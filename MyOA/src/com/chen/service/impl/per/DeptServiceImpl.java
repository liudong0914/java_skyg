package com.chen.service.impl.per;

import com.chen.dao.per.DeptDao;
import com.chen.entity.Dept;
import com.chen.service.impl.BaseServiceImpl;
import com.chen.service.per.DeptService;

public class DeptServiceImpl extends BaseServiceImpl<Dept, Integer> implements
		DeptService {
	private DeptDao deptDao;

	public void setDeptDao(DeptDao deptDao) {
		this.deptDao = deptDao;
		super.setBaseDao(deptDao);
	}

}
