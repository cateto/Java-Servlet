<%@ page language="java" contentType="text/html; charset=utf-8" 
import="java.util.*, java.sql.*, mvc.domain.Board, board.mvc.vo.ListResult"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
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
			<h3> MY Board with MVC(Listing)</h3>
		<font color='gray' size='4' face='Comic Sans MS'>
			<a href='../'><button class="btn btn-default">인덱스</button></a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href='board.do?m=write'><button class="btn btn-default">글쓰기</button></a><br/>
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
	ListResult listResult = (ListResult)request.getAttribute("listResult");
			
	int cp = listResult.getCurrentPage();
	int ps = listResult.getPageSize();
	long tpc = listResult.getTotalPageCount();
	ArrayList<Board> list = listResult.getList(cp,ps);
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
		
		<hr width='600' size='2' color='gray' noshade>
			<font color='gray' size='3' face='Comic Sans MS'>
				(Total Page : <%=tpc%>)	&nbsp;&nbsp;&nbsp;
				
		<% for(int i=1; i<=tpc; i++){ %>
			<a href="board.do?m=list&cp=<%=i%>&ps=<%=ps%>">
			<%=i%></a>&nbsp;
		<% 
			} 
		%>
    			( TOTAL : <%=listResult.getTotalCount()%> )
    			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    			Page Size :
    			<select id="psId" name="ps" onchange="f(this)">
					<option id="3" value="3" >3</option>
					<option id="5" value="5">5</option>
					<option id="10" value="10">10</option>
				</select>
				 
				 
				<script language="javascript">
       				window.onload = function(){
       				
       				<%--var ps = getCookie("ps");
       					
       					if(ps == <%=ps%>){
       						var psId = document.getElementById("psId");
       						for(var i=0; i<psId.length; i++){
    					        if(psId[i].value==ps){
    					        	console.log("sel[i].value is "+psId[i].value);
    					            psId[i].selected = true;
    					        }
    					    }
       					} --%>
       					
						var sel = document.getElementById("psId");
						for(var i=0; i<sel.length; i++){
					        if(sel[i].value==<%=ps%>){
					        	console.log("sel[i].value is "+sel[i].value);
					            sel[i].selected = true;
					        }
					    }
       						
       							
       				}
       				
       				var getCookie = function(name) {
       					var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
       					return value? value[2] : null;
       				};


					function f(select){
           				var ps = select.value;
						alert("ps : " + ps);
						console.log("ps :"+ps); <%-- 기능 : 웹페이지 콘솔창에 찍힘 (크롬 개발자 도구 : f12 )--%>

						location.href="board.do?m=list&cp=1&ps="+ps;
       				}
    			</script>
    			
		
	</center>