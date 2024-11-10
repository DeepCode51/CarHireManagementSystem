package com.neusoft.dao.impl;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2016年12月15日 21时47分54秒
 */
import org.springframework.stereotype.Repository;
import com.neusoft.model.Rent;
import com.neusoft.utils.Pager;
import com.neusoft.base.dao.impl.BaseDaoImpl;
import java.util.*;
import com.neusoft.dao.*;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分54秒
 */

@Repository
public class RentDaoImpl extends BaseDaoImpl<Rent> implements RentDao{
	
 /**
  * 分页查询
  */
	@Override
	public Pager<Rent> findPager(Rent rent) {
		if(rent.getId() !=0 && !"".equals(rent.getId() )){
	    	   String hql = "from Rent";
	    	   Map<String,Object> alias = new HashMap<String,Object>();
	   		   alias.put("1", "%" +rent.getId()+ "%" );
	   		  return findByAlias(hql, alias);
	       }else{
	    	   String hql = "from Rent where 1=1 order by id desc ";
				return findByAlias(hql, null);
	       }
	}
	
}
