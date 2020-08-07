package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Bean.*;

//CONTENT WRITER SELFKEY TIME board_idboard
public class Comment implements DBUSE {

	@Override
	public void insertDB(Object a){
		CommentBean db = new CommentBean();
		db = (CommentBean) a;
		Connection conn;
		PreparedStatement pstmt =null;
		Statement stmt = null;
		String time = timeset();
		try {
			conn = DBConnection.get_connect();
			stmt=conn.createStatement();
			String sql = "insert into comment(content,selfkey,time,board_idboard,idmember) values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, db.get_content());
			pstmt.setInt(2,db.get_selfkey());
			pstmt.setString(3,time);
			pstmt.setInt(4,db.get_board_idboard());
			pstmt.setInt(5,db.get_idmember());
			int i = pstmt.executeUpdate();
			System.out.println(i);
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
	public List<CommentBean> selectList(int idboard){
		List<CommentBean> list = new ArrayList<>();
		Connection conn;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		Statement stmt =null;
		try{
			conn = DBConnection.get_connect();
			stmt=conn.createStatement();
			String sql ="select * from comment where board_idboard = ? order by time desc";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idboard);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommentBean comment = new CommentBean();
				comment.set_idcomment(rs.getInt("idcomment"));
				comment.set_selfkey(rs.getInt("selfkey"));
				comment.set_time(rs.getString("time"));
				comment.set_board_idboard(rs.getInt("board_idboard"));
				comment.set_content(rs.getString("content"));
				comment.set_idmember(rs.getInt("idmember"));
				list.add(comment);
			}
			
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
