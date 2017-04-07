package com.chen.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * 角色类
 */

public class Role implements java.io.Serializable {

	// Fields

	private Integer roleId;
	private String roleName;
	private String roleDesc;
	private Set userses = new HashSet(0);
	
	private Set memus = new HashSet(0);

	// Constructors

	public Set getMemus() {
		return memus;
	}

	public void setMemus(Set memus) {
		this.memus = memus;
	}

	/** default constructor */
	public Role() {
	}

	/** minimal constructor */
	public Role(String roleName, String roleDesc) {
		this.roleName = roleName;
		this.roleDesc = roleDesc;
	}

	/** full constructor */
	public Role(String roleName, String roleDesc, Set userses) {
		this.roleName = roleName;
		this.roleDesc = roleDesc;
		this.userses = userses;
		
	}

	// Property accessors

	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDesc() {
		return this.roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public Set getUserses() {
		return this.userses;
	}

	public void setUserses(Set userses) {
		this.userses = userses;
	}

	

}