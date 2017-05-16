package com.common;
//package wyf.hxl;
import java.sql.*;
import java.util.*;
import java.io.*;
import java.awt.*;
import javax.swing.*;
public class DataBase
{
	Connection con=null;//声明Connection引用
	Statement stat;
	public ResultSet rs;
	int count;
	public DataBase()
	{
		try
		{//加载MySQL的驱动类，并创建数据库连接
			Class.forName("org.gjt.mm.mysql.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library3","root","root");	
			stat=con.createStatement();//创建Statement对象			
		}
		catch(Exception e)
		{//捕获异常，并打印出来
			e.printStackTrace();
		}
	}
	public void selectDb(String sql)
	{//声明select方法
		try
		{//对SQL语句进行转码
			//sql=new String(sql.getBytes(),"ISO-8859-1");
			rs=stat.executeQuery(sql);
		}
		catch(Exception ei)
		{//捕获异常，并打印出来
			ei.printStackTrace();
		}
	}
	public int updateDb(String sql)
	{//声明update方法
		try
		{//对SQL语句进行转码
			//sql=new String(sql.getBytes(),"ISO-8859-1");
			sql = new String(sql.getBytes("gb2312"));//转码
			count=stat.executeUpdate(sql);			
		}
	    catch(Exception ei)
		{//捕获异常，并打印出来
			ei.printStackTrace();
		}
		return count;//返回参数
	}
	public void dbClose()
	{//声明close方法		
		try
		{
			con.close();//执行数据库关闭动作
		}
		catch(Exception e)
		{//捕获异常，并打印出来
			e.printStackTrace();
	    }	
	}}
