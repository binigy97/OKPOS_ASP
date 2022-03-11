package com.okpos.asp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.okpos.asp.domain.memberMng.MemberMngDAO;
import com.okpos.asp.domain.memberMng.PosmemberDTO;

@Service
public class MemberMngService {
	private MemberMngDAO memDao;

	@Autowired
	public void setDao(MemberMngDAO memDao) {
		this.memDao = memDao;
	}
	
	public PosmemberDTO findId(String memId) {
		return memDao.findId(memId);
	}
	
	public String selectAuthById(String memId) {
		Integer authNum = memDao.selectAuthById(memId);
		String auth;

		if (authNum == null) auth = "NULL";
		else if (authNum == 0) auth = "ADMIN";
		else if (authNum == 1) auth = "MANAGER";
		else auth = "USER";
		
		return auth;
	}
	
}
