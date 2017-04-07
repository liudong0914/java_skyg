package com.chen.dao.impl.calendar;


import org.hibernate.SessionFactory;

import com.chen.dao.calendar.NoteDao;
import com.chen.dao.impl.BaseDaoImpl;
import com.chen.entity.Mynote;

/**
 * 便签DAO实现类
 * @author TCJ
 *
 */
public class NoteDaoImpl extends BaseDaoImpl<Mynote, Integer> implements NoteDao {

	public void setSessionFactory(SessionFactory factory) {
		super.setSessionFactory(factory);
	}
}
