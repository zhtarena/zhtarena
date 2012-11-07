package com.zhtarena.oa.web.interceptor;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.zhtarena.oa.util.HibernateUtil;

public class TransactionInterceptor extends AbstractInterceptor{

	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		
		Session session = HibernateUtil.getSession();
		Transaction tx = session.getTransaction();
		if(!tx.isActive()) {
			 tx = session.beginTransaction();
		}
		try {
			String result = actionInvocation.invoke();
			if(tx!=null&& !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.commit();
				tx=null;
			}
			return result;
		} catch(Exception e) {
			e.printStackTrace();
			if(tx!=null) {
				tx.rollback();
				tx=null;
				return "error";	
			}
		} finally {
			HibernateUtil.closeSession();
		}
		return null;
	}

}
