package com.okpos.asp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.okpos.asp.domain.storeMng.StoreMngDAO;

@Service
public class StoreMngService {
	private StoreMngDAO storeDao;

	@Autowired
	public void setStoreDao(StoreMngDAO storeDao) {
		this.storeDao = storeDao;
	}
}
