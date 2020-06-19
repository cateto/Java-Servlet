<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*, soo.db.ConnectionPoolBean"
    pageEncoding="UTF-8"%>

<jsp:useBean id="pool" class="soo.db.ConnectionPoolBean" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY Board</title>
</head>
<body>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	int seq = 0;
	String sql = "delete from BOARD where SEQ=?";
	try{
		String seqStr =  request.getParameter("seq");
		if(seqStr != null) seqStr = seqStr.trim();
		seq = Integer.parseInt(seqStr);
	}catch(NumberFormatException ne){}
	
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
	
	response.sendRedirect("BoardList.jsp");

%>
</body>
</html>