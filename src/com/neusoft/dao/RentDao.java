package com.neusoft.dao;
import com.neusoft.base.dao.BaseDao;
import com.neusoft.model.Rent;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2016年12月15日 21时47分54秒
 */
import com.neusoft.utils.Pager;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分54秒
 */


public interface RentDao extends BaseDao<Rent>{
	
	/**
	 * dao分页查询
	 * @param user
	 * @return
	 */
	Pager<Rent> findPager(Rent rent);
}
