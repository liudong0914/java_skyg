package com.chen.action.calendar;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.JSONCleaner;
import org.apache.struts2.json.JSONException;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import com.chen.action.BaseAction;
import com.chen.bean.Pager;
import com.chen.entity.Dept;
import com.chen.entity.Machine;
import com.chen.entity.Meetinginfo;
import com.chen.entity.Memu;
import com.chen.entity.Mynote;
import com.chen.entity.Operatelog;
import com.chen.entity.Precontract;
import com.chen.entity.Schedule;
import com.chen.entity.Users;
import com.chen.service.calendar.MeetingService;
import com.chen.service.calendar.PrecontractService;
import com.chen.service.calendar.ScheduleService;
import com.chen.service.per.DeptService;
import com.chen.service.per.MachineService;
import com.chen.service.sys.MemuService;
import com.chen.service.sys.OperatelogService;
import com.chen.service.sys.UserService;
import com.chen.util.SystemUtil;
import com.opensymphony.xwork2.ActionContext;

import freemarker.template.utility.StringUtil;

@Results({
	@Result(name="scheduleList",type="redirect",location="schedule!list.action")
})
public class ScheduleAction extends BaseAction {
		private static final Integer Integer = null;
		private Integer scheduleId;
		private String title;
		private String address;
		private Timestamp beginTime;
		private Timestamp endTime;
		private String schContent;
		private Timestamp createTime;
		private Meetinginfo meetinginfo;
		private int meetingId;
		private Integer ifPrivate;
		private MeetingService meetingService;
		private ScheduleService scheduleService;
		private MachineService machineService;
		private UserService userService;
		private PrecontractService precontractService;
		private DeptService deptService;
		private int machid;
		private Machine machine;
		private Schedule schedule;
		private Integer[] scheduleIds;
		private Users user; //用户
		private Precontract  precontract; //预约人
		private String userId;
		private Pager pager;
		private OperatelogService operatelogService; //操作日志
		private MemuService memuService;
		private Operatelog operatelog;
		

		

		//		//获取所有的会议类型
//		public String melist(){ffff
//			List meetingList=meetingService.getAll();
//			ActionContext.getContext().put("meetingList", meetingList);
//			return "melist";
//		}
		

		public Pager getPager() {  // 通过修改 get方法    显示指定长度  的内容

			return pager;
		}
		
		public String getUserId() {
			return userId;
		}


		public void setUserId(String userId) {
			this.userId = userId;
		}


		//在显示所有删除日程
		public String delete(){
			if(scheduleIds!=null && scheduleIds.length>0){
				scheduleService.delete(scheduleIds);
			}
			Operatelog operatelog=new Operatelog();
			Users users=(Users)getSession().get("loginUser");
			operatelog.setUsers(users);
			operatelog.setOperateName(DELETE);
			Memu memu=new Memu();
			memu.setMemuId(102001);
			operatelog.setMemu(memu);
			operatelog.setOperateDesc("删除日程");
			operatelog.setOperateTime(new Timestamp(new Date().getTime()));
			operatelogService.save(operatelog);
			return "scheduleList";
		}
		
		//本页面删除日程
		public String deleteSch(){
			System.out.println(Integer.parseInt(getParameter("scheduleId")));
			scheduleService.delete(Integer.parseInt(getParameter("scheduleId")));
			
			ajaxText("成功删除！");
			return null;
		}

		//跳到添加的页面
		public String add(){
			//获取到所有的会议类型
			List meetingList=meetingService.getAll();
			ActionContext.getContext().put("meetingList", meetingList);
//			List user=userService.getAll();
//			ActionContext.getContext().put("userList", user);
			return ADD;
		}
		
		//执行添加日程的方法
		public String doadd(){
			
			String s=getRequest().getParameter("uIds");
			
			
			if(!StringUtils.isEmpty(s)){
				
			String[] userIdstr =s.split(",");
			System.out.println("字符串数字长度："+userIdstr.length);
			  int[] ids=new int[userIdstr.length];
			for (int i = 0; i < userIdstr.length; i++) {
				System.out.println(userIdstr[i]);
				ids[i]=Integer.parseInt(userIdstr[i]);
			}
			System.out.println("用户Id数组 个数："+ids.length);
			
			
			Set userset=new HashSet();
			Users u=null;
			 for (int i = 0; i <ids.length; i++) {
				 u=userService.get(ids[i]);
				 System.out.println(u.getRealName());
				userset.add(u);
			}
                  	schedule=new Schedule();
//				schedule.setUserses(userset);
//				scheduleService.update(schedule);
//				
				
				user=(Users)getSession().get("loginUser");
				schedule.setUsers(user);
				//获取当前系统时间
				schedule.setCreateTime(new Timestamp(new Date().getTime()));
//			String re=ServletActionContext.getRequest().getParameter("userId");
//				System.out.println(re);
//				  user=userService.get(Integer.parseInt(userId));
//				  System.out.println(user.getUserId()+":"+user.getUserName());
				  schedule.setTitle(title);
				  schedule.setAddress(address);
				  schedule.setBeginTime(beginTime);
				  schedule.setEndTime(endTime);
				  schedule.setSchContent(schContent);
				  schedule.setMeetinginfo(meetinginfo);
				 schedule.setIfPrivate(0);
				int scheduleId=scheduleService.save(schedule);
				//添加预约人
				schedule.setUserses(userset);
				scheduleService.update(schedule);
			
				
				
				//操作日志的添加
				Operatelog operatelog=new Operatelog();
				Users users=(Users)getSession().get("loginUser");
				operatelog.setUsers(users);
				operatelog.setOperateName(SAVE);
				Memu memu=new Memu();
				memu.setMemuId(102001);
				operatelog.setMemu(memu);
				operatelog.setOperateDesc("添加日程");
				operatelog.setOperateTime(new Timestamp(new Date().getTime()));
				operatelogService.save(operatelog);		
	
			}
		
			//获取用户
			
			return "scheduleList";
		}
//		public String addPrecont(Integer machId,Users user){
//			precontract =new Precontract();
//			precontract.setUsers(user);
//			System.out.println(user.getUserName());
//			System.out.println(machId);
//			Schedule sc=scheduleService.get(machId);
//			System.out.println(sc.getSchContent());
//			precontract.setSchedule(sc);
//		
//			
//			System.out.println("将要保存到预约人表中的"+precontract.getSchedule().getScheduleId());
//			System.out.println("将要保存到预约人表中的"+precontract.getUsers().getUserId());
//			precontractService.save(precontract);
//			
//			return "scheduleList";
//		}
		
		//显示所有的用户
		public String userlist(){
			List user=userService.getAll();
			ActionContext.getContext().put("userList", user);
			
			return "userlist";
		}
		//查询所有的日程
		public String list(){
			
			user=(Users)getSession().get("loginUser");
			if(pager == null || getRequest().getParameter("search")!=null){
				pager = new Pager();
			}
			DetachedCriteria criteria=DetachedCriteria.forClass(Schedule.class);
			//显示当前用户的日程
			if(user!=null){
				criteria.add(Restrictions.eq("users", user));
			}
			
			if(schedule != null ){
				if(schedule.getTitle() != null && schedule.getTitle().trim() !=""){
					criteria.add(Restrictions.like("title", schedule.getTitle(), MatchMode.ANYWHERE));
					System.out.println(schedule.getTitle());
				}
				if(schedule.getBeginTime() != null || schedule.getEndTime() != null){
					if(schedule.getBeginTime() != null){
						criteria.add(Restrictions.ge("beginTime", schedule.getBeginTime()));
					}
					if(schedule.getEndTime() != null){
						criteria.add(Restrictions.le("endTime", schedule.getEndTime()));
					}
				}
			}
			pager=scheduleService.findByPager(pager, criteria); 
			System.out.println(pager.getList().size());
		
				return LIST;
		
		}
		//到查询部门日程
		public String seldept(){
			
			//获取到所有的机构
			List machList=machineService.getAll();
			ActionContext.getContext().put("machList", machList);
			if(pager == null){
				pager = new Pager();
			}
			
			DetachedCriteria criteria=DetachedCriteria.forClass(Schedule.class);
			if(schedule != null){
				if(schedule.getDeptId() !=0 && schedule.getDeptId()!=null){
					
					List<Users> userlist=userService.getList("dept", deptService.get(schedule.getDeptId()));
					
					if(userlist  != null && userlist.size()>0){
						criteria.add(Restrictions.in("users", userlist));
					}
				}
			
			if(schedule.getBeginTime() != null && schedule.getBeginTime().toString().length() > 0){
				
					criteria.add(Restrictions.ge("beginTime", schedule.getBeginTime()));
			}
		
	       if(schedule.getUsers() !=null && schedule.getUsers().getRealName().trim()!=""){
	    	  // System.out.println(schedule.getUsers().getRealName());
	    	   criteria.createCriteria("users").add(Restrictions.like("realName",schedule.getUsers().getRealName(),MatchMode.ANYWHERE));
			}		
		}
		
			pager=scheduleService.findByPager(pager, criteria);
			//schedule.setUsers(null);
			return "seldept";
	}
		
		
		//获取选中机构相对应的部门ID
		public String getDeptIds() throws Exception{
			
		
		Integer id=Integer.parseInt(getRequest().getParameter("machid"));
		Machine m=machineService.get(id);
		Set deptList=m.getDepts();
	        	System.out.println(deptList.size());
	         	JsonConfig jsonConfig=new JsonConfig();
	         	//清除dept里面的对象
	         	jsonConfig.setExcludes(new String[] {"machine","users","userses"});
			JSONArray jsonArray=JSONArray.fromObject(deptList,jsonConfig);
			String str = jsonArray.toString();
	      	ajaxJson(str);
			return null;
		}
		
		
		//获取日程ID
		public String detail(){
//			schedule=new Schedule();
//			if(id != null){
				schedule=scheduleService.get(id);
				List<Schedule> sList=new ArrayList<Schedule>(schedule.getUserses());
				System.out.println(sList.size());
				getRequest().setAttribute("sList", sList);
//				Schedule schedule2=new Schedule();
//				schedule2=scheduleService.get(id);
//				System.out.println(schedule2.getScheduleId());
//				List<Precontract> list=precontractService.getAll();
//				
//				ActionContext.getContext().put("precontractList", list);
//			}
			List meetingList=meetingService.getAll();
			ActionContext.getContext().put("meetingList", meetingList);
			
			return "detail";
		}
		
		//修改我的日程
		public String doupdate(){
			  //  schedule=new Schedule();
			
			    if(schedule!=null){
			    	String s=getRequest().getParameter("uIds");
                             // System.out.println(schedule.getScheduleId());
					if(!StringUtils.isEmpty(s)){
						
					String[] userIdstr =s.split(",");
					System.out.println("字符串数字长度："+userIdstr.length);
					  int[] ids=new int[userIdstr.length];
					for (int i = 0; i < userIdstr.length; i++) {
						System.out.println(userIdstr[i]);
						ids[i]=Integer.parseInt(userIdstr[i]);
					}
					System.out.println("用户Id数组 个数："+ids.length);
					
					
					Set userset=new HashSet();
					Users u=null;
					 for (int i = 0; i <ids.length; i++) {
						 u=userService.get(ids[i]);
						 System.out.println(u.getRealName());
						userset.add(u);
					}
					 
//					 scheduleService.update(schedule);
					 meetinginfo = meetingService.get(meetingId);
					 System.out.println(meetingService.get(meetingId));
					 schedule.setMeetinginfo(meetinginfo);
					 
					 schedule.setUserses(userset);
				scheduleService.update(schedule);
				
				//操作日志的添加
				Operatelog operatelog=new Operatelog();
				Users users=(Users)getSession().get("loginUser");
				operatelog.setUsers(users);
				operatelog.setOperateName("删除");
				Memu memu=new Memu();
				memu.setMemuId(102001);
				operatelog.setMemu(memu);
				operatelog.setOperateDesc("删除日程");
				operatelog.setOperateTime(new Timestamp(new Date().getTime()));
				operatelogService.save(operatelog);
			
			}
	  }
				
				
			return "scheduleList";
		}
		
	    public void setMeetingService(MeetingService meetingService) {
			this.meetingService = meetingService;
		}



		public void setScheduleService(ScheduleService scheduleService) {
			this.scheduleService = scheduleService;
		}

		public void setMachineService(MachineService machineService) {
			this.machineService = machineService;
		}

		public int getMachid() {
			return machid;
		}

		public void setMachid(int machid) {
			this.machid = machid;
		}

		public Machine getMachine() {
			return machine;
		}

		public void setMachine(Machine machine) {
			this.machine = machine;
		}
		public Schedule getSchedule() {
			return schedule;
		}
		public void setSchedule(Schedule schedule) {
			this.schedule = schedule;
		}
		public Integer[] getScheduleIds() {
			return scheduleIds;
		}
		public void setScheduleIds(Integer[] scheduleIds) {
			this.scheduleIds = scheduleIds;
		}


		public UserService getUserService() {
			return userService;
		}


		public void setUserService(UserService userService) {
			this.userService = userService;
		}


		public Users getUser() {
			return user;
		}


		public void setUser(Users user) {
			this.user = user;
		}


		public Precontract getPrecontract() {
			return precontract;
		}


		public void setPrecontract(Precontract precontract) {
			this.precontract = precontract;
		}


		public void setPrecontractService(PrecontractService precontractService) {
			this.precontractService = precontractService;
		}


		
		
		public Integer getScheduleId() {
			return scheduleId;
		}


		public void setScheduleId(Integer scheduleId) {
			this.scheduleId = scheduleId;
		}


		public String getTitle() {
			return title;
		}


		public void setTitle(String title) {
			this.title = title;
		}


		public String getAddress() {
			return address;
		}


		public void setAddress(String address) {
			this.address = address;
		}


		public Timestamp getBeginTime() {
			return beginTime;
		}


		public void setBeginTime(Timestamp beginTime) {
			this.beginTime = beginTime;
		}


		public Timestamp getEndTime() {
			return endTime;
		}


		public void setEndTime(Timestamp endTime) {
			this.endTime = endTime;
		}


		public String getSchContent() {
			return schContent;
		}


		public void setSchContent(String schContent) {
			this.schContent = schContent;
		}


		public Timestamp getCreateTime() {
			return createTime;
		}


		public void setCreateTime(Timestamp createTime) {
			this.createTime = createTime;
		}


		public Meetinginfo getMeetinginfo() {
			return meetinginfo;
		}


		public void setMeetinginfo(Meetinginfo meetinginfo) {
			this.meetinginfo = meetinginfo;
		}


		public int getMeetingId() {
			return meetingId;
		}


		public void setMeetingId(int meetingId) {
			this.meetingId = meetingId;
		}


		public Integer getIfPrivate() {
			return ifPrivate;
		}


		public void setIfPrivate(Integer ifPrivate) {
			this.ifPrivate = ifPrivate;
		}


		public void setDeptService(DeptService deptService) {
			this.deptService = deptService;
		}

		public void setPager(Pager pager) {
			this.pager = pager;
		}

		public Operatelog getOperatelog() {
			return operatelog;
		}

		public void setOperatelog(Operatelog operatelog) {
			this.operatelog = operatelog;
		}

		public void setOperatelogService(OperatelogService operatelogService) {
			this.operatelogService = operatelogService;
		}

		public void setMemuService(MemuService memuService) {
			this.memuService = memuService;
		}
		
		
		
		
		
		
		
		
		
		
		
}
