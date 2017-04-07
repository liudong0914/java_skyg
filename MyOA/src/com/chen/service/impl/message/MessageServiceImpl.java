/**
 * 
 */
package com.chen.service.impl.message;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.chen.bean.Pager;
import com.chen.dao.message.MessageDao;
import com.chen.dao.sys.UserDao;
import com.chen.entity.Message;
import com.chen.service.impl.BaseServiceImpl;
import com.chen.service.message.MessageService;

/**
 * @author chen
 *消息服务 实现
 * 2013-6-30
 */
public class MessageServiceImpl extends BaseServiceImpl<Message, Integer> implements
		MessageService {
	private MessageDao messageDao;   //注入 messageDao

	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
		super.setBaseDao(messageDao);
	}

	}
