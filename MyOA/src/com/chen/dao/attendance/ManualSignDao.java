package com.chen.dao.attendance;

import java.util.List;

import com.chen.dao.BaseDao;
import com.chen.entity.Manualsign;
import com.chen.entity.Users;
import com.chen.entity.Worktime;

public interface ManualSignDao extends BaseDao<Manualsign, Integer> {
	//根据userid得到签到信息
	public Manualsign findByUserId(int userId,String sign);
	//得到早退次数
	public Long getSignBack(int userId,Worktime worktime);
	//得到迟到次数
	public Long getSignLate(int userId,Worktime worktime);
	public List<Manualsign> findByUser();
}
