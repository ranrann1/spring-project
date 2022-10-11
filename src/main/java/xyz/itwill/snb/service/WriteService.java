package xyz.itwill.snb.service;




import xyz.itwill.snb.dto.Board;



public interface WriteService {
	void addBoard(Board board);
	void modifyBoard(Board board);
	void removeBoard(int num);
	Board getBoard(String userid);
	Board choiceBoard(int num);
	void updateStatusBoard(int num);
}
