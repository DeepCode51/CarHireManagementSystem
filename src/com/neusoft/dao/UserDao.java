package com.neusoft.dao;
import com.neusoft.base.dao.BaseDao;
import com.neusoft.model.User;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2016年12月15日 21时47分54秒
 */
import com.neusoft.utils.Pager;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分54秒
 */


public interface UserDao extends BaseDao<User>{
	
	/**
	 * dao分页查询
	 * @param user
	 * @return
	 */
	Pager<User> findPager(User user);

	User getByUserName(User user);

	User login(User user);

	User getByUserNameAndQuestion(User user);

	User getByUserNameAndQuestionAndAnswer(User user);
}
