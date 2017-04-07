package com.chen.entity;

/**
 * 已读信息
 */

public class Readedmessage implements java.io.Serializable {

	// Fields

	private Integer readId;
	private Users users;
	private Message message;

	// Constructors

	/** default constructor */
	public Readedmessage() {
	}

	/** full constructor */
	public Readedmessage(Users users, Message message) {
		this.users = users;
		this.message = message;
	}

	// Property accessors

	public Integer getReadId() {
		return this.readId;
	}

	public void setReadId(Integer readId) {
		this.readId = readId;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Message getMessage() {
		return this.message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

}