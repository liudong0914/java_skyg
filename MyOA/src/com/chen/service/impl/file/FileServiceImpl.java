package com.chen.service.impl.file;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import sun.nio.cs.ext.MacThai;

import com.chen.bean.Pager;
import com.chen.dao.file.FileDao;
import com.chen.dao.file.FileTypeDao;
import com.chen.entity.Files;
import com.chen.service.file.FileService;
import com.chen.service.impl.BaseServiceImpl;

public class FileServiceImpl extends BaseServiceImpl<Files, Integer> implements
		FileService {
	private FileDao fileDao;
	private FileTypeDao fileTypeDao;
	public FileServiceImpl(){}
	//注入fileTypeDao
	public void setFileTypeDao(FileTypeDao fileTypeDao) {
		this.fileTypeDao = fileTypeDao;
	}
	//注入FileDao
	public void setFileDao(FileDao fileDao) {
		this.fileDao = fileDao;
		super.setBaseDao(fileDao);
	}

	public List<Files> getFile() {
		//所有记录
		List<Files> fileAll = fileDao.getAll();
		List<Files> file = new ArrayList<Files>();
		//添加父文档
		for(Files fileentity : fileAll){
			if(fileentity.getParentId() == 0){
				file.add(fileentity);
			}
		}
		return file;
	}

	public List<Files> getFiles() {
		List<Files> files = getFile();
		//所有记录
		List<Files> fileAll = fileDao.getAll();
		List<Files> subList = new ArrayList<Files>();
		//子记录
		for(Files file : files){
			for(Files subFile : fileAll){
				if(file.getFileId().equals(subFile.getParentId()) && subFile.getIfDelete().equals(0)){
					subList.add(subFile);
				}
			}
		}
		return subList;
	}

	public List<Files> getSubFiles() {
		//所有记录
		List<Files> fileAll = fileDao.getAll();
		List<Files> subList = getFiles();
		List<Files> subSList = new ArrayList<Files>();
		for(Files file : subList){
			for(Files subFiles : fileAll){
				if(file.getFileId().equals(subFiles.getParentId()) && subFiles.getIfDelete().equals(0)){
					subSList.add(subFiles);
				}
			}
		}
		return subSList;
	}

	public List<Files> getSubFiles2() {
		//所有记录
		List<Files> fileAll = fileDao.getAll();
		List<Files> subList = getSubFiles();
		List<Files> subSList = new ArrayList<Files>();
		for(Files file : subList){
			for(Files subFiles : fileAll){
				if(file.getFileId().equals(subFiles.getParentId()) && subFiles.getIfDelete().equals(0)){
					subSList.add(subFiles);
				}
			}
		}
		return subSList;
	}
	//得到删除到回收站的文件
	public List<Files> getIfDelete() {
		List<Files> deleteFile = fileDao.getList("ifDelete", 1);
		return deleteFile;
	}
	//保存新建文件
	public int addFile(Files files) {
		int count = fileDao.save(files);
		return count;
	}
	public List<Files> findByName(String name) {
		List<Files> fileList = fileDao.findByName(name);
		return fileList;
	}
	public Map<Files, List<Files>> getFiless() {
		Map<Files, List<Files>> filesMap = new HashMap<Files, List<Files>>();
		//父的文件夹
		List<Files> parentFiles = fileDao.getList("parentId", 0);
		List<Files> childFiles = null;
		for(Files files : parentFiles){
			//根据父类的id得到对应的子文件
     		childFiles= new ArrayList<Files>();
			childFiles = fileDao.getList("parentId", files.getFileId());
			Collections.sort(childFiles);
			filesMap.put(files, childFiles);
		}
		return filesMap;
	}
	public Pager findByFile(Pager pager,String name,String remark) {
		DetachedCriteria dc = DetachedCriteria.forClass(Files.class);
		if(name != null)
			dc.add(Restrictions.like("fileName", name, MatchMode.ANYWHERE));
		if(remark != null)
			dc.add(Restrictions.like("remark", remark, MatchMode.ANYWHERE));
		return fileDao.findByPager(pager, dc);
	}
	/**
	 * 得到选中的父文件下面的所有子文件
	 */
	public Pager findBySubFile(Pager pager, Files files) {
		DetachedCriteria dc = DetachedCriteria.forClass(Files.class);
		if(files != null){
			//添加条件
			dc.add(Restrictions.eq("parentId", files.getFileId()));
		}
		dc.add(Restrictions.eq("ifDelete", 0));
		return fileDao.findByPager(pager, dc);
	}
	
}
