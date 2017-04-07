package com.chen.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.chen.bean.Pager;
import com.chen.entity.Role;

/**
 * @author chen Dao接口 - Dao基接口
 */
public interface BaseDao<T, PK extends Serializable> {
	/**
	 * 根据ID获取实体对象.
	 */
	public T get(PK id);

	/**
	 * 根据ID获取实体对象.
	 */
	public T load(PK id);

	/**
	 * 根据ID数组获取实体对象集合.
	 */
	public List<T> get(PK[] ids);

	/**
	 * 根据属性名和属性值获取实体对象.
	 */
	public T get(String propertyName, Object value);

	/**
	 * 根据属性名和属性值获取实体对象集合.
	 */
	public List<T> getList(String propertyName, Object value);

	/**
	 * 获取所有实体对象集合.
	 */
	public List<T> getAll();

	/**
	 * 获取所有实体对象总数.
	 */
	public Long getTotalCount();

	/**
	 * 根据属性名、修改前后属性值判断在数据库中是否唯一(若新修改的值与原来值相等则直接返回true).
	 */
	public boolean isUnique(String propertyName, Object oldValue,
			Object newValue);

	/**
	 * 根据属性名判断数据是否已存在.
	 */
	public boolean isExist(String propertyName, Object value);

	/**
	 * 保存实体对象.
	 */
	public PK save(T entity);

	/**
	 * 更新实体对象.
	 */
	public void update(T entity);

	/**
	 * 删除实体对象.
	 */
	public void delete(T entity);

	/**
	 * 根据ID删除实体对象.
	 */
	public void delete(PK id);

	/**
	 * 根据ID数组删除实体对象.
	 */
	public void delete(PK[] ids);

	/**
	 * 根据条件统计.
	 */
	public List<Object[]> stat(DetachedCriteria detachedCriteria);

	/**
	 * 根据Pager对象进行查询(提供分页、查找、排序功能).
	 */
	public Pager findByPager(Pager pager);

	/**
	 * 根据Pager和hql语句进行查询(提供分页、查找、排序功能).
	 */
	public Pager findByPager(Pager pager, DetachedCriteria detachedCriteria);
	/**
	 * 用于修改时验证  对象是否存在，把当前对象 排除
	 * @param name
	 * @param id
	 * @return
	 */

	public List<T> findByNameNotId(String propertyName, Object valueName,String propertyId, Object valueId);
}
