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
		v.add("���ٵ��� �� ����ֳ׿�;;����");
		v.add("���� �� ���ڳ׿�");
		v.add("Good morning");
		int random = r.nextInt(v.size());
		
		req.setCharacterEncoding("utf-8");
		String comment = req.getParameter("comment");
		v.add(comment);
		res.setContentType("text/html;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.println("<body bgcolor='pink'>");
		pw.println("<center>");
			pw.println("<h2> �ȳ��ϼ���. ����� ������ �ǰ� <font color='blue'>"+comment+"</font> ������. </h2>");
			pw.println("<h2> Thank you for you comment! <font color='blue'> </font></h2>");			
			pw.println("<br/><br/><br/>");
			pw.println("<h2> '"+ v.get(random) + "' This is Random comment from other user :) </h2><br/><br/>");
			pw.println("<a href ='form.html'>���ư���</a>");
		pw.println("</center>");
		pw.println("</body>");

	}

}