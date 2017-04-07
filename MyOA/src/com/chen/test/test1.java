package com.chen.test;

import java.io.Serializable;

import com.chen.dao.BaseDao;
import com.chen.dao.impl.BaseDaoImpl;
import com.chen.entity.Users;
import com.chen.service.impl.sys.UserServiceImpl;
import com.chen.service.sys.UserService;

public class test1 {
	public static void main(String[] args) {

		UserService userService = new UserServiceImpl();
		Users users = userService.get("userid", 1);
		System.out.println(users.getDept());

	}

}
