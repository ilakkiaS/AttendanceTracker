package com.acc.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static Connection connection = null;
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost/attendancetracker";
	static final String USER = "root";
	static final String PASS = "root";
	public static Connection createConnection() throws ClassNotFoundException, SQLException {
		    Class.forName(JDBC_DRIVER);
			connection = DriverManager.getConnection(DB_URL,USER,PASS);
		return connection;
}
	public static void closeConnection() throws SQLException {
		connection.close();
	}
}
