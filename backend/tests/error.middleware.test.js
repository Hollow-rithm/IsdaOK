import multer from "multer";
import errorMiddleware from "../src/middleware/error.middleware.js";

const mockRes = () => {
  const res = {};
  res.status = jest.fn().mockReturnValue(res);
  res.json = jest.fn().mockReturnValue(res);
  return res;
};

describe("errorMiddleware()", () => {
  test("Calls next() if null/undefined", () => {
    const req = {};
    const res = mockRes();
    const next = jest.fn();

    errorMiddleware(null, req, res, next);

    expect(next).toHaveBeenCalled();
    expect(res.status).not.toHaveBeenCalled();
  });

  test("Handles LIMIT_UNEXPECTED_FILE Multer error", () => {
    const err = new multer.MulterError("LIMIT_UNEXPECTED_FILE");
    const req = {};
    const res = mockRes();
    const next = jest.fn();

    errorMiddleware(err, req, res, next);

    expect(res.status).toHaveBeenCalledWith(400);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ status: "error", code: "LIMIT_UNEXPECTED_FILE" }));
  });

  test("Handles LIMIT_FILE_SIZE Multer error", () => {
    const err = new multer.MulterError("LIMIT_FILE_SIZE");
    const req = {};
    const res = mockRes();
    const next = jest.fn();

    errorMiddleware(err, req, res, next);

    expect(res.status).toHaveBeenCalledWith(400);
    expect(res.json).toHaveBeenCalledWith(
      expect.objectContaining({
        status: "error",
        message: "File is too large. Maximum size is 10MB.",
        code: "LIMIT_FILE_SIZE",
      })
    );
  });

  test("Handles generic Error with custom status", () => {
    const err = new Error("Not found");
    err.status = 404;
    const req = {};
    const res = mockRes();
    const next = jest.fn();

    errorMiddleware(err, req, res, next);

    expect(res.status).toHaveBeenCalledWith(404);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ status: "error", message: "Not found" }));
  });

  test("Returns 500 if internal server error", () => {
    const err = {};
    const req = {};
    const res = mockRes();
    const next = jest.fn();

    errorMiddleware(err, req, res, next);

    expect(res.status).toHaveBeenCalledWith(500);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ message: "Internal server error.",code: "INTERNAL_SERVER_ERROR" }));
  });
});
