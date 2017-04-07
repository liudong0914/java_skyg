package com.chen.action.sys;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.chen.action.BaseAction;
import com.chen.bean.Pager;
import com.chen.entity.Memu;
import com.chen.entity.Operatelog;
import com.chen.entity.Role;
import com.chen.entity.Users;
import com.chen.service.sys.MemuService;
import com.chen.service.sys.OperatelogService;

/**
 * 菜单排序
 * 
 * @author chen
 * 
 *         2013-7-8
 */

@Results( 
	@Result(name = "main", type = "redirect", location = "model!main.action?memmuList=memulist")
	)
	@ParentPackage("myoa")
public class MemuAction extends BaseAction {
	private MemuService memuService; // 注入memuService
	private OperatelogService operatelogService;                   //操作日志
	public void setOperatelogService(OperatelogService operatelogService) {
		this.operatelogService = operatelogService;
	}
	private String memuId;            

	public String getMemuId() {
		return memuId;
	}

	public void setMemuId(String memuId) {
		this.memuId = memuId;
	}

	public void setMemuService(MemuService memuService) {
		this.memuService = memuService;
	}
	private Map<Memu, List<Memu>> chirdmap;// 所有子菜单
	private List<Memu> parentMemu; // 所有父 菜单
	public String list() { // 进入显示页面
		memuId=getParameter("memuId");
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
		/*
		 * for (Memu memu : parentMemu) { listMemus=new ArrayList<Memu>();
		 * listMemus=memuService.getList("parentNodeId", memu.getMemuId());
		 * Collections.sort(listMemus); chirdmap.put(memu, listMemus); }
		 */
		return "list";
	}
	public String doUpdate() { // 菜单排序
		Operatelog op=new Operatelog();
		 op.setUsers((Users)getSession("loginUser"));
			Memu memu=memuService.get(Integer.parseInt("105004"));
			  op.setMemu(memu);
				op.setOperateDesc("菜单排序");
			  op.setOperateTime(new Timestamp(new Date().getTime())); //操作日志 相关信息
		String control = getParameter("control"); // 获得传过来的 是上移还是 下移
		try {
			control = new String(control.getBytes("iso8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String memuId = getParameter("allmemuId"); // 获得传过来的
																	// MemuId
		Memu m = null;
		if (control.equals("下移")) { // 最下面一个向下 其他 都加1 自己 变为1
		if(memuId.length()<6){         //              父菜单的排序
		Integer memuIdNum=Integer.parseInt(memuId);
			m = memuService.get(memuIdNum);
			System.out.println("当前位置：" + m.getDisplayOrder());
			if (m.getDisplayOrder() != 6) {
				System.out.println("要改变到的位置：" + (m.getDisplayOrder() + 1));

				Memu m2 = memuService.get("displayOrder",
						(m.getDisplayOrder() + 1));
				m2.setDisplayOrder(m.getDisplayOrder());
				memuService.update(m2);

				m.setDisplayOrder(m.getDisplayOrder() + 1);
				memuService.update(m);
			} else {
				List<Memu> lm = memuService.getList("parentNodeId", 0);
				Memu mu = null;
				for (int i = 0; i < lm.size(); i++) {
					mu = new Memu();
					mu = lm.get(i);
					System.out.println("位置：" + mu.getDisplayOrder());
					System.out.println("菜单" + mu.getDisplayName());
					System.out.println(i);
					if (mu.getDisplayOrder() == 6)
						mu.setDisplayOrder(1);
					else
						mu.setDisplayOrder(mu.getDisplayOrder() + 1);
					memuService.update(mu);
				}
			}
			
		}
		else{
				  Integer memuIdNum=Integer.parseInt(memuId);
				  Memu ms=memuService.get(memuIdNum);             //得到当前的对象
				   Integer i= ms.getParentNodeId();            //得到父菜单Id
				   List<Memu> l=memuService.getList("parentNodeId", i);
				   System.out.println(l.size());
				   System.out.println("当前排序号："+ms.getDisplayOrder());
				   int thiss=ms.getDisplayOrder();
				   int newid=ms.getDisplayOrder()+1;
				   System.out.println("改变为："+newid);
				   Memu mss=null;
				   boolean b=false;
				   int minmemuid=10000;                    //最小的
				   int maxmemuid=0;                              //最大的
			        for (int j = 0; j <l.size(); j++) {
			        	mss=new Memu();
			        	mss=l.get(j);
			        	System.out.println("排序号"+mss.getDisplayOrder());
			        	if(mss.getDisplayOrder()>maxmemuid){        //保存子菜单 中 最大的
			        		maxmemuid=mss.getDisplayOrder();
			        		System.out.println("新的最大的:"+maxmemuid);
			        	}
			        	if(mss.getDisplayOrder()<minmemuid){        //保存子菜单 中 最小的
			        		minmemuid=mss.getDisplayOrder();
			        		System.out.println("新的最小的"+minmemuid);
			        	}
			        	if(mss.getDisplayOrder()==newid){
			        		mss.setDisplayOrder(ms.getDisplayOrder());
			        		memuService.update(mss);
			        		b=true;
			        		break;
			        		}
						
					}
			        if(b==false){                          //没找到说明 已经是 最下面了  所以 把他 变为 最上，同时改变其他的 值加1
			        	Memu m3=null;
			        	 for (int j = 0; j <l.size(); j++) {
			        		 m3=new Memu();
			        		 m3=l.get(j);
			        			if(m3.getDisplayOrder()==thiss )
									m3.setDisplayOrder(minmemuid);
								else
								m3.setDisplayOrder(m3.getDisplayOrder() + 1);
			        			
			        			memuService.update(m3);
			        	 }
			        }
			        else{ ms.setDisplayOrder(newid);
			        memuService.update(ms);}
		}
		
	
	
		 op.setOperateName("下调整");
		operatelogService.save(op);
		
		
		
		}
		if (control.equals("上移")) { // 最上面一个 向上 自己变为6 其他减1
			if(memuId.length()<6){         //              父菜单的排序
				Integer memuIdNum=Integer.parseInt(memuId);
			m = memuService.get(memuIdNum);
			System.out.println("当前位置：" + m.getDisplayOrder());
			if (m.getDisplayOrder() != 1) {
				System.out.println("要改变到的位置：" + (m.getDisplayOrder() - 1));

				Memu m2 = memuService.get("displayOrder",
						(m.getDisplayOrder() - 1));
				m2.setDisplayOrder(m.getDisplayOrder());
				memuService.update(m2);

				m.setDisplayOrder(m.getDisplayOrder() - 1);
				memuService.update(m);
			} else {
				List<Memu> lm = memuService.getList("parentNodeId", 0);
				System.out.println(lm.size());
				Memu mu = null;
				for (int i = 0; i < lm.size(); i++) {
					mu = new Memu();
					mu = lm.get(i);
					System.out.println("位置：" + mu.getDisplayOrder());
					System.out.println("菜单" + mu.getDisplayName());
					System.out.println(i);
					if (mu.getDisplayOrder() == 1)
						mu.setDisplayOrder(6);
					else
						mu.setDisplayOrder(mu.getDisplayOrder() - 1);
					memuService.update(mu);
				}
			}}
			else{

				  Integer memuIdNum=Integer.parseInt(memuId);
				  Memu ms=memuService.get(memuIdNum);             //得到当前的对象
				   Integer i= ms.getParentNodeId();            //得到父菜单Id
				                                                    //通过父菜单Id 查找所有子菜单的 排序号
				   List<Memu> l=memuService.getList("parentNodeId", i);
				   System.out.println(l.size());
				   System.out.println("当前排序号："+ms.getDisplayOrder());
				   int thiss=ms.getDisplayOrder();
				   int newid=ms.getDisplayOrder()-1;
				   System.out.println("改变为："+newid);
				   Memu mss=null;
				   boolean b=false;
				   int minmemuid=10000;                    //最小的
				   int maxmemuid=0;                              //最大的
			        for (int j = 0; j <l.size(); j++) {
			        	mss=new Memu();
			        	mss=l.get(j);
			        	System.out.println("排序号"+mss.getDisplayOrder());
			        	if(mss.getDisplayOrder()>maxmemuid){        //保存子菜单 中 最大的
			        		maxmemuid=mss.getDisplayOrder();
			        		System.out.println("新的最大的:"+maxmemuid);
			        	}
			        	if(mss.getDisplayOrder()<minmemuid){        //保存子菜单 中 最小的
			        		minmemuid=mss.getDisplayOrder();
			        		System.out.println("新的最小的"+minmemuid);
			        	}
			        	if(mss.getDisplayOrder()==newid){
			        		mss.setDisplayOrder(ms.getDisplayOrder());
			        		memuService.update(mss);
			        		b=true;
			        		break;
			        		}
						
					}
			        if(b==false){                          //没找到说明 已经是 最下面了  所以 把他 变为 最上，同时改变其他的 值加1
			        	Memu m3=null;
			        	 for (int j = 0; j <l.size(); j++) {
			        		 m3=new Memu();
			        		 m3=l.get(j);
			        			if(m3.getDisplayOrder()==thiss )
									m3.setDisplayOrder(maxmemuid);
								else
								m3.setDisplayOrder(m3.getDisplayOrder()-1);
			        			
			        			memuService.update(m3);
			        	 }
			        }
			        else{ ms.setDisplayOrder(newid);
			        memuService.update(ms);}
			}
			 op.setOperateName("上调整");
			operatelogService.save(op);
		}
		return "main";
		
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
}
