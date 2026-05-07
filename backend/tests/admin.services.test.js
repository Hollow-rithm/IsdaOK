import db from "../src/config/database.js";

jest.mock("../src/config/database.js");

const mockRes = () => {
  const res = {};
  res.status = jest.fn().mockReturnValue(res);
  res.json = jest.fn().mockReturnValue(res);
  return res;
};

describe("adminService.showUsers()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Shows list of non-admin users", async () => {
    db.query.mockResolvedValueOnce([[
      { id: 1, username: "aldrin" },
      { id: 2, username: "jhuvienne" },
      { id: 3, username: "jwaine" },
      { id: 4, username: "kyle" },
    ]]);

    const { showUsers: svcShowUsers } = await import("../src/services/admin.services.js");
    const result = await svcShowUsers();

    expect(result).toHaveLength(4);
    expect(result[0].username).toBe("aldrin");
  });
});



describe("adminService.searchUsers()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Shows matching users by search prefix", async () => {
    db.query.mockResolvedValueOnce([[{ id: 1, username: "aldrin" }]]);

    const { searchUsers: svcSearch } = await import("../src/services/admin.services.js");
    const result = await svcSearch("ald");

    expect(db.query).toHaveBeenCalledWith(expect.any(String), ["ald%"]);
    expect(result[0].username).toBe("aldrin");
  });

  test("Shows nothing if no match found", async () => {
    db.query.mockResolvedValueOnce([[]]); 

    const { searchUsers: svcSearch } = await import("../src/services/admin.services.js");
    const result = await svcSearch("renz");

    expect(result).toHaveLength(0);
  });
});



describe("adminService.deleteUser()", () => {
  beforeEach(() => jest.clearAllMocks());
  
  test("Successfully deletes user", async () => {
    db.query
      .mockResolvedValueOnce([[{ id: 1, username: "aldrin", email: "renz@gmail.com" }]])
      .mockResolvedValueOnce([{}]); // DELETE

    const { deleteUser: svcDelete } = await import("../src/services/admin.services.js");
    const result = await svcDelete(1);

    expect(result.username).toBe("aldrin");
    expect(result.email).toBe("renz@gmail.com");
  });

  test("Deletion fails if user is not found", async () => {
    db.query.mockResolvedValueOnce([[]]);

    const { deleteUser: svcDelete } = await import("../src/services/admin.services.js");

    await expect(svcDelete(1)).rejects.toMatchObject({
      message: "User not found",
      status: 404,
    });
  });
});



describe("adminService.deleteUserRecord()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Successfully deletes user's record", async () => {
    db.query
      .mockResolvedValueOnce([[{ id: 1 }]])
      .mockResolvedValueOnce([{}]); // DELETE

    const { deleteUserRecord: svcDeleteRecord } = await import("../src/services/admin.services.js");
    const result = await svcDeleteRecord(5);

    expect(result.scanId).toBe(1);
    expect(result.status).toBe("success");
  });

  test("Deletion fails if user's record is not found", async () => {
    db.query.mockResolvedValueOnce([[]]);

    const { deleteUserRecord: svcDeleteRecord } = await import("../src/services/admin.services.js");

    await expect(svcDeleteRecord(2)).rejects.toMatchObject({ message: "Record not found", status: 404 });
  });
});
