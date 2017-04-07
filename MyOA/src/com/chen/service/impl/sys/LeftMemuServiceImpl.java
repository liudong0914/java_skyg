package com.chen.service.impl.sys;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.chen.dao.sys.LeftMemuDao;
import com.chen.entity.Memu;
import com.chen.service.impl.BaseServiceImpl;
import com.chen.service.sys.LeftMemuService;

@Service
public class LeftMemuServiceImpl extends BaseServiceImpl<Memu, Integer>
		implements LeftMemuService {
	private LeftMemuDao leftMemuDao;
	public void setLeftMemuDao(LeftMemuDao leftMemuDao) {
		this.leftMemuDao = leftMemuDao;
		super.setBaseDao(leftMemuDao);
	}
	//获得菜单
	public List<Memu> getMemus() {
		List<Memu> all = leftMemuDao.orderByAll();
		//保存父菜单
		List<Memu> parentMemu = new ArrayList<Memu>();
		//循环遍历所有
		for(Memu memu : all){
			//判断是否是父菜单
			if(memu.getParentNodeId() == 0){
				parentMemu.add(memu);
			}
		}
		return parentMemu;
	}
	//获得子菜单
	public List<Memu> getSubMemus() {
		List<Memu> all = leftMemuDao.orderByAll();
		//保存父菜单
		List<Memu> parentMemu = getMemus();
		//保存子菜单
		List<Memu> subMemu = new ArrayList<Memu>();
		//循环遍历所有
		for(Memu memu : parentMemu){
			//二次遍历，memuId跟parentNoteId判断
			for(Memu memuSub : all){
				if(memu.getMemuId().equals(memuSub.getParentNodeId())){
					subMemu.add(memuSub);
				}
			}
		}
		return subMemu;
	}
}
