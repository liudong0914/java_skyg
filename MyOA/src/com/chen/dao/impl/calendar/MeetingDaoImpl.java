package com.chen.dao.impl.calendar;


import org.hibernate.SessionFactory;

import com.chen.dao.calendar.MeetingDao;
import com.chen.dao.impl.BaseDaoImpl;
import com.chen.entity.Meetinginfo;

public class MeetingDaoImpl extends BaseDaoImpl<Meetinginfo, Integer> implements MeetingDao {

	public void setSessionFactory(SessionFactory factory) {
		super.setSessionFactory(factory);
	}
}
