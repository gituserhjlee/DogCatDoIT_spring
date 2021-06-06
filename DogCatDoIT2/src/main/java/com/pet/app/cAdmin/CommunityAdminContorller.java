package com.pet.app.cAdmin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("cAdmin.CommunityAdminController")
@RequestMapping("/cAdmin/*")
public class CommunityAdminContorller {
	
	@RequestMapping("main")
	public String main() throws Exception{
		return "cAdmin/main";
	}
	
	@RequestMapping("memberManager")
	public String memberManager() throws Exception{
		return "cAdmin/memberManager";
	}
	
	@RequestMapping("memberDetail")
	public String memberDetail() throws Exception{
		return "cAdmin/memberDetail";
	}
	
	@RequestMapping("qualificationManager")
	public String qualificationManager() throws Exception{
		return "cAdmin/qualificationManager";
	}
	
	@RequestMapping("postManager")
	public String postManager() throws Exception{
		return "cAdmin/postManager";
	}
}
