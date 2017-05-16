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
	//������Ϣ��ʾ��ǩ����
	private JLabel[] jlArray={
			new JLabel("ԭʼ����"),
			new JLabel("������"),
			new JLabel("ȷ��������"),
	                         };
	//�������������
	private JPasswordField[] jpfArray={
			new JPasswordField(),
			new JPasswordField(),
			new JPasswordField()
	                             };
	//����������ť����
	private JButton[] jbArray={new JButton("ȷ��"),
			                  new JButton("����")};
	                          
	//������
	public ChangePwd(String StuNo)
	{
		this.StuNo=StuNo;
		//��ʼ��ҳ��
		this.initialFrame();
		//ע�������
		this.addListener();
	}
	//����ע��������ķ���
	public void addListener()
	{
		jpfArray[0].addActionListener(this);
		jpfArray[1].addActionListener(this);
		jpfArray[2].addActionListener(this);
		jbArray[0].addActionListener(this);
		jbArray[1].addActionListener(this);
	}
	//��ʼ��ҳ��ķ���
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
	//ʵ��ActionListener�ӿ��еķ���
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
		{//�������ð�ť�Ĵ������
		    //��������Ϣ���
			for(int i=0;i<jpfArray.length;i++)
			{
				jpfArray[i].setText("");
			}
		}
		else if(e.getSource()==jbArray[0])
		{
			//��ȡ�û�����ľ�����
			String oldPwd=jpfArray[0].getText();
			//db=new DataBase();
			int flag=0;
			int b=Integer.parseInt(StuNo);
			if(oldPwd.equals(""))
			{//�������
				JOptionPane.showMessageDialog(this,"������ԭʼ����","����",JOptionPane.ERROR_MESSAGE);
				return;
			}
			int a=Integer.parseInt(oldPwd);
			
			//��ȡ������
			String newPwd=jpfArray[1].getText();
			if(newPwd.equals(""))
			{//������Ϊ��
				JOptionPane.showMessageDialog(this,"������������","����",JOptionPane.ERROR_MESSAGE);
				return;
			}
			String newPwd1=jpfArray[2].getText();
			if(!newPwd.equals(newPwd1))
			{//��������ȷ�����벻ͬ
				JOptionPane.showMessageDialog(this,"ȷ�������������벻��","����",JOptionPane.ERROR_MESSAGE);
				return;
			}
			try
			{ 
				sql="update student set Password='"+newPwd+"' where StuNo="+b;
				 db=new DataBase();
				flag=db.updateDb(sql);
				if(flag>0){
						JOptionPane.showMessageDialog(this,"��ϲ�㣬�޸ĳɹ�!!!",
						                     "��Ϣ",JOptionPane.INFORMATION_MESSAGE);		        	
			        }
				else{JOptionPane.showMessageDialog(this,"�޸�ʧ��!!!",
	                     "��Ϣ",JOptionPane.INFORMATION_MESSAGE);	}
				}
			 catch(Exception e1){e1.printStackTrace();}
			 }
			
	}
	}
			
			