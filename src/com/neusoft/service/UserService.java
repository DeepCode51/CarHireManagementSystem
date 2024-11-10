package com.neusoft.service;

import com.neusoft.model.User;
import com.neusoft.utils.Pager;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分54秒
 */
public interface UserService extends BaseService<User>{

	/**
	 * dao层分页查询
	 */
	Pager<User> findPager(User user);

	User getByUserName(User user);

	User login(User user);

	User getByUserNameAndQuestion(User user);

	User getByUserNameAndQuestionAndAnswer(User user);
}
