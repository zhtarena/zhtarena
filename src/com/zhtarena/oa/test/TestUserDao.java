package com.zhtarena.oa.test;

import java.util.List;

import org.junit.Test;

import com.zhtarena.oa.dao.UserDao;
import com.zhtarena.oa.dao.impl.UserDaoImpl;
import com.zhtarena.oa.entity.User;

public class TestUserDao {
	@Test
	public void findAll() {
		UserDao userDao = new UserDaoImpl();
		try {
			List<User> users = userDao.findAll();
			for(User u : users) {
				System.out.println(u.getId()+" "+u.getName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 这样不能测试，要测试有事务的语句一定要经过servlet的过滤器OpenSessionInViewFilter
	 * 所以这个测试是无效的。
	 * @throws Exception
	 */
//	@Test
	public void save() throws Exception{
		User user = new User();
		user.setName("test");
		UserDao userDao = new UserDaoImpl();
		userDao.save(user);
	}
	
	
}
