import mysql from "mysql2/promise";

// const db = mysql.createPool({
// 	host: "localhost",
// 	user: "root",
// 	password: "",
// 	database: "isdaok"
// });

const db = mysql.createPool({
	host: process.env.MYSQLHOST,
  	port: process.env.MYSQLPORT,
  	user: process.env.MYSQLUSER,
  	password: process.env.MYSQLPASSWORD,
  	database: process.env.MYSQLDATABASE
});

export default db;
