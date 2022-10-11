package xyz.itwill.snb.service;



import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import xyz.itwill.snb.dao.BoardDAO;
import xyz.itwill.snb.dto.Board;

@Service
@RequiredArgsConstructor
public class WriteServiceImpl implements WriteService {	
	private final BoardDAO boardDAO;
	
	@Override
	public void addBoard(Board board) {
		boardDAO.insertBoard(board);
		
	}

	@Override
	public void modifyBoard(Board board) {
		boardDAO.updateBoard(board);
	}

	@Override
	public void removeBoard(int num) {
		boardDAO.deleteBoard(num);
	}

	@Override
	public Board getBoard(String userid) {
		return boardDAO.selectBoard(userid);
	}

	@Override
	public Board choiceBoard(int num) {
		return boardDAO.choiceBoard(num);
	}

	@Override
	public void updateStatusBoard(int num) {
		boardDAO.updateStatusBoard(num);
	}
	

}
