package com.music;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.util.*;

public class PostServlet extends HttpServlet
{
	

	protected void service(HttpServletRequest req, HttpServletResponse res)
                throws ServletException, IOException{

		Vector<String> v = new Vector();
		Random r = new Random();
		v.add("I'm not Real User haha");
		v.add("닌텐도가 더 재미있네요;;ㅈㅅ");
		v.add("색이 참 예쁘네요");
		v.add("Good morning");
		int random = r.nextInt(v.size());
		
		req.setCharacterEncoding("utf-8");
		String comment = req.getParameter("comment");
		v.add(comment);
		res.setContentType("text/html;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.println("<body bgcolor='pink'>");
		pw.println("<center>");
			pw.println("<h2> 안녕하세요. 당신의 소중한 의견 <font color='blue'>"+comment+"</font> 고마워요. </h2>");
			pw.println("<h2> Thank you for you comment! <font color='blue'> </font></h2>");			
			pw.println("<br/><br/><br/>");
			pw.println("<h2> '"+ v.get(random) + "' This is Random comment from other user :) </h2><br/><br/>");
			pw.println("<a href ='form.html'>돌아가기</a>");
		pw.println("</center>");
		pw.println("</body>");

	}

}