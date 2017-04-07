package com.chen.service.impl.per;

import com.chen.dao.per.MachineDao;
import com.chen.dao.sys.UserDao;
import com.chen.entity.Machine;
import com.chen.service.impl.BaseServiceImpl;
import com.chen.service.per.MachineService;

public class MachineServiceImpl extends BaseServiceImpl<Machine, Integer>
		implements MachineService {
	private MachineDao machineDao;

	public void setMachineDao(MachineDao machineDao) {
		this.machineDao = machineDao;
		super.setBaseDao(machineDao);
	}

}
