package board.mvc.listing.model;

import java.util.ArrayList;

import board.mvc.vo.ListResult;
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
	
	public ArrayList<Board> listS(int cp, int ps){
		return dao.list(cp, ps);
	}
	
	public long total() {
		return dao.total();
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
	
	public ListResult getListResult(int cp, int ps) {
		return new ListResult(cp, total(), ps, listS(cp, ps));
	}

}
