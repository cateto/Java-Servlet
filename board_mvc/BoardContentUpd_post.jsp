<%@ page language="java" contentType="text/html; charset=utf-8" 
import="java.util.*, java.sql.*, mvc.domain.Board"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Board with MVC</title>

</head>
<body>
		<script language='javascript'>

			if(${flag}){
				alert('입력 성공 (with MV)');
			}else{
				alert('입력 실패 (with MV)');
			}
		
			location.href='board.do';
		</script>
</body>
</html>