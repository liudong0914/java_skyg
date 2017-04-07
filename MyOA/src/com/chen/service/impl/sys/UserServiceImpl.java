package com.chen.service.impl.sys;

import java.io.Serializable;

import com.chen.dao.sys.UserDao;
import com.chen.entity.Users;
import com.chen.service.impl.BaseServiceImpl;
import com.chen.service.sys.UserService;

public class UserServiceImpl extends BaseServiceImpl<Users, Integer> implements
		UserService {
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
		super.setBaseDao(userDao);
	}
}
