package com.chen.service.impl.sys;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.util.Assert;

import com.chen.action.BaseAction;
import com.chen.dao.BaseDao;
import com.chen.dao.impl.BaseDaoImpl;
import com.chen.dao.sys.LoginlogDao;
import com.chen.dao.sys.RoleDao;
import com.chen.entity.Role;
import com.chen.service.impl.BaseServiceImpl;
import com.chen.service.sys.RoleService;

public class RoleServiceImpl extends BaseServiceImpl<Role, Integer> implements RoleService {
	private RoleDao roleDao;
	//public SessionFactory sessionFactory;
	
	public void setRoleDao(RoleDao roleDao) {
		
		this.roleDao = roleDao;
		
		super.setBaseDao(roleDao);
	}
	/*public void setSessionFactory(SessionFactory factory) {
		this.sessionFactory = factory;
}
	public Session getSession() {
		
		return sessionFactory.getCurrentSession();
	}
	public Role findByNameNotId(String name, Integer id) {
		// TODO Auto-generated method stub
		return null;
	}*/
/*
	public Role findByNameNotId(String name, Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
	*/
	/**
	 * 用于修改时验证  对象是否存在，把当前对象 排除
	 * @param name
	 * @param id
	 * @return
	 */

}
