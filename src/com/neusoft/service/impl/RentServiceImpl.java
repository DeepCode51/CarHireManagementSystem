/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2016年12月15日 21时47分54秒
 */
package com.neusoft.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neusoft.model.Rent;
import com.neusoft.utils.Pager;
import com.neusoft.service.RentService;
import com.neusoft.dao.*;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分54秒
 */

@Service("rentService")
public class RentServiceImpl extends BaseServiceImpl<Rent> implements RentService{
	 
	@Autowired
	private RentDao rentDao;
	/**
	 * dao分页查询
	 * @param user
	 * @return
	 */
	@Override
	public Pager<Rent> findPager(Rent rent) {
		return rentDao.findPager(rent);
	}
	

	

}
