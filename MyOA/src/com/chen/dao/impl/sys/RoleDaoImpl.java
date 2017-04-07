package com.chen.dao.impl.sys;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.chen.dao.impl.BaseDaoImpl;
import com.chen.dao.sys.RoleDao;
import com.chen.entity.Role;
/**
 * 角色
 * @author chen
 *
 * 2013-6-30
 */
public class RoleDaoImpl extends BaseDaoImpl<Role, Integer> implements RoleDao {
	public void setSessionFactory(SessionFactory factory) {
		super.setSessionFactory(factory);
}
}