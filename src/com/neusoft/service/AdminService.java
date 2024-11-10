package com.neusoft.service;

import com.neusoft.model.Admin;
import com.neusoft.utils.Pager;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分53秒
 */
public interface AdminService extends BaseService<Admin>{

	/**
	 * dao层分页查询
	 */
	Pager<Admin> findPager(Admin admin);

	Admin getByUserName(Admin admin);

	Admin login(Admin admin);
}
