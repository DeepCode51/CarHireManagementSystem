/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2016年12月15日 21时47分53秒
 */
package com.neusoft.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neusoft.model.CarCategory;
import com.neusoft.utils.Pager;
import com.neusoft.service.CarCategoryService;
import com.neusoft.dao.*;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分53秒
 */

@Service("carCategoryService")
public class CarCategoryServiceImpl extends BaseServiceImpl<CarCategory> implements CarCategoryService{
	 
	@Autowired
	private CarCategoryDao carCategoryDao;
	/**
	 * dao分页查询
	 * @param user
	 * @return
	 */
	@Override
	public Pager<CarCategory> findPager(CarCategory carCategory) {
		return carCategoryDao.findPager(carCategory);
	}
	

	

}
