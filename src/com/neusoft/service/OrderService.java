package com.neusoft.service;

import java.util.List;

import com.neusoft.dto.RateDto;
import com.neusoft.model.Order;
import com.neusoft.utils.Pager;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分54秒
 */
public interface OrderService extends BaseService<Order>{

	/**
	 * dao层分页查询
	 */
	Pager<Order> findPager(Order Order);

	List<RateDto> listAll();
}
