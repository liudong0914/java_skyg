package com.chen.service.impl.calendar;

import com.chen.dao.calendar.PrecontractDao;
import com.chen.entity.Precontract;
import com.chen.service.calendar.PrecontractService;
import com.chen.service.impl.BaseServiceImpl;

public class PrecontractServiceImpl extends BaseServiceImpl<Precontract, Integer> implements
		PrecontractService {
		private PrecontractDao precontractDao;

		public void setPrecontractDao(PrecontractDao precontractDao) {
			this.precontractDao = precontractDao;
			super.setBaseDao(precontractDao);
		}
		
		
}
