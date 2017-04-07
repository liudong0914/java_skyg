package com.chen.action.attendance;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.chen.action.BaseAction;
import com.chen.bean.PageTime;
import com.chen.bean.Pager;
import com.chen.entity.Dept;
import com.chen.entity.Machine;
import com.chen.entity.Manualsign;
import com.chen.entity.Memu;
import com.chen.entity.Users;
import com.chen.service.attendance.ManualSignService;
import com.chen.service.per.DeptService;
import com.chen.service.per.MachineService;
import com.chen.service.sys.LeftMemuService;
import com.chen.util.SignRate;
import com.chen.util.SystemUtil;

public class ManualSignAction extends BaseAction {
	private static final long serialVersionUID = -8906761515232252524L;
	// Service
	private ManualSignService mss;
	private LeftMemuService leftMemuService;
	private MachineService machineService;
	private DeptService deptService;

	// 保存相对应的数据
	// private PageTime pageTime;
	private PageTime pageTime;
	private List<Dept> deptList;
	private Integer machineId;
	private Manualsign manualSign;
	private String nowDateTime;
	private String sign;
	private String ifSign;
	private List<Manualsign> manualSignAll;
	private Integer memuId;
	private List<Machine> machineAll;
	private List<SignRate> srlist;

	// 到签到签退页面
	public String sign() {
		position();
		return "sign";
	}

	public String manualsign() {
		if (sign.equals("签到")) {
			// 得到登陆用户
			Users user = (Users) getSession("loginUser");
			// 设置签到用户
			manualSign.setUsers(user);
			// 签到
			manualSign.setSignTag(1);
			// 签到时间
			// 是否签到
			manualSign.setSignTime(SystemUtil.getTimestamp(new Date()));
			Manualsign ms = mss.findByUserId(user.getUserId(), sign);
			// 如果用户已经签到，返回提示页面
			if (ms != null) {
				ifSign = "true";
			} else {
				mss.addManualSign(manualSign);
				ServletActionContext.getRequest().setAttribute("sign", sign);
				ServletActionContext.getRequest().setAttribute("signnowTime",
						SystemUtil.dateStr(new Date()));
			}
		} else {
			// 得到登陆用户
			Users user = (Users) getSession("loginUser");
			// 设置签退用户
			manualSign.setUsers(user);
			// 签退
			manualSign.setSignTag(0);
			// 签退时间
			manualSign.setSignTime(SystemUtil.getTimestamp(new Date()));
			Manualsign ms = mss.findByUserId(user.getUserId(), sign);
			if (ms != null) {
				ifSign = "false";
			} else {
				mss.addManualSign(manualSign);
				ServletActionContext.getRequest().setAttribute("backnowTime",
						SystemUtil.dateStr(new Date()));
				ServletActionContext.getRequest().setAttribute("sign", sign);
			}
		}
		return sign();
	}

	// 考勤历史查询
	public String search() {
		// 根据用户id查询自己的考勤记录
		DetachedCriteria dc = DetachedCriteria.forClass(Manualsign.class);
		Users user = (Users) getSession("loginUser");
		if (user != null) {
			if (user.getUserName().equals("admin")) {
				
			}else{
				dc.add(Restrictions.eq("users.userId", user.getUserId()));
			}
		}
		// 根据一个时间范围来查询相对应的数据
		if (pageTime != null) {
			dc.add(Restrictions.between("signTime",
					SystemUtil.getTimesByStr(pageTime.getBeginTime()),
					SystemUtil.getTimesByStr(pageTime.getEndTime())));
		}
		pager = mss.findByPager(pager, dc);
		position();
		return "search";
	}

	public String total() {
		Users user = (Users) getSession("loginUser");
		if(pager == null)
			pager = new Pager();
		srlist = mss.signlv(user, pager);
		// 根据用户来查询考勤率
		// 所有机构
		machineAll = machineService.getAll();
		position();
		return "total";
	}

	// 根据机构id得到所有对应的部门
	public String getDept() {
		// 根据机构id得到部门
		deptList = deptService.getList("machine.machineId", machineId);
		JsonConfig jsonConfig = new JsonConfig();
		// 排除属性
		String[] excludes = new String[] { "userses", "users", "machine" };
		jsonConfig.setExcludes(excludes);
		JSONArray deptJson = JSONArray.fromObject(deptList, jsonConfig);
		// 得到response
		HttpServletResponse response = ServletActionContext.getResponse();
		String deptStr = deptJson.toString();
		System.out.println(deptStr);
		try {
			// 打印到客户端
			response.getWriter().print(deptStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	// 当前位置
	public void position() {
		Memu submemu = leftMemuService.get("memuId", memuId);
		Memu memu = leftMemuService.get("memuId", submemu.getParentNodeId());
		ServletActionContext.getRequest().setAttribute("memu",
				memu.getDisplayName());
		ServletActionContext.getRequest().setAttribute("submemu", submemu);
	}

	// spring容器注入
	public void setManualSign(Manualsign manualSign) {
		this.manualSign = manualSign;
	}

	public String getNowDateTime() {
		return nowDateTime;
	}

	public void setNowDateTime(String nowDateTime) {
		this.nowDateTime = nowDateTime;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public List<Manualsign> getManualSignAll() {
		return manualSignAll;
	}

	public void setManualSignAll(List<Manualsign> manualSignAll) {
		this.manualSignAll = manualSignAll;
	}

	public String getIfSign() {
		return ifSign;
	}

	public void setIfSign(String ifSign) {
		this.ifSign = ifSign;
	}

	public void setLeftMemuService(LeftMemuService leftMemuService) {
		this.leftMemuService = leftMemuService;
	}

	public void setMemuId(Integer memuId) {
		this.memuId = memuId;
	}

	public void setMss(ManualSignService mss) {
		this.mss = mss;
	}

	public void setMachineService(MachineService machineService) {
		this.machineService = machineService;
	}

	public void setMachineAll(List<Machine> machineAll) {
		this.machineAll = machineAll;
	}

	public List<Machine> getMachineAll() {
		return machineAll;
	}

	public void setDeptService(DeptService deptService) {
		this.deptService = deptService;
	}

	public Integer getMachineId() {
		return machineId;
	}

	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}

	public PageTime getPageTime() {
		return pageTime;
	}

	public void setPageTime(PageTime pageTime) {
		this.pageTime = pageTime;
	}

	public List<SignRate> getSrlist() {
		return srlist;
	}

	public void setSrlist(List<SignRate> srlist) {
		this.srlist = srlist;
	}
}
