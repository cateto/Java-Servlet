<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*, soo.db.ConnectionPoolBean"
    pageEncoding="utf-8"%>
    
<jsp:useBean id="pool" class="soo.db.ConnectionPoolBean" scope="application"/>
    
<!DOCTYPE html>
<html>
<head>
<style>
	table, th, td {
	   border: 1px solid black;
	   border-collapse: collapse;
	}
	th, td {
	   padding: 5px; font-family:Comic Sans MS
	}
	a { text-decoration:none }
</style>
<meta charset="utf-8">
<title>My Board</title>
</head>
<body>
	<center>
	<font color=black size='4' face='Comic Sans MS'>
	<hr width='600' size='2' color='gray' noshade>
	<h3>MY Board</h3>
	<font color='gray' size='4' face='Comic Sans MS'>
	<a href='write.html'>글쓰기</a>
	</font>
	<hr width='600' size='2' color='gray' noshade>
	</font>

<% 
	int newSeq=0;
	int seq=0;
	try{
		String seqStr = request.getParameter("seq");
		if(seqStr != null) seqStr = seqStr.trim();
		seq = Integer.parseInt(seqStr);
	}catch(NumberFormatException ne){}
	String sql = "select * from BOARD where SEQ ="+seq+" order by SEQ desc";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		if(pool == null) return;
		con = pool.getConnection();
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			newSeq = rs.getInt(1);
			String writer = rs.getString(2);
			String email = rs.getString(3);
			String subject = rs.getString(4);
			String content = rs.getString(5);
			Date rdate = rs.getDate(6);
%>
			<table border='2' width='600' align='center' noshade>
			<tr>
			<td width='20%' align='center' bgcolor='AliceBlue'>No</td>
			<td><%=newSeq%></td>
			</tr>
			<tr>
			<td width='20%' align='center' bgcolor='AliceBlue'>Writer</td>
			<td><%=writer%></td>
			</tr>
			<tr>
			<td align='center' bgcolor='AliceBlue'>E-mail</td>
			<td><%=email%></td>
			</tr>
			<tr>
			<td align='center' bgcolor='AliceBlue'>Subject</td>
			<td><%=subject%></td>
			</tr>
			<tr>
			<td align='center' bgcolor='AliceBlue'>Contents</td>
			<td><%=content%></td>
			</tr>
			<td align='center' bgcolor='AliceBlue'>Date</td>
			<td><%=rdate%></td>
			</table>
<%
		}
	}catch(SQLException se){
	}finally{
		try{
			if(rs != null) rs.close();
			if(con != null) pool.returnConnection(con);
		}catch(SQLException se){}
	}
%>
		<hr width='600' size='2' color='gray' noshade>
		<font color='gray' size='4' face='Comic Sans MS'>
		<a href='BoardContentUpd.jsp?seq=<%=newSeq%>'>수정</a>
		&nbsp;&nbsp;|
		<a href='BoardContentDel.jsp?seq=<%=newSeq%>'>삭제</a>
		&nbsp;&nbsp;|
		<a href='BoardList.jsp'>목록</a>
		</font>
		<hr width='600' size='2' color='gray' noshade>
		</center>
</body>	
</html>