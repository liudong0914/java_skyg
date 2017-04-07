package com.chen.dao.impl.calendar;



import org.hibernate.SessionFactory;

import com.chen.dao.calendar.PrecontractDao;
import com.chen.dao.impl.BaseDaoImpl;
import com.chen.entity.Precontract;

public class PrecontractDaoImpl extends BaseDaoImpl<Precontract, Integer> implements
		PrecontractDao {
	public void setSessionFactory(SessionFactory factory) {
		super.setSessionFactory(factory);
	}
	
}
