import { analyzeFish, getHistory, deleteRecord } from "../src/controllers/fish.controller.js";
import * as fishService from "../src/services/fish.service.js";

jest.mock("../src/services/fish.service.js");

process.env.ML_SERVICE_URL = "http://localhost:8000/api/fish/analyze";

const mockRes = () => {
  const res = {};
  res.status = jest.fn().mockReturnValue(res);
  res.json = jest.fn().mockReturnValue(res);
  return res;
};

const mockFishFile = { path: "/tmp/fish-123.jpg", originalname: "fish.jpg" };
const mockGillFile = { path: "/tmp/gill-123.jpg", originalname: "gill.jpg" };
const mockEyeFile  = { path: "/tmp/eye-123.jpg",  originalname: "eye.jpg"  };

const mockAnalysisResult = {
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

describe("fishController.analyzeFish()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Returns 400 when fish_image is missing", async () => {
    const req = { files: {}, body: {}, user: { id: 1 }};
    const res = mockRes();

    await analyzeFish(req, res);

    expect(res.status).toHaveBeenCalledWith(400);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ message: "Fish image is required." }));
    expect(fishService.analyzeFish).not.toHaveBeenCalled();
  });

  test("Returns 400 when no fish is detected", async () => {
    fishService.analyzeFish.mockResolvedValue({ has_fish: false });

    const req = {
      files: { fish_image: [mockFishFile]},
      body: {},
      user: { id: 1 },
    };
    const res = mockRes();

    await analyzeFish(req, res);

    expect(res.status).toHaveBeenCalledWith(400);
    expect(res.json).toHaveBeenCalledWith(
      expect.objectContaining({ message: "No fish detected in image." })
    );
  });

  test("Returns analysis result when fish image is valid", async () => {
    fishService.analyzeFish.mockResolvedValue(mockAnalysisResult);

    const req = {
      files: { fish_image: [mockFishFile]},
      body: {},
      user: { id: 1 },
    };
    const res = mockRes();

    await analyzeFish(req, res);

    expect(fishService.analyzeFish).toHaveBeenCalledWith({
      fishImage: mockFishFile,
      gillImage: undefined,
      eyeImage: undefined,
      userId: 1,
    });
    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ status: "success", data: mockAnalysisResult }));
  });

  test("Forwards gill and eye images when provided", async () => {
    fishService.analyzeFish.mockResolvedValue(mockAnalysisResult);

    const req = {
      files: {
        fish_image: [mockFishFile],
        gill_image: [mockGillFile],
        eye_image: [mockEyeFile],
      },
      body: {},
      user: { id: 1 },
    };
    const res = mockRes();

    await analyzeFish(req, res);

    expect(fishService.analyzeFish).toHaveBeenCalledWith({
      fishImage: mockFishFile,
      gillImage: mockGillFile,
      eyeImage: mockEyeFile,
      userId: 1,
    });
    expect(res.status).toHaveBeenCalledWith(200);
  });

  test("Continues to pass if user is not authenticated (guest)", async () => {
    fishService.analyzeFish.mockResolvedValue(mockAnalysisResult);

    const req = {
      files: { fish_image: [mockFishFile] },
      body: {},
      user: null,
    };
    const res = mockRes();

    await analyzeFish(req, res);

    expect(fishService.analyzeFish).toHaveBeenCalledWith(expect.objectContaining({ userId: null }));
    expect(res.status).toHaveBeenCalledWith(200);
  });

  test("Returns 503 when ML service is unreachable", async () => {
    const err = new Error("Python ML service is down or unreachable");
    err.status = 503;
    fishService.analyzeFish.mockRejectedValue(err);

    const req = {
      files: { fish_image: [mockFishFile]},
      body: {},
      user: { id: 1 },
    };
    const res = mockRes();

    await analyzeFish(req, res);

    expect(res.status).toHaveBeenCalledWith(503);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ message: "Python ML service is down or unreachable" }));
  });

  test("Returns 504 when ML service times out", async () => {
    const err = new Error("Python ML service timed out.");
    err.status = 504;
    fishService.analyzeFish.mockRejectedValue(err);

    const req = {
      files: { fish_image: [mockFishFile]},
      body: {},
      user: { id: 1 },
    };
    const res = mockRes();

    await analyzeFish(req, res);

    expect(res.status).toHaveBeenCalledWith(504);
  });
});



describe("fishController.getHistory()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Returns scan history records", async () => {
    fishService.getHistory.mockResolvedValue([{
      id: 1,
      species: "Tilapia",
      overall_score: 0.80,
      quality_grade: "HIGH"
    }]);

    const req = { user: { id: 1 }};
    const res = mockRes();

    await getHistory(req, res);

    expect(fishService.getHistory).toHaveBeenCalledWith(1);
    expect(res.status).toHaveBeenCalledWith(200);
  });

  test("Returns nothing if no scan record history", async () => {
    fishService.getHistory.mockResolvedValue([]);

    const req = { user: { id: 1 }};
    const res = mockRes();

    await getHistory(req, res);

    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith([]);
  });

  test("Returns 500 on service error", async () => {
    fishService.getHistory.mockRejectedValue(new Error("DB error"));

    const req = { user: { id: 1 }};
    const res = mockRes();

    await getHistory(req, res);

    expect(res.status).toHaveBeenCalledWith(500);
  });
});



describe("fishController.deleteRecord()", () => {
  beforeEach(() => jest.clearAllMocks());

  test("Successfully deletes record", async () => {
    fishService.deleteRecord.mockResolvedValue({});

    const req = { params: { id: "3" }, user: { id: 1 }};
    const res = mockRes();

    await deleteRecord(req, res);

    expect(fishService.deleteRecord).toHaveBeenCalledWith(3, 1);
    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith(expect.objectContaining({ status: "success" }));
  });

  test("Deletion fails if user's record is not found", async () => {
    const err = new Error("Record not found");
    err.status = 404;
    fishService.deleteRecord.mockRejectedValue(err);

    const req = { params: { id: "2" }, user: { id: 1 }};
    const res = mockRes();

    await deleteRecord(req, res);

    expect(res.status).toHaveBeenCalledWith(404);
  });
});
