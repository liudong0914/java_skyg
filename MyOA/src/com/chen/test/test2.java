package com.chen.test;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.DetachedCriteria;

import sun.util.logging.resources.logging;

import com.chen.bean.Pager;
import com.chen.dao.BaseDao;
import com.chen.dao.impl.BaseDaoImpl;
import com.chen.dao.impl.sys.LoginlogDaoImpl;
import com.chen.dao.impl.sys.UserDaoImpl;
import com.chen.dao.sys.LoginlogDao;
import com.chen.dao.sys.UserDao;
import com.chen.entity.Loginlog;
import com.chen.entity.Users;
import com.chen.service.impl.sys.LoginlogServiceImpl;
import com.chen.service.impl.sys.UserServiceImpl;
import com.chen.service.sys.LoginlogService;
import com.chen.service.sys.UserService;

public class test2 {
	public static void saveUpdate() {
		Configuration cfg = new Configuration();
		// 默认添加/hibernate.cfg.xml
		cfg.configure();
		SessionFactory sf = cfg.buildSessionFactory();
		// 默认打开Session 会把 自动事务 关闭

		Session session = sf.openSession();
		// 所以 需要 自定义 打开事务
		Transaction tran = session.beginTransaction();
		// 还回的 是 integer
		Loginlog loginlog = new Loginlog();
		loginlog = (Loginlog) session.get(Loginlog.class, 3);
		System.out.println(loginlog.getLoginDesc());
		tran.commit();
		// 需要关闭 资源
		session.close();
		sf.close();
	}

	public static void main(String[] args) {
		BaseDao baseDao = new BaseDaoImpl();
		LoginlogService loginlogService = new LoginlogServiceImpl();
		LoginlogDao dao = new LoginlogDaoImpl();
		Loginlog log = new Loginlog();
		log = loginlogService.get("loginId", 3);
		System.out.println(log.getLoginDesc());

		saveUpdate();
	}

}
