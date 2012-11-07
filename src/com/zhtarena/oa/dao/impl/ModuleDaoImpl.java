package com.zhtarena.oa.dao.impl;

import java.util.List;

import com.zhtarena.oa.dao.ModuleDao;
import com.zhtarena.oa.entity.Module;
import com.zhtarena.oa.util.HibernateUtil;

public class ModuleDaoImpl implements ModuleDao {

	public List<Module> findAll() throws Exception {
		List<Module> modules= null;
		String hql = "from Module m order by m.sort";
		modules = HibernateUtil.getSession().createQuery(hql).list();
		return modules;
	}


}
