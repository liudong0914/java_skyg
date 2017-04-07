package com.chen.dao.impl.sys;

import org.hibernate.SessionFactory;

import com.chen.dao.impl.BaseDaoImpl;
import com.chen.dao.sys.UserDao;
import com.chen.entity.Users;

/**
 * 用户实现类
 * 
 * @author Administrator
 * 
 */
public class UserDaoImpl extends BaseDaoImpl<Users, Integer> implements UserDao {
	public void setSessionFactory(SessionFactory factory) {
		
		super.setSessionFactory(factory);
	}
}