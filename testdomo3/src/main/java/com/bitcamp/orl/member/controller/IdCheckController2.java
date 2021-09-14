package com.bitcamp.orl.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.orl.member.service.CheckService;

@Controller
public class IdCheckController2 {

	@Autowired
	private CheckService service;
	
	@RequestMapping(value="/member/idCheck", method = RequestMethod.POST)
	public String idCheck(@RequestParam("mid") String uid, Model model) {
		
		model.addAttribute("result",service.idCheck(uid));
		
		System.out.println("컨트롤러"+service.idCheck(uid));
		return "member/idcheck";
	}
	
	
}
