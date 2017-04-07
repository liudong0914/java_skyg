package com.chen.service.impl.message;

import com.chen.dao.message.MessageDao;
import com.chen.dao.message.MessageTypeDao;
import com.chen.entity.Messagetype;
import com.chen.service.impl.BaseServiceImpl;
import com.chen.service.message.MessageService;
import com.chen.service.message.MessageTypeService;
/**
 * 消息类类型服务 实现 
 * @author chen
 *
 * 2013-7-4
 */
public class MessageTypeServiceImpl extends BaseServiceImpl<Messagetype, Integer> implements MessageTypeService {

	private MessageTypeDao messageTypeDao;   //注入 messageTypeDao

		public void setMessageTypeDao(MessageTypeDao messageTypeDao) {
		this.messageTypeDao = messageTypeDao;
		super.setBaseDao(messageTypeDao);
	}


}
