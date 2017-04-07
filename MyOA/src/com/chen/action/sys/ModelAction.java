package com.chen.action.sys;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.registry.infomodel.User;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.chen.action.BaseAction;
import com.chen.bean.Pager;
import com.chen.entity.Loginlog;
import com.chen.entity.Memu;
import com.chen.entity.Messagetouser;
import com.chen.entity.Precontract;
import com.chen.entity.Schedule;
import com.chen.entity.Users;
import com.chen.service.calendar.PrecontractService;
import com.chen.service.calendar.ScheduleService;
import com.chen.service.message.MessagetouserService;
import com.chen.service.sys.LeftMemuService;
import com.chen.service.sys.LoginlogService;
import com.chen.service.sys.MemuService;
import com.chen.service.sys.UserService;
import com.chen.util.SystemUtil;


@ParentPackage("myoa")
@Results(
	@Result(name = "memulist", type = "redirect", location = "memu!list.action"))
public class ModelAction extends BaseAction {
	private static final long serialVersionUID = -1809690466156342656L;
	private MessagetouserService messagetouserService; //注入邮件
	private UserService userService; //注入用户
     private PrecontractService precontractService;
     private String memuRed;                                 //要返回到菜单
 	public String getMemuRed() {
 		return memuRed;
 	}
 	public void setMemuRed(String memuRed) {
 		this.memuRed = memuRed;
 	}
	public void setPrecontractService(PrecontractService precontractService) {
		this.precontractService = precontractService;
	}

	private Messagetouser messagetouser; //邮箱
	private LoginlogService loginlogService;
	private LeftMemuService leftMemuService;
	private  ScheduleService scheduleService;  //注入会议服务
	private Integer scheNum;    //会议数量
	private String memuId;  
	private DetachedCriteria d=null;
	private List<Memu> memuList = new ArrayList<Memu>();
	private  MemuService    memuService;
	private List<Memu> subMemuList;       
	private List<Memu> list;
	private Users user;
    private Integer loginCount;   //登录次数
	private Map<Memu, List<Memu>> chirdmap;// 所有子菜单
	private List<Memu> parentMemu; // 所有父 菜单
	private Integer  allMessage;    //所有邮件数量
	private Integer  noRead ;      //未读数量
	public Integer getScNum() {
		return scNum;
	}
	public void setScNum(Integer scNum) {
		this.scNum = scNum;
	}

	private Integer scNum;
     
	public void setScheduleService(ScheduleService scheduleService) {
		this.scheduleService = scheduleService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setMemuService(MemuService memuService) {
		this.memuService = memuService;
	}

	public Map<Memu, List<Memu>> getChirdmap() {
		return chirdmap;
	}
	public void setChirdmap(Map<Memu, List<Memu>> chirdmap) {
		this.chirdmap = chirdmap;
	}
	public List<Memu> getParentMemu() {
		return parentMemu;
	}
	public void setParentMemu(List<Memu> parentMemu) {
		this.parentMemu = parentMemu;
	}
	public Integer getLoginCount() {
	return loginCount;
}
public void setLoginCount(Integer loginCount) {
	this.loginCount = loginCount;
}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}

	private Map<Integer,Memu> map = new HashMap<Integer,Memu>();
	public String prompt(){
		if(!StringUtils.isEmpty(getParameter("memuRed"))){ 
			return "memulist";                  //返回到 菜单排序
			}
		
		else{
		user=(Users)getSession().get("loginUser");
		Loginlog loginlog=new Loginlog();
		  if(user!=null){
			  DetachedCriteria dCriteria=DetachedCriteria.forClass(Loginlog.class);
			  dCriteria.add(Restrictions.eq("users", user));
			  dCriteria.add(Restrictions.eq("ifSuccess", 1));
			 
	     pager= loginlogService.findByPager(pager, dCriteria);
	     
	       if(pager !=null){
	    	  loginCount=pager.getTotalCount();
	       }
		  }
	   	return "prompt";}
	}
	public void setLoginlogService(LoginlogService loginlogService) {
		this.loginlogService = loginlogService;
	}
	public String top(){                  //框架上
		user=(Users)getSession().get("loginUser"); //获取当前登录用户

		DetachedCriteria detachedCriteria=DetachedCriteria.forClass(Messagetouser.class);
		DetachedCriteria pCriteria=DetachedCriteria.forClass(Precontract.class);
		System.out.println(SystemUtil.getTimesByStr(SystemUtil.getDate2(1)));  //得到明天的日期
		pCriteria.add(Restrictions.eq("users", user));
		
		Date d=new Date();
		System.out.println(SystemUtil.getTimestamp(d));
		Timestamp t=SystemUtil.getTimestamp(d);
		Timestamp t1=SystemUtil.getTimesByStr(SystemUtil.getDate2(1));
		pCriteria.createCriteria("schedule").add(Restrictions.between("beginTime",t,t1));
		Pager scpager=new Pager();
		scpager=precontractService.findByPager(scpager,pCriteria);
		 scNum=scpager.getTotalCount();
		 
		detachedCriteria.add(Restrictions.eq("users", user));
		Pager p1=new Pager();
	    p1=messagetouserService.findByPager(p1, detachedCriteria);   
		allMessage=p1.getTotalCount();                 //得到所有邮件数量
	   DetachedCriteria   d2=DetachedCriteria.forClass(Messagetouser.class);
	    d2.add(Restrictions.eq("users", user));
	    d2.add(Restrictions.eq("ifRead", 0));
	   Pager p2=new Pager();
	   p2= messagetouserService.findByPager(p2, d2);
	    noRead=p2.getTotalCount();                               
		return "top";
	}
	public String unreadNum(){                  //得到 未读邮件数
		String userId=getParameter("userId");
		Users u=userService.get(Integer.parseInt(userId));
	   d=DetachedCriteria.forClass(Messagetouser.class);
	   d.add(Restrictions.eq("users", u));
	   d.add(Restrictions.eq("ifRead", 0));
	   pager=messagetouserService.findByPager(pager,d);
	   noRead= pager.getTotalCount();
	   ajaxJson(noRead.toString());
	
	   return null;
	}
	
	 
	public String left() {                   //框架左
		Pager p1 = new Pager();
		Pager p2 = null;
		DetachedCriteria d1 = DetachedCriteria.forClass(Memu.class);
		DetachedCriteria d2 = null;
		// memuId=Integer.parseInt(getParameter("memuId")); //获取 传过来的 菜单 Id
		List<Memu> listMemus = null;
		parentMemu = new ArrayList<Memu>();
		chirdmap = new HashMap<Memu, List<Memu>>();
		// parentMemu=memuService.getList("parentNodeId", 0);6
		d1.addOrder(Order.asc("displayOrder"));
		d1.add(Restrictions.eq("parentNodeId", 0));
		p1 = memuService.findByPager(pager, d1);
		parentMemu = p1.getList();
		for (Memu memu : parentMemu) {
			System.out.println("父菜单:" + memu.getDisplayName());
			listMemus = new ArrayList<Memu>();
			p2 = new Pager();
			d2 = DetachedCriteria.forClass(Memu.class);
			d2.addOrder(Order.asc("displayOrder"));
			d2.add(Restrictions.eq("parentNodeId", memu.getMemuId()));
			p2 = memuService.findByPager(p2, d2);
			listMemus = p2.getList();
			for (Memu ms : listMemus) {
				System.out.println("子菜单：" + ms.getDisplayName());
			}
			chirdmap.put(memu, listMemus);
		}

	
		return "left2";
	}

	public String center() {                   //框架中
		memuRed=getParameter("memuRed");
		return "center";
	}

	public String main() {                 //框架主要 显示页面
   String s=getParameter("memmuList");
		
		if(!StringUtils.isEmpty(s)){
			memuRed=s;
		}
		return "main";
	}

	public String middel() {
		String s=getParameter("memuRed");
		if(!StringUtils.isEmpty(s)){
			memuRed=s;
		}
		
		return "middel";
	}

	public void setLeftMemuService(LeftMemuService leftMemuService) {
		this.leftMemuService = leftMemuService;
	}

	public List<Memu> getMemuList() {
		return memuList;
	}

	public void setMemuList(List<Memu> memuList) {
		this.memuList = memuList;
	}

	public List<Memu> getSubMemuList() {
		return subMemuList;
	}

	public void setSubMemuList(List<Memu> subMemuList) {
		this.subMemuList = subMemuList;
	}

	public List<Memu> getList() {
		return list;
	}

	public void setList(List<Memu> list) {
		this.list = list;
	}

	public Map<Integer, Memu> getMap() {
		return map;
	}

	public void setMap(Map<Integer, Memu> map) {
		this.map = map;
	}
	public void setMessagetouserService(MessagetouserService messagetouserService) {
		this.messagetouserService = messagetouserService;
	}
	public Messagetouser getMessagetouser() {
		return messagetouser;
	}
	public void setMessagetouser(Messagetouser messagetouser) {
		this.messagetouser = messagetouser;
	}
	public Integer getAllMessage() {
		return allMessage;
	}
	public void setAllMessage(Integer allMessage) {
		this.allMessage = allMessage;
	}
	public Integer getNoRead() {
		return noRead;
	}
	public void setNoRead(Integer noRead) {
		this.noRead = noRead;
	}
	
	

}
