/**
 * 
 */
package com.chen.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.swing.JSpinner.DateEditor;

/**
 * @author chen 2012-11-30
 */
public class SystemUtil {
	/**
	 *格式化 输出 指定长度字符
	 * 
	 * @param str
	 */
	public static String charStr(String str, int count) {
		if (str != null && str.length() >= count) {
			String newStr = str.substring(0, count) + "....";
			return newStr;
		}
		return str;
	}

	/**
	 * 格式化 date
	 * 
	 * @param date
	 */
	public static String dateStr(Date date) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String newStr = dateFormat.format(date);
		return newStr;
	}

	/**
	 * 格式化 输出TimeStamp
	 * @param t
	 * @return
	 */
	public static Date timeStampFormat(Timestamp t) {   
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	      dateFormat.format(t);
	    
	      Date d=null;
	      try {
			d=dateFormat.parse(dateFormat.format(t));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return d;
	}
    
	public static String getString2(Date date) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String newStr = dateFormat.format(date);
		
		return newStr;
	}

	/**
	 *将字符串转成 util.Date
	 * 
	 * @param str
	 */
	public static Date getDate(String str) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = dateFormat.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return date;
	}

	/**
	 *将util.Date转换成 Timestamp 类型
	 * 
	 * @param str
	 */
	public static Timestamp getTimestamp(Date date) {
		
		return Timestamp.valueOf(dateStr(date));
	
	}
	/**
	 * /**
	 *将u字符串转换成 Timestamp 类型
	 * 
	 * @param str
	 */
	public static Timestamp getTimesByStr(String dataStr){
		   Date d=getDate(dataStr);
			String newTime=getString2(d);
			return Timestamp.valueOf(newTime);
	
	}
	/**
	 * 将 字符串转换成sql.Date
	 */
	public static java.sql.Date convertToSqlDate(String str) {
		SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date sqlDate = null;
		try {
			java.util.Date date = bartDateFormat.parse(str);
			sqlDate = new java.sql.Date(date.getTime());
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return sqlDate;
	}

	/**
	 * 将Util.Date转换成Sql.Date
	 * 
	 */
	public static java.sql.Date getSqlDate(Date date) {
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		return sqlDate;
	}

	/**
	 * 格式化 双精度
	 */
	public static String doubleString(double db) {
		DecimalFormat df =new DecimalFormat("#.00");
		String dbString = df.format(db);
		return dbString;
	}
	/**
	 * 在指定部分减多少天
	 * @param num
	 * @return
	 */
	public static String getDate(int num){
		Calendar cal = Calendar.getInstance();
	
		cal.add(Calendar.DAY_OF_MONTH, -num+1);
		Date date = new Date(cal.getTimeInMillis());
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String str = df.format(date);
		return str;
	}
	/**
	 * 在指定日期增加多少天
	 * @param num
	 * @return
	 */
	public static String getDate2(int num){
		Calendar cal = Calendar.getInstance();
	
		cal.add(Calendar.DAY_OF_MONTH, num);
		Date date = new Date(cal.getTimeInMillis());
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = df.format(date);
		return str;
	}
	
	public static String getYear(Date date){
		SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy");
		String year =bartDateFormat.format(date);
		return year;
	}
	public static String getMonth(Date date){
		SimpleDateFormat bartDateFormat = new SimpleDateFormat("MM");
		String month =bartDateFormat.format(date);
		return month;
	}
	public static String getDay(Date date){
		SimpleDateFormat bartDateFormat = new SimpleDateFormat("dd");
		String day =bartDateFormat.format(date);
		return day;
	}
	public static String getHms(Timestamp timestamp){
		SimpleDateFormat bartDateFormat = new SimpleDateFormat("HH:mm:ss");
		String hms =bartDateFormat.format(timestamp);
		return hms;
	}
	public static String getStrTimeStamp(Timestamp timestamp){
		SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String hms =bartDateFormat.format(timestamp);
		return hms;
	}
}
