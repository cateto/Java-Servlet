<%@ page language="java" contentType="text/html; charset=utf-8" 
import="java.util.*, java.sql.*, board.mv.model.BoardDTO,soo.db.ConnectionPoolBean,board.mv.model.BoardDAO"%>
<jsp:useBean id="pool" class="soo.db.ConnectionPoolBean" scope="application"/>
<jsp:useBean id="boardDao" class="board.mv.model.BoardDAO" scope="application"></jsp:useBean>


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

		String seqStr = request.getParameter("seq");
		if(seqStr != null) seqStr = seqStr.trim();
		
		int seq = Integer.parseInt(seqStr);
	BoardDTO bd = boardDao.content(seq);
%>
		<table border='2' width='600' align='center' noshade>
		<tr>
		<td width='20%' align='center' bgcolor='AliceBlue'>No</td>
		<td><%=seq%></td>
		</tr>
		<tr>
		<td width='20%' align='center' bgcolor='AliceBlue'>Writer</td>
		<td><%=bd.getWriter()%></td>
		</tr>
		<tr>
		<td align='center' bgcolor='AliceBlue'>E-mail</td>
		<td><%=bd.getEmail()%></td>
		</tr>
		<tr>
		<td align='center' bgcolor='AliceBlue'>Subject</td>
		<td><%=bd.getSubject()%></td>
		</tr>
		<tr>
		<td align='center' bgcolor='AliceBlue'>Contents</td>
		<td><%=bd.getContent()%></td>
		</tr>
		<td align='center' bgcolor='AliceBlue'>Date</td>
		<td><%=bd.getRdate()%></td>
		</table>

		<hr width='600' size='2' color='gray' noshade>
		<font color='gray' size='4' face='Comic Sans MS'>
		<a href='BoardContentUpd.jsp?seq=<%=seq%>'>수정</a>
		&nbsp;&nbsp;|
		<a href='BoardContentDel.jsp?seq=<%=seq%>'>삭제</a>
		&nbsp;&nbsp;|
		<a href='BoardList.jsp'>목록</a>
		</font>
		<hr width='600' size='2' color='gray' noshade>
		</center>
</body>	
</html>
<%
%>