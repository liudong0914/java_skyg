package com.stu;
import javax.swing.*;

import java.awt.*;
import java.awt.event.*;
import javax.swing.table.*;
import javax.swing.event.*;

import com.common.DataBase;

import java.sql.*;
import java.util.*;
import java.util.Date;
public class BorrowInfo extends JPanel implements ActionListener
{
	DataBase db;
	String sql;
	String str;
	String StuNo;
	//创建分割方向为上下的JSplitePane对象
    private JSplitPane jsp=new JSplitPane(JSplitPane.VERTICAL_SPLIT,true);
    //创建JPanel对象
	private JPanel jpt=new JPanel();
	private JPanel jpb=new JPanel();
	private JRadioButton[] jrbArray=
	    {new JRadioButton("当前借阅",true),new JRadioButton("历史借阅")};
	    private ButtonGroup bg=new ButtonGroup();
	//创建按钮数组
	private JButton jbArray=new JButton("查询");
	
	//创建标题
	Vector<String> head = new Vector<String>();
	{
		head.add("书号");
		head.add("学号");
		head.add("借阅时间");
		head.add("应还时间");
		head.add("实还时间");
		head.add("是否过期");
		head.add("是否预约");
	}
	//
	Vector<Vector> data=new Vector<Vector>();
	//创建表格模型
    DefaultTableModel dtm=new DefaultTableModel(data,head);
    //创建Jtable对象
	JTable jt=new JTable(dtm);
	//将JTable封装到滚动窗格
	JScrollPane jspn=new JScrollPane(jt);
	public BorrowInfo(String StuNo)
	{   this.StuNo=StuNo;
		this.setLayout(new GridLayout(1,1));
		//设置整个RetrunBook界面上下部分均为空布局管理器
		jpt.setLayout(null);
		jpb.setLayout(null);
        jbArray.setBounds(650,35,150,30);
        jpt.add(jbArray);
	    jbArray.addActionListener(this);
         for(int i=0;i<2;i++)
     	{
     		jrbArray[i].setBounds(70+i*150,20,150,20);
     		jpt.add(jrbArray[i]);
     		bg.add(jrbArray[i]);
     	}
		//把jpt设置到jsp的上部窗格
    	jsp.setTopComponent(jpt);
        //jpb.add(jspn);
    	jsp.setBottomComponent(jspn);
    	jsp.setDividerSize(4);
    	this.add(jsp);
    	//设置jsp中分割条的初始位置
    	jsp.setDividerLocation(80);
		//设置窗体的大小位置及可见性
        this.setBounds(10,10,800,600);
        this.setVisible(true); 
   	} 
   	public void actionPerformed(ActionEvent e)
   	{
   		if(e.getSource()==jbArray){
   		if(jrbArray[0].isSelected()){
   		System.out.println("请输入");
   			int b=Integer.parseInt(StuNo);
   				sql="select * from borrowlist where StuNO="+b ;
	   			db=new DataBase();
	   			db.selectDb(sql);
				Vector<Vector> vtemp = new Vector<Vector>();
				try{//结果集进行异常处理
	                int k=0;
					while(db.rs.next()){//取到结果集
					    k++;
						Vector<String> v = new Vector<String>();
						for(int i=1;i<8;i++){//将每列添加到临时数组v
							String str=db.rs.getString(i);
							str=new String(str.getBytes("gb2312"));
							v.add(str);
						}
										
						String str1=db.rs.getString(5);	
						str1=new String(str1.getBytes("gb2312"));
					    if(str1.equals("")){
                        
							vtemp.add(v);//将各条记录添加到临时数组vtemp
								//更新table	
						
						}
						
					    jt.clearSelection();
						dtm.setDataVector(vtemp,head);
						jt.updateUI();
						jt.repaint();	
					}
				    if(k==0){//提示
						JOptionPane.showMessageDialog(this,"没有你的借书记录！！！",
						                             "消息",JOptionPane.INFORMATION_MESSAGE);
						return;
					}			
	   			}
	   			catch(Exception ea){ea.printStackTrace();}
			}
   		if(jrbArray[1].isSelected()){
   			int b=Integer.parseInt(StuNo);
   				sql="select * from borrowlist where StuNO="+b ;
	   			db=new DataBase();
	   			db.selectDb(sql);
				Vector<Vector> vtemp = new Vector<Vector>();
				try{//结果集进行异常处理
	                int k=0,j=0;
					while(db.rs.next()){//取到结果集
					    k++;
						Vector<String> v = new Vector<String>();
						for(int i=1;i<8;i++){//将每列添加到临时数组v
							String str=db.rs.getString(i);
							str=new String(str.getBytes("gb2312"));
							v.add(str);
						}
										
						String str1=db.rs.getString(5);	
						str1=new String(str1.getBytes("gb2312"));
					    if(!(str1.equals(""))){
                            j++;
							vtemp.add(v);//将各条记录添加到临时数组vtemp
								//更新table	
						
						}
						
					    jt.clearSelection();
						dtm.setDataVector(vtemp,head);
						jt.updateUI();
						jt.repaint();	
					}
				    if(k==0){//提示
						JOptionPane.showMessageDialog(this,"没有你的借书记录！！！",
						                             "消息",JOptionPane.INFORMATION_MESSAGE);
						return;
					}	
				    if(j==0){//提示
						JOptionPane.showMessageDialog(this,"没有你的历史借书记录！！！",
						                             "消息",JOptionPane.INFORMATION_MESSAGE);
						return;
					}			
	   			}
	   			catch(Exception ea){ea.printStackTrace();}
   			
   			
   		}
   		
   		
   		
   		}
   		
   
   	
   	
}}
