package com.okpos.asp.domain.board;

import java.util.List;

public interface BoardDAO {
	
	// sysBoard 테이블 조회
	public abstract List<SysBoardDTO> selectSysboard();
	
	// bookBoard 테이블 조회
	public abstract List<BookBoardDTO> selectBookboard();
	
	// docBoard 테이블 조회
	public abstract List<DocBoardDTO> selectDocboard();
	
}
