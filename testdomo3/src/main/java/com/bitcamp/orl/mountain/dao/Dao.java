package com.bitcamp.orl.mountain.dao;

import java.util.List;


import com.bitcamp.orl.mountain.domain.MountainLocInfo;
import org.apache.ibatis.annotations.Param;


public interface Dao {

	List<MountainLocInfo> selectByLocName(@Param("locName")String locName);
	List<MountainLocInfo> selectByLocNameSeoul();

	MountainLocInfo selectByName(@Param("mountainName")String mountainName);
}
