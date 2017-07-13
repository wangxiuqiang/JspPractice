package util;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;

public class DBHelper {
	private static String driver = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/Goods?useUnicode=true&characterEncoding=UTF-8";
	private static String user = "root";
	private static String passwd = "root";
	private static Connection conn = null;
	static {
		try {
            Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static Connection getConn() throws Exception{
		if(conn == null){
			conn = DriverManager.getConnection(url, user, passwd);
		}
		return conn;
	}
}
