package com.manager;
import javax.swing.*;

import java.awt.*;
import java.awt.event.*;
import javax.swing.table.*;
import javax.swing.event.*;

import com.common.DataBase;

import java.sql.*;
import java.util.*;
import java.util.Date;
public class BorrowList extends JPanel implements ActionListener
{
	DataBase db;
	String sql;
	String str;
	//创建分割方向为上下的JSplitePane对象
    private JSplitPane jsp=new JSplitPane(JSplitPane.VERTICAL_SPLIT,true);
    //创建JPanel对象
	private JPanel jpt=new JPanel();
	private JPanel jpb=new JPanel();
	//创建按钮数组
	private JButton[] jbArray=new JButton[]
	{
		
		new JButton	("此书已归还"),
		new JButton	("确定"),
		new JButton	("全部借阅信息"),
		new JButton	("当前借阅信息"),
		new JButton	("历史借阅信息"),
	};
	private JLabel jl=new JLabel("请输入待查询的学号:");

	private JTextField jtxt=new JTextField();

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
	public BorrowList()
	{
		this.setLayout(new GridLayout(1,1));
		
		jpt.setLayout(null);
		jpb.setLayout(null);
		//设置Label的大小及位置
           jl.setBounds(100,35,100,30);	
		//将Jlabel添加到jpt面板上
		 jpt.add(jl);
		//为JTextField设置大小及位置
		jtxt.setBounds(250,35,150,30);
    	//把JTextField添加到jpt
	 jpt.add(jtxt);
        //设置JBuuton的大小及位置
	   // jbArray[0].setBounds(5,50,100,20);
        jbArray[0].setBounds(650,35,150,30);
        jbArray[1].setBounds(500,35,70,30);
        jbArray[2].setBounds(200,80,150,30);
        jbArray[3].setBounds(350,80,150,30);
        jbArray[4].setBounds(500,80,150,30);
        //添加JButton并给其添加事件监听器
         for(int i=0;i<2;i++)
		{
			 jpt.add(jbArray[i]);
			 jbArray[i].addActionListener(this);
		}
         for(int i=2;i<5;i++)
 		{
 			 jpt.add(jbArray[i]);
 			 jbArray[i].addActionListener(this);
 		}
         
		//把jpt设置到jsp的上部窗格
    	jsp.setTopComponent(jpt);
        //jpb.add(jspn);
    	jsp.setBottomComponent(jspn);
    	jsp.setDividerSize(4);
    	this.add(jsp);
    	//设置jsp中分割条的初始位置
    	jsp.setDividerLocation(120);
		//设置窗体的大小位置及可见性
        this.setBounds(10,10,800,600);
        this.setVisible(true); 
   	} 
   	public void actionPerformed(ActionEvent e)
   	{
   		if(e.getSource()==jbArray[1]){//事件源为"确定"按钮
   			if(jtxt.getText().trim().equals("")){//学号输入为空，提示
   				JOptionPane.showMessageDialog(this,"请输入学号",
					            "消息",JOptionPane.INFORMATION_MESSAGE);
					return;
   			}
   			else{//根据学号进行查询
   				sql="select * from borrowlist where StuNO="+jtxt.getText().trim();
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
						vtemp.add(v);//将各条记录添加到临时数组vtemp
						//更新table	
						jt.clearSelection();
						dtm.setDataVector(vtemp,head);
						jt.updateUI();
						jt.repaint();	
					}
				    if(k==0){//提示
						JOptionPane.showMessageDialog(this,"输入了错误的学号或该学生没有借书记录",
						                             "消息",JOptionPane.INFORMATION_MESSAGE);
						return;
					}			
	   			}
				catch(Exception ea){ea.printStackTrace();}
			}
   		}
   		if(e.getSource()==jbArray[0]){//当要归还图书
   			int row=jt.getSelectedRow();
   			if(row<0){//如果未选中下部表中的某些内容，进行提示
   			
				JOptionPane.showMessageDialog(this,"请选择要归还的书!!!","消息",
					                              JOptionPane.INFORMATION_MESSAGE);
				return;
   			}
   			str=(String)jt.getValueAt(row,0);//得到书号
   			int sno=Integer.parseInt((String)jt.getValueAt(row,1));
   			int bno=Integer.parseInt(str);
   			int flag=checkTime(sno,bno);	//判断是否超期
   			if(flag==-1){//如果图书超期，则将取消该同学的借书权限
   				db=new DataBase();
   				sql="update student set permitted='否' where StuNO="+sno;
   				db.updateDb(sql);
   				db.dbClose();
   			}
   			if(flag==0){return;}//如果图书未超期，则进行归还操作
   			
   			Date now =new Date();
   			sql="update borrowlist set backtime='"+(now.getYear()+1900)+"."
			    +(now.getMonth()+1)+"."+now.getDate()+"' where BookNO="+Integer.parseInt(str);
   			db=new DataBase();
   			db.updateDb(sql);
   			sql="update book set borrowed='否' where BookNO="+Integer.parseInt(str);
   			db.updateDb(sql);//更新了图书记录，设该书号的数为可借
   			db.dbClose();
			updateTable();
			
			
   		}
   		
   		if(e.getSource()==jbArray[2]){//查询全部借阅信息
   			sql="select * from borrowlist";
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
					vtemp.add(v);//将各条记录添加到临时数组vtemp
					//更新table	
					jt.clearSelection();
					dtm.setDataVector(vtemp,head);
					jt.updateUI();
					jt.repaint();	
				}
			    if(k==0){//提示
					JOptionPane.showMessageDialog(this,"没有借书记录",
					                             "消息",JOptionPane.INFORMATION_MESSAGE);
					return;
				}			
}
			catch(Exception ea){ea.printStackTrace();}
   	}
   		if(e.getSource()==jbArray[3]){//查询当前借阅信息
   			sql="select * from borrowlist";
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
					JOptionPane.showMessageDialog(this,"没有借书记录",
					                             "消息",JOptionPane.INFORMATION_MESSAGE);
					return;
				}			
}
			catch(Exception ea){ea.printStackTrace();}
   	}
   		
   		
   		
   		if(e.getSource()==jbArray[4]){//查询历史借阅信息
   			sql="select * from borrowlist";
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
				    if(!(str1.equals(""))){
                    
						vtemp.add(v);//将各条记录添加到临时数组vtemp
							//更新table	
					
					}
					
					jt.clearSelection();
					dtm.setDataVector(vtemp,head);
					jt.updateUI();
					jt.repaint();	
				}
			    if(k==0){//提示
					JOptionPane.showMessageDialog(this,"没有借书记录",
					                             "消息",JOptionPane.INFORMATION_MESSAGE);
					return;
				}			
}
			catch(Exception ea){ea.printStackTrace();}
   	}
   		
   		
   		
   	}
   	public void updateTable(){//实现界面下部表格的更新
   		if(jtxt.getText().trim().equals("")){//学号输入为空，提示
				JOptionPane.showMessageDialog(this,"请输入学号",
				            "消息",JOptionPane.INFORMATION_MESSAGE);
				return;
			}
		sql="select * from borrowlist where StuNO="+jtxt.getText().trim();
		db=new DataBase();
		db.selectDb(sql);//将图书信息从数据库中取出
		Vector<Vector> vtemp = new Vector<Vector>();
		try{
			while(db.rs.next()){
				Vector<String> v = new Vector<String>();
				for(int i=1;i<8;i++){//将每列添加到临时数组v
					String str=db.rs.getString(i);
					str=new String(str.getBytes("gb2312"));
					v.add(str);
				}
				vtemp.add(v);//将各条记录添加到临时数组vtemp
			}
			db.dbClose();	
		}
		catch(Exception ea){ea.printStackTrace();}
		jt.clearSelection();			
		dtm.setDataVector(vtemp,head);//更新table	
		jt.updateUI();
		jt.repaint();   		
   	}	
   	public int checkTime(int sno,int bno)
   	{//-1代表超期没交罚款  0代表当天借的书   1代表正常还的书  -2表示超期交罚款
   		int day=0;
   		int flag=0;
   		String bname="";
   		Date now=new Date();
   		String returntime="";
   		sql="select ReturnTime from borrowlist where StuNO="+sno+" and BookNO="+bno;
   		db=new DataBase();
   		db.selectDb(sql);
   		try{
   			if(db.rs.next()){
   				returntime=db.rs.getString(1);//获取归还时间
   			}
   		}
   		catch(Exception e){e.printStackTrace();}
		String[] strday=returntime.split("\\.");//这里使用了简单的正则式，规定了时间的格式
		int ryear=Integer.parseInt(strday[0].trim());
		int rmonth=Integer.parseInt(strday[1].trim());
		int rday=Integer.parseInt(strday[2].trim());
		day=(now.getYear()+1900-ryear)*365+(now.getMonth()+1-rmonth)*30+(now.getDate()-rday);
		if(day>0)
		{//代表超期了
			int i=JOptionPane.showConfirmDialog(this,"该书已过期,应交罚款为"
			             +day*0.1+"元,是否缴纳罚款?","消息",JOptionPane.YES_NO_OPTION);
			if(i==JOptionPane.YES_OPTION){
				JOptionPane.showMessageDialog(this,"你已成功交费"+day*0.1+"元",
										"消息",JOptionPane.INFORMATION_MESSAGE);
				flag=-2;
			}
			else
			{//超期且没交费
				flag=-1;
				sql="select BookName from BOOK where BookNO="+bno;
				db.selectDb(sql);
				try{
					if(db.rs.next()){bname=db.rs.getString(1).trim();}
				}
				catch(Exception e){e.printStackTrace();}
				sql="insert into overdue(StuNO,BookNO,BookName,OverTime) values("+sno+","+bno+",'"+bname+"',"+day+")";
				db.updateDb(sql);
			}
		}
		else
		{//表示可以正常归还的书
			flag=1;
		}
		db.dbClose();
   		return flag;
   	}
   	
   	
   	
}
