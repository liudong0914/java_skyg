package com.chen.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * 部门
 */

public class Dept implements java.io.Serializable {

	// Fields
	private Integer deptId;
	private Machine machine;
	private Users users;
	private String deptName;
	private Long connectTelNo;
	private Long connectMobileTelNo;
	private Long faxes;
	private Set userses = new HashSet(0);
	/** default constructor */
	public Dept() {
	}

	/** minimal constructor */
	public Dept(Machine machine, Users users, String deptName,
			Long connectTelNo, Long connectMobileTelNo, Long faxes) {
		this.machine = machine;
		this.users = users;
		this.deptName = deptName;
		this.connectTelNo = connectTelNo;
		this.connectMobileTelNo = connectMobileTelNo;
		this.faxes = faxes;
	}

	/** full constructor */
	public Dept(Machine machine, Users users, String deptName,
			Long connectTelNo, Long connectMobileTelNo, Long faxes, Set userses) {
		this.machine = machine;
		this.users = users;
		this.deptName = deptName;
		this.connectTelNo = connectTelNo;
		this.connectMobileTelNo = connectMobileTelNo;
		this.faxes = faxes;
		this.userses = userses;
	}

	// Property accessors

	public Integer getDeptId() {
		return this.deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public Machine getMachine() {
		return this.machine;
	}

	public void setMachine(Machine machine) {
		this.machine = machine;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getDeptName() {
		return this.deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public Long getConnectTelNo() {
		return this.connectTelNo;
	}

	public void setConnectTelNo(Long connectTelNo) {
		this.connectTelNo = connectTelNo;
	}

	public Long getConnectMobileTelNo() {
		return this.connectMobileTelNo;
	}

	public void setConnectMobileTelNo(Long connectMobileTelNo) {
		this.connectMobileTelNo = connectMobileTelNo;
	}

	public Long getFaxes() {
		return this.faxes;
	}

	public void setFaxes(Long faxes) {
		this.faxes = faxes;
	}

	public Set getUserses() {
		return this.userses;
	}

	public void setUserses(Set userses) {
		this.userses = userses;
	}

}