package com.bitcamp.orl.mountain.controller;


import com.bitcamp.orl.mountain.domain.MountainDetailInfo;
import com.bitcamp.orl.mountain.domain.MountainLocInfo;
import com.bitcamp.orl.mountain.service.MountainDetailInfoViewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class MountainDetailInfoController {

	@Autowired
	MountainDetailInfoViewService service;

	@RequestMapping("/mountain/mountainDetailInfo")
	public String getMountainLoc(HttpServletRequest request, Model model) {

		String mountainName = null;
		mountainName = request.getParameter("mountainName");
		System.out.println(mountainName);
		MountainLocInfo mountainLocInfo = service.getMountainLocInfo(mountainName);
		MountainDetailInfo mountainDetailInfo = null;
		mountainDetailInfo = service.getMountainDetailInfo(mountainLocInfo.getMountainCode());
		model.addAttribute("mountainDetailInfo",mountainDetailInfo);
		model.addAttribute("mountainLocInfo",mountainLocInfo);
		return "mountain/mountain_info";
	}


}
