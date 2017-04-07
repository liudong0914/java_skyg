package com.chen.service.impl.calendar;


import com.chen.dao.calendar.MeetingDao;
import com.chen.entity.Meetinginfo;
import com.chen.service.calendar.MeetingService;
import com.chen.service.impl.BaseServiceImpl;

/**
 * 会议类型Service实现类
 * @author TCJ
 *
 */
public class MeetingServiceImpl extends BaseServiceImpl<Meetinginfo, Integer> implements MeetingService {
	private MeetingDao meetingDao;

	public void setMeetingDao(MeetingDao meetingDao) {
		this.meetingDao = meetingDao;
		super.setBaseDao(meetingDao);
	}
	
	
}	
