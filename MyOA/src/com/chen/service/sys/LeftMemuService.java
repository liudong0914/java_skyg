package com.chen.service.sys;

import java.util.List;

import com.chen.entity.Memu;
import com.chen.service.BaseService;

public interface LeftMemuService extends BaseService<Memu, Integer> {
	public List<Memu> getMemus();
	public List<Memu> getSubMemus();
}
