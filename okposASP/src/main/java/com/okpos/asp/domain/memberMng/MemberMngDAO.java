package com.okpos.asp.domain.memberMng;

import java.util.List;

// 회원 정보(WebASP 이용자, 매점별 회원)를 다루는 DAO
public interface MemberMngDAO {
	// id 검색
	public abstract PosmemberDTO findId(String memId);
	
	// 권한 조회
	public abstract Integer selectAuthById(String memId);
	
	// 매장별회원 조회
	public abstract List<StorememberDTO> selectStoreMemberById(String memId);
}
