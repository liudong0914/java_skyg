package com.chen.service.impl.calendar;

import com.chen.dao.calendar.CalendarDao;
import com.chen.entity.Schedule;
import com.chen.service.calendar.CalendarService;
import com.chen.service.impl.BaseServiceImpl;

public class CalendarServiceImpl extends BaseServiceImpl<Schedule, Integer>
		implements CalendarService {
	private CalendarDao calendarDao;

	public void setCalendarDao(CalendarDao calendarDao) {
		this.calendarDao = calendarDao;
		super.setBaseDao(calendarDao);
	}

}
