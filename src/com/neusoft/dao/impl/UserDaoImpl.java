package com.neusoft.dao.impl;
import org.hibernate.Query;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2016年12月15日 21时47分54秒
 */
import org.springframework.stereotype.Repository;

import com.neusoft.model.User;
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
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{
	
 /**
  * 分页查询
  */
	@Override
	public Pager<User> findPager(User user) {
		if(user.getId() !=0 && !"".equals(user.getId() )){
	    	   String hql = "from User";
	    	   Map<String,Object> alias = new HashMap<String,Object>();
	   		   alias.put("1", "%" +user.getId()+ "%" );
	   		  return findByAlias(hql, alias);
	       }else{
	    	   String hql = "from User where 1=1 order by id desc ";
				return findByAlias(hql, null);
	       }
	}

	 /**
     * 根据用户名查询该用户是否存在
     */
	@Override
	public User getByUserName(User user) {
		String hql = "from User bean where bean.loginName =:loginName and bean.isDelete=0";
		Query q =this.getSession().createQuery(hql);
		q.setParameter("loginName", user.getLoginName());
		return (User)q.uniqueResult();
	}
	
	/**
	 * 根据用户名和密码查询
	 */
	@Override
	public User login(User user) {
		String hql = "from User bean where bean.loginName =:loginName and bean.passWord= :passWord and bean.isDelete=0";
		Query q =this.getSession().createQuery(hql);
		q.setParameter("loginName", user.getLoginName());
		q.setParameter("passWord", user.getPassWord());
		return (User)q.uniqueResult();
	}

	/**
	 * 根据用户名和问题查询判断该问题是否正确
	 */
	@Override
	public User getByUserNameAndQuestion(User user) {
		String hql = "from User bean where bean.loginName =:loginName and bean.question =:question and bean.isDelete=0";
		Query q =this.getSession().createQuery(hql);
		q.setParameter("loginName", user.getLoginName());
		q.setParameter("question", user.getQuestion());
		return (User)q.uniqueResult();
	}


	/**
	 * 根据用户名和问题和答案查询判断该问题是否正确
	 */
	@Override
	public User getByUserNameAndQuestionAndAnswer(User user) {
		String hql = "from User bean where bean.loginName =:loginName and bean.question =:question  and bean.answer =:answer and bean.isDelete=0";
		Query q =this.getSession().createQuery(hql);
		q.setParameter("loginName", user.getLoginName());
		q.setParameter("question", user.getQuestion());
		q.setParameter("answer", user.getAnswer());
		return (User)q.uniqueResult();
	}
	
}
