package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.sys.dao.AccountDao;
import com.thinkgem.jeesite.modules.sys.entity.Account;
import com.thinkgem.jeesite.modules.sys.entity.User;

@Service("AccountService")
public class AccountService{
	@Autowired
	private AccountDao dao;
	public Account get(String id){
		return dao.get(id);
	};
	public List<Account> getByEmail(String email){
		return dao.getByEmail(email);
	};
	public Page<Account> findAccount(Page<Account> page, Account user) {
		// 生成数据权限过滤条件（dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL）
		//user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		// 设置分页参数
		user.setPage(page);
		// 执行分页查询
		page.setList(dao.findList(user));
		return page;
	}
	public Account getByLoginName(String userName){
		return dao.getByLoginName(userName);
	}; 
	public List<Account> findList(Map<String, Object> params){
		return dao.findList(params);
	};
	// 分页总条数
	public Long getAccountpageCounts(Map<String, Object> params){
		return dao.getAccountpageCounts(params);
	};
	public List<Account> findAllList(){
		return dao.findAllList();
	};
	public int insert(Account a){
		return dao.insert(a);
	};
	public int update(Account a){
		return dao.update(a);
	};

	/**
	 * 根据登录名称查询用户
	 * @param loginName
	 * @return
	 */
	public Account getByLoginName(Account user){
		return dao.getByLoginName(user);
	};

	
	/**
	 * 查询全部用户数目
	 * @return
	 */
	public long findAllCount(Account user){
		return dao.findAllCount(user);
	};
	
	/**
	 * 更新用户密码
	 * @param user
	 * @return
	 */
	public int updatePasswordById(Account user){
		return dao.updatePasswordById(user);
	};
	
	

	/**
	 * 删除用户数据
	 * @param user
	 * @return
	 */
	public int delete(Account user){
		return dao.delete(user);
	};
	
	
	
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public int updateUserInfo(Account user){
		return dao.updateUserInfo(user);
	};
	
}
