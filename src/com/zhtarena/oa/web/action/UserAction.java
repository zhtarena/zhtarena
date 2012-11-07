package com.zhtarena.oa.web.action;

import com.zhtarena.oa.dao.UserDao;
import com.zhtarena.oa.dao.impl.UserDaoImpl;
import com.zhtarena.oa.entity.User;

public class UserAction extends BasicAction{

	private static final long serialVersionUID = 1L;
	
	private User user;

	public String login() throws Exception{
		UserDao userDao = new UserDaoImpl();
		System.out.println(user.getUsername());
		if(null != user) {
			User u = userDao.findByUsername(user.getUsername());
			if(null!=u) {
				if(u.getPassword().equals(user.getPassword())) {
					return "success";
				} else {
					session.put("wrongPwd", "wrong password");
					return "fail";
				}
			}
		}
		session.put("noUser", "no User");
		return "fail";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
