package com.sv.board;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class BoardContentDel extends HttpServlet 
{
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:JAVA";
	String usr = "servlet";
	String pwd = "java";
	Connection con;
	PreparedStatement pstmt;
	String sql = "delete from BOARD where SEQ=?";

	@Override 
	public void init() throws ServletException {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, usr, pwd);
			pstmt = con.prepareStatement(sql);
		}catch(ClassNotFoundException cnfe){
		}catch(SQLException se){}
	}
	@Override
	public void destroy(){
		try{
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		}catch(SQLException se){}
	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		throws IOException, ServletException {
		String seqStr =  req.getParameter("seq");
		if(seqStr != null) seqStr = seqStr.trim();
		int seq = Integer.parseInt(seqStr);
       
	    try{
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
		}catch(SQLException se){}

		res.sendRedirect("list.do");
	}
}
