import db from "../config/database.js";

export const showUsers = async () => {
	const [records] = await db.query("SELECT `id`, `username` FROM `users` WHERE `role` != 'admin'");

	return records;
};

export const searchUsers = async (query) => {
	const [records] = await db.query("SELECT `id`, `username` FROM `users` WHERE  `role` != 'admin' AND `username` LIKE ?", [`${query}%`]);

	return records;
};

export const deleteUser = async (id) => {
	const [records] = await db.query("SELECT `id`, `username`, `email` FROM `users` WHERE `id` = ?", [id]);

	if(!records.length){
		const error = new Error("User not found");
		error.status = 404;
		throw error;
	}

	await db.query("DELETE FROM `users` WHERE `id` = ?", [id]);

	return {
		status: "success",
		message: "User deleted successfully",
		id: records[0].id,
		username: records[0].username,
		email: records[0].email
	};
};

export const deleteUserRecord = async (scanId) => {
	const [records] = await db.query("SELECT `id` FROM `scans` WHERE `id` = ?", [scanId]);

	if(!records.length){
		const error = new Error("Record not found");
		error.status = 404;
		throw error;
	}

	await db.query("DELETE FROM `scans` WHERE `id` = ?", [scanId]);

	return {
		status: "success",
		message: "Record deleted successfully",
		scanId: records[0].id,
		userId: records[0].user_id
	};
}