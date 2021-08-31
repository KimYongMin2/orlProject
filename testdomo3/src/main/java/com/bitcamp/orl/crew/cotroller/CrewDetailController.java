package com.bitcamp.orl.crew.cotroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CrewDetailController {
	
	@RequestMapping("/crew/detail")
	public String getCrewDetail() {
		return "crew/detail";
	}
	
}
