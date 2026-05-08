import jwt from "jsonwebtoken";
import { auth, requireRole, optionalAuth } from "../src/utils/auth.js";

process.env.JWT_SECRET = "test";

const MAX_SESSION_DURATION = 7 * 24 * 60 * 60 * 1000; // 7 days

const mockRes = () => {
  const res = {};
  res.status = jest.fn().mockReturnValue(res);
  res.json = jest.fn().mockReturnValue(res);
  return res;
};

const makeToken = (payload = {}) =>
  jwt.sign({
    id: 1,
    username: "aldrin",
    email: "renz@gmail.com",
    role: "user",
    session_start: Date.now(),
    ...payload
  },
    process.env.JWT_SECRET,
    { expiresIn: "1d" }
  );

describe("auth() middleware", () => {
  test("Calls next() and attaches user when token is valid", () => {
    const token = makeToken();

    const req = { headers: { authorization: `Bearer ${token}` }};
    const res = mockRes();
    const next = jest.fn();
    auth(req, res, next);

    expect(next).toHaveBeenCalled();
    expect(req.user).toBeDefined();
    expect(req.user.id).toBe(1);
  });

  test("Returns 401 if Authorization header is missing", () => {
    const req = { headers: {}};
    const res = mockRes();
    const next = jest.fn();
    auth(req, res, next);

    expect(res.status).toHaveBeenCalledWith(401);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ message: "No token provided" }));
    expect(next).not.toHaveBeenCalled();
  });

  test("Returns 401 if Authorization header does not start with 'Bearer '", () => {
    const req = { headers: { authorization: "abc123" }};
    const res = mockRes();
    const next = jest.fn();
    auth(req, res, next);

    expect(res.status).toHaveBeenCalledWith(401);
    expect(next).not.toHaveBeenCalled();
  });

  test("Returns 401 if token is invalid", () => {
    const req = { headers: { authorization: "Bearer abc123" }};
    const res = mockRes();
    const next = jest.fn();
    auth(req, res, next);

    expect(res.status).toHaveBeenCalledWith(401);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ message: "Invalid or expired token" }));
    expect(next).not.toHaveBeenCalled();
  });

  test("Returns 401 if token is expired", () => {
    const expiredToken = jwt.sign({
        id: 1,
        session_start: Date.now()
    },
      process.env.JWT_SECRET,
      { expiresIn: "0s" }
    );

    const req = { headers: { authorization: `Bearer ${expiredToken}` }};
    const res = mockRes();
    const next = jest.fn();
    auth(req, res, next);

    expect(res.status).toHaveBeenCalledWith(401);
    expect(next).not.toHaveBeenCalled();
  });

  test("Returns 401 when session exceeds 7-day duration", () => {
    const oldSessionStart = Date.now() - (MAX_SESSION_DURATION + 1000);
    const token = makeToken({ session_start: oldSessionStart });

    const req = { headers: { authorization: `Bearer ${token}` }};
    const res = mockRes();
    const next = jest.fn();
    auth(req, res, next);

    expect(res.status).toHaveBeenCalledWith(401);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ message: "Session expired" }));
    expect(next).not.toHaveBeenCalled();
  });
});



describe("requireRole() middleware", () => {
  test("Calls next() if user has the required role for admin", () => {
    const req = { user: { role: "admin" }};
    const res = mockRes();
    const next = jest.fn();

    requireRole("admin")(req, res, next);

    expect(next).toHaveBeenCalled();
    expect(res.status).not.toHaveBeenCalled();
  });

  test("Returns 403 if user does not have the permitted role", () => {
    const req = { user: { role: "user" }};
    const res = mockRes();
    const next = jest.fn();

    requireRole("admin")(req, res, next);

    expect(res.status).toHaveBeenCalledWith(403);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ message: "Forbidden" }));
    expect(next).not.toHaveBeenCalled();
  });
});



describe("optionalAuth() middleware", () => {
  test("Calls next() and attaches user when token is valid", () => {
    const token = makeToken();
    const req = { headers: { authorization: `Bearer ${token}` }};
    const res = mockRes();
    const next = jest.fn();

    optionalAuth(req, res, next);

    expect(next).toHaveBeenCalled();
    expect(req.user).toBeDefined();
    expect(req.user.id).toBe(1);
  });

  test("Calls next() without attaching user when no Authorization header", () => {
    const req = { headers: {}};
    const res = mockRes();
    const next = jest.fn();

    optionalAuth(req, res, next);

    expect(next).toHaveBeenCalled();
    expect(req.user).toBeUndefined();
  });

  test("Calls next() without attaching user when token is invalid", () => {
    const req = { headers: { authorization: "Bearer abc123" }};
    const res = mockRes();
    const next = jest.fn();

    optionalAuth(req, res, next);

    expect(next).toHaveBeenCalled();
    expect(req.user).toBeUndefined();
  });
});
