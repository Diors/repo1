package com.huawei.wotracker.service.servlet;

public interface ILoginService {
	public static String SUSS_LOGIN="LOGIN-000000";
	public static String ERR_USER_NOT_EXIST="LOGIN-100001";
	public static String ERR_PASSWORD="LOGIN-100002";
	
	public String loginValidate(String username,String password);
}
