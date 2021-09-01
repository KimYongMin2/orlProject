package com.bitcamp.orl.mountain.dao;

import java.util.List;


import com.bitcamp.orl.mountain.domain.MountainLocInfo;
import org.apache.ibatis.annotations.Param;


public interface Dao {

	List<MountainLocInfo> selectByLocName(String var1);
	List<MountainLocInfo> selectByLocNameSeoul();
	List<MountainLocInfo> selectByLocName2(String var1);
	List<MountainLocInfo> selectByLocNameSeoul2();

	MountainLocInfo selectByName(@Param("mountainName")String mountainName);
	int countByLocName(@Param("locName") String var1);
	int countByLocNameSeoul();
}
