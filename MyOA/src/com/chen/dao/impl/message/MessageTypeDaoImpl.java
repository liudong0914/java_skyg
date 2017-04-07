package com.chen.dao.impl.message;

import org.hibernate.SessionFactory;

import com.chen.dao.impl.BaseDaoImpl;
import com.chen.dao.message.MessageTypeDao;
import com.chen.entity.Messagetype;
/**
 * 消息类型 实现
 * @author chen
 *
 * 2013-7-4
 */

public class MessageTypeDaoImpl extends BaseDaoImpl<Messagetype, Integer> implements MessageTypeDao {
	
	 public void setSessionFactory(SessionFactory factory) {
			super.setSessionFactory(factory);

}
}