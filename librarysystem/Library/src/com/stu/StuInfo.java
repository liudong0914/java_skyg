package com.stu;

import java.util.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import java.net.*;
import java.io.*;
import javax.swing.tree.*;

import com.common.DataBase;

import java.sql.*;
import java.util.Date;

public class StuInfo extends JPanel
{
	String StuNo;
	String sql; 
	DataBase db;
	private JLabel[] jlArray=new JLabel[]{//������ǩ����
			new JLabel("              ѧ    ��	:"),
			new JLabel("              ��    ��	:"),
			new JLabel("              ��     ��	:"),
			new JLabel("              ��    ��	:"),
			new JLabel("              ��    ��	:"),
			new JLabel("              Ժ    ϵ	:"),
			new JLabel("              �绰����   :"),
		    new JLabel("              ��    ��	:"),
		    new JLabel("              ����Ȩ��   :")   
		};
	//����������ʾ��Ϣ�ı�ǩ����
	private JLabel[] jlArray2=new JLabel[9];
	
	
	public StuInfo(String StuNo)
	{
        Vector<String> v = new Vector<String>();
		this.StuNo=StuNo;
		try
	{//��ѯ���ݿ⽫���ݴ������鲢����
			int b=Integer.parseInt(StuNo);
		String sql=
		"select StuNo,StuName,StuAge,StuSex,Class,Department,Tel,Password,Permitted from student where StuNo="+b;
		 db=new DataBase();
		 db.selectDb(sql);		
		if(db.rs.next())
		{  
			
			for(int i=1;i<=9;i++){//˳��ﵽ���ѵ��Ľ���еĸ����¼
				String str = db.rs.getString(i).trim();
				str = new String(str.getBytes("gb2312"));
				v.add(str);	
			}
			
		}
		
	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		for(int i=0;i<9;i++)
		{
			jlArray2[i]=new JLabel(v.get(i));
		}
		//���������Ϊ�ղ���
		this.setLayout(null);
		//������ʾ��ǩ����Ϣ��ǩ��ӵ���������ʾ
		jlArray[0].setBounds(30,50,100,30);
		this.add(jlArray[0]);
		jlArray[1].setBounds(30,100,100,30);
		this.add(jlArray[1]);
		jlArray[2].setBounds(30,150,100,30);
		this.add(jlArray[2]);
		jlArray[3].setBounds(30,200,100,30);
		this.add(jlArray[3]);
		jlArray[4].setBounds(30,250,100,30);
		this.add(jlArray[4]);
		jlArray[5].setBounds(30,300,100,30);
		this.add(jlArray[5]);
		jlArray[6].setBounds(30,350,100,30);
		this.add(jlArray[6]);
		jlArray[7].setBounds(30,400,100,30);
		this.add(jlArray[7]);
		jlArray[8].setBounds(30,450,150,30);
		this.add(jlArray[8]);
		
		jlArray2[0].setBounds(130,50,150,30);
		this.add(jlArray2[0]);
		jlArray2[1].setBounds(130,100,150,30);
		this.add(jlArray2[1]);
		jlArray2[2].setBounds(130,150,150,30);
		this.add(jlArray2[2]);
		jlArray2[3].setBounds(130,200,150,30);
		this.add(jlArray2[3]);
		jlArray2[4].setBounds(130,250,150,30);
		this.add(jlArray2[4]);
		jlArray2[5].setBounds(130,300,150,30);
		this.add(jlArray2[5]);
		jlArray2[6].setBounds(130,350,150,30);
		this.add(jlArray2[6]);
		jlArray2[7].setBounds(130,400,150,30);
		this.add(jlArray2[7]);
		jlArray2[8].setBounds(200,450,150,30);
		this.add(jlArray2[8]);
	
	}}
		