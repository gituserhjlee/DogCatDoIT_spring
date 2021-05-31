package com.pet.app.myPage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("myPage.myPageController")
@RequestMapping("/myPage/*")
public class MyPageController {
	@RequestMapping(value = "attendance")
	public String attendance() throws Exception{
		
		return "/myPage/attendance";
	}
}
