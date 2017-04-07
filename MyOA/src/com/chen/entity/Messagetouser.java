package com.chen.entity;

/**
 * 已发信息
 */

public class Messagetouser implements java.io.Serializable {

	// Fields

	private Integer id;
	private Users users;
	private Message message;
	private Integer ifRead;

	// Constructors

	/** default constructor */
	public Messagetouser() {
	}

	/** full constructor */
	public Messagetouser(Users users, Message message, Integer ifRead) {
		this.users = users;
		this.message = message;
		this.ifRead = ifRead;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Integer getIfRead() {
		return this.ifRead;
	}

	public void setIfRead(Integer ifRead) {
		this.ifRead = ifRead;
	}

}