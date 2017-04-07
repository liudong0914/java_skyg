package com.chen.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * 文件
 */

public class Files implements java.io.Serializable,Comparable<Files> {

	// Fields

	private Integer fileId;
	private Filetype filetype;
	private String fileName;
	private String remark;
	private Integer fileOwner;
	private Timestamp createDate;
	private Integer parentId;
	private String filePath;
	private Integer ifDelete;
	private Set accessoryfiles = new HashSet(0);

	// Constructors

	/** default constructor */
	public Files() {
	}

	/** minimal constructor */
	public Files(Filetype filetype, String fileName, String remark,
			Timestamp createDate, Integer parentId) {
		this.filetype = filetype;
		this.fileName = fileName;
		this.remark = remark;
		this.createDate = createDate;
		this.parentId = parentId;
	}

	/** full constructor */
	public Files(Filetype filetype, String fileName, String remark,
			Integer fileOwner, Timestamp createDate, Integer parentId,
			String filePath, Integer ifDelete, Set accessoryfiles) {
		this.filetype = filetype;
		this.fileName = fileName;
		this.remark = remark;
		this.fileOwner = fileOwner;
		this.createDate = createDate;
		this.parentId = parentId;
		this.filePath = filePath;
		this.ifDelete = ifDelete;
		this.accessoryfiles = accessoryfiles;
	}

	// Property accessors

	public Integer getFileId() {
		return this.fileId;
	}

	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}

	public Filetype getFiletype() {
		return this.filetype;
	}

	public void setFiletype(Filetype filetype) {
		this.filetype = filetype;
	}

	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getFileOwner() {
		return this.fileOwner;
	}

	public void setFileOwner(Integer fileOwner) {
		this.fileOwner = fileOwner;
	}

	public Timestamp getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getFilePath() {
		return this.filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Integer getIfDelete() {
		return this.ifDelete;
	}

	public void setIfDelete(Integer ifDelete) {
		this.ifDelete = ifDelete;
	}

	public Set getAccessoryfiles() {
		return this.accessoryfiles;
	}

	public void setAccessoryfiles(Set accessoryfiles) {
		this.accessoryfiles = accessoryfiles;
	}

	public int compareTo(Files o) {
		return this.fileId.compareTo(o.parentId);
	}

	@Override
	public int hashCode() {
		return fileId != null ? fileId : this.fileId;
	}

	@Override
	public boolean equals(Object obj) {
		Files files = null;
		if(obj instanceof Files){
			files = (Files)obj;
			return this.fileId.equals(files.parentId);
		}
		return false;
	}

}