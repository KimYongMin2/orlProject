package com.bitcamp.orl.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class test {

	@RequestMapping(value="/member/naver", method=RequestMethod.GET)
	public String loginPOSTNaver(HttpSession session) {
		
		return "member/naver";
	}
}
