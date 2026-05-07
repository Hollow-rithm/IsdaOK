import db from "../src/config/database.js";
import * as authService from "../src/services/auth.services.js";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { sendVerificationEmail, sendResetEmail } from "../src/utils/mailer.js";

jest.mock("../src/config/database.js");
jest.mock("bcryptjs");
jest.mock("jsonwebtoken");
jest.mock("../src/utils/mailer.js");

process.env.JWT_SECRET = "test";
process.env.BASE_URL = "http://localhost:3000";

describe("authService.register()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Registration fails if email already exists", async () => {
    db.query.mockResolvedValueOnce([[{ email: "renz@gmail.com" }]]);

    await expect(
      authService.register({ username: "aldrin", email: "renz@gmail.com", password: "Pogiako123!" })
    ).rejects.toThrow("Email already exists");
  });

  test("Registers user successfully and sends verification email", async () => {
    db.query
      .mockResolvedValueOnce([[]]) // no existing email
      .mockResolvedValueOnce([{ insertId: 1 }])
      .mockResolvedValueOnce([{}]); // INSERT user_tokens

    bcrypt.hash.mockResolvedValue("hashed_pass");
    jwt.sign.mockReturnValue("verify_token");
    sendVerificationEmail.mockResolvedValue();

    const result = await authService.register({
      username: "aldrin",
      email: "renz@gmail.com",
      password: "Pogiako123!",
    });

    expect(bcrypt.hash).toHaveBeenCalledWith("Pogiako123!", 10);
    expect(sendVerificationEmail).toHaveBeenCalledWith("renz@gmail.com", expect.stringContaining("verify_token"));
    expect(result.userID).toBe(1);
    expect(result.status).toBe("success");
  });
});



describe("authService.login()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Login fails if user is not found", async () => {
    db.query.mockResolvedValueOnce([[]]);

    await expect(
      authService.login({ email: "renz@gmail.com", password: "Pogiako123!" })
    ).rejects.toThrow("Invalid Email or Password");
  });

  test("Login fails if email is unverified", async () => {
    db.query.mockResolvedValueOnce([[
      {
        id: 1,
        username: "aldrin",
        email: "renz@gmail.com",
        password: "hashed_pass",
        role: "user",
        is_verified: 0
      }
    ]]);

    await expect(
      authService.login({ email: "renz@gmail.com", password: "Pogiako123!" })
    ).rejects.toMatchObject({ status: 403 });
  });

  test("Login fails if password does not match", async () => {
    db.query.mockResolvedValueOnce([[
      {
        id: 1,
        username: "aldrin",
        email: "renz@gmail.com",
        password: "hashed_pass",
        role: "user",
        is_verified: 1
      }
    ]]);
    bcrypt.compare.mockResolvedValue(false);

    await expect(
      authService.login({ email: "renz@gmail.com", password: "pogiako" })
    ).rejects.toThrow("Invalid Email or Password");
  });

  test("Returns user data on successful login", async () => {
    db.query.mockResolvedValueOnce([[
      {
        id: 1,
        username: "aldrin",
        email: "renz@gmail.com",
        password: "hashed_pass",
        role: "user",
        is_verified: 1
      }
    ]]);
    bcrypt.compare.mockResolvedValue(true);

    const result = await authService.login({ email: "renz@gmail.com", password: "Pogiako123!" });

    expect(result.id).toBe(1);
    expect(result.email).toBe("renz@gmail.com");
    expect(result.role).toBe("user");
  });
});



describe("authService.verifyEmail()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Blocks invalid token", async () => {
    jwt.verify.mockReturnValue({ email: "renz@gmail.com" });
    db.query.mockResolvedValueOnce([[]]); // no token

    await expect(authService.verifyEmail("no-token")).rejects.toThrow("Invalid token");
  });

  test("Shows if email is already verified and token has been used", async () => {
    jwt.verify.mockReturnValue({ email: "renz@gmail.com" });
    db.query.mockResolvedValueOnce([[{ id: 1, used: 1 }]]);

    await expect(authService.verifyEmail("used-token")).rejects.toThrow("Email already verified");
  });

  test("Verifies user email, sets token as used", async () => {
    jwt.verify.mockReturnValue({ email: "renz@gmail.com" });
    db.query
      .mockResolvedValueOnce([[{ id: 1, used: 0 }]]) // token
      .mockResolvedValueOnce([{}]) // UPDATE user_tokens
      .mockResolvedValueOnce([{}]); // UPDATE users

    const result = await authService.verifyEmail("valid-token");

    expect(db.query).toHaveBeenCalledTimes(3);
    expect(result.status).toBe("success");
  });
});



describe("authService.resendVerification()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Re-verification fails if email is not found", async () => {
    db.query.mockResolvedValueOnce([[]]);

    await expect(authService.resendVerification("renz@gmail.com")).rejects.toThrow("Email not Found");
  });

  test("Re-verification fails if email is already verified", async () => {
    db.query.mockResolvedValueOnce([[{ id: 1, is_verified: 1 }]]);

    await expect(authService.resendVerification("renz@gmail.com")).rejects.toThrow("Email already verified");
  });

  test("Provides new token and sends email successfully", async () => {
    db.query
      .mockResolvedValueOnce([[{ id: 1, is_verified: 0 }]])
      .mockResolvedValueOnce([{}]); // INSERT token

    jwt.sign.mockReturnValue("new-token");
    sendVerificationEmail.mockResolvedValue();

    const result = await authService.resendVerification("renz@gmail.com");

    expect(sendVerificationEmail).toHaveBeenCalledWith("renz@gmail.com", expect.stringContaining("new-token"));
    expect(result.status).toBe("success");
  });
});



describe("authService.forgotPassword()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Email is not sent if it is not found", async () => {
    db.query.mockResolvedValueOnce([[]]);

    const result = await authService.forgotPassword("renz@gmail.com");

    expect(result.status).toBe("success");
    expect(sendResetEmail).not.toHaveBeenCalled();
  });

  test("Updates to new token, invalidates old tokens, and sends email successfully", async () => {
    db.query
      .mockResolvedValueOnce([[{ id: 1 }]])
      .mockResolvedValueOnce([{}]) // UPDATE old tokens
      .mockResolvedValueOnce([{}]); // INSERT new token

    jwt.sign.mockReturnValue("reset-token");
    sendResetEmail.mockResolvedValue();

    const result = await authService.forgotPassword("renz@gmail.com");

    expect(sendResetEmail).toHaveBeenCalledWith("renz@gmail.com", expect.stringContaining("reset-token"));
    expect(result.status).toBe("success");
  });
});



describe("authService.resetPassword()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Blocks invalid token", async () => {
    jwt.verify.mockReturnValue({ email: "renz@gmail.com" });
    db.query.mockResolvedValueOnce([[]]); // no token
    await expect(authService.resetPassword("no-token", "Pogiako123!")).rejects.toThrow("Invalid Token");
  });

  test("Fails if token is already used", async () => {
    jwt.verify.mockReturnValue({ email: "renz@gmail.com" });
    db.query.mockResolvedValueOnce([[{ id: 1, used: 1, expires_at: new Date(Date.now() + 60000) }]]);
    await expect(authService.resetPassword("used-token", "Pogiako123!")).rejects.toThrow("Invalid or already used token");
  });

  test("Fails if reset link expired", async () => {
    jwt.verify.mockReturnValue({ email: "renz@gmail.com" });
    db.query.mockResolvedValueOnce([[{ id: 1, used: 0, expires_at: new Date(Date.now() - 1000) }]]);

    await expect(authService.resetPassword("expired-token", "Pogiako123!")).rejects.toThrow("Reset Link has expired");
  });

  test("Hashes new password and updates user on success", async () => {
    jwt.verify.mockReturnValue({ email: "test@gmail.com" });
    db.query
      .mockResolvedValueOnce([[{ id: 1, used: 0, expires_at: new Date(Date.now() + 60000) }]])
      .mockResolvedValueOnce([{}]) // UPDATE token to used
      .mockResolvedValueOnce([{}]); // UPDATE password

    bcrypt.hash.mockResolvedValue("new_hashed_pass");

    const result = await authService.resetPassword("token", "Pogiako123!");

    expect(bcrypt.hash).toHaveBeenCalledWith("Pogiako123!", 10);
    expect(result.status).toBe("success");
  });
});



describe("authService.getUserID()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Returns nothing if user is not found", async () => {
    db.query.mockResolvedValueOnce([[]]);

    await expect(authService.getUserID(999)).rejects.toThrow("User not found");
  });

  test("Returns user record when found", async () => {
    db.query.mockResolvedValueOnce([[{
        id: 1,
        username: "aldrin",
        email: "renz@gmail.com",
        role: "user"
      }]]);

    const user = await authService.getUserID(1);

    expect(user.id).toBe(1);
    expect(user.username).toBe("aldrin");
  });
});



describe("authService.googleLogin()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Login fails if Google account is not found", async () => {
    db.query.mockResolvedValueOnce([[]]);

    await expect(
      authService.googleLogin({ email: "renz@gmail.com", googleId: 1, name: "aldrinrenz" })
    ).rejects.toThrow("No account found");
  });

  test("Returns user record on successful Google login", async () => {
    db.query.mockResolvedValueOnce([[{ 
      id: 1,
      username: "aldrin",
      email: "renz@gmail.com",
      role: "user"
    }]]);

    const result = await authService.googleLogin({ email: "renz@gmail.com", googleId: 1, name: "aldrinrenz" });

    expect(result.id).toBe(1);
  });
});



describe("authService.googleRegister()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Registration fails if email account already exists", async () => {
    db.query.mockResolvedValueOnce([[{ id: 1 }]]);

    await expect(
      authService.googleRegister({ email: "renz@gmail.com", googleId: 1, name: "aldrinrenz" })
    ).rejects.toThrow("Account already exists");
  });

  test("Registers new user and returns their record", async () => {
    db.query
      .mockResolvedValueOnce([[]]) // no existing user
      .mockResolvedValueOnce([{ insertId: 1 }])
      .mockResolvedValueOnce([[{ id: 1, username: "aldrin", email: "renz@gmail.com", role: "user" }]]);

    const result = await authService.googleRegister({email: "renz@gmail.com", googleId: 1, username: "aldrin"});

    expect(result.id).toBe(1);
    expect(result.username).toBe("aldrin");
  });
});
