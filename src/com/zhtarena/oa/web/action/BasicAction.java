package com.zhtarena.oa.web.action;

import java.util.Map;


import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class BasicAction extends ActionSupport implements SessionAware,ServletResponseAware{

	private static final long serialVersionUID = 1L;
	
	protected Map<String, Object> request;
	protected Map<String, Object> session;
	protected Map<String, Object> application;
	protected HttpServletResponse response;

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setApplication(Map<String, Object> application) {
		this.application = application;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

}
