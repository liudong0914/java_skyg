package com.chen.bean;

import java.sql.Timestamp;

public class PageTime {
	
	private String dateNum;  //时间点
	   public String getDateNum() {
		return dateNum;
	}
	public void setDateNum(String dateNum) {
		this.dateNum = dateNum;
	}
	private String beginTime;               //封装 页面保存的  开始时间
	    private String endTime;                 //封装 页面保存的 结束时间
		public String getBeginTime() {
			return beginTime;
		}
		public void setBeginTime(String beginTime) {
			this.beginTime = beginTime;
		}
		public String getEndTime() {
			return endTime;
		}
		public void setEndTime(String endTime) {
			this.endTime = endTime;
		}

}
