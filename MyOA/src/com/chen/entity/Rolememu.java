package com.chen.entity;

/**
 * 权限
 */

public class Rolememu implements java.io.Serializable {

	// Fields

	private Integer roleMemutId;
	private Memu memu;
	private Role role;

	// Constructors

	/** default constructor */
	public Rolememu() {
	}

	/** full constructor */
	public Rolememu(Memu memu, Role role) {
		this.memu = memu;
		this.role = role;
	}

	// Property accessors

	public Integer getRoleMemutId() {
		return this.roleMemutId;
	}

	public void setRoleMemutId(Integer roleMemutId) {
		this.roleMemutId = roleMemutId;
	}

	public Memu getMemu() {
		return this.memu;
	}

	public void setMemu(Memu memu) {
		this.memu = memu;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}