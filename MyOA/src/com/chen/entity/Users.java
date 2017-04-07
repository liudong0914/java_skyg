package com.chen.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * 用户类
 */
public class Users implements java.io.Serializable {

	// Fields

	private Integer userId;
	private Userstate userstate;
	private Dept dept;
	private Role role;
	private String userName;
	private String password;
	private Integer gender;
	private String image;
	private  String realName;
	private  Timestamp  regTime;
	private Set depts = new HashSet(0);
	private Set operatelogs = new HashSet(0);
	private Set schedules = new HashSet(0);
	private Set mynotes = new HashSet(0);
	private Set loginlogs = new HashSet(0);
	private Set precontracts = new HashSet(0);
	private Set manualsigns = new HashSet(0);
	private Set readedmessages = new HashSet(0);
	private Set messages = new HashSet(0);
   private Set messages2=new HashSet(0);    
   private Set scheduleset=new HashSet(0);
   
	// Constructors

	public Set getScheduleset() {
	return scheduleset;
}

public void setScheduleset(Set scheduleset) {
	this.scheduleset = scheduleset;
}

	public Set getMessages2() {
	return messages2;
}
public void setMessages2(Set messages2) {
	this.messages2 = messages2;
}
	/** default constructor */
	public Users() {
	}
	/** minimal constructor */
	public Users(Userstate userstate, Dept dept, Role role, String userName,
			String password, Integer gender,String realName,Timestamp regTime) {
		this.userstate = userstate;
		this.dept = dept;
		this.regTime=regTime;
		this.realName=realName;
		this.role = role;
		this.userName = userName;
		this.password = password;
		this.gender = gender;
	}
	/** full constructor */
	public Users(Userstate userstate, Dept dept, Role role, String userName,
			String password, Integer gender, String image, String realName,Timestamp regTime,Set depts,
			Set operatelogs, Set schedules, Set mynotes, Set loginlogs,
			Set precontracts, Set manualsigns,
			Set readedmessages, Set messages) {
		this.userstate = userstate;
		this.dept = dept;
		this.role = role;
		this.userName = userName;
		this.password = password;
		this.gender = gender;
		this.image = image;
		this.depts = depts;
		this.realName=realName;
		this.regTime=regTime;
		this.operatelogs = operatelogs;
		this.schedules = schedules;
		this.mynotes = mynotes;
		this.loginlogs = loginlogs;
		this.precontracts = precontracts;
		this.manualsigns = manualsigns;
		this.readedmessages = readedmessages;
		this.messages = messages;
	}
	// Property accessors
	
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public void setRegTime(Timestamp regTime) {
		this.regTime = regTime;
	}

	public String getRealName() {
		return realName;
	}

	public Timestamp getRegTime() {
		return regTime;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Userstate getUserstate() {
		return this.userstate;
	}

	public void setUserstate(Userstate userstate) {
		this.userstate = userstate;
	}

	public Dept getDept() {
		return this.dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getGender() {
		return this.gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Set getDepts() {
		return this.depts;
	}

	public void setDepts(Set depts) {
		this.depts = depts;
	}

	public Set getOperatelogs() {
		return this.operatelogs;
	}
	public void setOperatelogs(Set operatelogs) {
		this.operatelogs = operatelogs;
	}

	public Set getSchedules() {
		return this.schedules;
	}
	public void setSchedules(Set schedules) {
		this.schedules = schedules;
	}
	public Set getMynotes() {
		return this.mynotes;
	}

	public void setMynotes(Set mynotes) {
		this.mynotes = mynotes;
	}

	public Set getLoginlogs() {
		return this.loginlogs;
	}

	public void setLoginlogs(Set loginlogs) {
		this.loginlogs = loginlogs;
	}

	public Set getPrecontracts() {
		return this.precontracts;
	}

	public void setPrecontracts(Set precontracts) {
		this.precontracts = precontracts;
	}

	public Set getManualsigns() {
		return this.manualsigns;
	}

	public void setManualsigns(Set manualsigns) {
		this.manualsigns = manualsigns;
	}


	public Set getReadedmessages() {
		return this.readedmessages;
	}

	public void setReadedmessages(Set readedmessages) {
		this.readedmessages = readedmessages;
	}

	public Set getMessages() {
		return this.messages;
	}

	public void setMessages(Set messages) {
		this.messages = messages;
	}

}