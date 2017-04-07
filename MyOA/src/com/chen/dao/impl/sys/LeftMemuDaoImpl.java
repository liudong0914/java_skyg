package com.chen.dao.impl.sys;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.chen.dao.impl.BaseDaoImpl;
import com.chen.dao.sys.LeftMemuDao;
import com.chen.entity.Memu;
/**
 * 左边 菜单
 * @author chen
 *
 * 2013-6-29
 */
public class LeftMemuDaoImpl extends BaseDaoImpl<Memu, Integer> implements
		LeftMemuDao {
	public void setSessionFactorys(SessionFactory factory) {
		super.setSessionFactory(factory);
	}

	public List<Memu> orderByAll() {
		Session session = getSession();
		//根据dispalyOrder列来排序
		String hql = "from Memu m order by m.displayOrder";
		Query query = session.createQuery(hql);
		return query.list();
	}
	
}
