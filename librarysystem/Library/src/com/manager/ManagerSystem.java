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
	//创建节点数组
	DefaultMutableTreeNode[]  dmtn=
			{new DefaultMutableTreeNode(new NodeValue("图书馆信息管理系统")),
			 new DefaultMutableTreeNode(new NodeValue("基本信息")),
			 new DefaultMutableTreeNode(new NodeValue("业务查询")),
			 new DefaultMutableTreeNode(new NodeValue("系统维护")),
			 new DefaultMutableTreeNode(new NodeValue("退出")),
			 new DefaultMutableTreeNode(new NodeValue("学生信息管理")),
			 new DefaultMutableTreeNode(new NodeValue("图书信息管理")),
			 new DefaultMutableTreeNode(new NodeValue("图书信息查询")),
			 new DefaultMutableTreeNode(new NodeValue("借阅信息查询")),
			 new DefaultMutableTreeNode(new NodeValue("欠费读者查询")),
			 new DefaultMutableTreeNode(new NodeValue("管理员信息管理"))};
    
	DefaultTreeModel dtm=new DefaultTreeModel(dmtn[0]);//创建树模型，指定根节点为"学生管理系统"    
    JTree jt=new JTree(dtm);//创建包含dtm树模型的JTree对象    
    JScrollPane jsp=new JScrollPane(jt);//为JTree创建滚动窗体    
    private JSplitPane jsplr=new JSplitPane(JSplitPane.HORIZONTAL_SPLIT,true);//创建分割窗体对象  
    private JPanel jp=new JPanel();//创建JPanel对象    
    Image image=new ImageIcon("tsgl.jpg").getImage();
    ImageIcon ii = new ImageIcon(image);    
	private JLabel jlRoot=new JLabel(ii);
    private Manager mg;//登陆管理员名
    String mgNo;//管理员ID
	CardLayout cl=new CardLayout();//获取卡片布局管理器引用
    public ManagerSystem(String mgNo)
    {
    	this.mgNo=mgNo;//获得管理员ID
    	mg=new Manager(mgNo);//创建管理员管理面板
   		this.setManager();//设置管理员权限
       	this.initJp();//初始化卡片布局面板
    	this.addTreeListener();//为树节点注册事件监听器
    	for(int i=1;i<5;i++){dmtn[0].add(dmtn[i]);}//给"图书馆信息管理系统"节点添加子节点
    	for(int i=5;i<7;i++){dmtn[1].add(dmtn[i]);}
    	for(int i=7;i<10;i++){dmtn[2].add(dmtn[i]);}
    	for(int i=10;i<11;i++){dmtn[3].add(dmtn[i]);}
		jt.setEditable(false);//设置该树中节点是可编辑的		
		this.add(jsplr);//将包含树的滚动窗口添加进窗体		
		jsplr.setLeftComponent(jt);//将包含树的滚动窗口添加进左边的子窗口		
		jp.setBounds(200,50,600,500);//为jp设置大小位置并添加进右边的子窗口
		jsplr.setRightComponent(jp);        
        jsplr.setDividerLocation(200);//设置分隔条的初始位置        
        jsplr.setDividerSize(4);//设置分隔条的宽度
        jlRoot.setFont(new Font("Courier",Font.PLAIN,30));
		jlRoot.setHorizontalAlignment(JLabel.CENTER);
		jlRoot.setVerticalAlignment(JLabel.CENTER);
		//设置窗体的关闭动作，标题，大小，位置及可见性
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);	
 		Image image=new ImageIcon("ico.gif").getImage();  
 		this.setIconImage(image);
		this.setTitle("图书馆管理系统");
		//设置窗体首次出现的大小和位置--自动居中
		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		int centerX=screenSize.width/2;
		int centerY=screenSize.height/2;
		int w=500;//本窗体宽度
		int h=400;//本窗体高度
		this.setBounds(centerX-w/2,centerY-h/2-100,w,h);//设置窗体出现在屏幕中央		
		this.setExtendedState(JFrame.MAXIMIZED_BOTH);//窗体全屏
		this.setVisible(true);//设置窗体可见		
		jt.setShowsRootHandles(true);//设置显示根节点的控制图标
    }
    public void setManager()
	{
		String sql="select permitted from manager where mgNo='"+mgNo+"'";
		DataBase db=new DataBase();//创建数据库类对象
		db.selectDb(sql);//执行查询
		try
		{
			db.rs.next();//结果集游标下移
			String str=db.rs.getString(1).trim();//得到管理员权限
			if(str.equals("0"))
			{
				mg.setFlag(false);//设置管理员权限
			}				
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}			 	
	}

	public void initJp()
	{
		jp.setLayout(cl);//设置布局管理器为卡片布局
		jp.add(jlRoot,"root");//添加根结点显示信息
		jp.add(new Student(),"stu");//添加学生管理模块界面
		jp.add(new BookManage(),"bm");//添加图书管理模块界面
		jp.add(new SearchBook(),"sb");//添加查找图书管理界面
		jp.add(new BorrowList(),"rb");//添加归还挂失图书界面
		jp.add(this.mg,"Manager");//添加管理员管理模块界面
		jp.add(new Overdue(),"et");//添加罚款处理界面
	}
	public void addTreeListener()
	{
		jt.addTreeSelectionListener(new TreeSelectionListener()
			{
				public void valueChanged(TreeSelectionEvent e)
				{
					DefaultMutableTreeNode cdmtn=//得到选中的节点对象
								(DefaultMutableTreeNode)e.getPath().getLastPathComponent();
					NodeValue cnv=(NodeValue)cdmtn.getUserObject();//得到自定义节点对象
					if(cnv.value.equals("图书馆管理系统"))
					{//显示根结点信息
						cl.show(jp,"root");
					}
	                if(cnv.value.equals("学生信息管理"))
					{//显示学生用户管理界面								
						cl.show(jp,"stu");
					}
					else if(cnv.value.equals("图书信息管理"))
					{//显示图书管理界面
					    cl.show(jp,"bm");	
					}	
					if(cnv.value.equals("图书信息查询"))
					{//显示查询图书界面													
						cl.show(jp,"sb");
					}
					
					else if(cnv.value.equals("借阅信息查询"))	
					{//显示归还挂失图书界面
						cl.show(jp,"rb");
					}
					else if(cnv.value.equals("欠费读者查询"))	
					{//显示缴纳罚款界面
						cl.show(jp,"et");
					}
					else if(cnv.value.equals("管理员信息管理"))	
					{//显示管理员管理界面
						cl.show(jp,"Manager");
					}
					else if(cnv.value.equals("退出"))
					{//显示退出界面
						int i=JOptionPane.showConfirmDialog(ManagerSystem.this,"是否退出系统?",
																"消息",JOptionPane.YES_NO_OPTION);
						if(i==JOptionPane.YES_OPTION)
						{//退出系统
							System.exit(0);
						}						
					}									
				}
			});
	}
    public static void main(String args[]){new ManagerSystem("wyf");}
}
class NodeValue{//声明NodeValue类
	String value;
	public NodeValue(String value){
		this.value=value;
	}
	public String getValue(){//声明NodeValue构造器
		return this.value;
	}
	//@Override
	public String toString(){
		return value;
	}

}