package com.chen.entity;

import java.sql.Timestamp;

/**
 * 操作日志
 */

public class Operatelog implements java.io.Serializable {

	// Fields

	private Integer operateId;
	private Users users;
	private String operateName;
	private String operateDesc;
	private Timestamp operateTime;
	private Memu memu;
	// Constructors

	/** default constructor */
	public Operatelog() {
	}

	/** minimal constructor */
	public Operatelog(Users users,Memu memu, String operateName,
			Timestamp operateTime) {
		this.memu=memu;
		this.users = users;
		this.operateName = operateName;
		this.operateTime = operateTime;
	}

	public Memu getMemu() {
		return memu;
	}

	public void setMemu(Memu memu) {
		this.memu = memu;
	}

	/** full constructor */
	public Operatelog(Users users,Memu memu, String operateName, 
			String operateDesc, Timestamp operateTime) {
		this.users = users;
		this.operateName = operateName;
		this.memu=memu;
		this.operateDesc = operateDesc;
		this.operateTime = operateTime;
	}

	// Property accessors

	public Integer getOperateId() {
		return this.operateId;
	}

	public void setOperateId(Integer operateId) {
		this.operateId = operateId;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getOperateName() {
		return this.operateName;
	}

	public void setOperateName(String operateName) {
		this.operateName = operateName;
	}
	public String getOperateDesc() {
		return this.operateDesc;
	}

	public void setOperateDesc(String operateDesc) {
		this.operateDesc = operateDesc;
	}

	public Timestamp getOperateTime() {
		return this.operateTime;
	}

	public void setOperateTime(Timestamp operateTime) {
		this.operateTime = operateTime;
	}

}