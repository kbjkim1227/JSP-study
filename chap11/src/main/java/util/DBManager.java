package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBManager {
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Context initContext = new InitialContext();
			Context envContext=(Context)initContext.lookup("java:/comp/env");
			DataSource ds=(DataSource)envContext.lookup("jdbc/oracle");
			conn = ds.getConnection();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	// select을 위한 close >> Statement를 parameter로 받는 이유는 PreparedStatement는 Statement를 상속받기 때문. 즉 upcasting기법 이용
	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			rs.close();
			stmt.close();
			conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	// insert, update, delete를 위한 close
	public static void close(Connection conn, Statement stmt) {
		try {
			stmt.close();
			conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}