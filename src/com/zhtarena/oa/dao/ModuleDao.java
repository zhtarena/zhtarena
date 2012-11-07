package com.zhtarena.oa.dao;

import java.util.List;

import com.zhtarena.oa.entity.Module;

public interface ModuleDao {
	
	List<Module> findAll() throws Exception;
	
}
