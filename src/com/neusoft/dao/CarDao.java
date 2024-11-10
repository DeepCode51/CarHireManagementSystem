package com.neusoft.dao;
import com.neusoft.base.dao.BaseDao;
import com.neusoft.model.Car;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2016年12月15日 21时47分53秒
 */
import com.neusoft.utils.Pager;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分53秒
 */


public interface CarDao extends BaseDao<Car>{
	
	/**
	 * dao分页查询
	 * @param user
	 * @return
	 */
	Pager<Car> findPager(Car car);
}
