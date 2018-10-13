package com.huawei.wotracker.servlet.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.huawei.wotracker.servlet.WoServletPlugin;
import com.huawei.wotracker.servlet.db.UserMapper;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = -4888332961024302028L;
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		
		
		
		
		
		SqlSessionFactory sqlSessionFactory = WoServletPlugin.getSqlSessionFactoryService();
		sqlSessionFactory.getConfiguration().addMapper(UserMapper.class);
		SqlSession session = sqlSessionFactory.openSession();
		UserMapper usermapper = session.getMapper(UserMapper.class);
		int count = usermapper.selectUserCntByCode("12345");
		System.out.println("user count is:" + count);
	}
	

}
