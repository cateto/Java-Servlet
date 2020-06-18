package com.music;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

public class GetServlet extends HttpServlet
{
  
	protected void service(HttpServletRequest req, HttpServletResponse res)
                throws ServletException, IOException{
		
		String name = req.getParameter("name");
		String loc = req.getParameter("loc");

		res.setContentType("text/html;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.println("<body bgcolor='skyblue'>");
		pw.println("<center>");
			pw.println("<h2> 안녕하세요. " +name+"님의 입장을 환영합니다. "+loc+"에서 접속하셨군요. </h2>");
			pw.println("<br/><br/><br/>");
			pw.println("<a href ='./'> <img src='https://img.icons8.com/material/50/000000/circled-left-2--v1.png'/> </a>");
		pw.println("</center>");
		pw.println("</body>");

	}

}
