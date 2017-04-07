package com.chen.dao.impl.message;

import org.hibernate.SessionFactory;

import com.chen.dao.impl.BaseDaoImpl;
import com.chen.dao.message.MessageDao;
import com.chen.entity.Message;
/**
 * 消息 实现类
 * @author chen
 *
 * 2013-6-30
 */
public class MessageDaoImpl extends BaseDaoImpl< Message, Integer> implements  MessageDao{
 public void setSessionFactory(SessionFactory factory) {
		super.setSessionFactory(factory);
}
}