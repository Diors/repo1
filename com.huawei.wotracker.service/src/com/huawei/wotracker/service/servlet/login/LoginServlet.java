package com.huawei.wotracker.service.servlet.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.osgi.util.tracker.ServiceTracker;

import com.huawei.wotracker.service.ILoginService;


public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = -4888332961024302028L;
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		

	}
	

}
