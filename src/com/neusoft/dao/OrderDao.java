package com.neusoft.dao;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2016年12月15日 21时47分54秒
 */
import com.neusoft.utils.Pager;

import java.util.List;

import com.neusoft.base.dao.BaseDao;
import com.neusoft.dto.RateDto;
import com.neusoft.model.*;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分54秒
 */


public interface OrderDao extends BaseDao<Order>{
	
	/**
	 * dao分页查询
	 * @param user
	 * @return
	 */
	Pager<Order> findPager(Order order);

	List<RateDto> listAll();
}
