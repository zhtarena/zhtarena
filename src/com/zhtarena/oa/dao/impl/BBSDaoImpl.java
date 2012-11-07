package com.zhtarena.oa.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.zhtarena.oa.dao.BBSDao;
import com.zhtarena.oa.entity.Bbs;
import com.zhtarena.oa.util.HibernateUtil;

public class BBSDaoImpl implements BBSDao {

	public List<Bbs> findRoot(long first, long max) throws Exception {
		List<Bbs> bbs= null;
		String hql = "from Bbs b where b.rootId=0";
		
		Query query = HibernateUtil.getSession().createQuery(hql);
		query.setFirstResult((int)first);
		query.setMaxResults((int)max);
		bbs = query.list();
		return bbs;
	}

	public void insert(Bbs bbs) throws Exception {
		HibernateUtil.getSession().save(bbs);
	}

	public Bbs findById(int id) throws Exception {
		Bbs bbs=null;
		bbs = (Bbs) HibernateUtil.getSession().load(Bbs.class, id);
		return bbs;
	}
	
	public void update(Bbs bbs) throws Exception {
		HibernateUtil.getSession().update(bbs);
	}

	public List<Bbs> findByRootId(int id) throws Exception {
		List<Bbs> subBbs= null;
		String hql = "from Bbs b where b.rootId=?";
		Query query = HibernateUtil.getSession().createQuery(hql);
		query.setInteger(0, id);
		subBbs = query.list();
		return subBbs;
	}
	
	public void delByRootId(int id) throws Exception {
		String hql = "delete from Bbs b where b.rootId=?";
		Query query = HibernateUtil.getSession().createQuery(hql);
		query.setInteger(0, id);
		query.executeUpdate();
	}

	public void del(int id) throws Exception {
		Bbs bbs = new Bbs();
		bbs.setId(id);
		this.del(bbs);
	}

	public void del(Bbs bbs) throws Exception {
		HibernateUtil.getSession().delete(bbs);
	}

	public long findRootCount() throws Exception {
		String hql = "select count(*) from Bbs b where b.rootId=0";
		Query query = HibernateUtil.getSession().createQuery(hql);
		return (Long) query.list().get(0);
	}

	public List<Bbs> findByRootId(int id, long first, long max) throws Exception {
		List<Bbs> subBbs= null;
		String hql = "from Bbs b where b.rootId=?";
		Query query = HibernateUtil.getSession().createQuery(hql);
		query.setInteger(0, id);
		query.setFirstResult((int)first);
		query.setMaxResults((int)max);
		subBbs = query.list();
		return subBbs;
	}

	public long findReBBScount(int id) throws Exception {
		String hql = "select count(*) from Bbs b where b.rootId=?";
		Query query = HibernateUtil.getSession().createQuery(hql);
		query.setInteger(0, id);
		return (Long) query.list().get(0);
	}

}
