package com.common;
//package wyf.hxl;
import java.sql.*;
import java.util.*;
import java.io.*;
import java.awt.*;
import javax.swing.*;
public class DataBase
{
	Connection con=null;//����Connection����
	Statement stat;
	public ResultSet rs;
	int count;
	public DataBase()
	{
		try
		{//����MySQL�������࣬���������ݿ�����
			Class.forName("org.gjt.mm.mysql.Driver");	
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library3","root","root");	
			stat=con.createStatement();//����Statement����			
		}
		catch(Exception e)
		{//�����쳣������ӡ����
			e.printStackTrace();
		}
	}
	public void selectDb(String sql)
	{//����select����
		try
		{//��SQL������ת��
			//sql=new String(sql.getBytes(),"ISO-8859-1");
			rs=stat.executeQuery(sql);
		}
		catch(Exception ei)
		{//�����쳣������ӡ����
			ei.printStackTrace();
		}
	}
	public int updateDb(String sql)
	{//����update����
		try
		{//��SQL������ת��
			//sql=new String(sql.getBytes(),"ISO-8859-1");
			sql = new String(sql.getBytes("gb2312"));//ת��
			count=stat.executeUpdate(sql);			
		}
	    catch(Exception ei)
		{//�����쳣������ӡ����
			ei.printStackTrace();
		}
		return count;//���ز���
	}
	public void dbClose()
	{//����close����		
		try
		{
			con.close();//ִ�����ݿ�رն���
		}
		catch(Exception e)
		{//�����쳣������ӡ����
			e.printStackTrace();
	    }	
	}}
