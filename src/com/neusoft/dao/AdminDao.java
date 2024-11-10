package com.neusoft.dao;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2016年12月15日 21时47分53秒
 */
import com.neusoft.utils.Pager;
import com.neusoft.model.*;
import com.neusoft.base.dao.BaseDao;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分53秒
 */


public interface AdminDao extends BaseDao<Admin>{
	
	/**
	 * dao分页查询
	 * @param user
	 * @return
	 */
	Pager<Admin> findPager(Admin admin);

	Admin getByUserName(Admin admin);

	Admin login(Admin ad);
}
