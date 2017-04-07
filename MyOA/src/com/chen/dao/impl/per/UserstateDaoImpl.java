package com.chen.dao.impl.per;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;

import com.chen.bean.Pager;
import com.chen.dao.impl.BaseDaoImpl;
import com.chen.dao.per.UserstateDao;
import com.chen.entity.Userstate;

public class UserstateDaoImpl extends BaseDaoImpl<Userstate, Integer> implements
		UserstateDao {
	public void setSessionFactorys(SessionFactory factory) {
		super.setSessionFactory(factory);
	}
}
