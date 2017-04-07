package com.chen.dao.sys;

import java.util.List;

import com.chen.dao.BaseDao;
import com.chen.entity.Memu;
/**
 * 菜单显示 接口
 * @author chen
 *
 * 2013-6-30
 */
public interface LeftMemuDao extends BaseDao<Memu, Integer> {
	public List<Memu> orderByAll();
}
