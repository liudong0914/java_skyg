package com.chen.action.message;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONObject;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.dialect.IngresDialect;

import com.chen.action.BaseAction;
import com.chen.bean.Pager;
import com.chen.entity.Message;
import com.chen.entity.Messagetouser;
import com.chen.entity.Users;
import com.chen.service.message.MessageService;
import com.chen.service.message.MessagetouserService;
import com.chen.service.sys.OperatelogService;
import com.chen.service.sys.UserService;

public class EmailAction extends BaseAction {
	private OperatelogService operatelogService; // 注入 操作服务
	private UserService userService;             //注入 用户
	private MessageService messageService;       //注入消息
	private MessagetouserService messagetouserService;   //注入收件箱
	private Pager pager=new Pager();                //保存 分页
	private Integer  allMessage;           //所有邮件数量
	private Integer[] messagetouserIds;        //封装所有选择的 Id
	private String contype;                    //封装操作类型
	
	public String getContype() {
		return contype;
	}
	public void setContype(String contype) {
		this.contype = contype;
	}
	public Integer[] getMessagetouserIds() {
		return messagetouserIds;
	}
	public void setMessagetouserIds(Integer[] messagetouserIds) {
		this.messagetouserIds = messagetouserIds;
	}
	public Integer getAllMessage() {
		return allMessage;
	}
	public void setAllMessage(Integer allMessage) {
		this.allMessage = allMessage;
	}

	private Integer  readed;        //已读邮件数量
	private Integer  noRead ;      //未读数量
	public Integer getReaded() {
		return readed;
	}
	public void setReaded(Integer readed) {
		this.readed = readed;
	}
	public Integer getNoRead() {
		return noRead;
	}
	public void setNoRead(Integer noRead) {
		this.noRead = noRead;
	}
	private DetachedCriteria detachedCriteria;    
	private Users user;        //封装用户

	public Pager getPager() {
		return pager;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}
	public void setMessagetouserService(MessagetouserService messagetouserService) {
		this.messagetouserService = messagetouserService;
	}
	public void setDetachedCriteria(DetachedCriteria detachedCriteria) {
		this.detachedCriteria = detachedCriteria;
	}
	
	 public void setOperatelogService(OperatelogService operatelogService) {
		this.operatelogService = operatelogService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public String  list(){
		pager.setPageSize(12);
		user=(Users)getSession("loginUser");
		detachedCriteria=DetachedCriteria.forClass(Messagetouser.class);
		detachedCriteria.add(Restrictions.eq("users", user));
		 DetachedCriteria detachedCriteria2=detachedCriteria.createCriteria("message"); //为users对象 里的message对象 添加排序条件
		 detachedCriteria2.addOrder(Order.desc("recordTime"));
		 Pager p1=new Pager();
		 p1=messagetouserService.findByPager(p1, detachedCriteria);   
		   allMessage=p1.getTotalCount();                 //得到所有邮件数量
		   DetachedCriteria   d2=DetachedCriteria.forClass(Messagetouser.class);
		     d2.add(Restrictions.eq("users", user));
		     d2.add(Restrictions.eq("ifRead", 0));
		    Pager p2=new Pager();
		   p2= messagetouserService.findByPager(p2, d2);
		     	noRead=p2.getTotalCount();                                 //得到 未读邮件数
		String unread=getParameter("unread");
		String allRead=getParameter("allRead");
		String all=getParameter("all");
		if(all!=null)
			getRequest().setAttribute("cont", all);
		
		if(unread!=null){
			detachedCriteria.add(Restrictions.eq("ifRead", 0));
	    	getRequest().setAttribute("cont",unread);
			pager=new Pager();
		}
		if(allRead!=null){
			detachedCriteria.add(Restrictions.eq("ifRead", 1));
			getRequest().setAttribute("cont",allRead);
			pager=new Pager();
		}
	
		pager=messagetouserService.findByPager(pager, detachedCriteria);    //条件查询后的结果
		 return "list";
	 }
	
	   public String doLook(){     //如果 查看 则更改 ifRead 为1
	    	Integer id=Integer.parseInt(getParameter("id"));
	    	Messagetouser mtu=messagetouserService.get(id);
	    	    mtu.setIfRead(1);
	    	  messagetouserService.update(mtu);
	    DetachedCriteria d=DetachedCriteria.forClass(Messagetouser.class);  //再查一遍没得邮件数量
	    String userId=getParameter("userId");
	    Users u=userService.get(Integer.parseInt(userId));
	    d.add(Restrictions.eq("users", u));
	    	  d.add(Restrictions.eq("ifRead", 0));
	   	   pager=messagetouserService.findByPager(pager,d);
	    	  Integer unReadN=pager.getTotalCount();
	    	  System.out.println(unReadN);
	    	JSONObject j=new JSONObject();
	    	j.put("success",unReadN);
	    	  ajaxJson(j.toString());
	    	return null;
	    }
       public String deletebyIds(){
    
    	 messagetouserService.delete(messagetouserIds);
    	   return list();
       }
      
            public String toShow(){   //标记为
            System.out.println(messagetouserIds.length);
           String toshow=getParameter("toShow");
           if(toshow.equals("readeds")){
        	   Messagetouser m1=null;
        	   for (int i = 0; i < messagetouserIds.length; i++) {     //把选中的标记为 已读
        		    m1=messagetouserService.get(messagetouserIds[i]);
        		    m1.setIfRead(1);
        		    messagetouserService.update(m1);
			}
        	   
           }
           if(toshow.equals("unreads")){
        	   Messagetouser m2=null;
        	   for (int i = 0; i < messagetouserIds.length; i++) { //把选中的标记为 未读
        		    m2=messagetouserService.get(messagetouserIds[i]);
        		    m2.setIfRead(0);
        		   messagetouserService.update(m2);
			}
           }
            	
              return  list();
            }
}
