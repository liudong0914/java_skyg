package com.chen.action.per;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import com.chen.action.BaseAction;
import com.chen.bean.Pager;
import com.chen.entity.Dept;
import com.chen.entity.Role;
import com.chen.entity.Users;
import com.chen.entity.Userstate;
import com.chen.service.per.DeptService;
import com.chen.service.per.UserstateService;
import com.chen.service.sys.LoginlogService;
import com.chen.service.sys.RoleService;
import com.chen.service.sys.UserService;
import com.opensymphony.xwork2.ActionContext;

@Results(@Result(name = "usList", type = "redirect", location = "/per/users!list.action"))
public class UsersAction extends BaseAction {
	private Users user;
	private UserService userService;
	private List<Users> list;
	private Dept dept;
	private DeptService deptService;
	private Role role;
	private RoleService roleService;
	private Userstate userstate;
	private UserstateService userstateService;
	private Integer[] userid;
	private DetachedCriteria detachedCriteria;
	private LoginlogService loginlogService;
	private String imageFileName;
	private File image;
	private Pager pager = new Pager();

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<Users> getList() {
		return list;
	}

	public void setList(List<Users> list) {
		this.list = list;
	}

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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public Integer[] getUserid() {
		return userid;
	}

	public void setUserid(Integer[] userid) {
		this.userid = userid;
	}

	public Userstate getUserstate() {
		return userstate;
	}

	public void setUserstate(Userstate userstate) {
		this.userstate = userstate;
	}

	public UserstateService getUserstateService() {
		return userstateService;
	}

	public void setUserstateService(UserstateService userstateService) {
		this.userstateService = userstateService;
	}

	public UserService getUserService() {
		return userService;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String list() {
		pager.setPageSize(20);
		detachedCriteria = DetachedCriteria.forClass(Users.class);
		if (user != null) {
			if (getParameter("search") != null) {
				pager = new Pager();
				pager.setPageSize(20);
				if (!StringUtils.isEmpty(user.getRealName())) {
					detachedCriteria.add(Restrictions.like("realName", user
							.getRealName(), MatchMode.ANYWHERE));
				}

				if (user.getRole() != null) {
					if (user.getRole().getRoleId() > 0)
						detachedCriteria.createCriteria("role").add(
								Restrictions.eq("roleId", user.getRole()
										.getRoleId()));
				}
			}
		}
		pager = deptService.findByPager(pager, detachedCriteria);
		List<Role> rList = roleService.getAll();
		ActionContext.getContext().put("rList", rList);
		return LIST;
	}

	public String del() {
		if (userid != null && userid.length > 0) {
			userService.delete(userid);
		}
		return list();
	}

	public String del2() {
		if (id != null) {

			userService.delete(id);
		}
		return list();
	}

	public String info() {
		if (id != null) {
			user = userService.get(id);
		}
		return "info";
	}

	public String update() {
		if (id != null) {
			user = userService.get(id);
			List<Dept> dList = deptService.getAll();
			List<Role> rList = roleService.getAll();
			List<Userstate> sList = userstateService.getAll();

			ActionContext.getContext().put("dlist", dList);
			ActionContext.getContext().put("rList", rList);
			ActionContext.getContext().put("sList", sList);
		}
		return "update";
	}

	public String doUpdate() {
		if (user != null) {
			user.setImage(imageFileName);
			userService.update(user);
		}
		return "usList";
	}

	public String add() {
		List<Dept> dList = deptService.getAll();
		List<Role> rList = roleService.getAll();
		List<Userstate> sList = userstateService.getAll();
		ActionContext.getContext().put("dlist", dList);
		ActionContext.getContext().put("rList", rList);
		ActionContext.getContext().put("sList", sList);
		return "add";
	}

	public String doAdd() {
		user.setRegTime(new Timestamp(new Date().getTime()));
		if (user != null) {
			user.setImage(imageFileName);
			userService.save(user);
		}
		return "usList";
	}

	public String doUpload() {
		String realPath = ServletActionContext.getServletContext().getRealPath(
				"/images/user");
		String ty = getParameter("ty");
		if (image != null) {
			File newFile = new File(new File(realPath), imageFileName);
			if (!newFile.getParentFile().exists()) {
				newFile.getParentFile().mkdirs();
			}
			try {
				FileUtils.copyFile(image, newFile);
				ActionContext.getContext().put("usList", "上传成功！");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (ty.equals("ss")) {
			return add();
		} else {
			return update();
		}
	}

	public String checkName() {
		String uname = getParameter("name");
		Users us = userService.get("userName", uname);
		List<Users> ul = userService.getAll();
		if (us != null) {
			ajaxJsonErrorMessage("该用户名已存在！");
		} else {
			ajaxJsonSuccessMessage("该用户名可用！");
		}
		return null;
	}
}
