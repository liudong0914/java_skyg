package com.chen.util;

import com.chen.entity.Users;

public class SignRate {
	private Users users;
	private Integer signCount;//考勤次数
	private Integer signMiner;
	private Long earlyBack;//早退
	private Long signLate;//迟到
	public Integer getSignCount() {
		return signCount;
	}
	public void setSignCount(Integer signCount) {
		this.signCount = signCount;
	}
	public Integer getSignMiner() {
		return signMiner;
	}
	public void setSignMiner(Integer signMiner) {
		this.signMiner = signMiner;
	}
	public Long getEarlyBack() {
		return earlyBack;
	}
	public void setEarlyBack(Long earlyBack) {
		this.earlyBack = earlyBack;
	}
	public Long getSignLate() {
		return signLate;
	}
	public void setSignLate(Long signLate) {
		this.signLate = signLate;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
}
