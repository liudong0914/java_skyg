package com.chen.service.impl.attendance;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.chen.bean.Pager;
import com.chen.dao.attendance.ManualSignDao;
import com.chen.dao.sys.WorkTimeDao;
import com.chen.entity.Manualsign;
import com.chen.entity.Users;
import com.chen.entity.Worktime;
import com.chen.service.attendance.ManualSignService;
import com.chen.service.impl.BaseServiceImpl;
import com.chen.util.SignRate;

public class ManualSignServiceImpl extends BaseServiceImpl<Manualsign, Integer> implements
		ManualSignService {
	private ManualSignDao manualSignDao;
	private WorkTimeDao worktimeDao;
	private List<SignRate> signRate;
	//添加考勤记录
	public int addManualSign(Manualsign manualSign) {
		int count = manualSignDao.save(manualSign);
		return count;
	}
	
	public List<SignRate> signlv(Users user,Pager pager){
		Worktime wt = getWorktime();
		SignRate sr = null;
		//保存考勤率
		List<SignRate> list = new ArrayList<SignRate>();
		//早退
		//Long backCount = manualSignDao.getSignBack(user.getUserId(), wt);
		//迟到
		//Long lateCount = manualSignDao.getSignLate(user.getUserId(), wt);
		//sr.setUsers(user);
		//sr.setEarlyBack(backCount);
		//sr.setSignLate(lateCount);
		List<Manualsign> manualList = manualSignDao.findByUser();
		for(Manualsign ma: manualList){
			sr = new SignRate();
			DetachedCriteria dc = DetachedCriteria.forClass(Manualsign.class);
			dc.add(Restrictions.eq("users.userId", ma.getUsers().getUserId()));
			dc.add(Restrictions.eq("signTag", 1));
			pager = manualSignDao.findByPager(pager, dc);
			sr.setSignCount(pager.getTotalCount());
			sr.setUsers(ma.getUsers());
			System.out.println(ma.getUsers().getUserId());
			//早退
			Long backCount = manualSignDao.getSignBack(ma.getUsers().getUserId(), wt);
			//迟到
			Long lateCount = manualSignDao.getSignLate(ma.getUsers().getUserId(), wt);
			sr.setEarlyBack(backCount);
			sr.setSignLate(lateCount);
			list.add(sr);
		}
		return list;
	}
	
	public Worktime getWorktime(){
		List<Worktime> wt = worktimeDao.getAll();
		Worktime workTime = null;
		if(wt != null && wt.size() > 0){
			workTime = (Worktime)wt.get(0);
		}
		return workTime;
	}
	//查询所有考勤记录
	public List<Manualsign> getManualsignAll() {
		List<Manualsign> manualSignList = manualSignDao.getAll();
		return manualSignList;
	}
	//是否多次签到
	public Manualsign findByUserId(int userId,String sign) {
		return manualSignDao.findByUserId(userId,sign);
	}

	public void setManualSignDao(ManualSignDao manualSignDao) {
		this.manualSignDao = manualSignDao;
		super.setBaseDao(manualSignDao);
	}
	public void setWorktimeDao(WorkTimeDao worktimeDao) {
		this.worktimeDao = worktimeDao;
	}
}
