package com.chen.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * 信息
 */

public class Message implements java.io.Serializable {

	// Fields

	private Integer messageId;
	private Users users;
	private Messagetype messagetype;
	private String title;
	private String content;
	private Timestamp beginTime;
	private Timestamp endTime;
	private Integer ifPublish;
	private Timestamp recordTime;
	private String publishObject;
	private Integer ifDelete;
	private Set readedmessages = new HashSet(0);
	
    private Set userses=new HashSet(0);
	// Constructors

	public Set getUserses() {
	
		return userses;
	}

	public void setUserses(Set userses) {
		this.userses = userses;
	}

	/** default constructor */
	public Message() {
	}

	/** minimal constructor */
	public Message(Users users, Messagetype messagetype, String title,
			String content, Timestamp beginTime, Timestamp endTime,
			Timestamp recordTime) {
		this.users = users;
		this.messagetype = messagetype;
		this.title = title;
		this.content = content;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.recordTime = recordTime;
	}

	/** full constructor */
	public Message(Users users, Messagetype messagetype, String title,
			String content, Timestamp beginTime, Timestamp endTime,
			Integer ifPublish, Timestamp recordTime, String publishObject,
			Integer ifDelete, Set readedmessages) {
		this.users = users;
		this.messagetype = messagetype;
		this.title = title;
		this.content = content;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.ifPublish = ifPublish;
		this.recordTime = recordTime;
		this.publishObject = publishObject;
		this.ifDelete = ifDelete;
		this.readedmessages = readedmessages;
	}

	// Property accessors

	public Integer getMessageId() {
		return this.messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Messagetype getMessagetype() {
		return this.messagetype;
	}

	public void setMessagetype(Messagetype messagetype) {
		this.messagetype = messagetype;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getBeginTime() {
		return this.beginTime;
	}

	public void setBeginTime(Timestamp beginTime) {
		this.beginTime = beginTime;
	}

	public Timestamp getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	public Integer getIfPublish() {
		return this.ifPublish;
	}

	public void setIfPublish(Integer ifPublish) {
		this.ifPublish = ifPublish;
	}

	public Timestamp getRecordTime() {
		return this.recordTime;
	}

	public void setRecordTime(Timestamp recordTime) {
		this.recordTime = recordTime;
	}

	public String getPublishObject() {
		return this.publishObject;
	}

	public void setPublishObject(String publishObject) {
		this.publishObject = publishObject;
	}

	public Integer getIfDelete() {
		return this.ifDelete;
	}

	public void setIfDelete(Integer ifDelete) {
		this.ifDelete = ifDelete;
	}

	public Set getReadedmessages() {
		return this.readedmessages;
	}

	public void setReadedmessages(Set readedmessages) {
		this.readedmessages = readedmessages;
	}



}