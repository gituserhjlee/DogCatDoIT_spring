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
	
	@RequestMapping(value = "setMasterProfile", method = RequestMethod.GET)
	String setMasterProfile() throws Exception{
		return "myPage/setMasterProfile";
	}
	@RequestMapping(value = "setMasterProfile", method = RequestMethod.POST)
	String setMasterProfileSubmit() throws Exception{
		return "myPage/setMasterProfile";
	}
	@RequestMapping(value = "setCompanyProfile", method = RequestMethod.GET)
	String setCompanyProfile() throws Exception{
		return "myPage/setCompanyProfile";
	}
	@RequestMapping(value = "setCompanyProfile", method = RequestMethod.POST)
	String setCompanyProfileSubmit() throws Exception{
		return "myPage/setCompanyProfile";
	}
	@RequestMapping(value = "qualification", method = RequestMethod.GET)
	String qualification() throws Exception{
		return "myPage/qualification";
	}
	@RequestMapping(value = "qualification", method = RequestMethod.POST)
	String qualificationSubmit() throws Exception{
		return "myPage/qualification";
	}
	@RequestMapping(value = "checkPwd")
	String checkPwd() throws Exception{
		return "myPage/checkPwd";
	}
	@RequestMapping(value = "setMember", method = RequestMethod.GET)
	String setMember() throws Exception{
		return "myPage/setMember";
	}
	@RequestMapping(value = "setMember", method = RequestMethod.POST)
	String setMemberSubmit() throws Exception{
		return "myPage/setMember";
	}
	@RequestMapping(value = "deleteMember", method = RequestMethod.GET)
	String deleteMember() throws Exception{
		return "myPage/deleteMember";
	}
	@RequestMapping(value = "deleteMember", method = RequestMethod.POST)
	String deleteMemberSubmit() throws Exception{
		return "myPage/deleteMember";
	}
	@RequestMapping(value = "written")
	String written() throws Exception{
		return "myPage/written";
	}
	@RequestMapping(value = "reserve")
	String reserve() throws Exception{
		return "myPage/reserve";
	}
	@RequestMapping(value = "point")
	String point() throws Exception{
		return "myPage/point";
	}
	@RequestMapping(value = "cupon")
	String cupon() throws Exception{
		return "myPage/cupon";
	}
	@RequestMapping(value = "purchase")
	String purchase() throws Exception{
		return "myPage/purchase";
	}
	@RequestMapping(value = "zzim")
	String zzim() throws Exception{
		return "myPage/zzim";
	}
	@RequestMapping(value = "cart")
	String cart() throws Exception{
		return "myPage/cart";
	}
}
