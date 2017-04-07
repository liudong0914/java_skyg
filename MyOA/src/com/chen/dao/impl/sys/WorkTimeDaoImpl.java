package com.chen.dao.impl.sys;

import org.hibernate.SessionFactory;

import com.chen.dao.impl.BaseDaoImpl;
import com.chen.dao.sys.WorkTimeDao;
import com.chen.entity.Worktime;

public class WorkTimeDaoImpl extends BaseDaoImpl<Worktime, Integer> implements WorkTimeDao{
	public void setSessionFactorys(SessionFactory factory){
		super.setSessionFactory(factory);
	}
}
