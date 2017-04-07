package com.chen.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * 日程表
 */

public class Schedule implements java.io.Serializable {

	// Fields

	private Integer scheduleId;
	private Meetinginfo meetinginfo;
	private Users users;
	private String title;
	private String address;
	private Timestamp beginTime;
	private Timestamp endTime;
	private String schContent;
	private Timestamp createTime;
	private Integer ifPrivate;
	private Set userses=new HashSet(0);
	


	// Constructors

	public Set getUserses() {
		return userses;
	}

	public void setUserses(Set userses) {
		this.userses = userses;
	}

	/** default constructor */
	public Schedule() {
	}

	/** minimal constructor */
	public Schedule(Meetinginfo meetinginfo, Users users, String title,
			String address, Timestamp beginTime, Timestamp endTime,
			Timestamp createTime) {
		this.meetinginfo = meetinginfo;
		this.users = users;
		this.title = title;
		this.address = address;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.createTime = createTime;
	}

	/** full constructor */
	public Schedule(Meetinginfo meetinginfo, Users users, String title,
			String address, Timestamp beginTime, Timestamp endTime,
			String schContent, Timestamp createTime, Integer ifPrivate
			) {
		this.meetinginfo = meetinginfo;
		this.users = users;
		this.title = title;
		this.address = address;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.schContent = schContent;
		this.createTime = createTime;
		this.ifPrivate = ifPrivate;
		
	}

	// Property accessors

	public Integer getScheduleId() {
		return this.scheduleId;
	}

	public void setScheduleId(Integer scheduleId) {
		this.scheduleId = scheduleId;
	}

	public Meetinginfo getMeetinginfo() {
		return this.meetinginfo;
	}

	public void setMeetinginfo(Meetinginfo meetinginfo) {
		this.meetinginfo = meetinginfo;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Timestamp getBeginTime() {
		return this.beginTime;
	}

	public void setBeginTime(Timestamp beginTime) {
		this.beginTime = beginTime;
	}

	public Timestamp getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	public String getSchContent() {
		return this.schContent;
	}

	public void setSchContent(String schContent) {
		this.schContent = schContent;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Integer getIfPrivate() {
		return this.ifPrivate;
	}

	public void setIfPrivate(Integer ifPrivate) {
		this.ifPrivate = ifPrivate;
	}


	//辅助类
	private Integer deptId;
	private Integer machineId;


	public Integer getMachineId() {
		return machineId;
	}

	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	
}