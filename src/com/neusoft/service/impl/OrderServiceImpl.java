/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2016年12月15日 21时47分54秒
 */
package com.neusoft.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neusoft.model.Order;
import com.neusoft.utils.Pager;
import com.neusoft.service.OrderService;
import com.neusoft.dao.*;
import com.neusoft.dto.RateDto;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分54秒
 */

@Service("orderService")
public class OrderServiceImpl extends BaseServiceImpl<Order> implements OrderService{
	 
	@Autowired
	private OrderDao orderDao;
	/**
	 * dao分页查询
	 * @param user
	 * @return
	 */
	@Override
	public Pager<Order> findPager(Order order) {
		return orderDao.findPager(order);
	}
	@Override
	public List<RateDto> listAll() {
		// TODO Auto-generated method stub
		return orderDao.listAll();
	}
	

	

}
