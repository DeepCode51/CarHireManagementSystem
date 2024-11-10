package com.neusoft.dao.impl;
import org.hibernate.Query;
import org.hibernate.transform.Transformers;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2016年12月15日 21时47分54秒
 */
import org.springframework.stereotype.Repository;
import com.neusoft.model.Order;
import com.neusoft.utils.Pager;
import com.neusoft.base.dao.impl.BaseDaoImpl;
import java.util.*;
import com.neusoft.dao.*;
import com.neusoft.dto.RateDto;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分54秒
 */

@Repository
public class OrderDaoImpl extends BaseDaoImpl<Order> implements OrderDao{
	
 /**
  * 分页查询
  */
	@Override
	public Pager<Order> findPager(Order order) {
		if(order.getId() !=0 && !"".equals(order.getId() )){
	    	   String hql = "from Order";
	    	   Map<String,Object> alias = new HashMap<String,Object>();
	   		   alias.put("1", "%" +order.getId()+ "%" );
	   		  return findByAlias(hql, alias);
	       }else{
	    	   String hql = "from Order where 1=1 order by id desc ";
				return findByAlias(hql, null);
	       }
	}

	/**
	 * 利润统计
	 */
		@Override
		public List<RateDto> listAll() {
		    String sql ="select SUM(o.totalPrice) AS price  ,DATE_FORMAT(o.finishTime, '%Y-%m') as month  FROM t_order o GROUP BY DATE_FORMAT(o.finishTime, '%Y-%m')";
		    Query qu = this.getSession().createSQLQuery(sql);
	        qu.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
	        List<Map<String,Object>>  list = qu.list();
            List<RateDto> rateList=new ArrayList<RateDto>();
            for(Map<String,Object> map : list){
            	RateDto rateDto=new RateDto();
            	if(map.get("month")!=null){
             	   rateDto.setMonth(map.get("month").toString());
                }
            	rateDto.setPrice(String.valueOf(map.get("price")));
                 rateList.add(rateDto);
            }
		    return rateList;
		}
	
}
