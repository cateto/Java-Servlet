<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*, soo.db.ConnectionPoolBean"
    pageEncoding="utf-8"%>
    
<jsp:useBean id="pool" class="soo.db.ConnectionPoolBean" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Board</title>
	<script language='javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>");
		<script>
		function f()
		{
	    	input.email.value = "";
	    	input.subject.value = "";
	    	$("#ta").text("");
	    	
	    	input.email.focus();
	    }
	
	   function check()
	   {
	       for(var i=0; i<document.input.elements.length; i++)
		   {
		      if(document.input.elements[i].value == "")
			  {
			     alert("모든 값을 입력 하셔야 합니다. ");
				 return false;
			  }
		   }
		   document.input.submit();
       }
		</script>

</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
		Connection con;
		Statement stmt;
		PreparedStatement pstmt;
		String sql="Update BOARD set WRITER=?, EMAIL=?, SUBJECT=?, CONTENT=?, RDATE=SYSDATE where SEQ=?";
		
		String writer = request.getParameter("writer");
			if(writer != null) writer = writer.trim();
		String email = request.getParameter("email");
			if(email != null) email = email.trim();
		String subject = request.getParameter("subject");
			if(subject != null) subject = subject.trim();
		String content = request.getParameter("content");
			if(content != null) content = content.trim();
		String seqStr = request.getParameter("seq");
			if(content != null) content = content.trim();
		int seq = Integer.parseInt(seqStr);
		
		response.setContentType("text/html;charset=utf-8");
		
		out.println("<script language='javascript'>");
		try{

			if(pool == null) return;
			con = pool.getConnection();	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, email);
			pstmt.setString(3, subject);
			pstmt.setString(4, content);
			pstmt.setInt(5, seq);
			int i = pstmt.executeUpdate();

		}catch(SQLException se){}
		
		out.println("location.href='BoardList.jsp'");
		out.println("</script>");

%>
</body>
</html>