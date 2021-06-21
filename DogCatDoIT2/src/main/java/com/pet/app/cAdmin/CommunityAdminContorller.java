package com.pet.app.cAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.app.common.MyUtil;
import com.pet.app.myPage.MyPageService;
import com.pet.app.myPage.Qualification;

@Controller("cAdmin.CommunityAdminController")
@RequestMapping("/cAdmin/*")
public class CommunityAdminContorller {
	@Autowired
	private CommunityAdminService service;
	
	@Autowired
	private MyPageService mService;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("main")
	public String main() throws Exception{
		return ".cAdmin.main";
	}
	
	@RequestMapping("memberManager")
	public String memberManager(
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpServletRequest req,
			Model model
			) throws Exception{
		String cp = req.getContextPath();
   	    
		int rows = 10;
		int total_page = 0;
		int memberCount = 0;
   	    
		memberCount = service.memberCount();
		if(memberCount != 0)
            total_page = myUtil.pageCount(rows, memberCount);
		
		if(total_page < current_page) 
            current_page = total_page;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);
        
        List<Member> list = service.listMember(map);
        
        int listNum, n = 0;
        for(Member dto : list) {
            listNum = memberCount - (offset + n);
            dto.setListNum(listNum);
            n++;
        }
        
        String listUrl = cp+"/cAdmin/memberManager";
        
        String paging = myUtil.paging(current_page, total_page, listUrl); 
        
        model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("memberCount", memberCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        
		return ".cAdmin.memberManager";
	}
	
	@RequestMapping("memberDetail")
	public String memberDetail(
			@RequestParam String userId,
			Model model
			) throws Exception{
		Member dto = service.readMember(userId);
		
		model.addAttribute("dto", dto);
		
		return "cAdmin/memberDetail";
	}
	
	@RequestMapping(value = "updateMember", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateMemberSubmit(
			Member dto,
			@RequestParam long clevel,
			@RequestParam long point,
			@RequestParam String userId,
			@RequestParam long userIdx
			) throws Exception{
		String state = "true";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("userIdx", userIdx);
			map.put("clevel", clevel);
			map.put("point", point);
			if(clevel!=dto.getClevel()) {
				service.updateClevel(map);				
			}
			if(point!=dto.getPoint()) {
				service.updatePoint(map);				
			}
		} catch (Exception e) {
			e.printStackTrace();
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping("deleteMember")
	@ResponseBody
	public Map<String, Object> deleteMemberSubmit(String userId) throws Exception{
		String state = "true";
		try {
			service.deleteQualification(userId);
			mService.deleteMember(userId);
		} catch (Exception e) {
			state="false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping("qualificationManager")
	public String qualificationManager(
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpServletRequest req,
			Model model
			) throws Exception{
		String cp = req.getContextPath();
   	    
		int rows = 10;
		int total_page = 0;
		int requestCount = 0;
		
		requestCount = service.requestCount();
		
		if(requestCount != 0)
            total_page = myUtil.pageCount(rows, requestCount);
		
		if(total_page < current_page) 
            current_page = total_page;
		
		int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", offset);
		map.put("rows", rows);
		List<Qualification> list = service.listRequestQualification(map);
		
		int listNum, n = 0;
        for(Qualification dto : list) {
            listNum = requestCount - (offset + n);
            dto.setListNum(listNum);
            n++;
        }
        
        String listUrl = cp+"/cAdmin/qualificationManager";
        
        String paging = myUtil.paging(current_page, total_page, listUrl); 
        
        model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("requestCount", requestCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        
		return ".cAdmin.qualificationManager";
	}
	
	@RequestMapping("qualificationDetail")
	public String qualificationDetail(
			@RequestParam int requestNum,
			Model model
			) throws Exception{
		Qualification dto = mService.readRequestQualification(requestNum);
		
		model.addAttribute("dto", dto);
		
		return "cAdmin/qualificationDetail";
	}
	
	@RequestMapping("postManager")
	public String postManager() throws Exception{
		return ".cAdmin.postManager";
	}
}
