/**
 * 
 */
package com.chen.service.impl.sys;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.chen.bean.Pager;
import com.chen.dao.sys.MemuDao;
import com.chen.dao.sys.UserDao;
import com.chen.entity.Memu;
import com.chen.service.impl.BaseServiceImpl;
import com.chen.service.sys.MemuService;

/**
 * 权限菜单 
 * @author chen
 *
 * 2013-6-29
 */
public class MemuServiceImpl extends BaseServiceImpl< Memu, Integer>implements MemuService {
	private MemuDao memuDao;
	public void setMemuDao(MemuDao memuDao) {
		this.memuDao = memuDao;
		super.setBaseDao(memuDao);
	}
}
