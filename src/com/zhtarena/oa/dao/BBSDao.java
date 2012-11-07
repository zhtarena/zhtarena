package com.zhtarena.oa.dao;

import java.util.List;

import com.zhtarena.oa.entity.Bbs;

public interface BBSDao {
	List<Bbs> findRoot(long first, long max)throws Exception;
	void insert(Bbs bbs) throws Exception;
	Bbs findById(int id) throws Exception;
	void update(Bbs bbs) throws Exception;
	List<Bbs> findByRootId(int id, long first, long max) throws Exception;
	List<Bbs> findByRootId(int id) throws Exception;
	void del(int id) throws Exception;
	void del(Bbs bbs) throws Exception;
	void delByRootId(int id) throws Exception;
	long findRootCount() throws Exception;
	long findReBBScount(int id) throws Exception;
}
