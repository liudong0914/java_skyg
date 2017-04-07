package com.chen.entity;

import java.sql.Timestamp;

/**
 * 登陆日志
 */

public class Loginlog implements java.io.Serializable {

	// Fields

	private Integer loginId;
	private Users users;
	private Timestamp loginTime;
	private Integer ifSuccess;
	private String loginUserIp;
	private String loginDesc;

	// Constructors

	/** default constructor */
	public Loginlog() {
	}

	/** minimal constructor */
	public Loginlog(Users users, Timestamp loginTime, Integer ifSuccess) {
		this.users = users;
		this.loginTime = loginTime;
		this.ifSuccess = ifSuccess;
	}

	/** full constructor */
	public Loginlog(Users users, Timestamp loginTime, Integer ifSuccess,
			String loginUserIp, String loginDesc) {
		this.users = users;
		this.loginTime = loginTime;
		this.ifSuccess = ifSuccess;
		this.loginUserIp = loginUserIp;
		this.loginDesc = loginDesc;
	}

	// Property accessors

	public Integer getLoginId() {
		return this.loginId;
	}

	public void setLoginId(Integer loginId) {
		this.loginId = loginId;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Timestamp getLoginTime() {
		return this.loginTime;
	}

	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}

	public Integer getIfSuccess() {
		return this.ifSuccess;
	}

	public void setIfSuccess(Integer ifSuccess) {
		this.ifSuccess = ifSuccess;
	}

	public String getLoginUserIp() {
		return this.loginUserIp;
	}

	public void setLoginUserIp(String loginUserIp) {
		this.loginUserIp = loginUserIp;
	}

	public String getLoginDesc() {
		return this.loginDesc;
	}

	public void setLoginDesc(String loginDesc) {
		this.loginDesc = loginDesc;
	}

}