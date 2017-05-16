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
public class SearchBook extends JPanel implements ActionListener{
	int flag;
	String sql;
	DataBase db;
   //创建分割方向为上下的JSplitePane对象
    private JSplitPane jsp=new JSplitPane(JSplitPane.VERTICAL_SPLIT,true);
	private JPanel jpt=new JPanel();//创建JPanel对象
	private JPanel jpb=new JPanel();
	private JLabel jl=new JLabel("请选择查询方式:");
	//创建表示下拉列表框数据模型的字符串数组
	private String[] str={"书号","书名","作者","购买时间"};
	private JComboBox jcb=new JComboBox(str);//创建下拉列表框
	private JButton jb=new JButton("查询");	//创建按钮
	private JButton jb1=new JButton("所有图书查询");	//创建按钮
	private JTextField jtxt=new JTextField();
	private ButtonGroup bg=new ButtonGroup();//创建按钮
	Vector<String> head = new Vector<String>();
	{//定义表头
		head.add("书号");head.add("书名");
		head.add("作者");head.add("出版社");
		head.add("购进时间");head.add("是否借阅");
		head.add("是否预约");
	}
	Vector<Vector> data=new Vector<Vector>();//定义检索出的书的基本信息
    DefaultTableModel dtm=new DefaultTableModel(data,head);	//创建表格模型
	JTable jt=new JTable(dtm); //创建Jtable对象
	JScrollPane jspn=new JScrollPane(jt);//将JTable封装到滚动窗格

	public SearchBook(){
		this.setLayout(new GridLayout(1,1));//设置查询图书界面为网格布局
		//设置整个RetrunBook界面上下部分均为空布局管理器
		jpt.setLayout(null);
		jpb.setLayout(null);
		//设置单选框的大小、位置，并添加事件监听器
		jpt.add(jl);
		jl.setBounds(150,35,150,20);
		jpt.add(jcb);
		jcb.setBounds(250,35,100,20);	
	    jcb.addActionListener(this);
        //添加JButton设置其大小位置并添加事件监听器
		jpt.add(jb);
		jpt.add(jb1);
		jb.setBounds(560,35,80,20);
		jb1.setBounds(760,35,150,20);
		jb.addActionListener(this);
		jb1.addActionListener(this);
		jtxt.setBounds(400,35,120,20);
		jpt.add(jtxt);
        jsp.setTopComponent(jpt);//把jpt设置到jsp的上部窗格
        jsp.setBottomComponent(jspn);
        jsp.setDividerSize(4);
       	this.add(jsp);
    	jsp.setDividerLocation(100);//设置jsp中分割条的初始位置
		//设置窗体的大小位置及可见性
        this.setBounds(3,10,600,400);
        this.setVisible(true);
	}
    //为事件加载的监听器加上处理事件
	public void actionPerformed(ActionEvent e){
		 if(e.getSource()==jb1){//查询全部图书信息
		    	this.searchAllBook();
		    }
		  
			    if(e.getSource()==jb){//如果事件源为"查询"按钮，则执行检索
			    	jtxt.setEditable(true);
					String str=jtxt.getText().trim();
					if(str.equals("")){
						JOptionPane.showMessageDialog(this,"请输入必要的信息！！！",
										"消息",JOptionPane.INFORMATION_MESSAGE);
						return;
					}
				   if(jcb.getSelectedIndex()==0){//根据书号进行查询
						sql="select * from BOOK where BookNO="+Integer.parseInt(str);
			        	jtxt.setText("");
					}
				   else if(jcb.getSelectedIndex()==1){//根据书名进行查询
						sql="select * from BOOK where BookName='"+str+"'";
			        	jtxt.setText("");
					}
					else if(jcb.getSelectedIndex()==2){//根据作者进行查询
						sql="select * from BOOK where Author='"+str+"'";
						jtxt.setText("");
					}
					else if(jcb.getSelectedIndex()==3){//根据购进时间进行查询
						sql="select * from BOOK where BuyTime='"+str+"'";
						jtxt.setText("");
					}
					db=new DataBase();;
					db.selectDb(sql);
					//从表中检索成功后，把查到的书的所有信息显示在界面下部分的表中
					Vector<Vector> vtemp = new Vector<Vector>();
					try{ 
						int flag=0;
					
						while(db.rs.next())
						{//取到结果集
						
							flag++;
						
							Vector<String> v = new Vector<String>();
							for(int i=1;i<=7;i++){//将每列添加到临时数组v
								String str1=db.rs.getString(i);
							//str1=new String(str.getBytes("gb2312"));//转码
								v.add(str1);
							}
							vtemp.add(v);//将各条记录添加到临时数组vtemp
						}
						if(flag==0){//查询失败，提示
							JOptionPane.showMessageDialog(this,"没有您要查找的内容！！！",
							                      "消息",JOptionPane.INFORMATION_MESSAGE);
						    return;
						}		
					}
					catch(Exception ea){ea.printStackTrace();}				
					dtm.setDataVector(vtemp,head);	//更新table	
					jt.updateUI();
					jt.repaint();
					db.dbClose();			
				}
	        }
	
	
	 public void searchAllBook(){//弹出提示对话框
		 	sql="select * from book";
	        db=new DataBase();
			db.selectDb(sql);//查询学号文本中所输学号是否存在于STUDENT表中				   
		     try{//对结果集进行异常处
				 Vector<Vector> vtemp = new Vector<Vector>();
				  while(db.rs.next()){
			       	Vector<String> v = new Vector<String>();
					for(int i=1;i<=7;i++){//顺序达到所搜到的结果中的各项记录
						String str = db.rs.getString(i).trim();
						str = new String(str.getBytes("gb2312"));
						v.add(str);	
					}
					vtemp.add(v);//更新结果框中的内容
				 }
				 dtm.setDataVector(vtemp,head);
				 jt.updateUI();
				 jt.repaint();				 	
			 }
			 catch(Exception e){e.printStackTrace();}	    	
		}
	
}
		