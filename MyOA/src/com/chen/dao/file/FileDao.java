package com.chen.dao.file;


import java.util.List;

import com.chen.dao.BaseDao;
import com.chen.entity.Files;

public interface FileDao extends BaseDao<Files, Integer> {
	public List<Files> findByName(String name);
}
