package com.huawei.wotracker.service.internal;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.huawei.wotracker.service.internal.db.SessionFactory;
import com.huawei.wotracker.service.internal.db.mapper.UserMapper;

public class LoginService{
	public static String RET_SUCCESS="000000";
	public static String ERR_USER_NOT_EXIST="ERR-LOGIN-000001";
	public static String ERR_PASSWORD_ERROR="ERR-LOGIN-000002";

	private String realName;
	public String loginValidate(String username, String password) {
		SqlSession session = SessionFactory.openSession(UserMapper.class);

		UserMapper usermapper = session.getMapper(UserMapper.class);
		Map user = usermapper.selectUserByCode(username);
		if (user == null || user.isEmpty()) {
			return ERR_USER_NOT_EXIST;
		} else {
			String dbpassword = (String) user.get("password");
			if(!password.equals(dbpassword)) {
				return  ERR_PASSWORD_ERROR;
			}
		}
		realName = user.get("user_name").toString();
		return RET_SUCCESS;
	}
	
	

	public String getUserRealName() {
		return realName;
	}
}
