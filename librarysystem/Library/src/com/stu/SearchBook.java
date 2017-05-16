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
   //�����ָ��Ϊ���µ�JSplitePane����
    private JSplitPane jsp=new JSplitPane(JSplitPane.VERTICAL_SPLIT,true);
	private JPanel jpt=new JPanel();//����JPanel����
	private JPanel jpb=new JPanel();
	private JLabel jl=new JLabel("��ѡ���ѯ��ʽ:");
	//������ʾ�����б������ģ�͵��ַ�������
	private String[] str={"���","����","����","����ʱ��"};
	private JComboBox jcb=new JComboBox(str);//���������б��
	private JButton jb=new JButton("��ѯ");	//������ť
	private JButton jb1=new JButton("����ͼ���ѯ");	//������ť
	private JTextField jtxt=new JTextField();
	private ButtonGroup bg=new ButtonGroup();//������ť
	Vector<String> head = new Vector<String>();
	{//�����ͷ
		head.add("���");head.add("����");
		head.add("����");head.add("������");
		head.add("����ʱ��");head.add("�Ƿ����");
		head.add("�Ƿ�ԤԼ");
	}
	Vector<Vector> data=new Vector<Vector>();//�������������Ļ�����Ϣ
    DefaultTableModel dtm=new DefaultTableModel(data,head);	//�������ģ��
	JTable jt=new JTable(dtm); //����Jtable����
	JScrollPane jspn=new JScrollPane(jt);//��JTable��װ����������

	public SearchBook(){
		this.setLayout(new GridLayout(1,1));//���ò�ѯͼ�����Ϊ���񲼾�
		//��������RetrunBook�������²��־�Ϊ�ղ��ֹ�����
		jpt.setLayout(null);
		jpb.setLayout(null);
		//���õ�ѡ��Ĵ�С��λ�ã�������¼�������
		jpt.add(jl);
		jl.setBounds(150,35,150,20);
		jpt.add(jcb);
		jcb.setBounds(250,35,100,20);	
	    jcb.addActionListener(this);
        //���JButton�������Сλ�ò�����¼�������
		jpt.add(jb);
		jpt.add(jb1);
		jb.setBounds(560,35,80,20);
		jb1.setBounds(760,35,150,20);
		jb.addActionListener(this);
		jb1.addActionListener(this);
		jtxt.setBounds(400,35,120,20);
		jpt.add(jtxt);
        jsp.setTopComponent(jpt);//��jpt���õ�jsp���ϲ�����
        jsp.setBottomComponent(jspn);
        jsp.setDividerSize(4);
       	this.add(jsp);
    	jsp.setDividerLocation(100);//����jsp�зָ����ĳ�ʼλ��
		//���ô���Ĵ�Сλ�ü��ɼ���
        this.setBounds(3,10,600,400);
        this.setVisible(true);
	}
    //Ϊ�¼����صļ��������ϴ����¼�
	public void actionPerformed(ActionEvent e){
		 if(e.getSource()==jb1){//��ѯȫ��ͼ����Ϣ
		    	this.searchAllBook();
		    }
		  
			    if(e.getSource()==jb){//����¼�ԴΪ"��ѯ"��ť����ִ�м���
			    	jtxt.setEditable(true);
					String str=jtxt.getText().trim();
					if(str.equals("")){
						JOptionPane.showMessageDialog(this,"�������Ҫ����Ϣ������",
										"��Ϣ",JOptionPane.INFORMATION_MESSAGE);
						return;
					}
				   if(jcb.getSelectedIndex()==0){//������Ž��в�ѯ
						sql="select * from BOOK where BookNO="+Integer.parseInt(str);
			        	jtxt.setText("");
					}
				   else if(jcb.getSelectedIndex()==1){//�����������в�ѯ
						sql="select * from BOOK where BookName='"+str+"'";
			        	jtxt.setText("");
					}
					else if(jcb.getSelectedIndex()==2){//�������߽��в�ѯ
						sql="select * from BOOK where Author='"+str+"'";
						jtxt.setText("");
					}
					else if(jcb.getSelectedIndex()==3){//���ݹ���ʱ����в�ѯ
						sql="select * from BOOK where BuyTime='"+str+"'";
						jtxt.setText("");
					}
					db=new DataBase();;
					db.selectDb(sql);
					//�ӱ��м����ɹ��󣬰Ѳ鵽�����������Ϣ��ʾ�ڽ����²��ֵı���
					Vector<Vector> vtemp = new Vector<Vector>();
					try{ 
						int flag=0;
					
						while(db.rs.next())
						{//ȡ�������
						
							flag++;
						
							Vector<String> v = new Vector<String>();
							for(int i=1;i<=7;i++){//��ÿ����ӵ���ʱ����v
								String str1=db.rs.getString(i);
							//str1=new String(str.getBytes("gb2312"));//ת��
								v.add(str1);
							}
							vtemp.add(v);//��������¼��ӵ���ʱ����vtemp
						}
						if(flag==0){//��ѯʧ�ܣ���ʾ
							JOptionPane.showMessageDialog(this,"û����Ҫ���ҵ����ݣ�����",
							                      "��Ϣ",JOptionPane.INFORMATION_MESSAGE);
						    return;
						}		
					}
					catch(Exception ea){ea.printStackTrace();}				
					dtm.setDataVector(vtemp,head);	//����table	
					jt.updateUI();
					jt.repaint();
					db.dbClose();			
				}
	        }
	
	
	 public void searchAllBook(){//������ʾ�Ի���
		 	sql="select * from book";
	        db=new DataBase();
			db.selectDb(sql);//��ѯѧ���ı�������ѧ���Ƿ������STUDENT����				   
		     try{//�Խ���������쳣��
				 Vector<Vector> vtemp = new Vector<Vector>();
				  while(db.rs.next()){
			       	Vector<String> v = new Vector<String>();
					for(int i=1;i<=7;i++){//˳��ﵽ���ѵ��Ľ���еĸ����¼
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
		