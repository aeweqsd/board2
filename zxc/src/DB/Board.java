package DB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Bean.*;


public class Board implements DBUSE{
	
	
	//name content hit time writer
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
			System.out.println(i+"�� ����");
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
			String sql = "delete from board where idboard = ?";
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
	@Override
	public Object selectDB(Object a) {
		BoardBean db = new BoardBean();
		BoardBean db2 = new BoardBean();
		db = (BoardBean) a;
		int num = db.get_idboard();
		Connection conn;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		Statement stmt = null;
		try {
			conn = DBConnection.get_connect();
			stmt=conn.createStatement();
			String sql = "select * from board where idboard = ?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				db2.set_content(rs.getString("content"));
				db2.set_hit(rs.getInt("hit"));
				db2.set_idboard(rs.getInt("idboard"));
				db2.set_idmember(rs.getInt("idmember"));
				db2.set_name(rs.getString("name"));
				db2.set_time(rs.getString("time"));
			}
			sql="update board set hit=? where idboard=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,db2.get_hit()+1);
			pstmt.setInt(2,num);
			int r = pstmt.executeUpdate();
			System.out.println(r);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return db2;
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
	public List<BoardBean> selectList(int pagenum){
		List<BoardBean> list = new ArrayList<>();
		Connection conn;
		int page = (pagenum-1)*5+1;
		int boardNum = boardnumber();
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		Statement stmt = null;
		try {
			conn = DBConnection.get_connect();
			stmt=conn.createStatement();
			String sql = "select * from"+
					"(select @rownum:=@rownum-1 as rnum,a.idboard,a.name,a.content,a.hit,a.time,a.idmember,b.memberid "+
					"from board as a, member as b ,(select @rownum:=?) tmp "+
					"where a.idmember = b.idmember)as a "+
					" where rnum between ? and ?"+
					" order by rnum ";
			pstmt=conn.prepareStatement(sql);
	    	pstmt.setInt(1,boardNum);
			pstmt.setInt(2, page);
			pstmt.setInt(3,page+4);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				BoardBean board = new BoardBean();
				board.set_relative(rs.getInt("rnum"));
				board.set_idboard(rs.getInt("idboard"));
				board.set_name(rs.getString("name"));
				board.set_content(rs.getString("content"));
				board.set_hit(rs.getInt("hit"));
				board.set_time(rs.getString("time"));
				board.set_idmember(rs.getInt("idmember"));
				board.set_memberid(rs.getString("memberid"));
				list.add(board);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}
	public int boardnumber() {
		Connection conn;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		Statement stmt = null;
		int max=0;
		try {
			conn = DBConnection.get_connect();
			stmt=conn.createStatement();
			String sql = "select count(*) as num from board";
			pstmt =conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				max=rs.getInt("num");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return max+1;
	}
	public int devide_page(int num) {
		if(num%5==0)
			return (num/5);
		else
			return (num/5)+1;
	}



}
