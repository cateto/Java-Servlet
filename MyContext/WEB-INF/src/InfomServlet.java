package com.music;

import javax.servlet.http.*;
import javax.servlet.*;

public class InfomServlet extends HttpServlet
{
  
	protected void service(HttpServletRequest req, HttpServletResponse res)
                throws ServletException, java.io.IOException{
		
		res.setContentType("text/html;charset=utf-8");
		java.io.PrintWriter pw = res.getWriter();
		pw.println("<body bgcolor='Turquoise'>");
		pw.println("<center>");
		pw.println("<h2> �ȳ��ϼ���? �� ���� �پ��� ���� ������ �Ұ��ϴ� ���������Դϴ�.</h2><br/>");
		pw.println("<h3> Hello Surfer? This is a web page introducing various world music.</h3><br/>");
		

		pw.println("<a href ='./'> <img src='https://img.icons8.com/material/50/000000/circled-left-2--v1.png'/> </a>");
		pw.println("</center>");
		pw.println("</body>");

	}

}
