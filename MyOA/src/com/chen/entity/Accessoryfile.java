package com.chen.entity;

import java.sql.Timestamp;

/**
 * 文件附件
 */

public class Accessoryfile implements java.io.Serializable {

	// Fields

	private Integer accessoryId;
	private Files files;
	private String accName;
	private Integer accSize;
	private Integer accType;
	private Timestamp createDate;
	private String accPath;

	// Constructors

	/** default constructor */
	public Accessoryfile() {
	}

	/** minimal constructor */
	public Accessoryfile(Files files, String accName, Integer accSize,
			Integer accType, Timestamp createDate) {
		this.files = files;
		this.accName = accName;
		this.accSize = accSize;
		this.accType = accType;
		this.createDate = createDate;
	}

	/** full constructor */
	public Accessoryfile(Files files, String accName, Integer accSize,
			Integer accType, Timestamp createDate, String accPath) {
		this.files = files;
		this.accName = accName;
		this.accSize = accSize;
		this.accType = accType;
		this.createDate = createDate;
		this.accPath = accPath;
	}

	// Property accessors

	public Integer getAccessoryId() {
		return this.accessoryId;
	}

	public void setAccessoryId(Integer accessoryId) {
		this.accessoryId = accessoryId;
	}

	public Files getFiles() {
		return this.files;
	}

	public void setFiles(Files files) {
		this.files = files;
	}

	public String getAccName() {
		return this.accName;
	}

	public void setAccName(String accName) {
		this.accName = accName;
	}

	public Integer getAccSize() {
		return this.accSize;
	}

	public void setAccSize(Integer accSize) {
		this.accSize = accSize;
	}

	public Integer getAccType() {
		return this.accType;
	}

	public void setAccType(Integer accType) {
		this.accType = accType;
	}

	public Timestamp getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public String getAccPath() {
		return this.accPath;
	}

	public void setAccPath(String accPath) {
		this.accPath = accPath;
	}

}