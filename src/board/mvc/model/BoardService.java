package board.mvc.model;

import java.util.ArrayList;

import mvc.domain.Board;

public class BoardService {
	
	//SingleTon Object Model
	
	private BoardDAO dao;
	private static final BoardService instance = new BoardService();
	private BoardService() {
		dao = new BoardDAO();
	}
	public static BoardService getInstance() {
		return instance;
	}
	
	public ArrayList<Board> listS(){
		return dao.list();
	}
	
	public Board content(int seq){
		return dao.content(seq);
	}
	
	public void del(int seq){
		dao.del(seq);
	}
	
	public boolean insert(Board dto) {
		return dao.insert(dto);
	}
	
	public boolean update(Board dto) {
		return dao.update(dto);
	}

}
