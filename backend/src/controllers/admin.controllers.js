import * as adminService from "../services/admin.services.js"
import { getHistory } from "../services/fish.service.js";
import { validate } from "../utils/validate.js";
import jwt from "jsonwebtoken";


export const showUsers = async (req, res) => {
	try {
		const users = await adminService.showUsers();

		if (users.length > 0) {
			res.status(200).json(users);
		} else {
			res.status(404).json({ message: "No users found" });
		}
	} catch (err) {
		res.status(500).json({
			status: "error",
			message: err.message,
		});
	}
};

export const searchUsers = async (req, res) => {
	try {
		const { query } = req.query;
		const users = await adminService.searchUsers(query);

		if (users.length > 0) {
			res.status(200).json(users);
		} else {
			res.status(404).json({ message: "No users found" });
		}
	} catch (err) {
		res.status(500).json({
			status: "error",
			message: err.message,
		});
	}
};

export const deleteUser = async (req, res) => {
	try {
		const { id } = req.params;
		const user = await adminService.deleteUser(id);

		res.status(200).json({
			status: "success",
			message: "User deleted",
			id: user.id,
			username: user.username,
			email: user.email
		});
		
	} catch (err) {
		res.status(500).json({
			status: "error",
			message: err.message,
		});
	}
};

export const getUserHistory = async (req, res) => {
	try {
		const userHistory = await getHistory(req.params.id);
		res.status(200).json(userHistory);
	} catch (err) {
		res.status(err.status || 500).json({ message: err.message });
	}
};

export const deleteUserRecord = async (req, res) => {
	try {
		const scanId = parseInt(req.params.id);
		await adminService.deleteUserRecord(scanId);

		res.status(200).json({
			status: "success",
			message: "Record deleted"
		});
		
	} catch (err) {
		res.status(err.status || 500).json({
			status: "error",
			message: err.message,
		});
	}
}