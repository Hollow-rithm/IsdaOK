import { register, login, verifyToken, googleLogin, googleRegister } from "../src/controllers/auth.controllers.js";
import * as authService from "../src/services/auth.services.js";
import jwt from "jsonwebtoken";

jest.mock("../src/services/auth.services.js");
jest.mock("jsonwebtoken");

process.env.JWT_SECRET = "test";

const mockRes = () => {
  const res = {};
  res.status = jest.fn().mockReturnValue(res);
  res.json = jest.fn().mockReturnValue(res);
  res.send = jest.fn().mockReturnValue(res);
  return res;
};

describe("authController.register()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Validation fails for missing fields (username, email, password)", async () => {
    const req = { body: { username: "", email: "", password: "" } };
    const res = mockRes();
    await register(req, res);

    expect(res.status).toHaveBeenCalledWith(422);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ status: "error" }));
    expect(authService.register).not.toHaveBeenCalled();
  });

  test("Successfully registers user", async () => {
    authService.register.mockResolvedValue({ status: "success" });

    const req = {
      body: {
        username: "aldrin",
        email: "renz@gmail.com",
        password: "Pogiako123!",
      },
    };
    const res = mockRes();
    await register(req, res);

    expect(authService.register).toHaveBeenCalledWith({
      username: "aldrin",
      email: "renz@gmail.com",
      password: "Pogiako123!",
    });
    expect(res.status).toHaveBeenCalledWith(201);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ status: "success" }));
  });

  test("Registration fails if email already exists)", async () => {
    const err = new Error("Email already exists");
    err.status = 400;
    authService.register.mockRejectedValue(err);

    const req = {
      body: {
        username: "aldrin",
        email: "renz@gmail.com",
        password: "Pogiako123!",
      },
    };
    const res = mockRes();
    await register(req, res);

    expect(res.status).toHaveBeenCalledWith(400);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ message: "Email already exists" }));
  });
});



describe("authController.login()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Login fails if email is not provided", async () => {
    const req = { body: { email: "", password: "Pogiako123!" }};
    const res = mockRes();
    await login(req, res);

    expect(res.status).toHaveBeenCalledWith(422);
    expect(authService.login).not.toHaveBeenCalled();
  });

  test("Provides token on successful login", async () => {
    authService.login.mockResolvedValue({
      id: 1,
      username: "aldrin",
      email: "renz@gmail.com",
      role: "user",
    });
    jwt.sign.mockReturnValue("mock-jwt-token");

    const req = { body: { email: "renz@gmail.com", password: "Pogiako123!" }};
    const res = mockRes();
    await login(req, res);

    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ status: "success", token: "mock-jwt-token" }));
  });

  test("Login fails for invalid credentials", async () => {
    const err = new Error("Invalid Email or Password");
    authService.login.mockRejectedValue(err);

    const req = { body: { email: "renz@gmail.com", password: "pogiako" }};
    const res = mockRes();
    await login(req, res);

    expect(res.status).toHaveBeenCalledWith(400);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ message: "Invalid Email or Password" }));
  });

  test("Login fails if email is unverified", async () => {
    const err = new Error("Please verify your email before logging in.");
    err.status = 403;
    authService.login.mockRejectedValue(err);

    const req = { body: { email: "renz@gmail.com", password: "Pogiako123!" }};
    const res = mockRes();
    await login(req, res);

    expect(res.status).toHaveBeenCalledWith(403);
  });
});



describe("authController.verifyToken()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Refreshes token for a valid user", async () => {
    authService.getUserID.mockResolvedValue({
      id: 1,
      username: "aldrin",
      email: "renz@gmail.com",
      role: "user",
    });
    jwt.sign.mockReturnValue("new-jwt-token");

    const req = { user: { id: 1, session_start: Date.now() }};
    const res = mockRes();
    await verifyToken(req, res);

    expect(authService.getUserID).toHaveBeenCalledWith(1);
    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ status: "success", token: "new-jwt-token" }));
  });
});



describe("authController.googleLogin()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Provides token on successful Google login", async () => {
    authService.googleLogin.mockResolvedValue({
      id: 1,
      username: "aldrin",
      email: "renz@gmail.com",
      role: "user",
    });
    jwt.sign.mockReturnValue("google-jwt-token");

    const req = { body: { email: "renz@gmail.com", googleId: 1, name: "aldrinrenz" }};
    const res = mockRes();
    await googleLogin(req, res);

    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ status: "success", token: "google-jwt-token" }));
  });

  test("Login fails if Google account is not found", async () => {
    authService.googleLogin.mockRejectedValue(new Error("No account found."));

    const req = { body: { email: "renz@gmail.com", googleId: 1, name: "aldrinrenz" }};
    const res = mockRes();
    await googleLogin(req, res);

    expect(res.status).toHaveBeenCalledWith(500);
  });
});



describe("authController.googleRegister()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Provides token on successful Google registration", async () => {
    authService.googleRegister.mockResolvedValue({
      id: 1,
      username: "aldrin",
      email: "renz@gmail.com",
      role: "user",
    });
    jwt.sign.mockReturnValue("new.google.token");

    const req = { body: { email: "renz@gmail.com", googleId: 1, username: "aldrinrenz" }};
    const res = mockRes();
    await googleRegister(req, res);

    expect(res.status).toHaveBeenCalledWith(201);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ status: "success", token: "new.google.token" }));
  });

  test("Registration fails if email account already exists", async () => {
    authService.googleRegister.mockRejectedValue(new Error("Account already exists."));

    const req = { body: { email: "renz@gmail.com", googleId: 1, username: "aldrinrenz" }};
    const res = mockRes();
    await googleRegister(req, res);

    expect(res.status).toHaveBeenCalledWith(500);
  });
});
