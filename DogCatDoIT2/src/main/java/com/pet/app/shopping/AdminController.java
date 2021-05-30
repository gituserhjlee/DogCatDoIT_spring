package com.pet.app.shopping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shopping/*")
public class AdminController {
	@GetMapping("admin")
	public String mainPage() {
		return ".shopping.mainPage";
	}
	
}
