/**
 * 
 */
package com.chen.dao.impl.sys;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;

import com.chen.bean.Pager;
import com.chen.dao.impl.BaseDaoImpl;
import com.chen.dao.sys.LoginlogDao;
import com.chen.entity.Loginlog;

/**
 * 登录日志
 * @author Administrator
 * 
 */
public class LoginlogDaoImpl extends BaseDaoImpl<Loginlog, Integer> implements
		LoginlogDao {
	public void setSessionFactory(SessionFactory factory) {
		super.setSessionFactory(factory);
	}
}
