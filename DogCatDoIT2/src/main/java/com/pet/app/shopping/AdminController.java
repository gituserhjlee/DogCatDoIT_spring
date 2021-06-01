package com.pet.app.shopping;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shopping/*")
public class AdminController {
	@GetMapping("main")
	public String mainPage() {
		return ".shopping.mainPage";
	}
	
	@GetMapping("admin/dashboard")
	public String adminPage() {
		return ".shopping.admin.dashboard";
	}
	@GetMapping("admin/ItemManage")
	public String ItemManage(Model model) {
		model.addAttribute("mode","insert");
		return ".shopping.admin.ItemManage";
	}
	@PostMapping("admin/item/insert")
	public String insertItem(Item item) {
		
		return "redirect:/shopping/admin/ItemManage";
	}
}
