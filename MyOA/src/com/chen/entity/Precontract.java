package com.chen.entity;

/**
 * Precontract entity. @author MyEclipse Persistence Tools
 */

public class Precontract implements java.io.Serializable {

	// Fields

	private Integer precontractId;
	private Schedule schedule;
	private Users users;

	// Constructors

	/** default constructor */
	public Precontract() {
	}

	/** full constructor */
	public Precontract(Schedule schedule, Users users) {
		this.schedule = schedule;
		this.users = users;
	}

	// Property accessors

	public Integer getPrecontractId() {
		return this.precontractId;
	}

	public void setPrecontractId(Integer precontractId) {
		this.precontractId = precontractId;
	}

	public Schedule getSchedule() {
		return this.schedule;
	}

	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

}