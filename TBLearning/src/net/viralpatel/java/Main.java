package net.viralpatel.java;

import java.sql.Connection;
import au.com.bytecode.opencsv.CSVLoader;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost:3306/tblearning_db";
    static final String USER = "root";
    static final String PASS = "";
   
	
	public static void main(String[] args) {
		try {
			
			CSVLoader loader = new CSVLoader(getCon());
			loader.loadCSV("C:\\employee.sql", "CUSTOMER", true);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static Connection getCon() {
		Connection conn = null;
		try {
			 Class.forName(JDBC_DRIVER); 
			 conn = DriverManager.getConnection(DB_URL, USER, PASS);
			

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return conn;
	}
}
