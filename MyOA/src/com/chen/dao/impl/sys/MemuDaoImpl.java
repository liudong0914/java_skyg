/**
 * 
 */
package com.chen.dao.impl.sys;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;

import com.chen.bean.Pager;
import com.chen.dao.impl.BaseDaoImpl;
import com.chen.dao.sys.MemuDao;
import com.chen.entity.Memu;

/**
 * 权限
 * @author chen
 *
 */
public class MemuDaoImpl extends BaseDaoImpl<Memu, Integer> implements MemuDao {
	public void setSessionFactory(SessionFactory factory) {
		super.setSessionFactory(factory);

}}
