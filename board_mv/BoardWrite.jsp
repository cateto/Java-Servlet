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
</head>
<body>
<% 

%>
	    <script language='javascript'>
		if(<%=boardDao.insert(boardDto)%>){
			alert('입력 성공 (with MV)');
		}else{
			alert('입력 실패 (with MV)');
		}
		location.href='BoardList.jsp';

		</script>

</body>
</html>