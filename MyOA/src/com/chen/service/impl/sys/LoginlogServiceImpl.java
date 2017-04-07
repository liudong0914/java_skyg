/**
 * 
 */
package com.chen.service.impl.sys;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.chen.bean.Pager;
import com.chen.dao.sys.LoginlogDao;
import com.chen.entity.Loginlog;
import com.chen.service.impl.BaseServiceImpl;
import com.chen.service.sys.LoginlogService;

/**
 * @author Administrator
 * 
 * 
 */
public class LoginlogServiceImpl extends BaseServiceImpl<Loginlog, Integer>
		implements LoginlogService {
	private LoginlogDao loginlogDao;

	public void setLoginlogDao(LoginlogDao loginlogDao) {
		this.loginlogDao = loginlogDao;
		super.setBaseDao(loginlogDao);
	}

}
