<%@page contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<% 
%>
	    <script language='javascript'>
		
	    if(${flag}){
			alert('입력 성공 (with MVC)');
		}else{
			alert('입력 실패 (with MVC)');
		}
	    
	    location.href='board.do'; 

		</script>

</body>
</html>