package com.chen.action.per;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import sun.security.provider.SystemSigner;

import com.chen.action.BaseAction;
import com.chen.bean.Pager;
import com.chen.entity.Dept;
import com.chen.entity.Machine;
import com.chen.entity.Memu;
import com.chen.entity.Role;
import com.chen.entity.Users;
import com.chen.service.per.MachineService;
import com.chen.service.sys.LeftMemuService;

import freemarker.template.utility.StringUtil;

@Results(@Result(name = "toList", type = "redirect", location = "machine!list.action"))
@ParentPackage("myoa")
public class MachineAction extends BaseAction {
	private Machine machine;
	private MachineService machineService;
	private List<Machine> list;
	private Integer[] machineid;
	private Integer memuId;
	private Pager pager=new Pager();
	

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public void setMachineid(Integer[] machineid) {
		this.machineid = machineid;
	}

	public Integer[] getMachineid() {
		return machineid;
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

	public List<Machine> getList() {
		return list;
	}

	public void setList(List<Machine> list) {
		this.list = list;
	}

	public void setMemuId(Integer memuId) {
		this.memuId = memuId;
	}

	public String list() {
		pager.setPageSize(20);
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Machine.class);

		if (machine != null) {
			if (getParameter("search") != null) {
				pager = new Pager();
				pager.setPageSize(20);
				if (!StringUtils.isEmpty(machine.getMachineName())) {
					detachedCriteria.add(Restrictions.like("machineName",
							machine.getMachineName(), MatchMode.ANYWHERE));
				}
				if (!StringUtils.isEmpty(machine.getMachineShortName())) {
					detachedCriteria.add(Restrictions.like("machineShortName",
							machine.getMachineShortName(), MatchMode.ANYWHERE));
				}
			}
		}

		pager = machineService.findByPager(pager, detachedCriteria);
		return LIST;
	}

	public String del() {
		if (machineid != null && machineid.length > 0) {
			machineService.delete(machineid);
		}
		return "toList";
	}

	public String del2() {
		if (id != null) {
			machineService.delete(id);
		}
		return "toList";
	}

	public String adds() {
		machineService.save(machine);
		return list();
	}

	public String updates() {
		System.out.println(machine.getMachineName());
		System.out.println(machine.getMachineId());
		machineService.update(machine);
		return list();
	}

	public String checkName() {
		String uname = getParameter("name");
		String mId = getRequest().getParameter("id");
		String oper = getRequest().getParameter("oper");

		if (oper.equals("add")) {
			machine = machineService.get("machineName", uname);
			if (machine != null) {
				ajaxJsonErrorMessage("该机构名已存在！");
			} else {
				ajaxJsonSuccessMessage("该机构名可用！");
			}
		}
		if (oper.equals("update")) {
			List<Machine> ml = machineService.findByNameNotId("machineName",
					uname, "machineId", mId);
			if (ml.size() > 0) {
				ajaxJsonErrorMessage("该机构名已存在！");
			} else {
				ajaxJsonSuccessMessage("该机构名可用！");
			}
		}
		return null;
	}
}
