<%@ page language="java" contentType="text/html; charset=utf-8" 
import="java.sql.*, board.mv.model.BoardDTO,soo.db.ConnectionPoolBean"%>
<jsp:useBean id="pool" class="soo.db.ConnectionPoolBean" scope="application"/>
<jsp:useBean id="boardDao" class="board.mv.model.BoardDAO" scope="application"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY Board</title>
</head>
<body>
<%

	boardDao.setPool(pool);
	String seqStr =  request.getParameter("seq");
	if(seqStr != null) seqStr = seqStr.trim();
	int seq = Integer.parseInt(seqStr);

	boardDao.del(seq);

	response.sendRedirect("./BoardList.jsp");

%>
</body>
</html>