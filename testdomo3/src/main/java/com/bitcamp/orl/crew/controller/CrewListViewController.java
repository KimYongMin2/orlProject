package com.bitcamp.orl.crew.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.orl.crew.domain.Crew;
import com.bitcamp.orl.crew.domain.SearchType;
import com.bitcamp.orl.crew.service.CrewListViewService;

@Controller
@RequestMapping("/crew/list")
public class CrewListViewController {
	
	@Autowired
	CrewListViewService service;
	
	@RequestMapping(method = RequestMethod.GET)
	public String getCrewList(
			HttpServletRequest request,
			Model model,
			@ModelAttribute("searchType")SearchType searchType
			) {
		
		//내 크루 리스트 처리//
		List<Crew> myCrewList = null;
		myCrewList = service.getMyCrewList(request);
		model.addAttribute("myCrewList", myCrewList);
		
		//크루 검색기능 더해서 전체 크루 리스트 처리		
		List<Crew> list = null;
		if(searchType.getKeyword() !=null && searchType.getKeyword().trim().length() > 0) {
			list= service.getCrewListAll(searchType);
		} else {
			list = service.getCrewListAll();
		}
		model.addAttribute("crewList", list);
		
		return "crew/list";
	}
	
}
