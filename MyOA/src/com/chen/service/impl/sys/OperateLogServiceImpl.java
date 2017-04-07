package com.chen.service.impl.sys;

import com.chen.dao.sys.MemuDao;
import com.chen.dao.sys.OperatelogDao;
import com.chen.entity.Operatelog;
import com.chen.service.impl.BaseServiceImpl;
import com.chen.service.sys.OperatelogService;
/**
 * 操作日志
 * @author chen
 *
 * 2013-6-30
 */
public class OperateLogServiceImpl extends BaseServiceImpl<Operatelog, Integer> implements OperatelogService {

	private OperatelogDao operatelogDao;  //注入OperatelogDao

	public void setOperatelogDao(OperatelogDao operatelogDao) {
		this.operatelogDao = operatelogDao;
		super.setBaseDao(operatelogDao);
	}
	
}
