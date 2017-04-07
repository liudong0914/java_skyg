package com.chen.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * 菜单
 */

public class Memu implements java.io.Serializable,Comparable<Memu> {

	// Fields

	private Integer memuId;
	private String displayName;
	private String memuUrl;
	private Integer displayOrder;
	private Integer parentNodeId;
	private Set roles = new HashSet(0);

	// Constructors

	public Set getRoles() {
		return roles;
	}

	public void setRoles(Set roles) {
		this.roles = roles;
	}

	/** default constructor */
	public Memu() {
	}

	/** minimal constructor */
	public Memu(String displayName, String memuUrl, Integer parentNodeId) {
		this.displayName = displayName;
		this.memuUrl = memuUrl;
		this.parentNodeId = parentNodeId;
	}

	/** full constructor */
	public Memu(String displayName, String memuUrl, Integer displayOrder,
			Integer parentNodeId) {
		this.displayName = displayName;
		this.memuUrl = memuUrl;
		this.displayOrder = displayOrder;
		this.parentNodeId = parentNodeId;
		
	}

	// Property accessors

	public Integer getMemuId() {
		return this.memuId;
	}

	public void setMemuId(Integer memuId) {
		this.memuId = memuId;
	}

	public String getDisplayName() {
		return this.displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getMemuUrl() {
		return this.memuUrl;
	}

	public void setMemuUrl(String memuUrl) {
		this.memuUrl = memuUrl;
	}

	public Integer getDisplayOrder() {
		return this.displayOrder;
	}

	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}

	public Integer getParentNodeId() {
		return this.parentNodeId;
	}

	public void setParentNodeId(Integer parentNodeId) {
		this.parentNodeId = parentNodeId;
	}
	public int compareTo(Memu memu) {
		return this.displayOrder.compareTo(memu.displayOrder);
	}
	@Override
	public boolean equals(Object obj) {
     Memu memu=null;
		if(obj instanceof Memu){
			memu = (Memu)obj;
			return this.displayOrder.equals(memu.displayOrder);
		}
		return false;
	}

	@Override
	public int hashCode() {
		return displayOrder!=null?displayOrder.hashCode():this.hashCode();
	}

}