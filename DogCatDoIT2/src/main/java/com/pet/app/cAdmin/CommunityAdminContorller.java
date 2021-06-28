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

import com.pet.app.common.MyUtilGeneral;
import com.pet.app.myPage.MyPageService;
import com.pet.app.myPage.PointHistory;
import com.pet.app.myPage.Posting;
import com.pet.app.myPage.Qualification;
import com.pet.app.shopping.Order;

@Controller("cAdmin.CommunityAdminController")
@RequestMapping("/cAdmin/*")
public class CommunityAdminContorller {
	@Autowired
	private CommunityAdminService service;
	
	@Autowired
	private MyPageService mService;
	
	@Autowired
	private MyUtilGeneral myUtil;
	
	@RequestMapping("main")
	public String main() throws Exception{
		return ".cAdmin.main";
	}
	
	@RequestMapping("memberManager")
	public String memberManager(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue = "") String qualificationName,
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
        
        if(qualificationName!= null && qualificationName.length()!=0) {
        	map.put("qualificationName", qualificationName);
        }
        
        List<Member> list = service.listMember(map);
        int listNum, n = 0;
        for(Member dto : list) {
            listNum = memberCount - (offset + n);
            dto.setListNum(listNum);
            dto.setLevelName(service.readShopLevel(dto.getUserIdx()));
            n++;
        }
        
        String listUrl = cp+"/cAdmin/memberManager";
        
        Map<String, Object> map2 = new HashMap<String, Object>();
        map2.put("0", "신규회원");
        map2.put("1", "일반회원");
        map2.put("2", "열심회원");
        map2.put("3", "우수회원");
        map2.put("4", "대표회원");
        
        String paging = myUtil.paging(current_page, total_page, listUrl); 
        
        model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("memberCount", memberCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        model.addAttribute("map", map2);
        model.addAttribute("qName", qualificationName);
        
		return ".cAdmin.memberManager";
	}
	
	@RequestMapping("memberDetail")
	public String memberDetail(
			@RequestParam String userId,
			Model model
			) throws Exception{
		Member dto = service.readMember(userId);
		dto.setLevelName(service.readShopLevel(dto.getUserIdx()));
		
		List<Order> list = service.listOrder(dto.getUserIdx());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", 0);
		map.put("rows", 10);
		map.put("userId", userId);
		List<Posting> postingList = mService.listPosting(map);
		int n = 1;
		for(Posting vo : postingList) {
			vo.setListNum(n);
			n++;
		}
		
		Map<String, Object> map2 = new HashMap<String, Object>();
        map2.put("0", "신규회원");
        map2.put("1", "일반회원");
        map2.put("2", "열심회원");
        map2.put("3", "우수회원");
        map2.put("4", "대표회원");
        
        model.addAttribute("postingList", postingList);
        model.addAttribute("list", list);
		model.addAttribute("dto", dto);
		model.addAttribute("map", map2);
		
		return "cAdmin/memberDetail";
	}
	
	@RequestMapping(value = "updateMember", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateMemberSubmit(
			@RequestParam long clevel,
			@RequestParam long point,
			@RequestParam String userId,
			@RequestParam long userIdx
			) throws Exception{
		String state = "true";
		Member dto = service.readMember(userId);
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("userIdx", userIdx);
			map.put("clevel", clevel);
			map.put("point", point);
			PointHistory ph = new PointHistory();
			ph.setUserId(userId);
			ph.setBy_what("관리자 조정");
			ph.setAmount(point-dto.getPoint());
			
			if(dto.getClevel()!=clevel) {
				service.updateClevel(map);
			}
			
			if(dto.getPoint()!=point) {
				service.updatePoint(map);
				mService.insertPointHistory(ph);				
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
			@RequestParam(defaultValue = "") String gubun,
			@RequestParam(defaultValue = "") String state,
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpServletRequest req,
			Model model
			) throws Exception{
		String cp = req.getContextPath();
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(gubun!= null && gubun.length()!=0) {
			map.put("gubun", gubun);
		}
		
		if(state!= null && state.length()!=0) {
			map.put("state", state);
		}
		
		int rows = 10;
		int total_page = 0;
		int requestCount = 0;
		
		requestCount = service.requestCount(map);
		
		if(requestCount != 0)
            total_page = myUtil.pageCount(rows, requestCount);
		
		if(total_page < current_page) 
            current_page = total_page;
		
		int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
		
		
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
        model.addAttribute("gubun", gubun);
        model.addAttribute("state", state);
        
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
	
	@RequestMapping(value = "updateQualification", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateQualificationSubmit(
			@RequestParam String mode,
			@RequestParam String userId,
			@RequestParam int requestNum,
			@RequestParam String gubun
			) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		String state = "true";
		
		try {
			if(mode.equals("approve")) {
				map.put("qualificationName", gubun);
				map.put("userId", userId);
				map.put("state", "approved");
				service.updateQualification(map);
			} else if(mode.equals("reject")) {
				map.put("state", "rejected");
			}
			map.put("requestNum", requestNum); 
			
			service.updateRequestQualification(map);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("state", state);
		return model;
	}
	
	@RequestMapping("postManager")
	public String postManager() throws Exception{
		return ".cAdmin.postManager";
	}
}
