/**
 * 
 */
package com.chen.action.message;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.apache.commons.lang.xwork.StringUtils;
import org.apache.struts2.json.JSONCleaner;
import org.apache.struts2.json.JSONException;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import sun.security.krb5.internal.UDPClient;

import com.chen.action.BaseAction;
import com.chen.bean.PageTime;
import com.chen.bean.Pager;
import com.chen.entity.Dept;
import com.chen.entity.Machine;
import com.chen.entity.Memu;
import com.chen.entity.Message;
import com.chen.entity.Messagetype;
import com.chen.entity.Operatelog;
import com.chen.entity.Role;
import com.chen.entity.Users;
import com.chen.service.message.MessageService;
import com.chen.service.message.MessageTypeService;
import com.chen.service.per.DeptService;
import com.chen.service.per.MachineService;
import com.chen.service.sys.MemuService;
import com.chen.service.sys.OperatelogService;
import com.chen.service.sys.UserService;
import com.chen.util.SystemUtil;
import com.sun.jmx.snmp.UserAcl;

/**
 *消息管理
 * 
 * @author chen
 * 
 *         2013-6-30
 */
public class MessageAction extends BaseAction {
	private MessageService messageService; // 注入服务
	private Operatelog operatelog;
	private Integer memuId; // 菜单id 用于保存操作日志
	private MemuService memuService;
	private OperatelogService operatelogService; // 注入 操作服务
	private Integer[] messages; // 用于 批量删除
	private PageTime pageTime; // 封装 所有字符串 时间
	private MessageTypeService messageTypeService; // 注入消息类型
	private Message message; // 保存消息 信息
	private DetachedCriteria detachedCriteria;
	private Pager pager=new Pager();           //分页
	private MachineService machineService; // 再注入 机构服务
	private UserService userService; // 注入 用户
	private DeptService deptService; // 注入 部门服务
	private Integer[] userIds; // 保存用户 数组
	private  String radioObj;    //保存单选按钮传过来的 值  判断是否为 所有人 
	private Messagetype messagetype;      //消息类型
	private String  contrType;                //操作类型
	
	
	
	public String getContrType() {
		return contrType;
	}
	public void setContrType(String contrType) {
		this.contrType = contrType;
	}
	public Messagetype getMessagetype() {
		return messagetype;
	}
	public void setMessagetype(Messagetype messagetype) {
		this.messagetype = messagetype;
	}
	public String getRadioObj() {
		return radioObj;
	}
	public void setRadioObj(String radioObj) {
		this.radioObj = radioObj;
	}

	public Integer[] getUserIds() {
		return userIds;
	}

	public void setUserIds(Integer[] userIds) {
		this.userIds = userIds;
	}

	public void setDeptService(DeptService deptService) {
		this.deptService = deptService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setMachineService(MachineService machineService) {
		this.machineService = machineService;
	}

	public void setMessageTypeService(MessageTypeService messageTypeService) {
		this.messageTypeService = messageTypeService;
	}

	public PageTime getPageTime() {
		return pageTime;
	}

	public void setPageTime(PageTime pageTime) {
		this.pageTime = pageTime;
	}

	public Integer[] getMessages() {
		return messages;
	}

	public void setMessages(Integer[] messages) {
		this.messages = messages;
	}

	public void setOperatelogService(OperatelogService operatelogService) {
		this.operatelogService = operatelogService;
	}

	public Operatelog getOperatelog() {
		return operatelog;
	}

	public void setOperatelog(Operatelog operatelog) {
		this.operatelog = operatelog;
	}

	public Integer getMemuId() {
		return memuId;
	}

	public void setMemuId(Integer memuId) {
		this.memuId = memuId;
	}

	public void setMemuService(MemuService memuService) {
		this.memuService = memuService;
	}

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public Pager getPager() { // 按照指定字符长度 输出
		return pager;
	}
	public String toAdd() { // 跳到 添加页面
		pageTime = new PageTime();
		pageTime.setBeginTime(SystemUtil.getString2(new Date()));
		List<Messagetype> mtList = messageTypeService.getAll();
		List<Machine> machineList = machineService.getAll();
		getRequest().setAttribute("machineList", machineList);
		getRequest().setAttribute("mtList", mtList);
		return "info";
	}
	public String list() {
		pager.setPageSize(21);
		Message m=messageService.get(2);
		m.getUserses();
		memuId = Integer.parseInt(getParameter("memuId"));
		if (getRequest().getParameter("search") != null) { // 查询时 防止当前页数一起传过来
			pager = new Pager();
			pager.setPageSize(21);
		}
		detachedCriteria = DetachedCriteria.forClass(Message.class);
		Users user = (Users) getSession().get("loginUser");
		Role role = user.getRole(); // 获得角色
		String roleName = role.getRoleName();
		String admin = getRequest().getParameter("admin");

		if (pageTime != null) { // 不管是谁进入 先 加条件

			if (!StringUtils.isEmpty(pageTime.getBeginTime())) {
				Timestamp t = SystemUtil.getTimesByStr(pageTime.getBeginTime());
				detachedCriteria.add(Restrictions.ge("recordTime", t));
			}
			if (!StringUtils.isEmpty(pageTime.getEndTime())) {
				Timestamp t2 = SystemUtil.getTimesByStr(pageTime.getEndTime());
				detachedCriteria.add(Restrictions.le("recordTime", t2));
			}
			if (!StringUtils.isEmpty(pageTime.getDateNum())) {
				Integer dNum = Integer.parseInt(pageTime.getDateNum());
				SystemUtil.getDate(dNum);
				Timestamp t3 = SystemUtil.getTimesByStr(SystemUtil
						.getDate(dNum));
				detachedCriteria.add(Restrictions.ge("recordTime", t3));
			}
		}
		if (admin == null) {
			if (roleName.equals("系统管理员")) {
				//System.out.println("系统管理员进入 查看所有发布消息");
				detachedCriteria.addOrder(Order.desc("recordTime"));
				detachedCriteria.add(Restrictions.eq("ifPublish", 1)); // 查询所有
																		// 已经发布的信息
				pager = messageService.findByPager(pager, detachedCriteria);

			} else {
				System.out.println("普通用户");
				detachedCriteria.addOrder(Order.asc("ifPublish"));
				detachedCriteria.add(Restrictions.eq("users", user));
				pager = messageService.findByPager(pager, detachedCriteria);
				return "myList";
			}
		} else {
			System.out.println("系统管理员进入自己的消息管理");
			detachedCriteria.addOrder(Order.asc("ifPublish"));
			detachedCriteria.add(Restrictions.eq("users", user));
			pager = messageService.findByPager(pager, detachedCriteria);
			return "myList";

		}
		return "list";
	}
     public String myList(){
    	 pager.setPageSize(21);
    	 detachedCriteria=detachedCriteria.forClass(Message.class);
    	 Users user = (Users) getSession().get("loginUser");
    		
			detachedCriteria.addOrder(Order.asc("ifPublish"));
			detachedCriteria.add(Restrictions.eq("users", user));
			pager = messageService.findByPager(pager, detachedCriteria);
    	 
    	 return "myList";
     }
	public String doDelete() { // 通过Id删除 一个
		String messageId = getRequest().getParameter("messageId");
		messageService.delete(Integer.parseInt(messageId));
		operatelog = new Operatelog();
		operatelog.setMemu(memuService.get(memuId));
		operatelog.setOperateTime(new Timestamp(new Date().getTime()));
		operatelog.setOperateDesc("删除消息");
		Users u = (Users) getSession().get("loginUser");
		operatelog.setUsers((Users) getSession().get("loginUser"));
		operatelog.setOperateName(DELETE);
		operatelogService.save(operatelog);
		if(getParameter("admin")!=null){
			return adminList();
		}
		else{
			return myList();
		}
	}
	public String adminList()
	{
		 pager.setPageSize(21);
		detachedCriteria=DetachedCriteria.forClass(Message.class);
		detachedCriteria.add(Restrictions.eq("ifPublish", 1)); // 查询所有
		// 已经发布的信息
   pager = messageService.findByPager(pager, detachedCriteria);

		
		return "list";
	}
	
	public String doDeleteByIds() { // 通过Id批量删除
		if (messages != null && messages.length > 0) {
			messageService.delete(messages);
			operatelog = new Operatelog();
			operatelog.setMemu(memuService.get(memuId));
			operatelog.setOperateTime(new Timestamp(new Date().getTime()));
			operatelog.setOperateDesc("删除信息");
			Users u = (Users) getSession().get("loginUser");
			operatelog.setUsers((Users) getSession().get("loginUser"));
			operatelog.setOperateName("删除");
			operatelogService.save(operatelog);
		}
		if(getParameter("admin")!=null){
			return adminList();
		}
		else{
			return myList();
		}

	}

	public String getDepts() { // Ajax回调 函数 通过机构 得到部门
		String machineId = getRequest().getParameter("machineId");
		Machine m = machineService.get(Integer.parseInt(machineId));
		//Set depts = m.getDepts();
		List deptList=deptService.getList("machine",m);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] {"machine", "users", "userses","connectMobileTelNo","connectTelNo","faxes"});
		JSONArray jsonArray = JSONArray.fromObject(deptList, jsonConfig);
		String newJson = jsonArray.toString();
		System.out.println(newJson);
		ajaxJson(newJson);
		return null;
	}

	public String getUsers() { // Ajax回调 函数 查询 得到 用户
		DetachedCriteria detachedc = DetachedCriteria.forClass(Users.class);
		String machineId = getRequest().getParameter("machineId");
		String deptId = getRequest().getParameter("deptId");
		String uName = getRequest().getParameter("username");
		JsonConfig jsonConfig = null;
		List userList = null;
	   List<Users> us=userService.getAll();                  //这里为什么要 查一遍啊，？？？？？？？？？？？？？？？  
		if (Integer.parseInt(machineId) != 0 && Integer.parseInt(deptId) != 0) {
			Dept d = deptService.get(Integer.parseInt(deptId));
			// Set users=d.getUserses();
			if (!StringUtils.isEmpty(uName))
			detachedc.add(Restrictions.like("realName", uName,
					MatchMode.ANYWHERE));
			detachedc.add(Restrictions.eq("dept", d));
			pager = userService.findByPager(pager, detachedc);
			System.out.println(pager.getList().size());
		} 
   
		else if (Integer.parseInt(machineId) != 0
				&& Integer.parseInt(deptId) == 0) {
			Machine m = machineService.get(Integer.parseInt(machineId));
			System.out.println("机构名称:"+m.getMachineName());
			Set depts = m.getDepts();
			System.out.println("所拥有的部门数量："+depts.size());
			Object[] d = depts.toArray();
			Dept dept = null;
			Set userset = null;
			Object[] useArray = null;
			System.out.println(("所拥有的部门长度："+d.length));
			userList = new ArrayList();
			for (int i = 0; i < d.length; i++) {
				dept = new Dept();
				dept = (Dept) d[i];
				System.out.println("第"+(i+1)+"部门Id:"+dept.getDeptId() + " -- "
						+"部门名称：" +dept.getDeptName());
				userset = dept.getUserses();
				useArray = userset.toArray();
				System.out.println("第"+(i+1)+"个部门的 用户数量："+useArray.length);
				Users u = null;
				for (int j = 0; j < useArray.length; j++) {
					u = new Users();
					u = (Users) useArray[j];
				
					System.out.println("第"+(j+1)+"个用户Id:"+u.getUserId() +"--------第"+(j+1)+"个用户姓名："+ u.getRealName());
					userList.add(u);

				}
			}
			pager = new Pager();
			System.out.println("用户总数："+userList.size());
			pager.setList(userList);

			if (!StringUtils.isEmpty(uName)) {
				List ulist = new ArrayList();
				Users user = null;
				for (int i = 0; i < userList.size(); i++) {
					user = (Users) userList.get(i);
					if (user.getRealName().contains(uName)) {
						System.out.println(user.getRealName());
						ulist.add(user);
					}

				}
				pager.setList(ulist);
			}

		}

		else if (Integer.parseInt(machineId) == 0
				&& Integer.parseInt(deptId) == 0) {
			if (!StringUtils.isEmpty(uName)) {
				detachedc.add(Restrictions.like("realName", uName,
						MatchMode.ANYWHERE));
				System.out.println(uName);
				pager = userService.findByPager(pager, detachedc);

			}
		}

		
		if(pager.getList().contains((Users)getSession("loginUser")))  //如果存在自己 就去除
			pager.getList().remove((Users)getSession("loginUser"));
		
		jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "regTime", "dept", "role",
				"userstate", "depts", "operatelogs", "schedules", "mynotes",
				"loginlogs", "precontracts", "manualsigns", "readedmessages",
				"messages2", "messages","scheduleset","image"});
		JSONArray jsonArray = JSONArray.fromObject(pager.getList(), jsonConfig);
		String newJson = jsonArray.toString();
		System.out.println(newJson);
	                	ajaxJson(newJson);
		return null;

	}
    public String doAdd(){
    	if(message==null)
    		message=new Message();
    	messagetype=messageTypeService.get(message.getMessagetype().getMessageTypeId());
    		if(radioObj.equals("all")){
    			message.setMessagetype(messagetype);
        		message.setBeginTime(SystemUtil.getTimesByStr(pageTime.getBeginTime()));
        		message.setEndTime(SystemUtil.getTimesByStr(pageTime.getEndTime())); 
                message.setIfDelete(0);
                message.setIfPublish(0);
                message.setRecordTime(null);
                message.setUsers((Users)getSession().get("loginUser"));
            	message.setPublishObject("所有人");
    		}
    		if(radioObj.equals("some")){
        		message.setMessagetype(messagetype);
        		message.setBeginTime(SystemUtil.getTimesByStr(pageTime.getBeginTime()));
        		message.setEndTime(SystemUtil.getTimesByStr(pageTime.getEndTime())); 
                message.setIfDelete(0);
                message.setIfPublish(0);
                message.setRecordTime(null);
                message.setUsers((Users)getSession().get("loginUser"));
        		Users u=null;
        		String publishObject="";
        		Set userset=new HashSet();
        		for(int i=0;i<userIds.length;i++){
        			u=new Users();
        			u=userService.get(userIds[i]);
        			System.out.println("接收人+"+u.getRealName());
        			publishObject+=u.getRealName()+",";
        			userset.add(u);
        		}	
        		publishObject=publishObject.substring(0,publishObject.lastIndexOf(","));
        		message.setPublishObject(publishObject);
        	
        		
    		}
    		int success=messageService.save(message);                   //添加完毕
    		if(success>0){
    		Memu memu=memuService.get(memuId);                  //添加操作日志
    		 operatelog=new Operatelog();
    		operatelog.setMemu(memu);
    		operatelog.setOperateDesc("添加消息");
    		operatelog.setOperateName(SAVE);
    		operatelog.setUsers((Users)getSession().get("loginUser"));
    		operatelog.setOperateTime(new Timestamp(new Date().getTime()));
    		operatelogService.save(operatelog);
    		}
    		pageTime=null;
    	return  myList();
    }
    public String toUpdate(){  //准备修改
    	contrType="update";       //操作类型 改为修改
    Integer	messageId=Integer.parseInt(getParameter("messageId"));
    message=messageService.get(messageId);
	pageTime = new PageTime();
	pageTime.setBeginTime(SystemUtil.getString2(new Date()));
	pageTime.setEndTime(SystemUtil.getStrTimeStamp(message.getEndTime()));
	List<Messagetype> mtList = messageTypeService.getAll();
	List<Machine> machineList = machineService.getAll();
	getRequest().setAttribute("machineList", machineList);
	getRequest().setAttribute("mtList", mtList);
        
    	return "info";
    }
     public String doUpdate(){          // 修改 并加入操作日志
    	 if(message==null)
     		message=new Message();
     	messagetype=messageTypeService.get(message.getMessagetype().getMessageTypeId());
     		if(radioObj.equals("all")){
     			message.setMessagetype(messagetype);
         		message.setBeginTime(SystemUtil.getTimesByStr(pageTime.getBeginTime()));
         		message.setEndTime(SystemUtil.getTimesByStr(pageTime.getEndTime())); 
                 message.setIfDelete(0);
                 message.setIfPublish(0);
                 message.setRecordTime(null);
                 message.setUsers((Users)getSession().get("loginUser"));
             	message.setPublishObject("所有人");
     		}
     		if(radioObj.equals("some")){
         		message.setMessagetype(messagetype);
         		message.setBeginTime(SystemUtil.getTimesByStr(pageTime.getBeginTime()));
         		message.setEndTime(SystemUtil.getTimesByStr(pageTime.getEndTime())); 
                 message.setIfDelete(0);
                 message.setIfPublish(0);
                 message.setRecordTime(null);
                 message.setUsers((Users)getSession().get("loginUser"));
         		Users u=null;
         		String publishObject="";
         		Set userset=new HashSet();
         		for(int i=0;i<userIds.length;i++){
         			u=new Users();
         			u=userService.get(userIds[i]);
         			System.out.println("接收人+"+u.getRealName());
         			publishObject+=u.getRealName()+",";
         			userset.add(u);
         		}	
         		publishObject=publishObject.substring(0,publishObject.lastIndexOf(","));
         		message.setPublishObject(publishObject);
         		System.out.println(publishObject);
     		}
     		//messageService.update(message);
     		Memu memu=memuService.get(memuId);                  //添加操作日志
   		 operatelog=new Operatelog();
   		operatelog.setMemu(memu);
   		operatelog.setOperateDesc("修改消息");
   		operatelog.setOperateName(UPDATE);
   		operatelog.setUsers((Users)getSession().get("loginUser"));
   		operatelog.setOperateTime(new Timestamp(new Date().getTime()));
   		operatelogService.save(operatelog);
    	 
    	 
    	 
    	 
    	 return  myList();
     }
      public String doPublic(){              //操作发布
    	  String id=getParameter("messageId");
    	 Message m= messageService.get(Integer.parseInt(id));
    	 String userStr=m.getPublishObject();
    	  Set usersset=null;
    	 if(userStr.equals("所有人")){
    		  List<Users> ul=userService.getAll();
    		  usersset=new HashSet();
    		  System.out.println(ul.size());
    		  for (Users users : ul) {
    			  usersset.add(users);
			}
    		 System.out.println(usersset.size());
    		 
    	 }
    	 else{ String[] userS=userStr.split(",");  //将数据库中的 发布对象 切割（因为是一字符串 方式保存）得到对应的 用户的 RealName 
    	     System.out.println(userS.length);
    	      usersset=new HashSet();
    	     int[] useres=new int[userS.length];
    	     Users u=null;
    	     for (int i = 0; i < userS.length; i++) {   
    	    	 u=userService.get("realName", userS[i]);      //通过realName 得到对应 Users 对象
    	    	 usersset.add(u);
			} 
			
    	     }
    	     m.setIfPublish(1);
    	     m.setRecordTime(new Timestamp(new Date().getTime()));
    	   m.setUserses(usersset);
    	    messageService.update(m);
    	     Memu memu=memuService.get(memuId);  
    	     operatelog=new Operatelog();
    	   		operatelog.setMemu(memu);
    	   		operatelog.setOperateDesc("发布消息");
    	   		operatelog.setOperateName("发布");
    	   		operatelog.setUsers((Users)getSession().get("loginUser"));
    	   		operatelog.setOperateTime(new Timestamp(new Date().getTime()));
    	   		operatelogService.save(operatelog);
    	  return myList();
      }   
      } 

