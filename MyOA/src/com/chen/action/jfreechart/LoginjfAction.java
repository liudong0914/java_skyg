package com.chen.action.jfreechart;
import java.awt.Font;
import java.util.List;
import java.util.Set;

import com.chen.entity.Loginlog;
import com.chen.entity.Users;
import com.chen.service.sys.LoginlogService;
import com.chen.service.sys.UserService;
import com.opensymphony.xwork2.ActionSupport;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.title.LegendTitle;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.general.DefaultPieDataset;
public class LoginjfAction extends ActionSupport {    
	private static final long serialVersionUID = 5752180822913527064L;  
	//供ChartResult调用->ActionInvocation.getStack().findValue("chart")  
	private LoginlogService loginlogService;
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setLoginlogService(LoginlogService loginlogService) {
		this.loginlogService = loginlogService;
	}
	private JFreeChart chart; 
	 public JFreeChart getChart(){ 
              chart = ChartFactory.createPieChart3D( "用户登录统计图",        // // 图表标题  
              getDataSet(), //数据           
			 true, // 是否显示图例           
			 false, //是否显示工具提示           
				 false //是否生成URL        
				 ); 
                 //重新设置图标标题，改变字体        
				 chart.setTitle(new TextTitle("用户登录统计图", new Font("黑体", Font.ITALIC , 22)));
                      //取得统计图标的第一个图例        
				 LegendTitle legend = chart.getLegend(0); //修改图例的字体   
				legend.setItemFont(new Font("宋体", Font.BOLD, 14)); ////获得饼图的Plot对象  
				  PiePlot plot = (PiePlot)chart.getPlot();  //  //设置饼图各部分的标签字体  
				  plot.setLabelFont(new Font("隶书", Font.BOLD, 18));       
				  // //设定背景透明度（0-1.0之间） 
				 plot.setBackgroundAlpha(0.9f);            // //设定前景透明度（0-1.0之间）      
				plot.setForegroundAlpha(0.50f);
				 return chart;
	}
	 private DefaultPieDataset getDataSet(){
		 DefaultPieDataset dataset=new DefaultPieDataset();
		   List<Users> ulist= userService.getAll();
		    Users u=null;
		 List<Loginlog> loglist=loginlogService.getAll();             //循环遍历 
		     for (int  i = 0; i < ulist.size(); i++) {
		    	 u=new Users();
		    	 u=ulist.get(i);
		    	Set logset=u.getLoginlogs();
		    	 for (int j = 0; j<logset.size() ; j++) {
		    		 dataset.setValue(u.getRealName(),logset.size());                 //赋值
				}
			}   
		 return dataset;
	 }
}
