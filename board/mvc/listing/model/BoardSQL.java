package board.mvc.listing.model;

class BoardSQL {
	
	static final String LIST = "select * from (select ROWNUM rnum, aa.* from (select * from BOARD order by SEQ desc) aa) where rnum>? and rnum<=?";
	static final String TOTAL = "select count(*) from BOARD";
	static final String DELETE = "delete from BOARD where SEQ=?";
	static final String INPUT = "insert into BOARD values(BOARD_SEQ.nextval, ?, ?, ?, ?, SYSDATE)";
	static final String UPDATE = "update BOARD set WRITER=?, EMAIL=?, SUBJECT=?, CONTENT=?, RDATE=SYSDATE where SEQ=?";
	

}
