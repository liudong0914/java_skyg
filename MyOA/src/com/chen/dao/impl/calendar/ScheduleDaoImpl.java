package com.chen.dao.impl.calendar;


import org.hibernate.SessionFactory;

import com.chen.dao.calendar.ScheduleDao;
import com.chen.dao.impl.BaseDaoImpl;
import com.chen.entity.Schedule;

public class ScheduleDaoImpl extends BaseDaoImpl<Schedule, Integer> implements ScheduleDao {

	public void setSessionFactory(SessionFactory factory) {
		super.setSessionFactory(factory);
	}
}
