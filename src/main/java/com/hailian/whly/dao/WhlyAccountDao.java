package com.hailian.whly.dao;

import java.util.List;

import com.hailian.whly.entity.WhlyAccount;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

@MyBatisDao
public interface WhlyAccountDao{
	public List<WhlyAccount> getWhlyAccountList(WhlyAccount a);
}
