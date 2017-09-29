package com.hailian.whly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hailian.whly.dao.WhlyAccountDao;
import com.hailian.whly.entity.WhlyAccount;

@Service
public class WhlyAccountService {
	@Autowired
	private WhlyAccountDao dao;
	public List<WhlyAccount> getWhlyAccountList(WhlyAccount a){
		return dao.getWhlyAccountList(a);
	}; 
}
