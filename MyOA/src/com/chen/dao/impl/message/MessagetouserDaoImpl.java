package com.chen.dao.impl.message;

import org.hibernate.SessionFactory;

import com.chen.dao.impl.BaseDaoImpl;
import com.chen.dao.message.MessagetouserDao;
import com.chen.entity.Messagetouser;
/**
 * 收件箱
 * @author chen
 *
 * 2013-7-7
 */
public class MessagetouserDaoImpl extends BaseDaoImpl<Messagetouser, Integer> implements MessagetouserDao {
	 public void setSessionFactory(SessionFactory factory) {
			super.setSessionFactory(factory);}
}
