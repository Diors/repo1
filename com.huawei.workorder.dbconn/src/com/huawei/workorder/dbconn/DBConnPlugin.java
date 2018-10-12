package com.huawei.workorder.dbconn;

import java.io.InputStream;
import java.net.URL;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.osgi.framework.ServiceReference;

public class DBConnPlugin implements BundleActivator {

	@Override
	public void start(BundleContext context) throws Exception {
		URL resource = context.getBundle().getResource("/resource/mybatis-config.xml");  
		InputStream inputStream = resource.openStream();  
		SqlSessionFactory sqlSessionFactory =
		  new SqlSessionFactoryBuilder().build(inputStream);
		context.registerService(SqlSessionFactory.class, sqlSessionFactory, null);
		
		/**sqlSessionFactory.getConfiguration().addMapper(ITestMapper.class);
		SqlSession session = sqlSessionFactory.openSession();
		ITestMapper testmapper = session.getMapper(ITestMapper.class);
		testmapper.selectuser();
		**/
	}

	@Override
	public void stop(BundleContext context) throws Exception {
		ServiceReference<SqlSessionFactory> reference = context.getServiceReference(SqlSessionFactory.class);
		context.ungetService(reference);
		
	}

}
