package com.chen.action.per;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import com.chen.action.BaseAction;
import com.chen.bean.Pager;
import com.chen.entity.Dept;
import com.chen.entity.Machine;
import com.chen.entity.Users;
import com.chen.service.per.DeptService;
import com.chen.service.per.MachineService;
import com.chen.service.sys.LeftMemuService;
import com.chen.service.sys.UserService;
import com.opensymphony.xwork2.ActionContext;

@Results(@Result(name = "usList", type = "redirect", location = "/per/dept!list.action"))
public class DeptAction extends BaseAction {
	private Dept dept;
	private DeptService deptService;
	private List<Dept> list;
	private Integer[] deptid;
	private DetachedCriteria detachedCriteria;
	private LeftMemuService leftMemuService;
	private Machine machine;
	private MachineService machineService;
	private Users users;
	private Pager pager = new Pager();

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	private UserService userService;

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	public DeptService getDeptService() {
		return deptService;
	}

	public void setDeptService(DeptService deptService) {
		this.deptService = deptService;
	}

	public List<Dept> getList() {
		return list;
	}

	public void setList(List<Dept> list) {
		this.list = list;
	}

	public Integer[] getDeptid() {
		return deptid;
	}

	public void setDeptid(Integer[] deptid) {
		this.deptid = deptid;
	}

	public Machine getMachine() {
		return machine;
	}

	public void setMachine(Machine machine) {
		this.machine = machine;
	}

	public MachineService getMachineService() {
		return machineService;
	}

	public void setMachineService(MachineService machineService) {
		this.machineService = machineService;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String list() {
		pager.setPageSize(20);
		detachedCriteria = DetachedCriteria.forClass(Dept.class);
		if (dept != null) {
			if (getParameter("search") != null) {
				pager = new Pager();
				pager.setPageSize(20);
				if (!StringUtils.isEmpty(dept.getDeptName())) {
					detachedCriteria.add(Restrictions.like("deptName", dept
							.getDeptName(), MatchMode.ANYWHERE));
				}
				if (dept.getMachine().getMachineId() > 0) {
					detachedCriteria.createCriteria("machine").add(
							Restrictions.eq("machineId", dept.getMachine()
									.getMachineId()));
				}
			}
		}
		pager = deptService.findByPager(pager, detachedCriteria);
		List<Machine> mList = machineService.getAll();
		ActionContext.getContext().put("mlist", mList);
		return LIST;
	}

	public String del() {
		if (deptid != null && deptid.length > 0) {
			deptService.delete(deptid);
		}
		return list();
	}

	public String del2() {
		if (id != null) {
			deptService.delete(id);
		}
		return list();
	}

	public String info() {
		if (id != null) {
			dept = deptService.get(id);
		}
		return "info";
	}

	public String update() {
		if (id != null) {
			dept = deptService.get(id);
			List<Machine> mList = machineService.getAll();
			List<Users> uList = userService.getAll();
			ActionContext.getContext().put("mlist", mList);
			ActionContext.getContext().put("uList", uList);
		}
		return "update";
	}

	public String doUpdate() {
		if (dept != null) {
			deptService.update(dept);
		}
		return "usList";
	}

	public String add() {
		List<Machine> mList = machineService.getAll();
		List<Users> uList = userService.getAll();
		ActionContext.getContext().put("mlist", mList);
		ActionContext.getContext().put("uList", uList);
		return "add";
	}

	public String doAdd() {
		if (dept != null) {
			deptService.save(dept);
		}
		return "usList";
	}

	public String checkName() {
		String uname = getParameter("name");
		String mId = getRequest().getParameter("id");
		String oper = getRequest().getParameter("oper");

		if (oper.equals("add")) {
			dept = deptService.get("deptName", uname);
			if (dept != null) {
				ajaxJsonErrorMessage("该机构名已存在！");
			} else {
				ajaxJsonSuccessMessage("该机构名可用！");
			}
		}
		if (oper.equals("update")) {
			List<Dept> dl = deptService.findByNameNotId("deptName", uname,
					"deptId", mId);
			if (dl.size() > 0) {
				ajaxJsonErrorMessage("该机构名已存在！");
			} else {
				ajaxJsonSuccessMessage("该机构名可用！");
			}
		}
		return null;
	}
}
