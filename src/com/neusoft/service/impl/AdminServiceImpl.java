/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2016年12月15日 21时47分53秒
 */
package com.neusoft.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neusoft.model.Admin;
import com.neusoft.utils.Pager;
import com.neusoft.dao.*;
import com.neusoft.service.*;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分53秒
 */

@Service("adminService")
public class AdminServiceImpl extends BaseServiceImpl<Admin> implements AdminService{
	 
	@Autowired
	private AdminDao adminDao;
	/**
	 * dao分页查询
	 * @param user
	 * @return
	 */
	@Override
	public Pager<Admin> findPager(Admin admin) {
		return adminDao.findPager(admin);
	}
	
	@Override
	public Admin getByUserName(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.getByUserName(admin);
	}
	
	
	@Override
	public Admin login(Admin admin) {
	 Admin ad = new Admin();
	 ad.setAdminName(admin.getAdminName());
	 ad.setPassWord(admin.getPassWord());
	return adminDao.login(ad);
}
	

	

}
