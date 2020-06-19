<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*, soo.db.ConnectionPoolBean"
    pageEncoding="utf-8"%>
    
<jsp:useBean id="pool" class="soo.db.ConnectionPoolBean" scope="application"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Board</title>
</head>
<body>
<% 
	response.setContentType("text/html;charset=utf-8");
	out.println("<style>");
	out.println("table, th, td {");
	out.println("border: 1px solid black;");
	out.println("border-collapse: collapse;");
	out.println("}");
	out.println("th, td {");
	out.println("padding: 5px;");
	out.println("}");
	out.println("a {text-decoration:none; font-family:Comic Sans MS}");
	out.println("</style>");
	out.println("</head>");
	out.println("<body>");
	out.println("<center>");
	out.println("<font color='black' size='4' face='Comic Sans MS'>");
	out.println("<hr width='600' size='2' color='gray' noshade>");
	out.println("<h3> MY Board </h3>");
	out.println("<font color='gray' size='4' face='Comic Sans MS'>");
	out.println("<a href='./'>인덱스</a>");
	out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
	out.println("<a href='write.html'>글쓰기</a><br/>");
	out.println("</font>");
	out.println("<hr width='600' size='2' color='gray' noshade>");
	
		out.println("<TABLE border='2' width='600' align='center' noshade>");
		out.println("<TR size='2' align='center' noshade bgcolor='AliceBlue'>");
		out.println("<th bgcolor='AliceBlue'>no</th>");
		out.println("<th color='gray'>writer</th>");
		out.println("<th color='gray'>e-mail</th>");
		out.println("<th color='gray'>subject</th>");
		out.println("<th color='gray'>date</th>");
		out.println("</TR>");
	
	String sql = "select * from BOARD order by SEQ desc";
	Connection con =null;
	Statement stmt =null;
	ResultSet rs = null;
	
	try{
		if(pool == null) return;
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
				out.println("<TR align='center' noshade>");
				out.println("<TD>"+seq+"</TD>");
				out.println("<TD>"+writer+"</TD>");
				out.println("<TD>"+email+"</TD>");
				out.println("<TD>");  
				out.println("<a href='BoardContent.jsp?seq="+seq+"'>");
				out.println(subject);
				out.println("</a>");
				out.println("</TD>");
				out.println("<TD>"+rdate+"</TD>");
				out.println("</TR>");
		}
	}catch(SQLException se){
	}finally{
		try{
			if(rs != null) rs.close();
			if(con != null) pool.returnConnection(con);
		}catch(SQLException se){}
	}
		out.println("</table>");
		out.println("</center>");



%>

</body>
</html>