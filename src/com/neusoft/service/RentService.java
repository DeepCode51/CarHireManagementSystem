package com.neusoft.service;

import com.neusoft.model.Rent;
import com.neusoft.utils.Pager;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分54秒
 */
public interface RentService extends BaseService<Rent>{

	/**
	 * dao层分页查询
	 */
	Pager<Rent> findPager(Rent rent);
}
