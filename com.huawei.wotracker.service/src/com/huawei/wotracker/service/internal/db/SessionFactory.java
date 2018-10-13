package com.huawei.wotracker.service.internal.db;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import org.apache.ibatis.binding.MapperRegistry;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.huawei.wotracker.WoTrackerServicePlugin;

public class SessionFactory {
	
	private static SqlSessionFactory sqlSessionFactory;
	
	public SessionFactory() {
		URL resource = WoTrackerServicePlugin.context.getBundle().getResource("/resource/mybatis-config.xml");  
		try {
			InputStream inputStream = resource.openStream(); 
			sqlSessionFactory =
					  new SqlSessionFactoryBuilder().build(inputStream);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSession openSession(Class clazz) {
		MapperRegistry mapperRegistry = sqlSessionFactory.getConfiguration().getMapperRegistry();
		if(!mapperRegistry.getMappers().contains(clazz)) {
			sqlSessionFactory.getConfiguration().addMapper(clazz);
		}
		return sqlSessionFactory.openSession();
	}
}
