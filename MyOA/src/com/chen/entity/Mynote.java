package com.chen.entity;

import java.sql.Timestamp;

/**
 * 我的便签
 */

public class Mynote implements java.io.Serializable {

	// Fields

	private Integer noteId;
	private String userid;
	private Users users;
	private String noteTitle;
	private String noteContent;
	private Timestamp createTime;

	
	// Constructors

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	/** default constructor */
	public Mynote() {
	}

	/** minimal constructor */


	/** full constructor */
	public Mynote(Users users, String noteTitle, String noteContent,
			Timestamp createTime) {
		this.users = users;
		this.noteTitle = noteTitle;
		this.noteContent = noteContent;
		this.createTime = createTime;
	}

	// Property accessors

	public Mynote(Integer noteId, String userid, Users users, String noteTitle,
			String noteContent, Timestamp createTime) {
		super();
		this.noteId = noteId;
		this.userid = userid;
		this.users = users;
		this.noteTitle = noteTitle;
		this.noteContent = noteContent;
		this.createTime = createTime;
	}

	public Integer getNoteId() {
		return this.noteId;
	}

	public void setNoteId(Integer noteId) {
		this.noteId = noteId;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getNoteTitle() {
		return this.noteTitle;
	}

	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}

	public String getNoteContent() {
		return this.noteContent;
	}

	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

}