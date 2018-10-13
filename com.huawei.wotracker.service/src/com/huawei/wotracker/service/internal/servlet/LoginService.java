package com.huawei.wotracker.service.internal.servlet;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.huawei.wotracker.service.internal.db.SessionFactory;
import com.huawei.wotracker.service.internal.db.mapper.UserMapper;
import com.huawei.wotracker.service.servlet.ILoginService;

public class LoginService implements ILoginService {

	@Override
	public String loginValidate(String username, String password) {
		SqlSession session = SessionFactory.openSession(UserMapper.class);

		UserMapper usermapper = session.getMapper(UserMapper.class);
		Map user = usermapper.selectUserByCode(username);
		if (user == null || user.isEmpty()) {
			return ILoginService.ERR_USER_NOT_EXIST;
		} else {
			String dbpassword = (String) user.get("password");
			if(!password.equals(dbpassword)) {
				return  ILoginService.ERR_PASSWORD;
			}
		}
		return ILoginService.SUSS_LOGIN;
	}

}
