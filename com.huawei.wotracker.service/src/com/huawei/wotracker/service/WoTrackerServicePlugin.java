package com.huawei.wotracker.service;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceReference;

public class WoTrackerServicePlugin implements BundleActivator {
	public static BundleContext context;

	@Override
	public void start(BundleContext context) throws Exception {
		this.context = context;
		
		/**sqlSessionFactory.getConfiguration().addMapper(ITestMapper.class);
		SqlSession session = sqlSessionFactory.openSession();
		ITestMapper testmapper = session.getMapper(ITestMapper.class);
		testmapper.selectuser();
		**/
	}

	@Override
	public void stop(BundleContext context) throws Exception {
		if(this.context !=null) {
			this.context = null;
		}
		
	}
	
}
