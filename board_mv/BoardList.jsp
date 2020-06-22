<%@ page language="java" contentType="text/html; charset=utf-8" 
import="java.util.*, java.sql.*, board.mv.model.BoardDTO,soo.db.ConnectionPoolBean"%>
<jsp:useBean id="pool" class="soo.db.ConnectionPoolBean" scope="application"/>
<jsp:useBean id="boardDao" class="board.mv.model.BoardDAO" scope="application"></jsp:useBean>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Board</title>
</head>
<body>
<% 
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
	out.println("<a href='../'>인덱스</a>");
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
	
		boardDao.setPool(pool);
		ArrayList<BoardDTO> list = boardDao.list();
		if(list.size()!=0){
			for(BoardDTO dto : list){
%>				
			<TR align='center' noshade>
			<TD><%=dto.getSeq()%></TD>
			<TD><%=dto.getWriter()%></TD>
			<TD><%=dto.getEmail()%></TD>
			<TD>
				<a href='BoardContent.jsp?seq=<%=dto.getSeq()%>'>
				<%=dto.getSubject()%>
				</a>
			</TD>
			<TD><%=dto.getRdate()%></TD>
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
		
		out.println("</table>");
		out.println("</center>");
%>