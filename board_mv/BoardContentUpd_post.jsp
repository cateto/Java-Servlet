<%@ page language="java" contentType="text/html; charset=utf-8" 
import="java.util.*, java.sql.*, board.mv.model.BoardDTO,soo.db.ConnectionPoolBean,board.mv.model.BoardDAO"%>
<jsp:useBean id="pool" class="soo.db.ConnectionPoolBean" scope="application"/>
<jsp:useBean id="boardDao" class="board.mv.model.BoardDAO" scope="application"></jsp:useBean>
<jsp:useBean id="boardDto" class="board.mv.model.BoardDTO"/>
<jsp:setProperty name="boardDto" property="*" />

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
		<script language='javascript'>

	
	

	if(<%=boardDao.update(boardDto)%>){
		alert('입력 성공 (with MV)');
	}else{
		alert('입력 실패 (with MV)');
	}

		

			location.href='BoardList.jsp';
		</script>
</body>
</html>