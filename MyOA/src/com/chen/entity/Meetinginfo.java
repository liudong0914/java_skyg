package com.chen.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * 会议信息
 */

public class Meetinginfo implements java.io.Serializable {

	// Fields

	private Integer meetingId;
	private String meetingName;
	private Set schedules = new HashSet(0);

	// Constructors

	/** default constructor */
	public Meetinginfo() {
	}

	/** minimal constructor */
	public Meetinginfo(String meetingName) {
		this.meetingName = meetingName;
	}

	/** full constructor */
	public Meetinginfo(String meetingName, Set schedules) {
		this.meetingName = meetingName;
		this.schedules = schedules;
	}

	// Property accessors

	public Integer getMeetingId() {
		return this.meetingId;
	}

	public void setMeetingId(Integer meetingId) {
		this.meetingId = meetingId;
	}

	public String getMeetingName() {
		return this.meetingName;
	}

	public void setMeetingName(String meetingName) {
		this.meetingName = meetingName;
	}

	public Set getSchedules() {
		return this.schedules;
	}

	public void setSchedules(Set schedules) {
		this.schedules = schedules;
	}

}