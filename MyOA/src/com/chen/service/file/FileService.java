package com.chen.service.file;


import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;

import com.chen.bean.Pager;
import com.chen.entity.Files;
import com.chen.service.BaseService;

public interface FileService extends BaseService<Files, Integer> {
	public List<Files> getFile();
	public List<Files> getFiles();
	public List<Files> getSubFiles();
	public List<Files> getSubFiles2();
	public List<Files> getIfDelete();
	public int addFile(Files files);
	public List<Files> findByName(String name);
	public Map<Files,List<Files>> getFiless();
	public Pager findByFile(Pager pager,String name,String remark);
	public Pager findBySubFile(Pager pager,Files files);
}
