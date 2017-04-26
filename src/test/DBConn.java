package test;

import java.sql.*;

public class DBConn {
	private static Connection dbConn;

	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		// db 커넥트가 없으면 만들고 있으면 그냥 있는거 리턴함
		if (dbConn == null) {
			// String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String url = "jdbc:oracle:thin:@192.168.1.27:1521:xe";
			String user = "uforia";
			String pw = "kinder";

			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbConn = DriverManager.getConnection(url, user, pw);
		}
		return dbConn;
	}

	public static void close() throws SQLException {
		if (dbConn != null) {
			if (!dbConn.isClosed()) {
				dbConn.close();
			}
		}
		dbConn = null;

	}
}
