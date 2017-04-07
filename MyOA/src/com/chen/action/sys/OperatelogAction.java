package com.chen.action.sys;

import java.sql.Timestamp;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.chen.action.BaseAction;
import com.chen.bean.PageTime;
import com.chen.bean.Pager;
import com.chen.entity.Loginlog;
import com.chen.entity.Operatelog;
import com.chen.service.sys.OperatelogService;
import com.chen.util.SystemUtil;
import com.sun.org.apache.bcel.internal.generic.NEW;
/**
 * 操作日志  操作
 * @author chen
 *
 * 2013-6-30
 */
@ParentPackage("myoa")
public class OperatelogAction extends BaseAction {
	private OperatelogService operatelogService;  //注入服务
	public void setOperatelogService(OperatelogService operatelogService) {
		this.operatelogService = operatelogService;
	}
	private  Pager pager=new Pager();//分页
	
	private  Integer[] operatelogIds;  //保存多个 id 用于批量删除

	   private  PageTime pageTime;   //封装 所有字符串 时间
	public PageTime getPageTime() {
		return pageTime;
	}
	public void setPageTime(PageTime pageTime) {
		this.pageTime = pageTime;
	}
	public Integer[] getOperatelogIds() {
		return operatelogIds;
	}
	public void setOperatelogIds(Integer[] operatelogIds) {
		this.operatelogIds = operatelogIds;
	}
	public Pager getPager() {
		return pager;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}
	public  String list(){ 	  //显示所有
		pager.setPageSize(21);
		if(getRequest().getParameter("search")!=null){   //  查询时  防止当前页数一起穿过来
			pager=new Pager();
			pager.setPageSize(21);
		}
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Operatelog.class);
		if(pageTime!=null){
			if(!StringUtils.isEmpty(pageTime.getBeginTime())){
				Timestamp t=SystemUtil.getTimesByStr(pageTime.getBeginTime());
				detachedCriteria.add(Restrictions.ge("operateTime",t));
				}
			if(!StringUtils.isEmpty(pageTime.getEndTime())){
				Timestamp t2=SystemUtil.getTimesByStr(pageTime.getEndTime());
				detachedCriteria.add(Restrictions.le("operateTime",t2 ));
			}
			 if(!StringUtils.isEmpty(pageTime.getDateNum())){
					Integer dNum=Integer.parseInt(pageTime.getDateNum());
					SystemUtil.getDate(dNum);
					Timestamp t3=SystemUtil.getTimesByStr(SystemUtil.getDate(dNum));
					detachedCriteria.add(Restrictions.ge("operateTime",t3));
				}
		}
		detachedCriteria.addOrder(Order.desc("operateTime"));
		pager = operatelogService.findByPager(pager, detachedCriteria);
		return "list";
	    }
	  public String  doDelete(){ //通过Id删除 一个
		    String operId=getRequest().getParameter("operId");
		    operatelogService.delete(Integer.parseInt(operId));
		    	return list();
		    }
		    public String  doDeleteByIds(){ //通过Id批量删除
		    	if(operatelogIds!=null&&operatelogIds.length>0){
		    		operatelogService.delete(operatelogIds);
		    	}
		    	return list();
		    }
}
