package board.mvc.control;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.mvc.model.BoardService;
import mvc.domain.Board;


@WebServlet("/board_mvc/board.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
    	String m = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			if(m.equals("del")) {
				del(request, response);
			}else if(m.equals("content")){
				content(request, response);
			}else if(m.equals("write")){
				write(request, response);
			}else if(m.equals("insert")){
				insert(request, response);
			}else if(m.equals("update")){
				update(request, response);
			}else if(m.equals("update_p")){
				update_p(request, response);
			}else {
				list(request, response);
			}
		}else {
			list(request, response);
		}
	}
	
	private void list(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		BoardService service = BoardService.getInstance();
		ArrayList<Board> list = service.listS();
		request.setAttribute("list", list);
		
		String view = "BoardList.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	
	}
	
	private void del(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
		BoardService service = BoardService.getInstance();
		
		int seq = 0;
		String seqStr = request.getParameter("seq");
		if(seqStr != null) {
			seqStr = seqStr.trim();
			seq = Integer.parseInt(seqStr);
			service.del(seq);
		}
		
		response.sendRedirect("board.do");
	}
	
	private void content(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		BoardService service = BoardService.getInstance();
		
		int seq = 0;
		String seqStr = request.getParameter("seq");
		if(seqStr != null) {
			seqStr = seqStr.trim();
			seq = Integer.parseInt(seqStr);
			Board content = service.content(seq);
			request.setAttribute("content", content);
		}
		
		String view = "BoardContent.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	
	
	}
	
	private void write(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String view = "write.html";
		response.sendRedirect(view);
	}
	
	private void insert(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String writer = request.getParameter("writer");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		Board dto = new Board(-1, writer, email, subject, content, null);
		
		BoardService service = BoardService.getInstance();
		boolean flag = service.insert(dto);
		request.setAttribute("flag", flag);
		
		//System.out.println(flag);
		
		String view = "BoardWrite.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
		
		
	}
	private void update(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		BoardService service = BoardService.getInstance();
		
		int seq = 0;
		String seqStr = request.getParameter("seq");
		if(seqStr != null) {
			seqStr = seqStr.trim();
			seq = Integer.parseInt(seqStr);
			Board content = service.content(seq);
			request.setAttribute("content", content);
		}
		
		String view = "BoardContentUpd.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
		
	}
	
	private void update_p(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		int seq = 0;
		String seqStr = request.getParameter("seq");
		if(seqStr != null) {
			seqStr = seqStr.trim();
			seq = Integer.parseInt(seqStr);
		}
		String writer = request.getParameter("writer");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		Board dto = new Board(seq, writer, email, subject, content, null);
		
		BoardService service = BoardService.getInstance();
		boolean flag = service.update(dto);
		request.setAttribute("flag", flag);
		
		String view = "BoardContentUpd_post.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
		
	}

}
