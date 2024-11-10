package com.neusoft.service;

import com.neusoft.model.Car;
import com.neusoft.utils.Pager;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分53秒
 */
public interface CarService extends BaseService<Car>{

	/**
	 * dao层分页查询
	 */
	Pager<Car> findPager(Car Car);
}
