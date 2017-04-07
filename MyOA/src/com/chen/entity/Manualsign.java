package com.chen.entity;

import java.sql.Timestamp;

/**
 * 考勤
 */

public class Manualsign implements java.io.Serializable {

	// Fields

	private Integer signId;
	private Users users;
	private Timestamp signTime;
	private String signDesc;
	private Integer signTag;

	// Constructors

	/** default constructor */
	public Manualsign() {
	}

	/** minimal constructor */
	public Manualsign(Users users, Timestamp signTime) {
		this.users = users;
		this.signTime = signTime;
	}

	/** full constructor */
	public Manualsign(Users users, Timestamp signTime, String signDesc,
			Integer signTag) {
		this.users = users;
		this.signTime = signTime;
		this.signDesc = signDesc;
		this.signTag = signTag;
	}

	// Property accessors

	public Integer getSignId() {
		return this.signId;
	}

	public void setSignId(Integer signId) {
		this.signId = signId;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Timestamp getSignTime() {
		return this.signTime;
	}

	public void setSignTime(Timestamp signTime) {
		this.signTime = signTime;
	}

	public String getSignDesc() {
		return this.signDesc;
	}

	public void setSignDesc(String signDesc) {
		this.signDesc = signDesc;
	}

	public Integer getSignTag() {
		return this.signTag;
	}

	public void setSignTag(Integer signTag) {
		this.signTag = signTag;
	}

}