package com.neusoft.dao.impl;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2016年12月15日 21时47分53秒
 */
import org.springframework.stereotype.Repository;
import com.neusoft.model.CarCategory;
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
public class CarCategoryDaoImpl extends BaseDaoImpl<CarCategory> implements CarCategoryDao{
	
 /**
  * 分页查询
  */
	@Override
	public Pager<CarCategory> findPager(CarCategory carCategory) {
		if(carCategory.getId() !=0 && !"".equals(carCategory.getId() )){
	    	   String hql = "from CarCategory";
	    	   Map<String,Object> alias = new HashMap<String,Object>();
	   		   alias.put("1", "%" +carCategory.getId()+ "%" );
	   		  return findByAlias(hql, alias);
	       }else{
	    	   String hql = "from CarCategory where 1=1 order by id desc ";
				return findByAlias(hql, null);
	       }
	}
	
}
