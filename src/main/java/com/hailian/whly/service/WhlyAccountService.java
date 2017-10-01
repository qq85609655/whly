package com.hailian.whly.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hailian.whly.dao.WhlyAccountDao;
import com.hailian.whly.entity.WhlyAccount;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

@Service
@Transactional(readOnly = true)
public class WhlyAccountService extends CrudService<WhlyAccountDao, WhlyAccount>{
	public WhlyAccount get(String id) {
		return super.get(id);
	}
	
	public List<WhlyAccount> findList(WhlyAccount whlyAccount) {
		return super.findList(whlyAccount);
	}
	
	public Page<WhlyAccount> findPage(Page<WhlyAccount> page, WhlyAccount whlyAccount) {
		return super.findPage(page, whlyAccount);
	}
	
	@Transactional(readOnly = false)
	public void save(WhlyAccount whlyAccount) {
		super.save(whlyAccount);
	}
	
	@Transactional(readOnly = false)
	public void delete(WhlyAccount whlyAccount) {
		super.delete(whlyAccount);
	}
}
