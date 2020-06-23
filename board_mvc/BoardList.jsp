<%@ page language="java" contentType="text/html; charset=utf-8" 
import="java.util.*, java.sql.*, mvc.domain.Board"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Board</title>

		<style>
		table, th, td {
						border: 1px solid black;
						border-collapse: collapse;
		}
		th, td {
			padding: 5px;
		}
		a {text-decoration:none; font-family:Comic Sans MS}
		</style>

</head>
<body>
		<center>
		<font color='black' size='4' face='Comic Sans MS'>
		<hr width='600' size='2' color='gray' noshade>
			<h3> MY Board with MVC</h3>
		<font color='gray' size='4' face='Comic Sans MS'>
			<a href='../'>인덱스</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href='board.do?m=write'>글쓰기</a><br/>
		</font>
		<hr width='600' size='2' color='gray' noshade>
	
			<TABLE border='2' width='600' align='center' noshade>
			<TR size='2' align='center' noshade bgcolor='AliceBlue'>
				<th bgcolor='AliceBlue'>no</th>
				<th color='gray'>writer</th>
				<th color='gray'>e-mail</th>
				<th color='gray'>subject</th>
				<th color='gray'>date</th>
			</TR>
<% 	
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	if(list != null && list.size() != 0){
		for(Board bd: list){
%>				
			<TR align='center' noshade>
				<TD><%=bd.getSeq()%></TD>
				<TD><%=bd.getWriter()%></TD>
				<TD><%=bd.getEmail()%></TD>
				<TD>
					<a href='board.do?m=content&seq=<%=bd.getSeq()%>'>
					<%=bd.getSubject()%>
					</a>
				</TD>
				<TD><%=bd.getRdate()%></TD>
			</TR>
<%			
		

		}
	}else{
%>
			<tr>
				<td align='center' colspan="5" >데이터가 없음</td>
			</tr>
<%	
	}
%>

		</table>
	</center>