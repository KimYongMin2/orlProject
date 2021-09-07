package com.bitcamp.orl.member.dao;

import java.util.List;

import com.bitcamp.orl.member.domain.Member;
import org.apache.ibatis.annotations.Param;

public interface Dao {
	
	List<Member> selectAll();
	
	int insertMember(Member member);
	
	Member selectByIdPw(@Param("memberId")String memberId, @Param("memberPw")String memberPw);

	int deleteMember(int memberIdx);
}
