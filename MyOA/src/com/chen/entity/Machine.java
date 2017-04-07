package com.chen.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * 机构
 */

public class Machine implements java.io.Serializable {

	// Fields

	private Integer machineId;
	private Integer deptId;
	private String machineName;
	private String machineShortName;
	private Set depts = new HashSet(0);

	// Constructors
	
	/** default constructor */
	public Machine() {
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	/** minimal constructor */
	public Machine(String machineName) {
		this.machineName = machineName;
	}

	/** full constructor */
	public Machine(String machineName, String machineShortName, Set depts) {
		this.machineName = machineName;
		this.machineShortName = machineShortName;
		this.depts = depts;
	}

	// Property accessors

	public Integer getMachineId() {
		return this.machineId;
	}

	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}

	public String getMachineName() {
		return this.machineName;
	}

	public void setMachineName(String machineName) {
		this.machineName = machineName;
	}

	public String getMachineShortName() {
		return this.machineShortName;
	}

	public void setMachineShortName(String machineShortName) {
		this.machineShortName = machineShortName;
	}

	public Set getDepts() {
		return this.depts;
	}

	public void setDepts(Set depts) {
		this.depts = depts;
	}

}