package com.okpos.asp.domain.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	private BoardDAO mapper;
	
	@Autowired
	public BoardDAOImpl(SqlSession sqlSession) {
		mapper = sqlSession.getMapper(BoardDAO.class);
	}

	@Override
	public List<SysBoardDTO> selectSysboard() {
		return mapper.selectSysboard();
	}

	@Override
	public List<BookBoardDTO> selectBookboard() {
		return mapper.selectBookboard();
	}

	@Override
	public List<DocBoardDTO> selectDocboard() {
		return mapper.selectDocboard();
	}

}
