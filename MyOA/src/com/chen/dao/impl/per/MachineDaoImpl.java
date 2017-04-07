package com.chen.dao.impl.per;

import org.hibernate.SessionFactory;

import com.chen.dao.impl.BaseDaoImpl;
import com.chen.dao.per.MachineDao;
import com.chen.entity.Machine;

public class MachineDaoImpl extends BaseDaoImpl<Machine, Integer> implements
		MachineDao {
	public void setSessionFactory(SessionFactory factory) {
		super.setSessionFactory(factory);
	}
}
