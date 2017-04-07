package com.chen.action.calendar;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.registry.infomodel.User;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;



import com.chen.action.BaseAction;
import com.chen.bean.Pager;
import com.chen.entity.Machine;
import com.chen.entity.Memu;
import com.chen.entity.Mynote;
import com.chen.entity.Operatelog;
import com.chen.entity.Users;
import com.chen.service.calendar.NoteService;
import com.chen.service.sys.MemuService;
import com.chen.service.sys.OperatelogService;
import com.chen.service.sys.UserService;
import com.chen.util.SystemUtil;
import com.opensymphony.xwork2.ActionContext;

@Results({
			@Result(name="notelist",type="redirect",location="note!list.action")
})
public class NoteAction extends BaseAction {
	private NoteService noteService;
	private UserService userService;
	private Mynote mynote;
	private Users user;
	private Integer userId;
	private Integer[] noteIds;
	private Integer memuId;
	private Pager pager;
	private OperatelogService operatelogService;
	private MemuService memuService;
	private Operatelog operatelog;
	
	public Pager getPager() {  // 通过修改 get方法    显示指定长度  的内容
	
		return pager;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}
	
	//显示登陆用户的便签
	private String usernote(){
		user=(Users)getSession().get("loginUser");
		if(user!=null){
			DetachedCriteria criteria=DetachedCriteria.forClass(Mynote.class);
			criteria.add(Restrictions.eq("users", user));
			pager=noteService.findByPager(pager, criteria);
		}
		return "usernote";
	}

	//显示所有的便签
	public String list(){
		user=(Users)getSession().get("loginUser");
		if(pager == null){
			pager =new Pager();
		}
		DetachedCriteria criteria=DetachedCriteria.forClass(Mynote.class);
		if(user!=null){
			
			criteria.add(Restrictions.eq("users", user));
			
		}
		
		if(mynote != null){
			if(mynote.getNoteTitle() !=null && mynote.getNoteTitle().trim() !=""){
				criteria.add(Restrictions.like("noteTitle", mynote.getNoteTitle(),MatchMode.ANYWHERE));
			
			}
			
			if(mynote.getCreateTime() !=null && mynote.getCreateTime().toString().length() > 0){
				criteria.add(Restrictions.ge("createTime", mynote.getCreateTime()));
			}
		}
		
		pager=noteService.findByPager(pager, criteria);
		
			return LIST;
	
	}
	
	//根据ID 获取便签的详细信息
	public String detail(){
		mynote=noteService.get(id);
		
		return "detail";
	}
	
	public String update(){
		
		if(noteIds!=null && noteIds.length>0){
			mynote=(Mynote) noteService.get(noteIds);
		}
		
		return "update"; 
	}
	//修改便签
	public String doupdate(){
	
		noteService.update(mynote);
		Users user=(Users)getSession().get("loginUser");
		Operatelog operatelog=new Operatelog();
		operatelog.setUsers(user);
		operatelog.setOperateName("修改");
		Memu memu=new Memu();
		memu.setMemuId(102003);
		operatelog.setMemu(memu);
		operatelog.setOperateDesc("修改便签");
		operatelog.setOperateTime(new Timestamp(new Date().getTime()));
		operatelogService.save(operatelog);
		//noteService.update(mynote);
		return "notelist";
	}
	//添加便签
	public String add(){
		
		return ADD;
	}

	//执行添加便签
	public String doadd(){
		
		
		Users user=(Users)getSession().get("loginUser");
		
		
		mynote.setUsers(user);
		//获取系统当前时间
		mynote.setCreateTime(new Timestamp(new Date().getTime())); //获取当前系统时间
//		String re=ServletActionContext.getRequest().getParameter("userid");
//		mynote.setUserid(re);
		noteService.save(mynote);
		//添加日志
		Operatelog operatelog=new Operatelog();
		operatelog.setUsers(user);
		
		operatelog.setOperateName("添加");
		Memu memu=new Memu();
		memu.setMemuId(102003);
		operatelog.setMemu(memu);
		operatelog.setOperateDesc("添加便签");
		operatelog.setOperateTime(new Timestamp(new Date().getTime()));  //获取当前系统时间
		operatelogService.save(operatelog);
		return "notelist";
	}
	
	
	//删除便签
	public String delete(){
//		mynote=(Mynote)noteService.get(noteIds);
		 if(noteIds!=null && noteIds.length>0){
			 noteService.delete(noteIds);	
		 }
		 Users user=(Users)getSession().get("loginUser"); //获取当前登录用户
		 System.out.println(user.getRealName());
		 Operatelog operatelog=new Operatelog(); //创建操作日志
		 operatelog.setUsers(user); //获取用户
		 operatelog.setOperateName("删除");
		 Memu memu=new Memu();
		 memu.setMemuId(102003);
		 operatelog.setMemu(memu);
		 operatelog.setOperateDesc("删除便签");
		 operatelog.setOperateTime(new Timestamp(new Date().getTime())); //获取当前系统时间
		 operatelogService.save(operatelog);
		return "notelist";
	}

	//在页面删除当前便签
	public String notedelete(){
		//获取当前便签ID
		noteService.delete(Integer.parseInt(getParameter("noteId")));
		return null;
	}


	public Mynote getMynote() {
		return mynote;
	}


	public void setMynote(Mynote mynote) {
		this.mynote = mynote;
	}


	public void setNoteService(NoteService noteService) {
		this.noteService = noteService;
	}
	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}
	public Integer[] getNoteIds() {
		return noteIds;
	}

	public void setNoteIds(Integer[] noteIds) {
		this.noteIds = noteIds;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
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
	public Integer getMemuId() {
		return memuId;
	}
	public void setMemuId(Integer memuId) {
		this.memuId = memuId;
	}
	public void setMemuService(MemuService memuService) {
		this.memuService = memuService;
	}
	

}
