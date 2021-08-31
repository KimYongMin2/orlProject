package com.bitcamp.orl.crew.dao;

import java.util.List;

import com.bitcamp.orl.crew.domain.Crew;
import com.bitcamp.orl.crew.domain.SearchType;
import org.apache.ibatis.annotations.Param;


public interface Dao {

	List<Crew> selectAll();

	List<Crew> selectAll(SearchType searchType);
	
	List<Crew> selectMyCrewList(@Param("memberIdx")int memberIdx);

	List<Crew> selectMyCrewList(@Param("memberIdx")int memberIdx, SearchType searchType);

}
