<%@ page language="java" contentType="text/html; charset=utf-8" 
import="java.util.*, java.sql.*, mvc.domain.Board"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY Board with MVC</title>
		<style>
			table, th, td {
							border: 1px solid black;
							border-collapse: collapse;
							font-family:Comic Sans MS"
			}
			th, td {
					padding: 5px;
					font-family:Comic Sans MS"
			}	
			a { text-decoration:none;
				font-family:Comic Sans MS}

			input { text-decoration:none;
					font-family:Comic Sans MS}
		</style>
		
		<script language='javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
		<script>
			function f()
			{
				input.email.value = '';
				input.subject.value = '';
				$('#ta').text('');
			
				input.email.focus();
			}
	
			function check(){  
				for(var i=0; i<document.input.elements.length; i++){
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
<body onload='input.writer.focus()'>
	<font color='black' size='4' face='Comic Sans MS'>
	<center>
	<hr width='750' size='2' color='gray' noshade>
	<h3> MY Board </h3>
	<font color='gray' size='3' face='Comic Sans MS'>
	<a href='board.do'>리스트</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href='../'>인덱스</a>
	</font>
	<hr width='750' size='2' color='gray' noshade>
	</center>

<%
	
	
	Board bd = (Board)request.getAttribute("content");


%>

		<form name='input' method='post' action='board.do?m=update_p'>
			<input type='hidden' name='seq' value=<%=bd.getSeq()%>>
			<table border='0' width='630' align='center'  cellpadding='3' cellspacing='1' bordercolor='gray'>
				<tr>
					<td width='30%' align='center'>WRITER</td>
					<td><input name='writer' readonly value='<%=bd.getWriter()%>' size='80'/></td>
				</tr>
				<tr>
					<td align='center'>EMAIL</td>
					<td><input name='email' value='<%=bd.getEmail()%>' size='80'/></td>
				</tr>
				<tr>
					<td align='center'>SUBJECT</td>
					<td><input name='subject' value='<%=bd.getSubject()%>' size='80'/></td>
				</tr>
				<tr>
					<td align='center'>CONTENT</td>
					<td><textarea id='ta' name='content' rows='15' cols='60'><%=bd.getContent()%></textarea></td>
				</tr>
				<tr>
					<td colspan='2' align='center'>
						<input type='submit' value='수정' onclick='return check()'>
						<input type='button' value='다시입력' onclick='f()'>
					</td>
				</tr>
			</table>
			<hr width='750' size='2' color='gray' noshade>
		</form>
		</font>
		</body>

</html>