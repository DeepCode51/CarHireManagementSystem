package com.neusoft.dao.impl;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2016年12月15日 21时47分53秒
 */
import org.springframework.stereotype.Repository;
import com.neusoft.model.Car;
import com.neusoft.utils.Pager;
import com.neusoft.base.dao.impl.BaseDaoImpl;
import java.util.*;
import com.neusoft.dao.*;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分53秒
 */

@Repository
public class CarDaoImpl extends BaseDaoImpl<Car> implements CarDao{
	
 /**
  * 分页查询
  */
	@Override
	public Pager<Car> findPager(Car Car) {
		if(Car.getId() !=0 && !"".equals(Car.getId() )){
	    	   String hql = "from Car";
	    	   Map<String,Object> alias = new HashMap<String,Object>();
	   		   alias.put("1", "%" +Car.getId()+ "%" );
	   		  return findByAlias(hql, alias);
	       }else{
	    	   String hql = "from Car where 1=1 order by id desc ";
				return findByAlias(hql, null);
	       }
	}
	
}
