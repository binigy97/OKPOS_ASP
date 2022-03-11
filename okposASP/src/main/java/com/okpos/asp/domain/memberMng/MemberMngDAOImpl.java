package com.okpos.asp.domain.memberMng;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberMngDAOImpl implements MemberMngDAO {
	private MemberMngDAO mapper;
	
	@Autowired
	public MemberMngDAOImpl(SqlSession sqlSession) {
		mapper = sqlSession.getMapper(MemberMngDAO.class);
	}

	@Override
	public PosmemberDTO findId(String memId) {
		return mapper.findId(memId);
	}

	@Override
	public Integer selectAuthById(String memId) {
		return mapper.selectAuthById(memId);
	}

	@Override
	public List<StorememberDTO> selectStoreMemberById(String memId) {
		return mapper.selectStoreMemberById(memId);
	}

}
