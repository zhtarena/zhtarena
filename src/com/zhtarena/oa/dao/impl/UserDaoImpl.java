package com.zhtarena.oa.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.zhtarena.oa.dao.UserDao;
import com.zhtarena.oa.entity.User;
import com.zhtarena.oa.util.HibernateUtil;

public class UserDaoImpl implements UserDao{
	

	/**
	 * 获得所有的用户数据
	 */
	public List<User> findAll() throws Exception {
		List<User> users= null;
		String hql = "from User";
		users = HibernateUtil.getSession().createQuery(hql).list();
		return users;
	}
	
	/**
	 * 增加用户
	 */
	public void save(User user) throws Exception {
		HibernateUtil.getSession().save(user);
	}

	/**
	 * 通过一个用户来把这个用户删除掉
	 */
	public void delete(User user) throws Exception {
		HibernateUtil.getSession().delete(user);
	}

	/**
	 * 通过一个Id来把对应的用户删除掉
	 */
	public void delete(int id) throws Exception {
		User user = new User();
		user.setId(id);
		HibernateUtil.getSession().delete(user);
	}

	/**
	 * 修改改一个用户的数据
	 */
	public void update(User user) throws Exception {
		HibernateUtil.getSession().update(user);
	}

	/**
	 * 通过id查找
	 */
	public User findById(int id) throws Exception {
		String hql = "from User u where u.id=?";
		Query query = HibernateUtil.getSession().createQuery(hql);
		query.setParameter(1, id);
		return (User)query.list().get(0);
	}
	
	
	/**
	 * 通过username查找
	 */
	public User findByUsername(String username) throws Exception {
		String hql = "from User u where u.username=?";
		Query query = HibernateUtil.getSession().createQuery(hql);
		query.setParameter(0, username);
		User u=null;
		if(query.list().size()>0) {
			u =  (User) query.list().get(0);
		}
		return u;
	}
	
	
}
