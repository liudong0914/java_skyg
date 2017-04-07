package com.chen.service.impl.file;

import java.util.List;

import com.chen.dao.file.FileTypeDao;
import com.chen.entity.Filetype;
import com.chen.service.file.FileTypeService;
import com.chen.service.impl.BaseServiceImpl;

public class FileTypeServiceImpl extends BaseServiceImpl<Filetype, Integer> implements
		FileTypeService {
	private FileTypeDao fileTypeDao;
	
	public void setFileTypeDao(FileTypeDao fileTypeDao) {
		this.fileTypeDao = fileTypeDao;
		super.setBaseDao(fileTypeDao);
	}
	/**
	 * 得到所有FileType
	 */
	public List<Filetype> getFileTypeAll() {
		List<Filetype> fileTypeList = fileTypeDao.getAll();
		return fileTypeList;
	}
	
}
