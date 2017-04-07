package com.chen.service.file;

import java.util.List;

import com.chen.entity.Filetype;
import com.chen.service.BaseService;

public interface FileTypeService extends BaseService<Filetype, Integer> {
	public List<Filetype> getFileTypeAll();
}
