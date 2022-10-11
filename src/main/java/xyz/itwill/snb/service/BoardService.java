package xyz.itwill.snb.service;

import java.util.Map;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xyz.itwill.snb.dto.Board;
import xyz.itwill.snb.dao.BoardMapper;

@Service
public class BoardService {

	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	@Autowired
	private BoardMapper boardMapper;
	
	public List<Board> select() {
		logger.info("BoardService select");
		return boardMapper.select();
	}
	
	public List<Board> selectByLocation(String location) {
		logger.info("BoardService select By Location");
		return boardMapper.selectByLocation(location);
	}
}
