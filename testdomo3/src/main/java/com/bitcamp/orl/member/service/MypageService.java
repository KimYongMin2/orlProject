package com.bitcamp.orl.member.service;

import com.bitcamp.orl.member.dao.Dao;
import com.bitcamp.orl.member.domain.Member;
import com.bitcamp.orl.member.domain.MemberEditRequest;
import com.bitcamp.orl.member.domain.MemberRequest;
import com.bitcamp.orl.member.domain.MemberVo;
import com.bitcamp.orl.member.util.CookieBox;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

@Service
public class MypageService {
	
	private Dao dao;
	
	@Autowired
	private SqlSessionTemplate template;

	public Member getMemberSelectByIdx(int memberIdx){

		Member member = null;
		dao = template.getMapper(Dao.class);

		member = dao.selectByIdx(memberIdx);

		return member;
	}

	public int editMember(Member member, MemberEditRequest memberEditRequest) {

		int resultCnt = 0;

		try {
			Member editMember = member;

			editMember.setMemberName(memberEditRequest.getMemberName());
			editMember.setMemberEmail(memberEditRequest.getMemberEmail());
			editMember.setMemberNickname(memberEditRequest.getMemberNickname());
			editMember.setMemberBirth(memberEditRequest.getBirth());

			dao = template.getMapper(Dao.class);
			resultCnt = dao.updateMember(member);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultCnt;
	}
}
