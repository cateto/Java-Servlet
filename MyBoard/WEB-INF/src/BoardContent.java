package com.sv.board;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class BoardContent extends HttpServlet 
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
			   pw.println("padding: 5px; font-family:Comic Sans MS");
			pw.println("}");
			pw.println("a { text-decoration:none }");
		pw.println("</style>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<center>");
			pw.println("<font color='black' size='4' face='Comic Sans MS'>");
			pw.println("<hr width='600' size='2' color='black' noshade>");
			pw.println("<h3>MY Board</h3>");
			pw.println("<font color='gray' size='4' face='Comic Sans MS'>");
			pw.println("<a href='write.html'>글쓰기</a>");
			pw.println("</font>");
			pw.println("<hr width='600' size='2' color='gray' noshade>");
			pw.println("</font>");
		

		String seqStr =  req.getParameter("seq");
		if(seqStr != null) seqStr = seqStr.trim();
		int seq = Integer.parseInt(seqStr);
		String sql = "select * from BOARD where SEQ ="+seq+" order by SEQ desc";
		ResultSet rs = null;
		int newSeq=0;
		try{
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				newSeq = rs.getInt(1);
				String writer = rs.getString(2);
				String email = rs.getString(3);
				String subject = rs.getString(4);
				String content = rs.getString(5);
				Date rdate = rs.getDate(6);
					pw.println("<table border='2' width='600' align='center' noshade>");
					pw.println("<tr>");
					pw.println("<td width='20%' align='center' bgcolor='AliceBlue'>No</td>");
					pw.println("<td>"+newSeq+"</td>");
					pw.println("</tr>");
					pw.println("<tr>");
					pw.println("<td width='20%' align='center' bgcolor='AliceBlue'>Writer</td>");
					pw.println("<td>"+writer+"</td>");
					pw.println("</tr>");
					pw.println("<tr>");
					pw.println("<td align='center' bgcolor='AliceBlue'>E-mail</td>");
					pw.println("<td>"+email+"</td>");
					pw.println("</tr>");
					pw.println("<tr>");
					pw.println("<td align='center' bgcolor='AliceBlue'>Subject</td>");
					pw.println("<td>"+subject+"</td>");
					pw.println("</tr>");
					pw.println("<tr>");
					pw.println("<td align='center' bgcolor='AliceBlue'>Contents</td>");
					pw.println("<td>"+content+"</td>");
					pw.println("</tr>");
					pw.println("<td align='center' bgcolor='AliceBlue'>Date</td>");
					pw.println("<td>"+rdate+"</td>");
					pw.println("</tr>");
					pw.println("</table>");
			}
		}catch(SQLException se){
		}finally{
			try{
				if(rs != null) rs.close();
			}catch(SQLException se){}
		}
		    	pw.println("<hr width='600' size='2' color='gray' noshade>");
				pw.println("<font color='gray' size='4' face='Comic Sans MS'>");
				pw.println("<a href='update.do?seq="+newSeq+"'>수정</a>");
				 pw.println("&nbsp;&nbsp;| ");
				pw.println("<a href='del.do?seq="+newSeq+"'>삭제</a>");
				 pw.println("&nbsp;&nbsp;| ");
				pw.println("<a href='list.do'>목록</a>");
				pw.println("</font>");
				pw.println("<hr width='600' size='2' color='gray' noshade>");
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
