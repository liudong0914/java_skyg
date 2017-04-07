package com.chen.service.attendance;

import java.util.List;

import com.chen.bean.Pager;
import com.chen.entity.Manualsign;
import com.chen.entity.Users;
import com.chen.service.BaseService;
import com.chen.util.SignRate;

public interface ManualSignService extends BaseService<Manualsign, Integer> {
	public int addManualSign(Manualsign manualSign);
	public Manualsign findByUserId(int userId,String sign);
	public List<SignRate> signlv(Users user,Pager pager);
}
