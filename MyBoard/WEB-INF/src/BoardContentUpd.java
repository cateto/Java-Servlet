package com.sv.board;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class BoardContentUpd extends HttpServlet 
{
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:JAVA";
	String usr = "servlet";
	String pwd = "java";
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	String sql="Update BOARD set WRITER=?, EMAIL=?, SUBJECT=?, CONTENT=?, RDATE=SYSDATE where SEQ=?";
	int newSeq;

	@Override 
	public void init() throws ServletException {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, usr, pwd);
			stmt = con.createStatement();
			pstmt = con.prepareStatement(sql);
		}catch(ClassNotFoundException cnfe){
		}catch(SQLException se){}
	}
	@Override
	public void destroy(){
		try{
			if(pstmt != null) pstmt.close();
			if(stmt != null) stmt.close();
			if(con != null) con.close();
		}catch(SQLException se){}
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		throws IOException, ServletException {
		res.setContentType("text/html;charset=utf-8");
		PrintWriter pw = res.getWriter();

				pw.println("<html>");
		  pw.println("<head>");
			pw.println("<meta charset='utf-8'>");
			pw.println("<title>MY Board</title>");
			pw.println("<style>");
				pw.println("table, th, td {");
				   pw.println("border: 1px solid black;");
				  pw.println(" border-collapse: collapse;");
				   pw.println("font-family:Comic Sans MS");
				pw.println("}");
				pw.println("th, td {");
				 pw.println("  padding: 5px;");
				   pw.println("font-family:Comic Sans MS");
				pw.println("}");
				pw.println("a { text-decoration:none;");
				pw.println("font-family:Comic Sans MS}");

				pw.println("input { text-decoration:none;");
				pw.println("font-family:Comic Sans MS}");
			pw.println("</style>");
			pw.println("<script language='javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>");
				pw.println("<script>");
				pw.println("function f()");
				pw.println("{");
					pw.println("input.email.value = '';");
					pw.println("input.subject.value = '';");
					pw.println("$('#ta').text('');");
					
					pw.println("input.email.focus();");
				pw.println("}");
			
			   pw.println("function check()");
			   pw.println("{");
				  pw.println(" for(var i=0; i<document.input.elements.length; i++)");
				   pw.println("{");
					 pw.println(" if(document.input.elements[i].value == '')");
					  pw.println("{");
						 pw.println("alert('모든 값을 입력 하셔야 합니다. ');");
						pw.println(" return false;");
					  pw.println("}");
				   pw.println("}");
				   pw.println("document.input.submit();");
			   pw.println("}");
			pw.println("</script>");
		  pw.println("</head>");
		  pw.println("<body onload='input.writer.focus()'>");
			pw.println("<font color='black' size='4' face='Comic Sans MS'>");
			pw.println("<center>");
			   pw.println("<hr width='750' size='2' color='gray' noshade>");
				  pw.println("<h3> MY Board </h3>");
					pw.println("<font color='gray' size='3' face='Comic Sans MS'>");
					pw.println("<a href='list.do'>리스트</a>");
					pw.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					pw.println("<a href='/mb'>인덱스</a>");
					pw.println("</font>");
			   pw.println("<hr width='750' size='2' color='gray' noshade>");
			pw.println("</center>");

		String seqStr =  req.getParameter("seq");
		if(seqStr != null) seqStr = seqStr.trim();
		int seq = Integer.parseInt(seqStr);
		String sSql = "select * from BOARD where SEQ ="+seq+" order by SEQ desc";
		ResultSet rs = null;
		
		try{
			rs = stmt.executeQuery(sSql);
			while(rs.next()){
				newSeq = rs.getInt(1);
				String writer = rs.getString(2);
				String email = rs.getString(3);
				String subject = rs.getString(4);
				String content = rs.getString(5);
				Date rdate = rs.getDate(6);

				pw.println("<form name='input' method='post' action='update.do'>");
	pw.println("<input type='hidden' name='seq' value="+newSeq+">");
	   pw.println("<table border='0' width='630' align='center'  cellpadding='3' cellspacing='1' bordercolor='gray'>");
	     pw.println(" <tr>");
		    pw.println(" <td width='30%' align='center'>WRITER</td>");
			 pw.println("<td><input name='writer' readonly value='"+writer+"' size='80'/></td>");
		pw.println("  </tr>");
		  pw.println("<tr>");
		    pw.println(" <td align='center'>EMAIL</td>");
			pw.println(" <td><input name='email' value='"+email+"' size='80'/></td>");
		 pw.println(" </tr>");
          pw.println("<tr>");
		    pw.println(" <td align='center'>SUBJECT</td>");
			pw.println(" <td><input name='subject' value='"+subject+"' size='80'/></td>");
		 pw.println(" </tr>");
		 pw.println(" <tr>");
		     pw.println("<td align='center'>CONTENT</td>");
			pw.println(" <td><textarea id='ta' name='content' rows='15' cols='60'>"+content+"</textarea></td>");
		 pw.println(" </tr>");
		  pw.println("<tr>");
		    pw.println(" <td colspan='2' align='center'>");
				pw.println("<input type='submit' value='수정' onclick='check()'>");
				pw.println("<input type='button' value='다시입력' onclick='f()'>");
			 pw.println("</td>");
		  pw.println("</tr>");
	   pw.println("</table>");
	   pw.println("<hr width='750' size='2' color='gray' noshade>");
	pw.println("</form>");
	pw.println("</font>");
 pw.println(" </body>");
			}
		}catch(SQLException se){
		}finally{
			try{
				if(rs != null) rs.close();
			}catch(SQLException se){}
		}
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)
		throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");

		String writer = req.getParameter("writer");
			if(writer != null) writer = writer.trim();
		String email = req.getParameter("email");
			if(email != null) email = email.trim();
		String subject = req.getParameter("subject");
			if(subject != null) subject = subject.trim();
		String content = req.getParameter("content");
			if(content != null) content = content.trim();
       
	    res.setContentType("text/html;charset=utf-8");
	    PrintWriter pw = res.getWriter();
		pw.println("<script language='javascript'>");
	    try{
			pstmt.setString(1, writer);
			pstmt.setString(2, email);
			pstmt.setString(3, subject);
			pstmt.setString(4, content);
			pstmt.setInt(5, newSeq);
			int i = pstmt.executeUpdate();
			if(i>0){
				pw.println("alert('입력 성공')");
			}else{
				pw.println("alert('입력 실패')");
			}
		}catch(SQLException se){}

            pw.println("location.href='list.do'");
		pw.println("</script>");
	}

}
