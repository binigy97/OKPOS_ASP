package com.okpos.asp.domain.storeMng;

import java.time.LocalTime;
import java.util.List;

// 매장 관리 DAO
public interface StoreMngDAO {
	// store table(매장정보) select
	public abstract List<StoreDTO> selectStoreByMemId(String memId); // mem_id
	
	// store table(매장정보) insert
	public abstract int insertStore(StoreDTO storeDto);
	
	// store table(매장정보) update
	public abstract int updateStoreForBasic(int id, String name, int type, LocalTime openTime, LocalTime closeTime); // store_id
}
