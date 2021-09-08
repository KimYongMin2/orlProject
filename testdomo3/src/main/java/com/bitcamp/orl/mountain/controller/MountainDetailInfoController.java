package com.bitcamp.orl.mountain.controller;


import com.bitcamp.orl.mountain.domain.MountainLocInfo;
import com.bitcamp.orl.mountain.service.MountainDetailInfoViewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MountainDetailInfoController {

	@Autowired
	MountainDetailInfoViewService service;

	// 산 상세 보여주는 컨트롤러
	@RequestMapping("/mountain/mountainDetailInfo")
	public String getMountainLoc(HttpServletRequest request, Model model) {

		String mountainName = null;
		mountainName = request.getParameter("mountainName");
		MountainLocInfo mountainLocInfo = service.getMountainLocInfo(mountainName);
		model.addAttribute("mountainLocInfo",mountainLocInfo);
		return "mountain/mountain_info";
	}

}
