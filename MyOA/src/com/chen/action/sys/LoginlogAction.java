package com.chen.action.sys;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.lang.SystemUtils;
import org.apache.commons.lang.xwork.StringUtils;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import sun.net.www.content.audio.basic;
import com.chen.action.BaseAction;
import com.chen.bean.PageTime;
import com.chen.bean.Pager;
import com.chen.entity.Loginlog;
import com.chen.entity.Role;
import com.chen.service.sys.LoginlogService;
import com.chen.util.SystemUtil;
import com.sun.org.apache.bcel.internal.generic.NEW;

/**
 * 登录日志 操作
 * @author chen
 *
 * 2013-6-29
 */
@ParentPackage("myoa")
public class LoginlogAction extends BaseAction  {
	private LoginlogService loginlogService; //注入 loginlogService
	public void setLoginlogService(LoginlogService loginlogService) {
		this.loginlogService = loginlogService;
	}
    private Loginlog loginlog;   //封装loginlog 对象 数据
    private List<Loginlog> logList;   //封装登录信息集合
    private Integer[] loginlogIds;
   private  PageTime pageTime;   //封装 所有字符串 时间
	public PageTime getPageTime() {
	return pageTime;
}
public void setPageTime(PageTime pageTime) {
	this.pageTime = pageTime;
}
	private Pager pager=new Pager();
	public Pager getPager() {
		return pager;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}
	public Integer[] getLoginlogIds() {
		return loginlogIds;
	}
	public void setLoginlogIds(Integer[] loginlogIds) {
		this.loginlogIds = loginlogIds;
	}
	public List<Loginlog> getLogList() {
		return logList;
	}
	public void setLogList(List<Loginlog> logList) {
		this.logList = logList;
	}
	public Loginlog getLoginlog() {
		return loginlog;
	}
	public void setLoginlog(Loginlog loginlog) {
		this.loginlog = loginlog;
	}
	public String  list(){
     	pager.setPageSize(21);
		if(getRequest().getParameter("search")!=null){   //  查询时  防止当前页数一起穿过来
			pager=new Pager();
			pager.setPageSize(21);
		}
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Loginlog.class);
		if(pageTime!=null){
			if(!StringUtils.isEmpty(pageTime.getBeginTime())){
				Timestamp t=SystemUtil.getTimesByStr(pageTime.getBeginTime());
				detachedCriteria.add(Restrictions.ge("loginTime",t));
				}
			if(!StringUtils.isEmpty(pageTime.getEndTime())){
				Timestamp t2=SystemUtil.getTimesByStr(pageTime.getEndTime());
				detachedCriteria.add(Restrictions.le("loginTime",t2 ));
			}
			 if(!StringUtils.isEmpty(pageTime.getDateNum())){
				Integer dNum=Integer.parseInt(pageTime.getDateNum());
				SystemUtil.getDate(dNum);
				Timestamp t3=SystemUtil.getTimesByStr(SystemUtil.getDate(dNum));
				detachedCriteria.add(Restrictions.ge("loginTime",t3));
			}
		}
		detachedCriteria.addOrder(Order.desc("loginTime"));
		pager = loginlogService.findByPager(pager, detachedCriteria);
		
	return "list";
	}
	  public String  doDelete(){ //通过Id删除 一个
	    String roleId=getRequest().getParameter("loginlogId");
	    loginlogService.delete(Integer.parseInt(roleId));
	    	return list();
	    }
	    
	    public String  doDeleteByIds(){ //通过Id批量删除
	    	if(loginlogIds!=null&&loginlogIds.length>0){
	    		loginlogService.delete(loginlogIds);
	    	}
	    	return list();
	    }
}
