import db from "../src/config/database.js";
import * as fishServiceDirect from "../src/services/fish.service.js";
import axios from "axios";
import fs from "fs";

jest.mock("../src/config/database.js");
jest.mock("axios");
jest.mock("fs");

const mlResponse = {
  has_fish: true,
  species: "Tilapia",
  scores: { eye_score: 0.70, gill_score: 0.65, body_score: 0.72 },
  rule_score: 0.79,
  rule_quality: "HIGH",
  ml_quality: "HIGH",
  final_quality: "HIGH",
  features: {
    eye: { red_intensity: 0.1, red_coverage: 0.2, eye_cloudiness: 0.3 },
    body: { shine_coverage: 0.4, shine_intensity: 0.5, body_color_b: 0.6 },
    gill: { hue_mean: 0.1, redness_purity: 0.2, brightness_mean: 0.3, brown_dominance: 0.4, color_cov: 0.5 },
  }
};

describe("fishService.analyzeFish()", () => {
  beforeEach(() => {
    jest.clearAllMocks();
    fs.existsSync.mockReturnValue(false);
    fs.createReadStream.mockReturnValue("stream");
    fs.promises = { unlink: jest.fn().mockResolvedValue()};
  });

  test("Calls ML service and returns analysis result (guest)", async () => {
    axios.post.mockResolvedValue({ data: mlResponse });

    const result = await fishServiceDirect.analyzeFish({
      fishImage: { path: "/tmp/fish.jpg" },
      gillImage: null,
      eyeImage: null,
      userId: null,
    });

    expect(axios.post).toHaveBeenCalled();
    expect(db.query).not.toHaveBeenCalled(); // not saved to DB if guest
    expect(result.has_fish).toBe(true);
    expect(result.species).toBe("Tilapia");
    expect(result.rule_score).toBe(0.79);
  });

  test("Saves scan and its results to the database (user)", async () => {
    axios.post.mockResolvedValue({ data: mlResponse });
    db.query
      .mockResolvedValueOnce([{ insertId: 1 }]) // INSERT scans
      .mockResolvedValueOnce([{}])
      .mockResolvedValueOnce([{}])
      .mockResolvedValueOnce([{}]);

    await fishServiceDirect.analyzeFish({
      fishImage: { path: "/tmp/fish.jpg" },
      gillImage: { path: "/tmp/gill.jpg" },
      eyeImage: { path: "/tmp/eye.jpg" },
      userId: 1,
    });

    expect(db.query).toHaveBeenCalledTimes(4);
    const dbCall = db.query.mock.calls[0];
    expect(dbCall[0]).toMatch(/INSERT INTO scans/i);
    expect(dbCall[1][0]).toBe(1); // userId
  });

  test("Throws 503 when ML service connection is refused", async () => {
    const err = new Error("connect ECONNREFUSED");
    err.code = "ECONNREFUSED";
    axios.post.mockRejectedValue(err);

    await expect(
      fishServiceDirect.analyzeFish({
        fishImage: { path: "/tmp/fish.jpg" },
        gillImage: null,
        eyeImage: null,
        userId: null,
      })
    ).rejects.toMatchObject({ status: 503 });
  });

  test("Throws 504 when ML service times out", async () => {
    const err = new Error("timeout");
    err.code = "ECONNABORTED";
    axios.post.mockRejectedValue(err);

    await expect(
      fishServiceDirect.analyzeFish({
        fishImage: { path: "/tmp/fish.jpg" },
        gillImage: null,
        eyeImage: null,
        userId: null,
      })
    ).rejects.toMatchObject({ status: 504 });
  });

  test("Throws ML service error status for err.response", async () => {
    const err = {
      response: {
        status: 422,
        data: { detail: "ML service returned an error" }
      },
    };
    axios.post.mockRejectedValue(err);

    await expect(
      fishServiceDirect.analyzeFish({
        fishImage: { path: "/tmp/fish.jpg" },
        gillImage: null,
        eyeImage: null,
        userId: null,
      })
    ).rejects.toMatchObject({ status: 422, message: "ML service returned an error" });
  });

  test("Throws 500 for unknown errors", async () => {
    axios.post.mockRejectedValue(new Error("Unknown error occurred"));

    await expect(
      fishServiceDirect.analyzeFish({
        fishImage: { path: "/tmp/fish.jpg" },
        gillImage: null,
        eyeImage: null,
        userId: null,
      })
    ).rejects.toMatchObject({ status: 500 });
  });
});



describe("fishService.getHistory()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Provides scan history for the given user", async () => {
    db.query.mockResolvedValueOnce([[{
      id: 1,
      species: "Tilapia",
      rule_score: 0.79,
      final_quality: "HIGH"
    }], []]);
    
    const result = await fishServiceDirect.getHistory(1);

    expect(db.query).toHaveBeenCalledWith(expect.any(String), [1]);
    expect(result[0].species).toBe("Tilapia");
  });

  test("Shows nothing if the user has no scan history", async () => {
    db.query.mockResolvedValueOnce([[], []]); 

    const result = await fishServiceDirect.getHistory(1);

    expect(result).toEqual([]);
  });
});



describe("fishService.deleteRecord()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Successfully deletes record", async () => {
    db.query
      .mockResolvedValueOnce([[{ id: 1 }], []]) // SELECT
      .mockResolvedValueOnce([[], []]); // DELETE

    const result = await fishServiceDirect.deleteRecord(5, 1);

    expect(db.query).toHaveBeenCalledTimes(2);
    expect(result.scanId).toBe(1);
    expect(result.status).toBe("success");
  });
  
  test("Deletion fails if record is not found", async () => {
    db.query.mockResolvedValueOnce([[], []]);

    await expect(fishServiceDirect.deleteRecord(999, 1)).rejects.toMatchObject({ message: "Record not found", status: 404 });
  });

});
