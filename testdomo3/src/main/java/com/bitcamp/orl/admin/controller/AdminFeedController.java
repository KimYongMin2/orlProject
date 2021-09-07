package com.bitcamp.orl.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.orl.crew.domain.Crew;
import com.bitcamp.orl.crew.service.CrewListViewService;

@Controller
public class AdminFeedController {

	@Autowired
	private CrewListViewService crewservice;
	
	@RequestMapping("/admin/feed")
	public String FeedList(HttpServletRequest request, Model model) {
		
		List<Crew> crewList = null;
		
		crewList=crewservice.getCrewListAll();
		
		model.addAttribute("crewList",crewList);
		
		
		return "admin/admin_feed";
	}
	
}
