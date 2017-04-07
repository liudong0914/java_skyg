package com.chen.action.sys;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.criterion.DetachedCriteria;
import com.chen.action.BaseAction;
import com.chen.bean.Pager;
import com.chen.entity.Memu;
import com.chen.entity.Operatelog;
import com.chen.entity.Role;
import com.chen.entity.Users;
import com.chen.service.sys.MemuService;
import com.chen.service.sys.OperatelogService;
import com.chen.service.sys.RoleService;
import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;
/**
 * 角色操作
 * @author Administrator
 *
 */
@Results(@Result(name = "addErr", type = "redirect", location = "role!list.action", params = {
		"err", "err" }))
@ParentPackage("myoa")
public class RoleAction extends BaseAction {
	private RoleService roleService; // 注入roleService
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	private Pager pager=new Pager();    
	
	
   public Pager getPager() {
		return pager;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}
private  MemuService memuService;  //注入memuService
   private   OperatelogService operatelogService;   //注入操作日志
   private  Integer memuId;           //菜单id    用于保存操作日志
   private  Operatelog operatelog;     //封装操作日志
	private Role role; // role用于保存提交 传来的 参数
	private Integer[] roleIds;  //用于保存批量删除的Id
	private List<Memu> listMemu;  //  保存所有权限
	private Integer[]   memuIds;  //用于保存所有 选中权限 的Ids
	private List<Memu> parentMemu;  //所有父 菜单
	private Map<Memu, List<Memu>> chirdmap;//所有子菜单
	   public Integer getMemuId() {
			return memuId;
		}
		public void setMemuId(Integer memuId) {
			this.memuId = memuId;
		}
		public void setOperatelogService(OperatelogService operatelogService) {
			this.operatelogService = operatelogService;
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
	public Integer[] getMemuIds() {
		return memuIds;
	}
	public void setMemuIds(Integer[] memuIds) {
		this.memuIds = memuIds;
	}
	public Integer[] getRoleIds() {
		return roleIds;
	}
	public void setRoleIds(Integer[] roleIds) {
		this.roleIds = roleIds;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	
	public String list() { // 进入显示页面
		pager.setPageSize(20);
		memuId=Integer.parseInt(getParameter("memuId"));   //获取 传过来的 菜单 Id
	   	List<Memu> listMemus=null;
	     chirdmap=new HashMap<Memu, List<Memu>>();
	    	parentMemu=memuService.getList("parentNodeId", 0);
	        for (Memu memu : parentMemu) {
	        	listMemus=new ArrayList<Memu>();
	        
	        	listMemus=memuService.getList("parentNodeId", memu.getMemuId());
	        	Collections.sort(listMemus);
	        	chirdmap.put(memu, listMemus);
			}
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Role.class);
		pager = roleService.findByPager(pager, detachedCriteria);
		return "list";
	}
	public String doAdd() { // 添加 角色
		if (role != null) {
			
		roleService.save(role);
		}
		return list();
	}
	public String checkName() { // 通过ajax 检查角色名 是否 存在
		HttpServletResponse response = ServletActionContext.getResponse();
		String nString = getRequest().getParameter("name");
		String roleId = getRequest().getParameter("id");
		String oper = getRequest().getParameter("oper");
	
		if(oper.equals("add")){
			role=roleService.get("roleName", nString);
		if(role!=null){
			ajaxJsonErrorMessage("该角色已存在！");
		}
		else{ajaxJsonSuccessMessage("该角色可用！");
		     }}
		if(oper.equals("update")){
			List<Role> rList=roleService.findByNameNotId("roleName",nString,"roleId",roleId);
			if(rList.size()>0){
				ajaxJsonErrorMessage("该角色已存在！");
			}
			else {
				ajaxJsonSuccessMessage("该角色可用！");
			}
		}
		return null;
	}
	public String doUpdate() {  //通过对象修改
		if (role != null) {
			roleService.update(role);
		}
		return list();
	}
    public String  doDelete(){ //通过Id删除 一个
    	
    	  String roleId=getRequest().getParameter("roleId");
    	roleService.delete(Integer.parseInt(roleId));
    	 operatelog=new Operatelog();
    	 operatelog.setMemu(memuService.get(memuId));
    	 operatelog.setOperateTime(new Timestamp(new Date().getTime()));
    	 operatelog.setOperateDesc("删除角色");
    	 Users u=(Users)getSession().get("loginUser");
    	 operatelog.setUsers((Users)getSession().get("loginUser"));
    	 operatelog.setOperateName("删除");
    	 operatelogService.save(operatelog);
    	return list();
    }
    
    public String  doDeleteByIds(){ //通过Id批量删除
    	if(roleIds!=null&&roleIds.length>0){
    		roleService.delete(roleIds);
    	}
    	return list();
    }
    public String addMemu(){  //添加权限
    	
    	if(memuIds!=null&&memuIds.length>0){
    	 role = roleService.get(role.getRoleId());
		Set memuSet = new HashSet();
		for(int i = 0 ; i < memuIds.length ; i++){
			Memu memu = memuService.get(memuIds[i]);
			memuSet.add(memu);
		}
		role.setMemus(memuSet);
		roleService.update(role);
     }
    	return list();
}
    

}