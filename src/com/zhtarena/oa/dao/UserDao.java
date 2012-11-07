package com.zhtarena.oa.dao;

import java.util.List;

import com.zhtarena.oa.entity.User;

public interface UserDao {
	//得到所有用户数据
	List<User> findAll() throws Exception;
	void save(User user) throws Exception;
	void update(User user) throws Exception;
	void delete(User user) throws Exception;
	void delete(int id) throws Exception;
	User findById(int id) throws Exception;
	User findByUsername(String username) throws Exception;
}
