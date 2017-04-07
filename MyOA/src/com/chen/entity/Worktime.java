package com.chen.entity;

import java.sql.Timestamp;

/**
 * 工作时间
 */

public class Worktime implements java.io.Serializable {

	// Fields

	private Integer workTimeId;
	private Timestamp onDutyTime;
	private Timestamp offDutyTime;

	// Constructors

	/** default constructor */
	public Worktime() {
	}

	/** full constructor */
	public Worktime(Timestamp onDutyTime, Timestamp offDutyTime) {
		this.onDutyTime = onDutyTime;
		this.offDutyTime = offDutyTime;
	}

	// Property accessors

	public Integer getWorkTimeId() {
		return this.workTimeId;
	}

	public void setWorkTimeId(Integer workTimeId) {
		this.workTimeId = workTimeId;
	}

	public Timestamp getOnDutyTime() {
		return this.onDutyTime;
	}

	public void setOnDutyTime(Timestamp onDutyTime) {
		this.onDutyTime = onDutyTime;
	}

	public Timestamp getOffDutyTime() {
		return this.offDutyTime;
	}

	public void setOffDutyTime(Timestamp offDutyTime) {
		this.offDutyTime = offDutyTime;
	}

}