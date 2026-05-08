import { showUsers, searchUsers, deleteUser, getUserHistory, deleteUserRecord } from "../src/controllers/admin.controllers.js";
import * as adminService from "../src/services/admin.services.js";
import * as fishService from "../src/services/fish.service.js";

jest.mock("../src/services/admin.services.js");
jest.mock("../src/services/fish.service.js");

const mockRes = () => {
  const res = {};
  res.status = jest.fn().mockReturnValue(res);
  res.json = jest.fn().mockReturnValue(res);
  return res;
};

describe("adminController.showUsers()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Shows users when users exist", async () => {
    adminService.showUsers.mockResolvedValue([
      { id: 1, username: "aldrin" },
      { id: 2, username: "jhuvienne" },
      { id: 3, username: "jwaine" },
      { id: 4, username: "kyle" },
    ]);

    const req = {};
    const res = mockRes();
    await showUsers(req, res);

    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith(expect.arrayContaining([expect.objectContaining({ username: "kyle" })]));
  });

  test("Shows nothing if no users found", async () => {
    adminService.showUsers.mockResolvedValue([]);

    const req = { query: { query: "aldrin" }};
    const res = mockRes();
    await showUsers(req, res);

    expect(res.status).toHaveBeenCalledWith(404);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ message: "No users found" }));
  });

  test("Can raise unexpected service error", async () => {
    adminService.showUsers.mockRejectedValue(new Error("DB connection failed"));

    const req = {};
    const res = mockRes();
    await showUsers(req, res);

    expect(res.status).toHaveBeenCalledWith(500);
  });
});



describe("adminController.searchUsers()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Search query matches user", async () => {
    adminService.searchUsers.mockResolvedValue([{ username: "aldrin" }]);

    const req = { query: { query: "aldrin" }};
    const res = mockRes();
    await searchUsers(req, res);

    expect(adminService.searchUsers).toHaveBeenCalledWith("aldrin");
    expect(res.status).toHaveBeenCalledWith(200);
  });

  test("No users found on search query", async () => {
    adminService.searchUsers.mockResolvedValue([]);

    const req = { query: { query: "renz" }};
    const res = mockRes();
    await searchUsers(req, res);

    expect(res.status).toHaveBeenCalledWith(404);
  });

  test("Can raise unexpected service error", async () => {
    adminService.searchUsers.mockRejectedValue(new Error("Query failed"));

    const req = { query: { query: "aaa" }};
    const res = mockRes();
    await searchUsers(req, res);

    expect(res.status).toHaveBeenCalledWith(500);
  });
});



describe("adminController.deleteUser()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Successfully deletes user", async () => {
    adminService.deleteUser.mockResolvedValue({ id: 1 });

    const req = { params: { id: 1 }};
    const res = mockRes();
    await deleteUser(req, res);

    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ status: "success", id: 1 }));
  });

  test("Can raise unexpected service error", async () => {
    adminService.deleteUser.mockRejectedValue(new Error("Delete failed"));

    const req = { params: { id: 1 }};
    const res = mockRes();
    await deleteUser(req, res);

    expect(res.status).toHaveBeenCalledWith(500);
  });
});



describe("adminController.getUserHistory()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Shows user's scan history", async () => {
    fishService.getHistory.mockResolvedValue([{
      id: 1,
      species: "Tilapia",
      overall_score: 0.95,
      quality_grade: "HIGH"
    }]);

    const req = { params: { id: 1 }};
    const res = mockRes();
    await getUserHistory(req, res);

    expect(fishService.getHistory).toHaveBeenCalledWith(1);
    expect(res.status).toHaveBeenCalledWith(200);
  });

  test("Shows nothing if user has no records", async () => {
    const err = new Error("No records found");
    err.status = 404;
    fishService.getHistory.mockRejectedValue(err);

    const req = { params: { id: 1 }};
    const res = mockRes();
    await getUserHistory(req, res);

    expect(res.status).toHaveBeenCalledWith(404);
  });

  test("Can raise unexpected service error", async () => {
    adminService.deleteUser.mockRejectedValue(new Error("Delete failed"));

    const req = { params: { id: 1 }};
    const res = mockRes();
    await deleteUser(req, res);

    expect(res.status).toHaveBeenCalledWith(500);
  });
});



describe("adminController.deleteUserRecord()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Successfully deletes user's record", async () => {
    adminService.deleteUserRecord.mockResolvedValue({});

    const req = { params: { id: 1 }};
    const res = mockRes();
    await deleteUserRecord(req, res);

    expect(adminService.deleteUserRecord).toHaveBeenCalledWith(1);
    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ status: "success" }));
  });

  test("Deletion fails if user's record is not found", async () => {
    const err = new Error("No records found");
    err.status = 404;
    adminService.deleteUserRecord.mockRejectedValue(err);

    const req = { params: { id: 1 }};
    const res = mockRes();
    await deleteUserRecord(req, res);

    expect(res.status).toHaveBeenCalledWith(404);
  });

  test("Can raise unexpected service error", async () => {
    adminService.deleteUser.mockRejectedValue(new Error("Delete failed"));

    const req = { params: { id: 1 }};
    const res = mockRes();
    await deleteUser(req, res);

    expect(res.status).toHaveBeenCalledWith(500);
  });
});
