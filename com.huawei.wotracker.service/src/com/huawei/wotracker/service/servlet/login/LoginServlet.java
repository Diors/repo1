package com.huawei.wotracker.service.servlet.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huawei.wotracker.service.internal.LoginService;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = -4888332961024302028L;

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		LoginService loginService = new LoginService();

		String retCode = loginService.loginValidate(username, password);

		if (LoginService.RET_SUCCESS.equals(retCode)) {
			request.getSession().setAttribute("username", loginService.getUserRealName());
			request.getSession().setAttribute("usercode", username);
			request.getSession().setAttribute("login_status", true);
		}
		PrintWriter out = response.getWriter();
		out.print(retCode);
		out.close();
	}

}
