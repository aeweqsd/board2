package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Bean.BoardBean;

//CONTENT WRITER SELFKEY TIME board_idboard
public class Comment implements DBUSE {

	@Override
	public void insertDB(Object a){
		BoardBean db = new BoardBean();
		db = (BoardBean) a;
		Connection conn;
		PreparedStatement pstmt =null;
		Statement stmt = null;
		String time = timeset();
		try {
			conn = DBConnection.get_connect();
			stmt=conn.createStatement();
			String sql = "insert into board(name,content,hit,time,idmember) values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, db.get_name());
			pstmt.setString(2, db.get_content());
			pstmt.setInt(3,0);
			pstmt.setString(4,time);
			pstmt.setInt(5,db.get_idmember());
			int i = pstmt.executeUpdate();
			System.out.println(i+"°¡ µé¾î°¬À½");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void deleteDB(Object a) {
		BoardBean db = new BoardBean();
		db = (BoardBean) a;
		Connection conn;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		Statement stmt = null;
		try {
			conn = DBConnection.get_connect();
			stmt=conn.createStatement();
			String sql = "delete from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,db.get_idboard());
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateDB(Object a) {
		BoardBean db = new BoardBean();
		db = (BoardBean) a;
		Connection conn;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		Statement stmt = null;
		try {
			conn = DBConnection.get_connect();
			stmt=conn.createStatement();
			String sql = "insert into board values(?,?,?,?,)";
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	public String timeset() {
		Connection conn;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String time = null;
		try {
		conn = DBConnection.get_connect();
		String sql = "select now()";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(sql);
			if(rs.next())
				time =rs.getString("now()");
		}catch(SQLException |ClassNotFoundException e) {
			e.printStackTrace();
		}
		return time;
		
	}

	@Override
	public Object selectDB(Object a) {
		// TODO Auto-generated method stub
		return a;
	}
	
}
