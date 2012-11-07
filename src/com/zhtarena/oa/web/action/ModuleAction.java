package com.zhtarena.oa.web.action;

import java.util.List;

import com.zhtarena.oa.dao.ModuleDao;
import com.zhtarena.oa.dao.impl.ModuleDaoImpl;
import com.zhtarena.oa.entity.Module;

public class ModuleAction extends BasicAction{

	private static final long serialVersionUID = 1L;

	private List<Module> modules;
	ModuleDao dao = new ModuleDaoImpl();
	
	public String findAll() throws Exception {
//		System.out.println("00");
		
		modules = dao.findAll();
		return "success";
	}

	public String list() throws Exception {
		modules = dao.findAll();
		return "list";
	}
	
	
	
	public List<Module> getModules() {
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}
	
	
}
