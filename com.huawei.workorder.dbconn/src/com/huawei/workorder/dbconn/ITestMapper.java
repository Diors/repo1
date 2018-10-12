package com.huawei.workorder.dbconn;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
@Mapper 
public interface ITestMapper {

	@Select("select count(1) from user")
	int selectuser();	
}
