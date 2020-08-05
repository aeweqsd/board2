package DB;
import Bean.*;
import java.sql.*;
public class Member implements DBUSE {

	@Override
	public void insertDB(Object a){
		MemberBean info = new MemberBean();
		info = (MemberBean) a;
		Connection conn;
		PreparedStatement pstmt =null;
		Statement stmt = null;
		try {
			conn = DBConnection.get_connect();
			stmt=conn.createStatement();
			String sql = "insert into member(memberid,password) values(?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, info.get_memberid());
			pstmt.setString(2, info.get_password());
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
	@Override
	public Object selectDB(Object a) {
		MemberBean info = new MemberBean();
		info = (MemberBean) a;
		String id =info.get_memberid();
		MemberBean status=new MemberBean();
		Connection conn;
		PreparedStatement pstmt =null;
		Statement stmt = null;
		ResultSet rs;
		try {
			conn = DBConnection.get_connect();
			stmt=conn.createStatement();
			String sql = "select * from member where memberid = ?";
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, id);
			rs = pstmt.executeQuery();
				if(rs.next()) {
					status.set_idmember(rs.getInt("idmember"));
					status.set_memberid(rs.getString("memberid"));
					status.set_password(rs.getString("password"));
					
				}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return status;
}
	
}
