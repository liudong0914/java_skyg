/**
 * 
 */
package com.chen.service.impl.message;

import com.chen.dao.message.MessagetouserDao;
import com.chen.entity.Messagetouser;
import com.chen.service.impl.BaseServiceImpl;
import com.chen.service.message.MessagetouserService;

/**
 * @author chen
 *
 * 2013-7-7
 */
public class MessagetouserServiceImpl extends BaseServiceImpl<Messagetouser, Integer> implements
		MessagetouserService {
	private MessagetouserDao messagetouserDao;

	public void setMessagetouserDao(MessagetouserDao messagetouserDao) {
		this.messagetouserDao = messagetouserDao;
		super.setBaseDao(messagetouserDao);
	}
	

}
