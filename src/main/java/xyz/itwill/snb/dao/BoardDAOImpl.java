package xyz.itwill.snb.dao;



import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.itwill.snb.dto.Board;
import xyz.itwill.snb.mapper.BoardMapper;

@Repository
@RequiredArgsConstructor
public class BoardDAOImpl implements BoardDAO {
	private final SqlSession sqlSession;	
	
	@Override
	public int insertBoard(Board board) {
		return sqlSession.getMapper(BoardMapper.class).insertBoard(board);
	}

	@Override
	public int updateBoard(Board board) {
		return sqlSession.getMapper(BoardMapper.class).updateBoard(board);
	}

	@Override
	public int deleteBoard(int num) {
		return sqlSession.getMapper(BoardMapper.class).deleteBoard(num);
	}

	@Override
	public Board choiceBoard(int num) {
		return sqlSession.getMapper(BoardMapper.class).choiceBoard(num);
	}

	@Override
	public Board selectBoard(String userid) {
		return sqlSession.getMapper(BoardMapper.class).selectBoard(userid);
	}

	@Override
	public int updateStatusBoard(int num) {
		return sqlSession.getMapper(BoardMapper.class).updateStatusBoard(num);
	}
	
}
