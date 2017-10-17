/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.Account;

/**
 * 用户DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface AccountDao{
	public Account get(String id);
	public List<Account> getByEmail(String email);
	public Account getByLoginName(String userName); 
	public List<Account> findList(Map<String, Object> params);
	// 分页总条数
	public Long getAccountpageCounts(Map<String, Object> params);
	public List<Account> findAllList();
	public int insert(Account a);
	public int update(Account a);
	public List<Account> findList(Account user);

	/**
	 * 根据登录名称查询用户
	 * @param loginName
	 * @return
	 */
	public Account getByLoginName(Account user);

	
	/**
	 * 查询全部用户数目
	 * @return
	 */
	public long findAllCount(Account user);
	
	/**
	 * 更新用户密码
	 * @param user
	 * @return
	 */
	public int updatePasswordById(Account user);
	
	

	/**
	 * 删除用户数据
	 * @param user
	 * @return
	 */
	public int delete(Account user);
	
	
	
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public int updateUserInfo(Account user);

}
