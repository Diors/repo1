package com.huawei.workorder.servlet;

import org.apache.ibatis.session.SqlSessionFactory;
import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.osgi.util.tracker.ServiceTracker;

public class WoServletPlugin implements BundleActivator {
	private static ServiceTracker sqlSessionFactoryTracker;
	private static BundleContext context;
	
	@Override
	public void start(BundleContext context) throws Exception {
		System.out.println("Bundle start.........");
		this.context = context;
	}

	@Override
	public void stop(BundleContext context) throws Exception {
		
		if(sqlSessionFactoryTracker!=null) {
			sqlSessionFactoryTracker.close();
		}
		if(this.context != null) {
			this.context = null;
		}
	}

	public static SqlSessionFactory getSqlSessionFactoryService() {
		sqlSessionFactoryTracker = new ServiceTracker(context,SqlSessionFactory.class,null);
		sqlSessionFactoryTracker.open();
		SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) sqlSessionFactoryTracker.getService();
		return sqlSessionFactory;
	}
}
