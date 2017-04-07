package com.chen.service.impl.calendar;


import com.chen.dao.calendar.ScheduleDao;
import com.chen.entity.Schedule;
import com.chen.service.calendar.ScheduleService;
import com.chen.service.impl.BaseServiceImpl;

/**
 * 日程的service实现类
 * @author TCJ
 *
 */
public class ScheduleServiceImpl extends BaseServiceImpl<Schedule, Integer> implements ScheduleService {
		private ScheduleDao scheduleDao;

		public void setScheduleDao(ScheduleDao scheduleDao) {
			this.scheduleDao = scheduleDao;
			super.setBaseDao(scheduleDao);
		}
		
		
		
		
}
