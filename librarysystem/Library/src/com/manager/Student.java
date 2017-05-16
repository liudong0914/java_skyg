package com.manager;
import javax.swing.*;

import java.awt.*;
import java.awt.event.*;
import javax.swing.table.*;

import com.common.DataBase;

import java.sql.*;
import java.util.*;
import java.util.Date;
public class Student extends JPanel implements ActionListener
{   //����һ�����·���ָ��JSplitPane����
	private JSplitPane jsp=new JSplitPane(JSplitPane.VERTICAL_SPLIT);
	private JPanel jpt=new JPanel();
	String[]str1=new String[9];//�����ַ�������
	String sql;
	String sql2;
	String sql3;
	DataBase db;
	private JLabel[] jlArray=new JLabel[]{//������ǩ����
		new JLabel("              ѧ    ��"),
		new JLabel("              ��    ��"),
		new JLabel("              ��     ��"),
		new JLabel("              ��    ��"),
		new JLabel("              ��    ��"),
		new JLabel("              Ժ    ϵ"),
		new JLabel("              �绰����"),
	    new JLabel("              ��    ��"),
	    new JLabel("              ����Ȩ��")   
	};
	private JTextField[] jtxtArray=new JTextField[]{//�����ı�������
		new JTextField(),new JTextField(),
		new JTextField(),new JTextField(),
		new JTextField(),new JTextField(),
		new JTextField(),new JTextField()
	};
	private String[] str={"��","��"};//���������б������ģ�͵��ַ�������
	private JComboBox jcp=new JComboBox(str);//���������б��
	private JButton[] jbArray={//����JButton��ť���ı�
	    new JButton("���ѧ����Ϣ"),new JButton("ɾ��ѧ����Ϣ"),
	    new JButton("�޸�ѧ����Ϣ"),new JButton("����ѧ����Ϣ"),
	    new JButton("����ȫ��ѧ����Ϣ")
	};
	Vector<String> head = new Vector<String>();
	{//��������
		head.add("ѧ��");head.add("����");head.add("����");
		head.add("�Ա�");head.add("�༶");head.add("Ժϵ");
		head.add("�绰����");head.add("����");head.add("����Ȩ��");
	}
	Vector<Vector> data=new Vector<Vector>();//���²��Ӵ��������ñ��
    DefaultTableModel dtm=new DefaultTableModel(data,head);//�������ģ��
	JTable jt=new JTable(dtm);//����JTable����
	JScrollPane jspn=new JScrollPane(jt);//��JTable��װ����������
	public Student()
	{
		this.setLayout(new GridLayout(1,1));//����������Ϊ���񲼾�
		jpt.setLayout(null);//���������ϲ���Ϊ�ղ��ֹ�����
		jsp.setDividerLocation(130);//����jspt�зָ����ĳ�ʼλ��
		jsp.setDividerSize(4);//���÷ָ����Ŀ��
		jsp.setTopComponent(jpt);
		jsp.setBottomComponent(jspn);
		for(int i=0;i<8;i++){//���ı�����ӽ��ϲ����
			jpt.add(jtxtArray[i]);
		}
		for(int i=0;i<9;i++){
			jpt.add(jlArray[i]);
			if(i<4)
			{//�Խ����ϵĵ�һ�б�ǩ���ı����Сλ�ý�������
			    jlArray[i].setBounds(20+i*200,10,100,20);
			    jtxtArray[i].setBounds(120+i*200,10,120,20);
			    jtxtArray[i].addActionListener(this);
			}
			else if(i>3&&i<8)
			{//�Եڶ��б�ǩ���ı����Сλ�ý�������
				jlArray[i].setBounds(20+(i-4)*200,50,100,20);
				jtxtArray[i].setBounds(120+(i-4)*200,50,120,20);
				jtxtArray[i].addActionListener(this);
			}
			else
			{//�����������ʾ��ǩ��������
				jlArray[i].setBounds(820,10,100,20);
			}
		}
		this.add(jsp);
		jpt.add(jcp);
    	jsp.setBottomComponent(jspn);//�����²��Ӵ���
		jcp.setBounds(920,10,100,20);
		for(int i=0;i<5;i++)
		{//��JButton��ӽ�jpt
			jpt.add(jbArray[i]);
			jbArray[i].setBounds(170+112*i,90,112,25);
			jbArray[i].addActionListener(this);	//���ü�����
		}		
		//���ô���Ĵ�Сλ�ü��ɼ���
		this.setBounds(5,5,600,500);
		this.setVisible(true);
	}
	public void actionPerformed(ActionEvent e)
	{//Ϊ�ı������ý���
		if(e.getSource()==jtxtArray[0])
    	{
    		jtxtArray[1].requestFocus();
    	}
    	if(e.getSource()==jtxtArray[1])
    	{
    		jtxtArray[2].requestFocus();
    	}
    	if(e.getSource()==jtxtArray[2])
    	{
    		jtxtArray[3].requestFocus();
    	}
    	if(e.getSource()==jtxtArray[3])
    	{
    		jtxtArray[4].requestFocus();
    	}
    	if(e.getSource()==jtxtArray[4])
    	{
    		jtxtArray[5].requestFocus();
    	}
    	if(e.getSource()==jtxtArray[5])
    	{
    		jtxtArray[6].requestFocus();
    	}
    	if(e.getSource()==jtxtArray[6])
    	{
    		jtxtArray[7].requestFocus();
    	}
	    //�����"���ѧ����Ϣ"��ť�ǽ�ִ����ӹ��ܣ����ı����ѧ����Ϣ��ӽ�STUDENT����
		if(e.getSource()==jbArray[0])
		{
			this.insertStudent();
		}
		//�����"ɾ��ѧ����Ϣ"��ť�ǽ�ִ��ɾ�����ܣ���ѧ��Ϊѧ�ſ��ѧ����Ϣ��STUDENT����ɾ��	
		if(e.getSource()==jbArray[1])
		{
			try {
				this.deleteStudent();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		//�����"�޸�ѧ����Ϣ"��ť�ǽ�ִ���޸Ĺ��ܣ�����ϢΪѧ�ſ��ѧ����Ϣ��STUDENT���и���
		if(e.getSource()==jbArray[2])
		{
			this.updateStudent();
		}
		//�����"����ѧ����Ϣ"��ť�ǽ�ִ�в��ҹ��ܣ�����STUDENT���в���ѧ��Ϊѧ�ſ��ѧ����Ϣ
		if(e.getSource()==jbArray[3])
		{
			this.searchStudent();
		}
		if(e.getSource()==jbArray[4])
		{
			this.searchAllStudent();
		}
	}
	public void insertStudent(){
        for(int i=0;i<8;i++){//�����ı���������Ϣ
			str1[i]=jtxtArray[i].getText().trim();		
		}
    	if(str1[0].equals("")&&str1[1].equals("")&&str1[2].equals("")
		   &&str1[3].equals("")&&str1[4].equals("")&&str1[5].equals("")
		   &&str1[6].equals("")&&str1[7].equals(""))
		{//�����ı���Ϊ����ʾ
		  	JOptionPane.showMessageDialog(this,	"ѧ����Ϣ����Ϊ�գ�����",
							        "��Ϣ",JOptionPane.INFORMATION_MESSAGE);
			return;	
		}
		if(!str1[0].equals("")&&!str1[1].equals("")&&!str1[2].equals("")
		   &&!str1[3].equals("")&&!str1[4].equals("")&&!str1[5].equals("")
		   &&!str1[6].equals("")&&!str1[7].equals(""))
		{//�����ı���������Ϣ
			str1[8]=jcp.getSelectedItem().toString();
			sql="insert into STUDENT(StuNO,StuName,StuAge,StuSex,Class,Department,"
			+"Tel,Password,Permitted) values('"+str1[0]+"','"+str1[1]+"','"
			 + str1[2] + "',' "+str1[3]+"','"+
			            str1[4]+"','"+str1[5]+"','"+str1[6]+"','"+str1[7]+"','"+str1[8]+"')";
			db=new DataBase();
			db.updateDb(sql);//����ѧ����Ϣ
			Vector<String> v = new Vector<String>();
		    for(int i=0;i<=8;i++){//��ÿ����ӵ���ʱ����v
				v.add(str1[i]);
				if(i<8){jtxtArray[i].setText("");}	
		    }
		    data.add(v);
			dtm.setDataVector(data,head);//����table����ʾ	
			jt.updateUI();
			jt.repaint();
			return;
		}
    }
	public void deleteStudent() throws SQLException{
		String stuno = jtxtArray[0].getText().trim();
		if(stuno.equals("")){//��ѧ������Ϊ����ʾ
			JOptionPane.showMessageDialog(this,	"ѧ�Ų���Ϊ�գ�����",
						        "��Ϣ",JOptionPane.INFORMATION_MESSAGE);
			return;			
		}
		sql="select * from borrowlist where StuNO="+Integer.parseInt(stuno);
		db=new DataBase();
		db.selectDb(sql);//ɾ��ͼ���¼
	    Vector<String> v = new Vector<String>();
		try{	
			
			  while(db.rs.next()){
			       
					for(int i=1;i<=7;i++){//˳��ﵽ���ѵ��Ľ���еĸ����¼
						String str = db.rs.getString(i).trim();
						str = new String(str.getBytes("gb2312"));
						v.add(str);	}
		                  }
		 }
		catch(Exception e){e.printStackTrace();}
	     for(int i = 0; i < v.size(); i++ ){
		 if((v.get(i)).equals("")){//��Record�����У��������ʾ�Ի���
					JOptionPane.showMessageDialog(this,	"����ɾ��������Ϣ������δ��,�������飡",
								        "��Ϣ",JOptionPane.INFORMATION_MESSAGE);
					return;	
				}	}
		    sql="select * from orderlist where StuNO="+Integer.parseInt(stuno);
			db=new DataBase();
			db.selectDb(sql);//
		   if(db.rs.next()){
			try{	
				  Vector<String> v1 = new Vector<String>();
				  while(db.rs.next()){
				       
						for(int i=1;i<=6;i++){//˳��ﵽ���ѵ��Ľ���еĸ����¼
							String str = db.rs.getString(i).trim();
							str = new String(str.getBytes("gb2312"));
							v1.add(str);	}
			                  } 
				     
				       sql2="update book,orderlist set ordered='��' where book.bookno=orderlist.bookno and orderlist.StuNo="+Integer.parseInt(stuno);
			           db=new DataBase();
			           db.updateDb(sql2); 
					   sql="delete from orderlist where StuNO="+Integer.parseInt(stuno);
					   db=new DataBase();
			           db.updateDb(sql);//ɾ��ѧ��Ϊ�������ݵ�ѧ������Ϣ 
			           sql3="delete from student where StuNO="+Integer.parseInt(stuno);
			           db=new DataBase();
			           db.updateDb(sql3);
			        	JOptionPane.showMessageDialog(this,	"�ɹ�ɾ��������Ϣ��¼����",
									        "��Ϣ",JOptionPane.INFORMATION_MESSAGE);
			          	
					}	
			 
			catch(Exception e){e.printStackTrace();}}
	
		   else{
		sql="delete from STUDENT where StuNO="+Integer.parseInt(stuno);
		JOptionPane.showMessageDialog(this,	"�ɹ�ɾ��������Ϣ��¼����",
		        "��Ϣ",JOptionPane.INFORMATION_MESSAGE);
		db=new DataBase();
		db.updateDb(sql);//��Record�����޴�ѧ����¼��ɾ��������Ϣ	
		}
	}
	public void updateStudent(){
		String str[]=new String[9];
		int row = jt.getSelectedRow();//������ѡ�к�
		if(row>=0){//ѡ���˱���е�ĳ��
			for(int i=0;i<9;i++){str[i]=jt.getValueAt(row,i).toString();}
			sql="update STUDENT set StuName='"+str[1]+"',StuAge='"+str[2]+"',StuSex='"+str[3]+"',Class='"
			     +str[4]+"',Department='"+str[5]+"',Tel='"+str[6]+"',Password='"+str[7]+"',Permitted='"+str[8]
			     +"' where StuNO="+Integer.parseInt(str[0].trim());
			db=new DataBase();
			db.updateDb(sql);//����ѧ����Ϣ
			JOptionPane.showMessageDialog(this,"�޸ĳɹ�����",
			                                   "��Ϣ!!",JOptionPane.INFORMATION_MESSAGE);
			return;
		}
		if(row==-1){//��û��ѡ��͵��'�޸���Ϣ'��ť ����ʾ
			JOptionPane.showMessageDialog(this,"����'����'��ť,���²�����,��ѡ��������,���'�޸���Ϣ'��ť",
			                               "Warning!!",JOptionPane.INFORMATION_MESSAGE);
			return;
		}		
	}
	public void searchStudent(){
		if(jtxtArray[0].getText().equals("")){//
			JOptionPane.showMessageDialog(this,"���벻��Ϊ�գ����������룡����",
			                              "��Ϣ",JOptionPane.INFORMATION_MESSAGE);
			return;
		}
       	sql="select * from STUDENT where StuNO="+Integer.parseInt(jtxtArray[0].getText().trim());
        db=new DataBase();
		db.selectDb(sql);//��ѯѧ���ı�������ѧ���Ƿ������STUDENT����				   
	     try{//�Խ���������쳣����
		     int k=0;
			 Vector<Vector> vtemp = new Vector<Vector>();
			  while(db.rs.next()){
			 	k++;
		       	Vector<String> v = new Vector<String>();
				for(int i=1;i<=9;i++){//˳��ﵽ���ѵ��Ľ���еĸ����¼
					String str = db.rs.getString(i).trim();
					str = new String(str.getBytes("gb2312"));
					v.add(str);	
				}
				vtemp.add(v);//���½�����е�����
			 }
			 if(k==0){//��Book����û�и���ţ��������ʾ�Ի���
			 	 JOptionPane.showMessageDialog(this,	"û����Ҫ���ҵ�����",
				                 "��Ϣ",JOptionPane.INFORMATION_MESSAGE);
			 }
			 dtm.setDataVector(vtemp,head);
			 jt.updateUI();
			 jt.repaint();				 	
		 }
		 catch(Exception e){e.printStackTrace();}	    	
	}
	public void searchAllStudent(){
       	sql="select * from STUDENT";
        db=new DataBase();
		db.selectDb(sql);//��ѯѧ���ı�������ѧ���Ƿ������STUDENT����				   
	     try{//�Խ���������쳣��
			 Vector<Vector> vtemp = new Vector<Vector>();
			  while(db.rs.next()){
		       	Vector<String> v = new Vector<String>();
				for(int i=1;i<=9;i++){//˳��ﵽ���ѵ��Ľ���еĸ����¼
					String str = db.rs.getString(i).trim();
					str = new String(str.getBytes("gb2312"));
					v.add(str);	
				}
				vtemp.add(v);//���½�����е�����
			 }
			 dtm.setDataVector(vtemp,head);
			 jt.updateUI();
			 jt.repaint();				 	
		 }
		 catch(Exception e){e.printStackTrace();}	    	
	}
	
}