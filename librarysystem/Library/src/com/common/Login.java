package com.common;

import com.manager.ManagerSystem;
import com.stu.*;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;import javax.swing.table.*;
import javax.swing.event.*;import java.sql.*;
import java.util.*;import java.util.Date;
public class Login extends JFrame implements ActionListener{
	private JPanel jp=new JPanel();//����JPanel����
	private JPanel jp1=new JPanel();//���������ѡ��
    private JLabel []jlArray={new JLabel("�û���"),new JLabel("��  ��")}; //������ǩ����
    private JButton[] jbArray={new JButton("��¼"),new JButton("���")};//������ť����
    private JTextField jtxt=new JTextField("123");//�����ı��� 
    private JPasswordField jpassword=new JPasswordField("123");//���������
    private JLabel jl=new JLabel();
    private JComboBox jcb ;
    String sql;
    DataBase db;
    DataBase db1;
    private JLabel background;
    private ImageIcon backpicture;
    public Login(){
    	super("��ӭ��½ͼ�����Ϣϵͳ��");
    	backpicture=new ImageIcon("login.jpg");
		background=new JLabel(backpicture);
		background.setBounds(0, 0, backpicture.getIconWidth(), backpicture.getIconHeight());
    	jp.setLayout(null);	
    	for(int i=0;i<2;i++){//���ñ�ǩ�Ĵ�С��λ��
        	jlArray[i].setBounds(180,100+i*50,80,26);
        	jlArray[i].setForeground(Color.orange);
        	jp.add(jlArray[i]);
        }
        for(int i=0;i<2;i++){
        	jbArray[i].setBounds(200+i*120,230,100,26);//���ð�ť�Ĵ�Сλ��
        	
        	jp.add(jbArray[i]);	
        	jbArray[i].addActionListener(this);//Ϊ��ťע�ᶯ���¼�������       
        }  
        jtxt.setBounds(240,100,180,30);//�����ı���Ĵ�Сλ��
        jp.add(jtxt);//���ı�����ӽ�JPanel���� 
        jtxt.addActionListener(this);//Ϊ�ı���ע���¼������� 
        jpassword.setBounds(240,150,180,30);//���������Ĵ�Сλ��
        jp.add(jpassword);//���������ӽ�JPanel���� 
        jpassword.setEchoChar('*');//���������� �����ַ� 
        jpassword.addActionListener(this);//Ϊ�����ע�������
        jl = new JLabel("���  :");
	    jl.setForeground(Color.orange);
	    String[] ss = {"����","����Ա"};
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
		
if("����Ա".equals(box)){
	    String mgno=jtxt.getText().trim();
	    if(e.getSource()==jtxt){//�л����뽹�㵽�����
			jpassword.requestFocus();
		}
		else if(e.getSource()==jbArray[1]){//����"���"��ť������ս����ϵ�������Ϣ
			jtxt.setText("");
			jpassword.setText("");
			jtxt.requestFocus();//�����뽹�����õ��ı���
		}
		else if(e.getSource()==jbArray[0]){//�¼�ԴΪ��¼��ť
	    	String no=jtxt.getText().trim();
		    if(jtxt.getText().trim().equals("")){//�û�����ʾΪ��
				JOptionPane.showMessageDialog(this,"�û�������Ϊ�գ�","��Ϣ",JOptionPane.INFORMATION_MESSAGE);
		    	return;
			}
			if(jpassword.getText().trim().equals("")){//�û�����Ϊ����ʾ
				JOptionPane.showMessageDialog(this,"�û����벻��Ϊ�գ�","��Ϣ",JOptionPane.INFORMATION_MESSAGE);
		    	return;
			}
			sql="select mgNo,password from manager where mgNo='"+no+"'";//��֤��¼�ߵ���ݺ�Ȩ��
	        db=new DataBase();
			db.selectDb(sql);
			try{
				String mgNo="wyf";
				String password="hxl";
				while(db.rs.next()){//��ý������Ϣ
				     mgNo=db.rs.getString(1).trim();
			         password=db.rs.getString(2).trim();					
				}
	        	if(jtxt.getText().trim().equals(mgNo)&&
	    		String.valueOf(jpassword.getPassword()).equals(password)){//��¼�ɹ���ʾ
	    			JOptionPane.showMessageDialog(this,"��ϲ������¼�ɹ�������","��ʾ",
	    			     JOptionPane.INFORMATION_MESSAGE);
	    			new ManagerSystem(mgno);
	    			this.dispose();   			
	    		}
	    		else{//��¼ʧ����ʾ
	    			JOptionPane.showMessageDialog(this,"��¼ʧ�ܣ�","��ʾ",
	    			     JOptionPane.INFORMATION_MESSAGE);
	    	        return;  
	    		}
			}
		    catch(Exception e1){e1.printStackTrace();}  
		    db.dbClose();//�ر����ݿ�����   
		}
		}
		


		if("����".equals(box)){     
	 String stuno =jtxt.getText().trim();
	    if(e.getSource()==jtxt){//�л����뽹�㵽�����
			jpassword.requestFocus();
		}
		else if(e.getSource()==jbArray[1]){//����"���"��ť������ս����ϵ�������Ϣ
			jtxt.setText("");
			jpassword.setText("");
			jtxt.requestFocus();//�����뽹�����õ��ı���
		}
		else if(e.getSource()==jbArray[0]){//�¼�ԴΪ��¼��ť
	    	//String no=jtxt.getText().trim();
		    if(jtxt.getText().trim().equals("")){//�û�����ʾΪ��
				JOptionPane.showMessageDialog(this,"�û�������Ϊ�գ�","��Ϣ",JOptionPane.INFORMATION_MESSAGE);
		    	return;
			}
			if(jpassword.getText().trim().equals("")){//�û�����Ϊ����ʾ
				JOptionPane.showMessageDialog(this,"�û����벻��Ϊ�գ�","��Ϣ",JOptionPane.INFORMATION_MESSAGE);
		    	return;
			}
			
			
			 sql="select StuNO,Password from STUDENT where StuNO="
        				+Integer.parseInt(jtxt.getText().trim());
	        db1=new DataBase();
			db1.selectDb(sql);
			try{
				String StuNO="123";
				String Password="123";
				while(db1.rs.next()){//��ý������Ϣ
					StuNO=db1.rs.getString(1).trim();
					Password=db1.rs.getString(2).trim();					
				}
	        	if(jtxt.getText().trim().equals(StuNO)&&
	    		String.valueOf(jpassword.getPassword()).equals(Password)){//��¼�ɹ���ʾ
	    			JOptionPane.showMessageDialog(this,"��ϲ������¼�ɹ�������","��Ϣ",
	    			     JOptionPane.INFORMATION_MESSAGE);
	    			new StudentSystem(stuno);
	    			this.dispose();   			
	    		}
	    		else{//��¼ʧ����ʾ
	    			JOptionPane.showMessageDialog(this,"��¼ʧ�ܣ�","��Ϣ",
	    			     JOptionPane.INFORMATION_MESSAGE);
	    	        return;  
	    		}
			}
		    catch(Exception e1){
		    	e1.printStackTrace();}  
		    db1.dbClose();//�ر����ݿ�����   
		}
	    }
		}
	public static void main(String[]args)
    {
    	new Login().setVisible(true);
    }
}