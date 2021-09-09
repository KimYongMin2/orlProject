package com.bitcamp.orl.member.controller;

import com.bitcamp.orl.member.domain.Member;
import com.bitcamp.orl.member.domain.MemberEditRequest;
import com.bitcamp.orl.member.domain.MemberRequest;
import com.bitcamp.orl.member.domain.MemberVo;
import com.bitcamp.orl.member.service.MypageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MypageController {

	@Autowired
	private MypageService service;

	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
	public String getMypage(HttpServletRequest request, Model model) {
		MemberVo memberVo = (MemberVo) request.getSession().getAttribute("memberVo");
		Member member = service.getMemberSelectByIdx(memberVo.getMemberIdx());
		model.addAttribute("member", member);
		return "member/mypage_edit";
	}

	@RequestMapping(value = "/member/mypage", method = RequestMethod.POST)
	public String postMypage(HttpServletRequest request, MemberEditRequest memberEditRequest, Model model) {
		MemberVo memberVo = (MemberVo) request.getSession().getAttribute("memberVo");
		Member member = service.getMemberSelectByIdx(memberVo.getMemberIdx());
		int result = service.editMember(member, memberEditRequest);
		model.addAttribute("result", result);
		return "member/update";
	}
	
	@RequestMapping("/member/mypage_pw_change")
	public String getMypagePwChange() {
		return "member/mypage_pw_change";
	}
}
