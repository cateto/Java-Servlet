<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>MyBoard INDEX</title>
	  <style>
	      a {text-decoration:none;font-size:12pt; font-family:Comic Sans MS;}
	  </style>
   </head>
   <script>console.log("${loginUser}");</script>
   <body style="text-align:center">
       <h2>Welcome to MyBoard</h2>
	   <br/>
	   <br/>
		
		<c:if test="${empty loginUser}">
		<a href="login/login.do?m=form"><h2>Login</h2></a>
		</c:if>
		<c:if test="${!empty loginUser}">
		<a href="login/login.do?m=out"><h2>Logout</h2></a>
		</c:if>
		<br/><br/><br/><br/><br/>
		<!--<a href="./file/file.do?m=form"><h2>파일 폼</h2></a>  -->
		<a href="./file/file.do?m=list"><h2>파일 리스트</h2></a>
		<br/>
		<a href="board_listing/board.do?cp=1&ps=3"><img src='https://mblogthumb-phinf.pstatic.net/MjAxOTA3MDNfMTAw/MDAxNTYyMTUyNzEzODY1.mMekpyS3sVXTgwrd9C0xgToDp-0dq3EOvf4iIFKDLP4g.wlWcLtghO56PQwyOT0xfHN_z6l3qitVVGJk0chJG7tMg.PNG.krla12q/20190703_201812.png?type=w800'></a>
		<br/>
		
		<a href="board_mvc/board.do"><img src='https://i.ytimg.com/vi/-6CS1er1-RE/hqdefault.jpg'></a>
		<br/>
		
		<a href="BoardList.jsp"><img src='https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQHmxGhjCL-k11mVIzG1Yzo0Gx19Ep7kp9AnbSUVBthoRrwXenk&usqp=CAU'></a>
		<br/>
		<a href="board_mv/BoardList.jsp"><img src='https://w.namu.la/s/92e842aee485ed01c2280f86cef0c72a9aa0bfcf6e2e51833547ff7f797c64d08ff3b3595ce8133db577bde01422ad1c0a6bc04d4451e91486576d812f83967d2d5420a9d14da75a549dde972daa88021bb82e1c8a360db0badd8c503cdfe05edd9d80b8da2c8a54763cce0d6dd9598e'></a>
		<br/>
		
		<audio autoplay controls> <source src="audio/login.mp3" type="audio/mp3"> </audio><br/><br/>

   </body>
</html>