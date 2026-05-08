import dotenv from "dotenv";
dotenv.config({ path: ".env" });
import mysql from "mysql2/promise";

//  const db = mysql.createPool({
//  	host: "localhost",
// 	user: "root",
//  	password: "",
//  	database: "isdaok"
//  });

const db = mysql.createPool({
	host: process.env.DB_HOST,
 	port: process.env.DB_PORT,
	user: process.env.DB_USER,
 	password: process.env.DB_PASS,
 	database: process.env.DB_NAME
});

export default db;