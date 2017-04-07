/**
 * 
 */
package com.chen.dao.impl.sys;

import org.hibernate.SessionFactory;

import com.chen.dao.impl.BaseDaoImpl;
import com.chen.dao.sys.OperatelogDao;
import com.chen.entity.Operatelog;

/**
 * @author chen
 *操作日志
 * 2013-6-30
 */
public class OperatelogDaoImpl extends BaseDaoImpl<Operatelog, Integer> implements
		OperatelogDao {
	public void setSessionFactory(SessionFactory factory) {
		super.setSessionFactory(factory);
	}
}
