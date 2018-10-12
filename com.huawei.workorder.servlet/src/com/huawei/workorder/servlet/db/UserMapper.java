package com.huawei.workorder.servlet.db;

import org.apache.ibatis.annotations.Select;

public interface UserMapper {

	@Select("select count(1) from user where user_code= #{usercode}")
	int selectUserCntByCode(String usercode);

}
