package com.bitcamp.orl.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bitcamp.orl.member.domain.Member;

public interface Dao {

	//회원 가입
	int insertMember(Member member);

	//로그인
	Member selectByIdPw(@Param("memberId")String memberId, @Param("memberPw")String memberPw);

	//아이디체크
	int selectById(String memberId);

	//닉네임 체크
	int selectByNickName(String memberNickname);

	// 회원 정보 삭제
	int deleteMember(int memberIdx);

	//회원 정보 수정
	int updateMember(Member member);

	// 회원 리스트
	List<Member> selectAll();

	// idx에 해당하는 member
	Member selectByIdx(int idx);


}