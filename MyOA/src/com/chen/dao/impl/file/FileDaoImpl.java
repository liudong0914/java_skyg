package com.chen.dao.impl.file;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.chen.dao.file.FileDao;
import com.chen.dao.impl.BaseDaoImpl;
import com.chen.entity.Files;

public class FileDaoImpl extends BaseDaoImpl<Files, Integer> implements FileDao {
	public void setSessionFactorys(SessionFactory factory) {
		super.setSessionFactory(factory);
	}
	public List<Files> findByName(String name){
		Session session = getSession();
		String hql="select f from Files f where f.fileName like '%"+name+"%'";
		Query query = session.createQuery(hql);
		return query.list();
	}
}
