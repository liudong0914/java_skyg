package com.chen.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * 文件类型
 */

public class Filetype implements java.io.Serializable {

	// Fields

	private Integer fileTypeId;
	private String fileTypeName;
	private String fileTypeImage;
	private String fileTypeSuffix;
	private Set fileses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Filetype() {
	}

	/** minimal constructor */
	public Filetype(String fileTypeName, String fileTypeImage) {
		this.fileTypeName = fileTypeName;
		this.fileTypeImage = fileTypeImage;
	}

	/** full constructor */
	public Filetype(String fileTypeName, String fileTypeImage,
			String fileTypeSuffix, Set fileses) {
		this.fileTypeName = fileTypeName;
		this.fileTypeImage = fileTypeImage;
		this.fileTypeSuffix = fileTypeSuffix;
		this.fileses = fileses;
	}

	// Property accessors

	public Integer getFileTypeId() {
		return this.fileTypeId;
	}

	public void setFileTypeId(Integer fileTypeId) {
		this.fileTypeId = fileTypeId;
	}

	public String getFileTypeName() {
		return this.fileTypeName;
	}

	public void setFileTypeName(String fileTypeName) {
		this.fileTypeName = fileTypeName;
	}

	public String getFileTypeImage() {
		return this.fileTypeImage;
	}

	public void setFileTypeImage(String fileTypeImage) {
		this.fileTypeImage = fileTypeImage;
	}

	public String getFileTypeSuffix() {
		return this.fileTypeSuffix;
	}

	public void setFileTypeSuffix(String fileTypeSuffix) {
		this.fileTypeSuffix = fileTypeSuffix;
	}

	public Set getFileses() {
		return this.fileses;
	}

	public void setFileses(Set fileses) {
		this.fileses = fileses;
	}

}