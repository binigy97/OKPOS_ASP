package com.okpos.asp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.okpos.asp.domain.board.BoardDAOImpl;
import com.okpos.asp.domain.board.BookBoardDTO;
import com.okpos.asp.domain.board.DocBoardDTO;
import com.okpos.asp.domain.board.SysBoardDTO;

@Service
public class BoardService {

	private BoardDAOImpl dao;
	
	@Autowired
	public void setBoardDAO(BoardDAOImpl dao) {
		this.dao = dao;
	}
	
	public List<SysBoardDTO> selectSysboard() {
		return dao.selectSysboard();
	}

	public List<BookBoardDTO> selectBookboard() {
		return dao.selectBookboard();
	}

	public List<DocBoardDTO> selectDocboard() {
		return dao.selectDocboard();
	}
	
}
