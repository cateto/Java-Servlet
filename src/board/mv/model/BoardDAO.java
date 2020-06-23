package board.mv.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import soo.db.ConnectionPoolBean;

public class BoardDAO {
	
	private ConnectionPoolBean pool;
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}

	public ArrayList<BoardDTO> list(){
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
	    String sql = "select * from BOARD order by SEQ desc";

	    try{
			if(pool == null) return null;
			con = pool.getConnection();	
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				int seq = rs.getInt(1);
				String writer = rs.getString(2);
				String email = rs.getString(3);
				String subject = rs.getString(4);
				String content = rs.getString(5);
				Date rdate = rs.getDate(6);
				
				list.add(new BoardDTO(seq, writer, email, subject, content, rdate));
			}
			return list;
		}catch(SQLException se){
			return null;
		}finally{
			try{
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null)  pool.returnConnection(con);
			}catch(SQLException se){}
		}
	}
	
	public BoardDTO content(int seq){
	
		String sql = "select * from BOARD where SEQ ="+seq;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		BoardDTO bd = null;
		
		try{
			if(pool == null) return null;
			con = pool.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				String writer = rs.getString(2);
				String email = rs.getString(3);
				String subject = rs.getString(4);
				String content = rs.getString(5);
				Date rdate = rs.getDate(6);
				
				bd = new BoardDTO(seq ,writer, email, subject, content, rdate);
			}
			return bd;
		}catch(SQLException se){
			return null;
		}finally{
			try{
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null)  pool.returnConnection(con);
			}catch(SQLException se){}
		}
	}	
	
	public void del(int seq) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "delete from BOARD where SEQ=?";
		
		try{
			if(pool == null) return;
			con = pool.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
		}catch(SQLException se){
			
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) pool.returnConnection(con);
			}catch(SQLException se){}
		}
	}
	
	public boolean insert(BoardDTO dto) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="insert into BOARD values(BOARD_SEQ.nextval, ?, ?, ?, ?, SYSDATE)";
	    
	    try{
			if(pool == null) return false;
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			int i = pstmt.executeUpdate();
			if(i>0){
				return true;
			}else{
				return false;
			}
		}catch(SQLException se){
			return false;
		}finally{
			try{
				if(con != null) pool.returnConnection(con);
			}catch(SQLException se){}
		}
	}
	
	public boolean update(BoardDTO dto) {
		Connection con = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		String sql="Update BOARD set WRITER=?, EMAIL=?, SUBJECT=?, CONTENT=?, RDATE=SYSDATE where SEQ=?";
		
		try{
			if(pool == null) return false;
			con = pool.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, dto.getSeq());
			int i = pstmt.executeUpdate();
			return true;
		}catch(SQLException se){
			return false;
			
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) pool.returnConnection(con);
			}catch(SQLException se){}
		}
		
	}
	
	
	
	


}
