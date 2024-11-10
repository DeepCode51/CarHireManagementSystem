/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2016年12月15日 21时47分54秒
 */
package com.neusoft.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neusoft.model.User;
import com.neusoft.utils.Pager;
import com.neusoft.service.UserService;
import com.neusoft.dao.*;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2016年12月15日 21时47分54秒
 */

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{
	 
	@Autowired
	private UserDao userDao;
	/**
	 * dao分页查询
	 * @param user
	 * @return
	 */
	@Override
	public Pager<User> findPager(User user) {
		return userDao.findPager(user);
	}
	@Override
	public User getByUserName(User user) {
		// TODO Auto-generated method stub
		return userDao.getByUserName(user);
	}
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return userDao.login(user);
	}
	@Override
	public User getByUserNameAndQuestion(User user) {
		// TODO Auto-generated method stub
		return userDao.getByUserNameAndQuestion(user);
	}
	@Override
	public User getByUserNameAndQuestionAndAnswer(User user) {
		// TODO Auto-generated method stub
		return userDao.getByUserNameAndQuestionAndAnswer(user);
	}
	

	

}
