<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*, soo.db.ConnectionPoolBean"
    pageEncoding="UTF-8"%>

<jsp:useBean id="pool" class="soo.db.ConnectionPoolBean" scope="application"/>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<% 
		request.setCharacterEncoding("utf-8");
		String writer = request.getParameter("writer");
			if(writer != null) writer = writer.trim();
		String email = request.getParameter("email");
			if(email != null) email = email.trim();
		String subject = request.getParameter("subject");
			if(subject != null) subject = subject.trim();
		String content = request.getParameter("content");
			if(content != null) content = content.trim();
       
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="insert into BOARD values(BOARD_SEQ.nextval, ?, ?, ?, ?, SYSDATE)";
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
			int i = pstmt.executeUpdate();
			if(i>0){
				out.println("alert('입력 성공')");
			}else{
				out.println("alert('입력 실패')");
			}
		}catch(SQLException se){
			
		}finally{
			try{
				if(con != null) pool.returnConnection(con);
			}catch(SQLException se){}
		}

            out.println("location.href='BoardList.jsp'");
          	out.println("</script>");
          	
%>		
</body>
</html>