<%@ page language="java" contentType="text/html; charset=utf-8" 
import="java.util.*, java.sql.*, board.mv.model.BoardDTO,soo.db.ConnectionPoolBean,board.mv.model.BoardDAO"%>
<jsp:useBean id="pool" class="soo.db.ConnectionPoolBean" scope="application"/>
<jsp:useBean id="boardDao" class="board.mv.model.BoardDAO" scope="application"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
response.setContentType("text/html;charset=utf-8");
Connection con = null;
Statement stmt = null;
PreparedStatement pstmt = null; 
int newSeq =0;

		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='utf-8'>");
		out.println("<title>MY Board</title>");
		out.println("<style>");
		out.println("table, th, td {");
		out.println("border: 1px solid black;");
		out.println(" border-collapse: collapse;");
		out.println("font-family:Comic Sans MS");
		out.println("}");
		out.println("th, td {");
		out.println("  padding: 5px;");
		out.println("font-family:Comic Sans MS");
		out.println("}");
		out.println("a { text-decoration:none;");
		out.println("font-family:Comic Sans MS}");

		out.println("input { text-decoration:none;");
		out.println("font-family:Comic Sans MS}");
		out.println("</style>");
		out.println("<script language='javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>");
		out.println("<script>");
		out.println("function f()");
		out.println("{");
		out.println("input.email.value = '';");
		out.println("input.subject.value = '';");
		out.println("$('#ta').text('');");
			
		out.println("input.email.focus();");
		out.println("}");
	
		out.println("function check()");
		out.println("{");
		out.println(" for(var i=0; i<document.input.elements.length; i++)");
		out.println("{");
		out.println(" if(document.input.elements[i].value == '')");
		out.println("{");
		out.println("alert('모든 값을 입력 하셔야 합니다. ');");
		out.println(" return false;");
		out.println("}");
		out.println("}");
		out.println("document.input.submit();");
		out.println("}");
		out.println("</script>");
		out.println("</head>");
		out.println("<body onload='input.writer.focus()'>");
		out.println("<font color='black' size='4' face='Comic Sans MS'>");
		out.println("<center>");
		out.println("<hr width='750' size='2' color='gray' noshade>");
		out.println("<h3> MY Board </h3>");
		out.println("<font color='gray' size='3' face='Comic Sans MS'>");
		out.println("<a href='BoardList.jsp'>리스트</a>");
		out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		out.println("<a href='../'>인덱스</a>");
		out.println("</font>");
		out.println("<hr width='750' size='2' color='gray' noshade>");
		out.println("</center>");


	String seqStr = request.getParameter("seq");
	if(seqStr != null) seqStr = seqStr.trim();
	
	int seq = Integer.parseInt(seqStr);
	BoardDTO bd = boardDao.content(seq);

		out.println("<form name='input' method='post' action='BoardContentUpd_post.jsp'>");
		out.println("<input type='hidden' name='seq' value="+seq+">");
		out.println("<table border='0' width='630' align='center'  cellpadding='3' cellspacing='1' bordercolor='gray'>");
		out.println(" <tr>");
		out.println(" <td width='30%' align='center'>WRITER</td>");
		out.println("<td><input name='writer' readonly value='"+bd.getWriter()+"' size='80'/></td>");
		out.println("  </tr>");
		out.println("<tr>");
		out.println(" <td align='center'>EMAIL</td>");
		out.println(" <td><input name='email' value='"+bd.getEmail()+"' size='80'/></td>");
		out.println(" </tr>");
		out.println("<tr>");
		out.println(" <td align='center'>SUBJECT</td>");
		out.println(" <td><input name='subject' value='"+bd.getSubject()+"' size='80'/></td>");
		out.println(" </tr>");
		out.println(" <tr>");
		out.println("<td align='center'>CONTENT</td>");
		out.println(" <td><textarea id='ta' name='content' rows='15' cols='60'>"+bd.getContent()+"</textarea></td>");
		out.println(" </tr>");
		out.println("<tr>");
		out.println(" <td colspan='2' align='center'>");
		out.println("<input type='submit' value='수정' onclick='check()'>");
		out.println("<input type='button' value='다시입력' onclick='f()'>");
		out.println("</td>");
		out.println("</tr>");
		out.println("</table>");
		out.println("<hr width='750' size='2' color='gray' noshade>");
		out.println("</form>");
		out.println("</font>");
		out.println(" </body>");


%>
</body>
</html>