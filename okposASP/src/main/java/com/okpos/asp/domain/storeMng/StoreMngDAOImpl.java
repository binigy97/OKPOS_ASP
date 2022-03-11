package com.okpos.asp.domain.storeMng;

import java.time.LocalTime;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreMngDAOImpl implements StoreMngDAO {
	private StoreMngDAO mapper;
	
	@Autowired
	public StoreMngDAOImpl(SqlSession sqlSession) {
		mapper = sqlSession.getMapper(StoreMngDAO.class);
	}

	@Override
	public List<StoreDTO> selectStoreByMemId(String memId) {
		return mapper.selectStoreByMemId(memId);
	}

	@Override
	public int insertStore(StoreDTO storeDto) {
		return mapper.insertStore(storeDto);
	}

	@Override
	public int updateStoreForBasic(int id, String name, int type, LocalTime openTime, LocalTime closeTime) {
		return updateStoreForBasic(id, name, type, openTime, closeTime);
	}

}
