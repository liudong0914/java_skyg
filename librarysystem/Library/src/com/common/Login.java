package com.common;

import com.manager.ManagerSystem;
import com.stu.*;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;import javax.swing.table.*;
import javax.swing.event.*;import java.sql.*;
import java.util.*;import java.util.Date;
public class Login extends JFrame implements ActionListener{
	private JPanel jp=new JPanel();//创建JPanel对象
	private JPanel jp1=new JPanel();//来放置身份选择
    private JLabel []jlArray={new JLabel("用户名"),new JLabel("密  码")}; //创建标签数组
    private JButton[] jbArray={new JButton("登录"),new JButton("清空")};//创建按钮数组
    private JTextField jtxt=new JTextField("123");//创建文本框 
    private JPasswordField jpassword=new JPasswordField("123");//创建密码框
    private JLabel jl=new JLabel();
    private JComboBox jcb ;
    String sql;
    DataBase db;
    DataBase db1;
    private JLabel background;
    private ImageIcon backpicture;
    public Login(){
    	super("欢迎登陆图书馆信息系统：");
    	backpicture=new ImageIcon("login.jpg");
		background=new JLabel(backpicture);
		background.setBounds(0, 0, backpicture.getIconWidth(), backpicture.getIconHeight());
    	jp.setLayout(null);	
    	for(int i=0;i<2;i++){//设置标签的大小和位置
        	jlArray[i].setBounds(180,100+i*50,80,26);
        	jlArray[i].setForeground(Color.orange);
        	jp.add(jlArray[i]);
        }
        for(int i=0;i<2;i++){
        	jbArray[i].setBounds(200+i*120,230,100,26);//设置按钮的大小位置
        	
        	jp.add(jbArray[i]);	
        	jbArray[i].addActionListener(this);//为按钮注册动作事件监听器       
        }  
        jtxt.setBounds(240,100,180,30);//设置文本框的大小位置
        jp.add(jtxt);//将文本框添加进JPanel容器 
        jtxt.addActionListener(this);//为文本框注册事件监听器 
        jpassword.setBounds(240,150,180,30);//设置密码框的大小位置
        jp.add(jpassword);//将密码框添加进JPanel容器 
        jpassword.setEchoChar('*');//设置密码框的 回显字符 
        jpassword.addActionListener(this);//为密码框注册监听器
        jl = new JLabel("身份  :");
	    jl.setForeground(Color.orange);
	    String[] ss = {"读者","管理员"};
	    jcb = new JComboBox(ss);
	    jcb.setForeground(Color.orange);
        jl.setBounds(180,50,80,30);
	    jp.add(jl);
	    jp.add(jcb);
	    jcb.setBounds(240,50,80,30);
        this.add(jp);
        jp.setOpaque(false);
        JPanel imagePanel = (JPanel) this.getContentPane();
        imagePanel.setOpaque(false);
        this.getLayeredPane().setLayout(null);
		this.getLayeredPane().add(background,new Integer(Integer.MIN_VALUE));
        this.setBounds(350,200,backpicture.getIconWidth(),backpicture.getIconHeight());
        this.setResizable(false);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
	public void actionPerformed(ActionEvent e){
		String box =(String)jcb.getSelectedItem();
		
if("管理员".equals(box)){
	    String mgno=jtxt.getText().trim();
	    if(e.getSource()==jtxt){//切换输入焦点到密码框
			jpassword.requestFocus();
		}
		else if(e.getSource()==jbArray[1]){//单击"清空"按钮，将清空界面上的所有信息
			jtxt.setText("");
			jpassword.setText("");
			jtxt.requestFocus();//将输入焦点设置到文本框
		}
		else if(e.getSource()==jbArray[0]){//事件源为登录按钮
	    	String no=jtxt.getText().trim();
		    if(jtxt.getText().trim().equals("")){//用户名提示为空
				JOptionPane.showMessageDialog(this,"用户名不能为空！","信息",JOptionPane.INFORMATION_MESSAGE);
		    	return;
			}
			if(jpassword.getText().trim().equals("")){//用户密码为空提示
				JOptionPane.showMessageDialog(this,"用户密码不能为空！","信息",JOptionPane.INFORMATION_MESSAGE);
		    	return;
			}
			sql="select mgNo,password from manager where mgNo='"+no+"'";//验证登录者的身份和权限
	        db=new DataBase();
			db.selectDb(sql);
			try{
				String mgNo="wyf";
				String password="hxl";
				while(db.rs.next()){//获得结果集信息
				     mgNo=db.rs.getString(1).trim();
			         password=db.rs.getString(2).trim();					
				}
	        	if(jtxt.getText().trim().equals(mgNo)&&
	    		String.valueOf(jpassword.getPassword()).equals(password)){//登录成功提示
	    			JOptionPane.showMessageDialog(this,"恭喜您，登录成功！！！","提示",
	    			     JOptionPane.INFORMATION_MESSAGE);
	    			new ManagerSystem(mgno);
	    			this.dispose();   			
	    		}
	    		else{//登录失败提示
	    			JOptionPane.showMessageDialog(this,"登录失败！","提示",
	    			     JOptionPane.INFORMATION_MESSAGE);
	    	        return;  
	    		}
			}
		    catch(Exception e1){e1.printStackTrace();}  
		    db.dbClose();//关闭数据库链接   
		}
		}
		


		if("读者".equals(box)){     
	 String stuno =jtxt.getText().trim();
	    if(e.getSource()==jtxt){//切换输入焦点到密码框
			jpassword.requestFocus();
		}
		else if(e.getSource()==jbArray[1]){//单击"清空"按钮，将清空界面上的所有信息
			jtxt.setText("");
			jpassword.setText("");
			jtxt.requestFocus();//将输入焦点设置到文本框
		}
		else if(e.getSource()==jbArray[0]){//事件源为登录按钮
	    	//String no=jtxt.getText().trim();
		    if(jtxt.getText().trim().equals("")){//用户名提示为空
				JOptionPane.showMessageDialog(this,"用户名不能为空！","信息",JOptionPane.INFORMATION_MESSAGE);
		    	return;
			}
			if(jpassword.getText().trim().equals("")){//用户密码为空提示
				JOptionPane.showMessageDialog(this,"用户密码不能为空！","信息",JOptionPane.INFORMATION_MESSAGE);
		    	return;
			}
			
			
			 sql="select StuNO,Password from STUDENT where StuNO="
        				+Integer.parseInt(jtxt.getText().trim());
	        db1=new DataBase();
			db1.selectDb(sql);
			try{
				String StuNO="123";
				String Password="123";
				while(db1.rs.next()){//获得结果集信息
					StuNO=db1.rs.getString(1).trim();
					Password=db1.rs.getString(2).trim();					
				}
	        	if(jtxt.getText().trim().equals(StuNO)&&
	    		String.valueOf(jpassword.getPassword()).equals(Password)){//登录成功提示
	    			JOptionPane.showMessageDialog(this,"恭喜您，登录成功！！！","信息",
	    			     JOptionPane.INFORMATION_MESSAGE);
	    			new StudentSystem(stuno);
	    			this.dispose();   			
	    		}
	    		else{//登录失败提示
	    			JOptionPane.showMessageDialog(this,"登录失败！","信息",
	    			     JOptionPane.INFORMATION_MESSAGE);
	    	        return;  
	    		}
			}
		    catch(Exception e1){
		    	e1.printStackTrace();}  
		    db1.dbClose();//关闭数据库链接   
		}
	    }
		}
	public static void main(String[]args)
    {
    	new Login().setVisible(true);
    }
}