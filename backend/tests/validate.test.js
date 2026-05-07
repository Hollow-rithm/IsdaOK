import { validate } from "../src/utils/validate.js";

describe("validate() — username", () => {
  const run = (username) => validate({ username }, ["username"]);

  test("Accepts valid username", () => {
    expect(run("aldrin")).toEqual({});
  });

  test("Accepts username with dots, underscores and numbers", () => {
    expect(run("aldrin_.69")).toEqual({});
  });

  test("rejects missing username", () => {
    expect(run(undefined).username).toBeDefined();
    expect(run(null).username).toBeDefined();
    expect(run("").username).toBeDefined();
  });

  test("Rejects non-string username", () => {
    expect(validate({ username: 123 }, ["username"]).username).toBeDefined();
  });

  test("Rejects username shorter than 3 characters", () => {
    expect(run("al").username).toMatch(/3 characters/i);
  });

  test("Rejects username longer than 16 characters", () => {
    expect(run("abcdefghijklmnopqrstuvwxyz").username).toMatch(/16 characters/i);
  });

  test("Rejects username with spaces", () => {
    expect(run("aldrin renz").username).toBeDefined();
  });

  test("Rejects username with special characters", () => {
    expect(run("aldrin!").username).toBeDefined();
    expect(run("aldrin@renz").username).toBeDefined();
  });
});



describe("validate() — email", () => {
  const run = (email) => validate({ email }, ["email"]);

  test("Accepts a valid gmail address", () => {
    expect(run("renz@gmail.com")).toEqual({});
  });

  test("Accepts institutional emails", () => {
    expect(run("student@feu.edu.ph")).toEqual({});
    expect(run("student@fit.edu.ph")).toEqual({});
  });

  test("Accepts yahoo and outlook", () => {
    expect(run("renz@yahoo.com")).toEqual({});
    expect(run("renz@outlook.com")).toEqual({});
    expect(run("renz@hotmail.com")).toEqual({});
  });

  test("Rejects missing email", () => {
    expect(run(undefined).email).toBeDefined();
    expect(run("").email).toBeDefined();
  });

  test("Rejects unsupported email domain", () => {
    expect(run("renz@protonmail.com").email).toBeDefined();
    expect(run("renz@example.com").email).toBeDefined();
  });

  test("Rejects malformed email", () => {
    expect(run("gmail.com").email).toBeDefined();
  });

  test("Rejects email without domain extension", () => {
    expect(run("@gmail").email).toBeDefined();
  });

  test("Rejects non-string email", () => {
    expect(validate({ email: 123 }, ["email"]).email).toBeDefined();
  });
});



describe("validate() — password", () => {
  const run = (password) => validate({ password }, ["password"]);

  test("Accepts a strong valid password", () => {
    expect(run("Pogiako123!")).toEqual({});
  });

  test("Rejects missing password", () => {
    expect(run(undefined).password).toBeDefined();
    expect(run("").password).toBeDefined();
  });

  test("Rejects password without uppercase", () => {
    expect(run("pogiako123!").password).toMatch(/uppercase/i);
  });

  test("Rejects password without lowercase", () => {
    expect(run("POGIAKO123!").password).toMatch(/lowercase/i);
  });

  test("Rejects password without a number", () => {
    expect(run("Pogiako!").password).toMatch(/number/i);
  });

  test("Rejects password without a special character", () => {
    expect(run("Pogiako123").password).toMatch(/special character/i);
  });

  test("Rejects password shorter than 8 characters", () => {
    expect(run("P0g1!").password).toMatch(/8 characters/i);
  });

  test("Rejects non-string password", () => {
    expect(validate({ password: 1234567890 }, ["password"]).password).toBeDefined();
  });
});



describe("validate() — multiple fields", () => {
  test("Returns errors for the corresponding invalid fields", () => {
    const errors = validate( // username & pass are invalid
      { username: "al", email: "renz@gmail.com", password: "pogi" }, ["username", "email", "password"]
    );
    expect(errors.username).toBeDefined();
    expect(errors.email).toBeUndefined();
    expect(errors.password).toBeDefined();
  });

  test("Returns all errors when all fields are invalid", () => {
    const errors = validate(
      { username: "a", email: "renz@gmail", password: "pogi" }, ["username", "email", "password"]
    );
    expect(errors.username).toBeDefined();
    expect(errors.email).toBeDefined();
    expect(errors.password).toBeDefined();
  });

  test("Returns nothing when all fields are valid", () => {
    const errors = validate(
      { username: "aldrin", email: "renz@gmail.com", password: "Pogiako123!" }, ["username", "email", "password"]
    );
    expect(errors).toEqual({});
  });
});
