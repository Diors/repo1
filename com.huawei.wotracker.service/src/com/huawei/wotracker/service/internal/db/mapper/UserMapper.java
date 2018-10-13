package com.huawei.wotracker.service.internal.db.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Select;

public interface UserMapper {

	@Select("select * from user where user_code=#{userCode}")
	public Map selectUserByCode(String userCode);
	
	
	
}
