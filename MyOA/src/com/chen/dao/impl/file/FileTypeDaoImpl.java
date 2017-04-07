package com.chen.dao.impl.file;

import java.util.List;

import org.hibernate.SessionFactory;

import com.chen.dao.file.FileTypeDao;
import com.chen.dao.impl.BaseDaoImpl;
import com.chen.entity.Filetype;

public class FileTypeDaoImpl extends BaseDaoImpl<Filetype, Integer> implements FileTypeDao {
	//注入sessionFactory
	public void setSessionFactorys(SessionFactory factory) {
		super.setSessionFactory(factory);
	}
	
}
