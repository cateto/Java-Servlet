package com.sv.board;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class BoardList extends HttpServlet 
{
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:JAVA";
	String usr = "servlet";
	String pwd = "java";
	Connection con;
	Statement stmt;
	
	@Override 
	public void init() throws ServletException {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, usr, pwd);
			stmt = con.createStatement();
		}catch(ClassNotFoundException cnfe){
		}catch(SQLException se){}
	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		throws IOException, ServletException {
		res.setContentType("text/html;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.println("<style>");
	pw.println("table, th, td {");
	   pw.println("border: 1px solid black;");
	   pw.println("border-collapse: collapse;");
	pw.println("}");
	pw.println("th, td {");
	   pw.println("padding: 5px;");
	pw.println("}");
	pw.println("a {text-decoration:none; font-family:Comic Sans MS}");
pw.println("</style>");
pw.println("</head>");
	pw.println("<body>");
		pw.println("<center>");
		pw.println("<font color='black' size='4' face='Comic Sans MS'>");
		pw.println("<hr width='600' size='2' color='gray' noshade>");
		pw.println("<h3> MY Board </h3>");
		pw.println("<font color='gray' size='4' face='Comic Sans MS'>");
		pw.println("<a href='/mb'>인덱스</a>");
		pw.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		pw.println("<a href='write.html'>글쓰기</a><br/>");
		pw.println("</font>");
		pw.println("<hr width='600' size='2' color='gray' noshade>");

			pw.println("<TABLE border='2' width='600' align='center' noshade>");
			pw.println("<TR size='2' align='center' noshade bgcolor='AliceBlue'>");
			pw.println("<th bgcolor='AliceBlue'>no</th>");
			pw.println("<th color='gray'>writer</th>");
			pw.println("<th color='gray'>e-mail</th>");
			pw.println("<th color='gray'>subject</th>");
			pw.println("<th color='gray'>date</th>");
			pw.println("</TR>");

		String sql = "select * from BOARD order by SEQ desc";
		ResultSet rs = null;
		try{
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				int seq = rs.getInt(1);
				String writer = rs.getString(2);
				String email = rs.getString(3);
				String subject = rs.getString(4);
				String content = rs.getString(5);
				Date rdate = rs.getDate(6);
				    pw.println("<TR align='center' noshade>");
					pw.println("<TD>"+seq+"</TD>");
					pw.println("<TD>"+writer+"</TD>");
					pw.println("<TD>"+email+"</TD>");
					pw.println("<TD>");  
					  pw.println("<a href='content.do?seq="+seq+"'>");
						pw.println(subject);
					  pw.println("</a>");
					pw.println("</TD>");
					pw.println("<TD>"+rdate+"</TD>");
				   pw.println("</TR>");
			}
		}catch(SQLException se){
		}finally{
			try{
				if(rs != null) rs.close();
			}catch(SQLException se){}
		}
		    pw.println("</table>");
		pw.println("</center>");
	}
	@Override
	public void destroy(){
		try{
			if(stmt != null) stmt.close();
			if(con != null) con.close();
		}catch(SQLException se){}
	}
}
