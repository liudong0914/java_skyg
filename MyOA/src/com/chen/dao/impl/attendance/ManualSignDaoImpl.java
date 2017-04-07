package com.chen.dao.impl.attendance;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.chen.dao.attendance.ManualSignDao;
import com.chen.dao.impl.BaseDaoImpl;
import com.chen.entity.Manualsign;
import com.chen.entity.Worktime;
import com.chen.util.SystemUtil;

public class ManualSignDaoImpl extends BaseDaoImpl<Manualsign, Integer> implements
		ManualSignDao {
	public void setSessionFactorys(SessionFactory factory){
		super.setSessionFactory(factory);
	}
	//根据用户id查询，查看是否多次签到
	public Manualsign findByUserId(int userId,String sign) {
		Date nowDate = new Date();
		String year = SystemUtil.getYear(nowDate);
		String month = SystemUtil.getMonth(nowDate);
		String day = SystemUtil.getDay(nowDate);
		Session session = getSession();
		String hql = null;
		if(sign.equals("签到")){
			hql = "select m from Manualsign m where m.users.userId="+userId+
			" and m.signTag = 1 and YEAR(signTime)='"+year+
			"' and MONTH(signTime)='"+month+
			"' and DAY(signTime)='"+day+"'";
		}else{
			hql = "select m from Manualsign m where m.users.userId="+userId+
			" and m.signTag = 0 and YEAR(signTime)='"+year+
			"' and MONTH(signTime)='"+month+
			"' and DAY(signTime)='"+day+"'";
		}
		Query query = session.createQuery(hql);
		return (Manualsign)query.uniqueResult();
	}
	/**
	 * 早退次数
	 */
	public Long getSignBack(int userId,Worktime worktime) {
		Session session = getSession();
		String hql = "select count(*) from Manualsign m where m.users.userId ="+userId+" " +
				"and TIME(signTime) < TIME('"+SystemUtil.getHms(worktime.getOffDutyTime())+"') " +
						"and signTag = 0";
		Query query = session.createQuery(hql);
		Long count = (Long)query.uniqueResult();
		return count;
	}
	/**
	 * 迟到次数
	 */
	public Long getSignLate(int userId, Worktime worktime) {
		Session session = getSession();
		String hql = "select count(*) from Manualsign m where m.users.userId ="+userId+" " +
				"and TIME(signTime) < TIME('"+SystemUtil.getHms(worktime.getOnDutyTime())+"') " +
						"and signTag = 1";
		Query query = session.createQuery(hql);
		Long count = (Long)query.uniqueResult();
		return count;
	}
	public List<Manualsign> findByUser() {
		String hql="from Manualsign m group by m.users.userId";
		Query query = getSession().createQuery(hql);
		List<Manualsign> manualList = query.list();
		return manualList;
	}
	
}
 