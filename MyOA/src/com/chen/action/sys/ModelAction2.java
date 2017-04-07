package com.chen.action.sys;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.registry.infomodel.User;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.chen.action.BaseAction;
import com.chen.bean.Pager;
import com.chen.entity.Loginlog;
import com.chen.entity.Memu;
import com.chen.entity.Users;
import com.chen.service.sys.LeftMemuService;
import com.chen.service.sys.LoginlogService;
@ParentPackage("myoa")
public class ModelAction2 extends BaseAction {
	private static final long serialVersionUID = -1809690466156342656L;
	private LoginlogService loginlogService;
	private LeftMemuService leftMemuService;
	private List<Memu> memuList = new ArrayList<Memu>();
	private List<Memu> subMemuList;
	private List<Memu> list;
	private Users user;
   private Integer loginCount;   //登录次数
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
	   	return "prompt";
	}
	public void setLoginlogService(LoginlogService loginlogService) {
		this.loginlogService = loginlogService;
	}
	public String top(){
		return "top";
	}
	public String left() {
		//memuList = leftMemuService.getMemus();
		//subMemuList = leftMemuService.getSubMemus();
		/*
		 * memuList = leftMenuService.getAll();
		 * 
		 * list = new ArrayList<Memu>(); for(int i = 0; i < memuList.size();
		 * i++){ if(memuList.get(i).getParentNodeId() == 0){ subMemuList =
		 * leftMenuService.getList("parentNodeId", memuList.get(i).getMemuId());
		 * for(Memu memu : subMemuList){ list.add(memu); } } }
		 */
		return "left";
	}

	public String center() {
		return "center";
	}

	public String main() {
		return "main";
	}

	public String middel() {
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

}
