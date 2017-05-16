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
	//�����ָ��Ϊ���µ�JSplitePane����
    private JSplitPane jsp=new JSplitPane(JSplitPane.VERTICAL_SPLIT,true);
    //����JPanel����
	private JPanel jpt=new JPanel();
	private JPanel jpb=new JPanel();
	private JRadioButton[] jrbArray=
	    {new JRadioButton("��ǰ����",true),new JRadioButton("��ʷ����")};
	    private ButtonGroup bg=new ButtonGroup();
	//������ť����
	private JButton jbArray=new JButton("��ѯ");
	
	//��������
	Vector<String> head = new Vector<String>();
	{
		head.add("���");
		head.add("ѧ��");
		head.add("����ʱ��");
		head.add("Ӧ��ʱ��");
		head.add("ʵ��ʱ��");
		head.add("�Ƿ����");
		head.add("�Ƿ�ԤԼ");
	}
	//
	Vector<Vector> data=new Vector<Vector>();
	//�������ģ��
    DefaultTableModel dtm=new DefaultTableModel(data,head);
    //����Jtable����
	JTable jt=new JTable(dtm);
	//��JTable��װ����������
	JScrollPane jspn=new JScrollPane(jt);
	public BorrowInfo(String StuNo)
	{   this.StuNo=StuNo;
		this.setLayout(new GridLayout(1,1));
		//��������RetrunBook�������²��־�Ϊ�ղ��ֹ�����
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
		//��jpt���õ�jsp���ϲ�����
    	jsp.setTopComponent(jpt);
        //jpb.add(jspn);
    	jsp.setBottomComponent(jspn);
    	jsp.setDividerSize(4);
    	this.add(jsp);
    	//����jsp�зָ����ĳ�ʼλ��
    	jsp.setDividerLocation(80);
		//���ô���Ĵ�Сλ�ü��ɼ���
        this.setBounds(10,10,800,600);
        this.setVisible(true); 
   	} 
   	public void actionPerformed(ActionEvent e)
   	{
   		if(e.getSource()==jbArray){
   		if(jrbArray[0].isSelected()){
   		System.out.println("������");
   			int b=Integer.parseInt(StuNo);
   				sql="select * from borrowlist where StuNO="+b ;
	   			db=new DataBase();
	   			db.selectDb(sql);
				Vector<Vector> vtemp = new Vector<Vector>();
				try{//����������쳣����
	                int k=0;
					while(db.rs.next()){//ȡ�������
					    k++;
						Vector<String> v = new Vector<String>();
						for(int i=1;i<8;i++){//��ÿ����ӵ���ʱ����v
							String str=db.rs.getString(i);
							str=new String(str.getBytes("gb2312"));
							v.add(str);
						}
										
						String str1=db.rs.getString(5);	
						str1=new String(str1.getBytes("gb2312"));
					    if(str1.equals("")){
                        
							vtemp.add(v);//��������¼��ӵ���ʱ����vtemp
								//����table	
						
						}
						
					    jt.clearSelection();
						dtm.setDataVector(vtemp,head);
						jt.updateUI();
						jt.repaint();	
					}
				    if(k==0){//��ʾ
						JOptionPane.showMessageDialog(this,"û����Ľ����¼������",
						                             "��Ϣ",JOptionPane.INFORMATION_MESSAGE);
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
				try{//����������쳣����
	                int k=0,j=0;
					while(db.rs.next()){//ȡ�������
					    k++;
						Vector<String> v = new Vector<String>();
						for(int i=1;i<8;i++){//��ÿ����ӵ���ʱ����v
							String str=db.rs.getString(i);
							str=new String(str.getBytes("gb2312"));
							v.add(str);
						}
										
						String str1=db.rs.getString(5);	
						str1=new String(str1.getBytes("gb2312"));
					    if(!(str1.equals(""))){
                            j++;
							vtemp.add(v);//��������¼��ӵ���ʱ����vtemp
								//����table	
						
						}
						
					    jt.clearSelection();
						dtm.setDataVector(vtemp,head);
						jt.updateUI();
						jt.repaint();	
					}
				    if(k==0){//��ʾ
						JOptionPane.showMessageDialog(this,"û����Ľ����¼������",
						                             "��Ϣ",JOptionPane.INFORMATION_MESSAGE);
						return;
					}	
				    if(j==0){//��ʾ
						JOptionPane.showMessageDialog(this,"û�������ʷ�����¼������",
						                             "��Ϣ",JOptionPane.INFORMATION_MESSAGE);
						return;
					}			
	   			}
	   			catch(Exception ea){ea.printStackTrace();}
   			
   			
   		}
   		
   		
   		
   		}
   		
   
   	
   	
}}
