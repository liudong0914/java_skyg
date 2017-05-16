package com.manager;

import java.awt.*;
import java.awt.event.*;
import javax.swing.event.*;
import javax.swing.*;
import javax.swing.tree.*;

import com.common.DataBase;
import com.stu.SearchBook;
import com.stu.StudentSystem;

import java.io.*;
public class ManagerSystem extends JFrame
{
	//�����ڵ�����
	DefaultMutableTreeNode[]  dmtn=
			{new DefaultMutableTreeNode(new NodeValue("ͼ�����Ϣ����ϵͳ")),
			 new DefaultMutableTreeNode(new NodeValue("������Ϣ")),
			 new DefaultMutableTreeNode(new NodeValue("ҵ���ѯ")),
			 new DefaultMutableTreeNode(new NodeValue("ϵͳά��")),
			 new DefaultMutableTreeNode(new NodeValue("�˳�")),
			 new DefaultMutableTreeNode(new NodeValue("ѧ����Ϣ����")),
			 new DefaultMutableTreeNode(new NodeValue("ͼ����Ϣ����")),
			 new DefaultMutableTreeNode(new NodeValue("ͼ����Ϣ��ѯ")),
			 new DefaultMutableTreeNode(new NodeValue("������Ϣ��ѯ")),
			 new DefaultMutableTreeNode(new NodeValue("Ƿ�Ѷ��߲�ѯ")),
			 new DefaultMutableTreeNode(new NodeValue("����Ա��Ϣ����"))};
    
	DefaultTreeModel dtm=new DefaultTreeModel(dmtn[0]);//������ģ�ͣ�ָ�����ڵ�Ϊ"ѧ������ϵͳ"    
    JTree jt=new JTree(dtm);//��������dtm��ģ�͵�JTree����    
    JScrollPane jsp=new JScrollPane(jt);//ΪJTree������������    
    private JSplitPane jsplr=new JSplitPane(JSplitPane.HORIZONTAL_SPLIT,true);//�����ָ�����  
    private JPanel jp=new JPanel();//����JPanel����    
    Image image=new ImageIcon("tsgl.jpg").getImage();
    ImageIcon ii = new ImageIcon(image);    
	private JLabel jlRoot=new JLabel(ii);
    private Manager mg;//��½����Ա��
    String mgNo;//����ԱID
	CardLayout cl=new CardLayout();//��ȡ��Ƭ���ֹ���������
    public ManagerSystem(String mgNo)
    {
    	this.mgNo=mgNo;//��ù���ԱID
    	mg=new Manager(mgNo);//��������Ա�������
   		this.setManager();//���ù���ԱȨ��
       	this.initJp();//��ʼ����Ƭ�������
    	this.addTreeListener();//Ϊ���ڵ�ע���¼�������
    	for(int i=1;i<5;i++){dmtn[0].add(dmtn[i]);}//��"ͼ�����Ϣ����ϵͳ"�ڵ������ӽڵ�
    	for(int i=5;i<7;i++){dmtn[1].add(dmtn[i]);}
    	for(int i=7;i<10;i++){dmtn[2].add(dmtn[i]);}
    	for(int i=10;i<11;i++){dmtn[3].add(dmtn[i]);}
		jt.setEditable(false);//���ø����нڵ��ǿɱ༭��		
		this.add(jsplr);//���������Ĺ����������ӽ�����		
		jsplr.setLeftComponent(jt);//���������Ĺ����������ӽ���ߵ��Ӵ���		
		jp.setBounds(200,50,600,500);//Ϊjp���ô�Сλ�ò����ӽ��ұߵ��Ӵ���
		jsplr.setRightComponent(jp);        
        jsplr.setDividerLocation(200);//���÷ָ����ĳ�ʼλ��        
        jsplr.setDividerSize(4);//���÷ָ����Ŀ���
        jlRoot.setFont(new Font("Courier",Font.PLAIN,30));
		jlRoot.setHorizontalAlignment(JLabel.CENTER);
		jlRoot.setVerticalAlignment(JLabel.CENTER);
		//���ô���Ĺرն��������⣬��С��λ�ü��ɼ���
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);	
 		Image image=new ImageIcon("ico.gif").getImage();  
 		this.setIconImage(image);
		this.setTitle("ͼ��ݹ���ϵͳ");
		//���ô����״γ��ֵĴ�С��λ��--�Զ�����
		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		int centerX=screenSize.width/2;
		int centerY=screenSize.height/2;
		int w=500;//���������
		int h=400;//������߶�
		this.setBounds(centerX-w/2,centerY-h/2-100,w,h);//���ô����������Ļ����		
		this.setExtendedState(JFrame.MAXIMIZED_BOTH);//����ȫ��
		this.setVisible(true);//���ô���ɼ�		
		jt.setShowsRootHandles(true);//������ʾ���ڵ�Ŀ���ͼ��
    }
    public void setManager()
	{
		String sql="select permitted from manager where mgNo='"+mgNo+"'";
		DataBase db=new DataBase();//�������ݿ������
		db.selectDb(sql);//ִ�в�ѯ
		try
		{
			db.rs.next();//������α�����
			String str=db.rs.getString(1).trim();//�õ�����ԱȨ��
			if(str.equals("0"))
			{
				mg.setFlag(false);//���ù���ԱȨ��
			}				
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}			 	
	}

	public void initJp()
	{
		jp.setLayout(cl);//���ò��ֹ�����Ϊ��Ƭ����
		jp.add(jlRoot,"root");//���Ӹ������ʾ��Ϣ
		jp.add(new Student(),"stu");//����ѧ������ģ�����
		jp.add(new BookManage(),"bm");//����ͼ�����ģ�����
		jp.add(new SearchBook(),"sb");//���Ӳ���ͼ���������
		jp.add(new BorrowList(),"rb");//���ӹ黹��ʧͼ�����
		jp.add(this.mg,"Manager");//���ӹ���Ա����ģ�����
		jp.add(new Overdue(),"et");//���ӷ��������
	}
	public void addTreeListener()
	{
		jt.addTreeSelectionListener(new TreeSelectionListener()
			{
				public void valueChanged(TreeSelectionEvent e)
				{
					DefaultMutableTreeNode cdmtn=//�õ�ѡ�еĽڵ����
								(DefaultMutableTreeNode)e.getPath().getLastPathComponent();
					NodeValue cnv=(NodeValue)cdmtn.getUserObject();//�õ��Զ���ڵ����
					if(cnv.value.equals("ͼ��ݹ���ϵͳ"))
					{//��ʾ�������Ϣ
						cl.show(jp,"root");
					}
	                if(cnv.value.equals("ѧ����Ϣ����"))
					{//��ʾѧ���û���������								
						cl.show(jp,"stu");
					}
					else if(cnv.value.equals("ͼ����Ϣ����"))
					{//��ʾͼ���������
					    cl.show(jp,"bm");	
					}	
					if(cnv.value.equals("ͼ����Ϣ��ѯ"))
					{//��ʾ��ѯͼ�����													
						cl.show(jp,"sb");
					}
					
					else if(cnv.value.equals("������Ϣ��ѯ"))	
					{//��ʾ�黹��ʧͼ�����
						cl.show(jp,"rb");
					}
					else if(cnv.value.equals("Ƿ�Ѷ��߲�ѯ"))	
					{//��ʾ���ɷ������
						cl.show(jp,"et");
					}
					else if(cnv.value.equals("����Ա��Ϣ����"))	
					{//��ʾ����Ա��������
						cl.show(jp,"Manager");
					}
					else if(cnv.value.equals("�˳�"))
					{//��ʾ�˳�����
						int i=JOptionPane.showConfirmDialog(ManagerSystem.this,"�Ƿ��˳�ϵͳ?",
																"��Ϣ",JOptionPane.YES_NO_OPTION);
						if(i==JOptionPane.YES_OPTION)
						{//�˳�ϵͳ
							System.exit(0);
						}						
					}									
				}
			});
	}
    public static void main(String args[]){new ManagerSystem("wyf");}
}
class NodeValue{//����NodeValue��
	String value;
	public NodeValue(String value){
		this.value=value;
	}
	public String getValue(){//����NodeValue������
		return this.value;
	}
	//@Override
	public String toString(){
		return value;
	}

}