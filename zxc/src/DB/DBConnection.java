package DB;
import java.sql.*;


public class DBConnection {
	private static Connection conn=null;
	private DBConnection() {}
	public static synchronized Connection get_connect() throws SQLException,ClassNotFoundException {
		if(conn ==null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:330/mydb?serverTimezone=UTC";
			String user="root";
			String password="root";
			conn= DriverManager.getConnection(url,user,password);
		}
		return conn;
	}
	
	public static void close() throws SQLException{
		if(conn!=null) {
			if(conn.isClosed()) {
				conn.close();
			}
		}
		
		
	}
}

