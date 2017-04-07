package com.chen.service.impl.per;

import com.chen.dao.per.MachineDao;
import com.chen.dao.per.UserstateDao;
import com.chen.entity.Userstate;
import com.chen.service.impl.BaseServiceImpl;
import com.chen.service.per.UserstateService;

public class UserstateServiceImpl extends BaseServiceImpl<Userstate, Integer> implements
		UserstateService {
	private UserstateDao userstateDao;

	public void setUserstateDao(UserstateDao userstateDao) {
		this.userstateDao = userstateDao;
		super.setBaseDao(userstateDao);
	}

}
