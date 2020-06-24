package board.mvc.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import mvc.domain.Board;

import static board.mvc.model.BoardSQL.LIST;
import static board.mvc.model.BoardSQL.DELETE;
import static board.mvc.model.BoardSQL.INPUT;
import static board.mvc.model.BoardSQL.UPDATE;

class BoardDAO {
	
	private DataSource ds;
	
	
	BoardDAO(){
		
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
			
		}catch(NamingException ne) {
			System.out.println("Apache DBCP 객체(jdbc/myoracle)를 찾지 못함");
		}
		
	}
	
	

	public ArrayList<Board> list(){
		
		ArrayList<Board> list = new ArrayList<Board>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
	    String sql = LIST;

	    try{
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				int seq = rs.getInt(1);
				String writer = rs.getString(2);
				String email = rs.getString(3);
				String subject = rs.getString(4);
				String content = rs.getString(5);
				Date rdate = rs.getDate(6);
				
				list.add(new Board(seq, writer, email, subject, content, rdate));
			}
			return list;
		}catch(SQLException se){
			return null;
		}finally{
			try{
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null)  con.close();
			}catch(SQLException se){}
		}
	}
	
	public Board content(int seq){
	
		String sql = "select * from BOARD where SEQ ="+seq;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		Board bd = null;
		
		try{
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				String writer = rs.getString(2);
				String email = rs.getString(3);
				String subject = rs.getString(4);
				String content = rs.getString(5);
				Date rdate = rs.getDate(6);
				
				bd = new Board(seq ,writer, email, subject, content, rdate);
			}
			return bd;
		}catch(SQLException se){
			return null;
		}finally{
			try{
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null)  con.close();
			}catch(SQLException se){}
		}
	}	
	
	public void del(int seq) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = DELETE;
		
		try{
			con = ds.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
		}catch(SQLException se){
			
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	public boolean insert(Board dto) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql= INPUT;
	    
	    try{

			con = ds.getConnection();
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
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	public boolean update(Board dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql= UPDATE;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, dto.getSeq());
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
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
		
	}
	
	
	
	


}
