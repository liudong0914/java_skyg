package com.chen.action.sys;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.hql.ast.SqlASTFactory;

import com.chen.action.BaseAction;
import com.chen.entity.Loginlog;
import com.chen.entity.Role;
import com.chen.entity.Users;

import com.chen.service.sys.LoginlogService;
import com.chen.service.sys.UserService;
import com.chen.util.SystemUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.bcel.internal.generic.NEW;

/**
 * 用户登录Action
 * 
 * @author chen
 * 
 */
@Results( {
	@Result(name = "doLogin", type = "redirect", location = "main!login.action"),
		@Result(name = "toLogin", type = "redirect", location = "main!login.action",params={"err","err"}),
		@Result(name = "main", type = "redirect", location = "model!main.action") })
@ParentPackage("myoa")
public class MainAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private UserService userService;
	private LoginlogService loginlogService;
	private Users user;
	private Loginlog loginlog;
	private Date date;
	private InetAddress address;
	
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setLoginlogService(LoginlogService loginlogService) {
		this.loginlogService = loginlogService;
	}
	/**
	 * 准备登录
	 * 
	 * @return
	 */
	public String login() {
		return "login";
	}
	/**
	 * 登录
	 */
	public String doLogin() {
		if (user != null) {
			Users loginUser = new Users();
			loginUser = userService.get("userName", user.getUserName());
			if (loginUser != null) {
				Role role=loginUser.getRole();
				role.getMemus().iterator();
				date = new Date();
				loginlog = new Loginlog();
				try {
					address = InetAddress.getLocalHost(); // 获得的本地IP地址
				} catch (UnknownHostException e) {
					e.printStackTrace(); 
				}
				loginlog.setLoginUserIp(address.getHostAddress());
				loginlog.setLoginTime(new Timestamp(new Date().getTime()));
				//loginlog.setLoginTime(SystemUtil.getTimestamp(date));
				loginlog.setUsers(loginUser);
				
				if (loginUser.getPassword().equals(user.getPassword())) {
					loginlog.setIfSuccess(1);
					loginlog.setLoginDesc("用户登录成功");
					loginlogService.save(loginlog);
					getSession().put("loginUser", loginUser);
					getSession().put("loginInfo", loginlog);
					return "main";
				} else {
					loginlog.setIfSuccess(0);
					loginlog.setLoginDesc("用户登录失败，用户名或密码不正确");
					loginlogService.save(loginlog);
					
					return "toLogin";
				}
			}
		}
		return "toLogin";
	}
	/**
	 * 退出
	 * @return
	 */
	public String out(){
		getHttpSession().invalidate();
		return "doLogin";
	}
}
