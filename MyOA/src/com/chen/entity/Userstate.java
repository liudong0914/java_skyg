package com.chen.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * 用户状态
 */

public class Userstate implements java.io.Serializable {

	// Fields

	private Integer userStateId;
	private String userStateName;
	private Set userses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Userstate() {
	}

	/** minimal constructor */
	public Userstate(String userStateName) {
		this.userStateName = userStateName;
	}

	/** full constructor */
	public Userstate(String userStateName, Set userses) {
		this.userStateName = userStateName;
		this.userses = userses;
	}

	// Property accessors

	public Integer getUserStateId() {
		return this.userStateId;
	}

	public void setUserStateId(Integer userStateId) {
		this.userStateId = userStateId;
	}

	public String getUserStateName() {
		return this.userStateName;
	}

	public void setUserStateName(String userStateName) {
		this.userStateName = userStateName;
	}

	public Set getUserses() {
		return this.userses;
	}

	public void setUserses(Set userses) {
		this.userses = userses;
	}

}