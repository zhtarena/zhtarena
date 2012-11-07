package com.zhtarena.oa.test;

import com.zhtarena.oa.dao.UserDao;
import com.zhtarena.oa.dao.impl.UserDaoImpl;
import com.zhtarena.oa.entity.User;
import com.zhtarena.oa.web.action.BasicAction;

public class TestAction extends BasicAction{
	private static final long serialVersionUID = 1L;
	
	private User user;
	
	public String addUser() throws Exception {
		UserDao dao = new UserDaoImpl();
		dao.save(user);
		return "success";
	}
	
	public String delUser() throws Exception {
		UserDao dao = new UserDaoImpl();
		dao.delete(user);
		return "success";
	}
	
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
