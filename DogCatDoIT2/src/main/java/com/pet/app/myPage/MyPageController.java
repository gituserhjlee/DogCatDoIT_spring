package com.pet.app.myPage;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pet.app.member.SessionInfo;

@Controller("myPage.myPageController")
@RequestMapping("/myPage/*")
public class MyPageController {
	@Autowired
	private MyPageService service;
	
	@RequestMapping(value = "main")
	public String main() throws Exception{
		return ".myPage.main";
	}
	
	@RequestMapping(value = "attendance")
	public String attendance() throws Exception{
		return ".myPage.attendance";
	}
	
	@RequestMapping(value = "calendar")
	public String calendar() throws Exception{
		return ".myPage.calendar";
	}
	
	@RequestMapping(value = "userProfile", method = RequestMethod.GET)
	String userProfile(
			@RequestParam int orderNum,
			HttpSession session,
			Model model) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		int countUserProfile = 0;
		countUserProfile = service.countUserProfile(userId);
		
		if(countUserProfile==0) {
			model.addAttribute("mode", "insert");
			return ".myPage.setUserProfile";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("orderNum", orderNum);
		
		UserProfile dto = service.readUserProfile(map);
		dto.setAnimalAge(service.setAge(dto.getProfileNum()));
		
		model.addAttribute("profileNum", dto.getProfileNum());
		model.addAttribute("orderNum", dto.getOrderNum());
		model.addAttribute("countUserProfile", countUserProfile);
		model.addAttribute("animalName", dto.getAnimalName());
		model.addAttribute("animalBirth", dto.getAnimalBirth());
		model.addAttribute("animalAge", dto.getAnimalAge());
		model.addAttribute("animalKind", dto.getAnimalKind());
		model.addAttribute("region", dto.getRegion());
		model.addAttribute("introduce", dto.getIntroduce());
		model.addAttribute("animalPhoto", dto.getAnimalPhoto());

		return ".myPage.userProfile";
	}
	
	@RequestMapping(value = "insertUserProfile", method = RequestMethod.GET)
	String insertUserProfile(Model model) throws Exception{
		
		model.addAttribute("mode", "insert");
		
		return ".myPage.setUserProfile";
	}
	
	@RequestMapping(value = "updateUserProfile", method = RequestMethod.GET)
	String updateUserProfile(
			@RequestParam int orderNum,
			HttpSession session,
			Model model
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("orderNum", orderNum);
		
		UserProfile dto = service.readUserProfile(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode","update");
		
		return ".myPage.setUserProfile";
	}
	
	@RequestMapping(value = "insertUserProfile", method = RequestMethod.POST)
	String insertUserProfileSubmit(
			UserProfile dto,
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root+"uploads"+File.separator+"userProfile";
		try {
			dto.setUserId(info.getUserId());
			service.insertUserProfile(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/myPage/userProfile?orderNum=1";
	}
	
	@RequestMapping(value = "updateUserProfile", method = RequestMethod.POST)
	String updateUserProfileSubmit(
			UserProfile dto,
			HttpSession session
			) throws Exception{
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+"uploads"+File.separator+"userProfile";
		try {
			service.updateUserProfile(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/myPage/userProfile?orderNum=1";
	}
	
	@RequestMapping(value = "deleteUserProfile")
	String deleteUserProfile(
			@RequestParam int profileNum,
			@RequestParam String animalPhoto,
			HttpSession session
			) throws Exception{
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+"uploads"+File.separator+"userProfile";
		
		try {
			pathname += File.separator+animalPhoto;
			service.deleteUserProfile(profileNum, pathname);			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/myPage/userProfile?orderNum=1";
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
