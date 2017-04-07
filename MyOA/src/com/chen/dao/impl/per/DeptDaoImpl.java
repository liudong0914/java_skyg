package com.chen.dao.impl.per;

import org.hibernate.SessionFactory;

import com.chen.dao.impl.BaseDaoImpl;
import com.chen.dao.per.DeptDao;
import com.chen.entity.Dept;


public class DeptDaoImpl extends BaseDaoImpl<Dept, Integer> implements DeptDao {
	public void setSessionFactorys(SessionFactory factory) {
		super.setSessionFactory(factory);
	}
}
