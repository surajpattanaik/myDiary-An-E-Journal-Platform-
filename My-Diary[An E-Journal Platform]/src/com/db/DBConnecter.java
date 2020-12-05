package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnecter {

	private static Connection conn;

	public static Connection getConn() {
		try {
			if (conn == null) {
				  //register jdbc driver s/w (optional)
				 Class.forName("com.mysql.jdbc.Driver");
				 //establish the connection
				 conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "illusio9");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
