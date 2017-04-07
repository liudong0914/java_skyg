package com.chen.dao.impl.calendar;

import org.hibernate.SessionFactory;

import com.chen.dao.calendar.CalendarDao;
import com.chen.dao.impl.BaseDaoImpl;
import com.chen.entity.Schedule;

public class CalendarDaoImpl extends BaseDaoImpl<Schedule, Integer> implements
		CalendarDao {
	public void setSessionFactory(SessionFactory factory) {
		super.setSessionFactory(factory);
	}
}
