package com.stu;

import java.util.*;
import java.sql.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;

import com.common.DataBase;
public class ChangePwd extends JPanel implements ActionListener
{
	private String StuNo;
	String sql;
	DataBase db;
	//创建信息提示标签数组
	private JLabel[] jlArray={
			new JLabel("原始密码"),
			new JLabel("新密码"),
			new JLabel("确认新密码"),
	                         };
	//创建密码框数组
	private JPasswordField[] jpfArray={
			new JPasswordField(),
			new JPasswordField(),
			new JPasswordField()
	                             };
	//创建操作按钮数组
	private JButton[] jbArray={new JButton("确认"),
			                  new JButton("重置")};
	                          
	//构造器
	public ChangePwd(String StuNo)
	{
		this.StuNo=StuNo;
		//初始化页面
		this.initialFrame();
		//注册监听器
		this.addListener();
	}
	//集体注册监听器的方法
	public void addListener()
	{
		jpfArray[0].addActionListener(this);
		jpfArray[1].addActionListener(this);
		jpfArray[2].addActionListener(this);
		jbArray[0].addActionListener(this);
		jbArray[1].addActionListener(this);
	}
	//初始化页面的方法
	public void initialFrame()
	{
		this.setLayout(null);
		for(int i=0;i<jlArray.length;i++)
		{
			jlArray[i].setBounds(30,20+50*i,150,30);
			this.add(jlArray[i]);
			jpfArray[i].setBounds(130,20+50*i,150,30);
			this.add(jpfArray[i]);
		}
		jbArray[0].setBounds(40,180,100,30);
		this.add(jbArray[0]);
		jbArray[1].setBounds(170,180,100,30);
		this.add(jbArray[1]);
	}
	//实现ActionListener接口中的方法
	public void actionPerformed(ActionEvent e)
	{
		if(e.getSource()==jpfArray[0])
		{
			jpfArray[1].requestFocus(true);
		}
		else if(e.getSource()==jpfArray[1])
		{
			jpfArray[2].requestFocus(true);
		}
		else if(e.getSource()==jpfArray[2])
		{
			jbArray[0].requestFocus(true);
		}
		else if(e.getSource()==jbArray[1])
		{//按下重置按钮的处理代码
		    //将输入信息清空
			for(int i=0;i<jpfArray.length;i++)
			{
				jpfArray[i].setText("");
			}
		}
		else if(e.getSource()==jbArray[0])
		{
			//获取用户输入的旧密码
			String oldPwd=jpfArray[0].getText();
			//db=new DataBase();
			int flag=0;
			int b=Integer.parseInt(StuNo);
			if(oldPwd.equals(""))
			{//旧密码空
				JOptionPane.showMessageDialog(this,"请输入原始密码","错误",JOptionPane.ERROR_MESSAGE);
				return;
			}
			int a=Integer.parseInt(oldPwd);
			
			//获取新密码
			String newPwd=jpfArray[1].getText();
			if(newPwd.equals(""))
			{//新密码为空
				JOptionPane.showMessageDialog(this,"请输入新密码","错误",JOptionPane.ERROR_MESSAGE);
				return;
			}
			String newPwd1=jpfArray[2].getText();
			if(!newPwd.equals(newPwd1))
			{//新密码与确认密码不同
				JOptionPane.showMessageDialog(this,"确认密码与新密码不符","错误",JOptionPane.ERROR_MESSAGE);
				return;
			}
			try
			{ 
				sql="update student set Password='"+newPwd+"' where StuNo="+b;
				 db=new DataBase();
				flag=db.updateDb(sql);
				if(flag>0){
						JOptionPane.showMessageDialog(this,"恭喜你，修改成功!!!",
						                     "消息",JOptionPane.INFORMATION_MESSAGE);		        	
			        }
				else{JOptionPane.showMessageDialog(this,"修改失败!!!",
	                     "消息",JOptionPane.INFORMATION_MESSAGE);	}
				}
			 catch(Exception e1){e1.printStackTrace();}
			 }
			
	}
	}
			
			