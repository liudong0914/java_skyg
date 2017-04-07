package com.chen.service.impl;

import java.io.Serializable;
import java.util.List;
import org.hibernate.criterion.DetachedCriteria;
import com.chen.bean.Pager;
import com.chen.dao.BaseDao;
import com.chen.entity.Role;
import com.chen.service.BaseService;

public class BaseServiceImpl<T, PK extends Serializable> implements
		BaseService<T, PK> {

	private BaseDao<T, PK> baseDao;

	public BaseDao<T, PK> getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao<T, PK> baseDao) {
		this.baseDao = baseDao;
	}
	
	public T get(PK id) {
		return baseDao.get(id);
	}

	public T load(PK id) {
		return baseDao.load(id);
	}

	public List<T> get(PK[] ids) {
		return baseDao.get(ids);
	}

	public T get(String propertyName, Object value) {
		return baseDao.get(propertyName, value);
	}

	public List<T> getList(String propertyName, Object value) {
		return baseDao.getList(propertyName, value);
	}

	public List<T> getAll() {
		return baseDao.getAll();
	}

	public Long getTotalCount() {
		return baseDao.getTotalCount();
	}

	public boolean isUnique(String propertyName, Object oldValue,
			Object newValue) {
		return baseDao.isUnique(propertyName, oldValue, newValue);
	}

	public boolean isExist(String propertyName, Object value) {
		return baseDao.isExist(propertyName, value);
	}

	public PK save(T entity) {
		return baseDao.save(entity);
	}

	public void update(T entity) {
		baseDao.update(entity);
	}

	public void delete(T entity) {
		baseDao.delete(entity);
	}

	public void delete(PK id) {
		baseDao.delete(id);
	}

	public void delete(PK[] ids) {
		baseDao.delete(ids);
	}

	public List<Object[]> stat(DetachedCriteria detachedCriteria) {
		return baseDao.stat(detachedCriteria);
	}

	public Pager findByPager(Pager pager) {
		return baseDao.findByPager(pager);
	}

	public Pager findByPager(Pager pager, DetachedCriteria detachedCriteria) {
		return baseDao.findByPager(pager, detachedCriteria);
	}
	public List<T> findByNameNotId(String propertyName, Object valueName,String propertyId, Object valueId){
		return baseDao.findByNameNotId(propertyName, valueName, propertyId, valueId);
	}
}