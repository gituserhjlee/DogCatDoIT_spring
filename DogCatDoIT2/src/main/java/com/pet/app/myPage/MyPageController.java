package com.pet.app.myPage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("myPage.myPageController")
@RequestMapping("/myPage/*")
public class MyPageController {
	@RequestMapping(value = "main")
	public String main() throws Exception{
		return "myPage/main";
	}
	
	@RequestMapping(value = "attendance")
	public String attendance() throws Exception{
		return "myPage/attendance";
	}
	
	@RequestMapping(value = "calendar")
	public String calendar() throws Exception{
		return "myPage/calendar";
	}
	
	@RequestMapping(value = "setUserProfile", method = RequestMethod.GET)
	String setUserProfile() throws Exception{
		return "myPage/setUserProfile";
	}
}
