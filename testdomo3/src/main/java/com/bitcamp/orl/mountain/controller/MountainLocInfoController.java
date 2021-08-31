package com.bitcamp.orl.mountain.controller;


import com.bitcamp.orl.mountain.domain.MountainLocInfo;
import com.bitcamp.orl.mountain.service.MountainLocInfoViewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class MountainLocInfoController {

	@Autowired
	MountainLocInfoViewService service;

	@RequestMapping("/mountain/mountainLocInfo")
	public String getMountainLoc(HttpServletRequest request, Model model) {

		String loc = null;
		loc = request.getParameter("locName");
		List<MountainLocInfo> mountainLocInfoList = null;
		mountainLocInfoList = service.getMountainLocInfo(loc);
		model.addAttribute("mountainLocInfoList",mountainLocInfoList);
		model.addAttribute("loc", loc);
		return "mountain/local";
	}


}
