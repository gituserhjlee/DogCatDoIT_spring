package com.pet.app.talk;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.app.common.MyUtil;
import com.pet.app.member.SessionInfo;

@Controller("talk.talkController")
@RequestMapping("/talk/*")
public class TalkController {
	@Autowired
	private TalkService service;
	@Autowired
	private MyUtil myUtil;
	
	// 받은 쪽지 리스트 / 보낸 쪽지 리스트
	@RequestMapping(value="{menuItem}/list")
	public String listTalk(
			@PathVariable String menuItem,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			HttpSession session,
			Model model
			) throws Exception {

		SessionInfo info = (SessionInfo)session.getAttribute("member");

		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}
		
		// 전체 게시물의 수
       Map<String, Object> map = new HashMap<String, Object>();
       map.put("condition", condition);
       map.put("keyword", keyword);
       map.put("userId", info.getUserId());
       
       if(menuItem.equals("receive")) {
    	   dataCount=service.dataCountReceive(map);
       } else {
    	   dataCount=service.dataCountSend(map);
       }
		
		// 전체페이지수
		total_page=myUtil.pageCount(rows, dataCount);
		
		if(current_page>total_page)
			current_page=total_page;
		
		// 리스트
        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);
		
        List<Talk> list=null;
        if(menuItem.equals("receive")) {
        	list=service.listReceive(map);
        } else {
	    	list=service.listSend(map);
        }
        
        String cp=req.getContextPath();
        String query = "";
        String listUrl = cp+"/talk/"+menuItem+"/list";
        String articleUrl = cp+"/talk/"+menuItem+"/article?page=" + current_page;
        if(keyword.length()!=0) {
        	query = "condition=" +condition + 
        	         "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl = cp+"/talk/"+menuItem+"/list?" + query;
        	articleUrl = cp+"/talk/"+menuItem+"/article?page=" + current_page + "&"+ query;
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);
		
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("menuItem", menuItem);
		
		model.addAttribute("menuIndex", 5);
		
		return ".talk.list";
	}

	// 쪽지 보내기 폼
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {
		model.addAttribute("menuIndex", 5);
		return ".talk.write";
	}
	
	// 쪽지 보내기
	@PostMapping("write")
	public String writeSubmit(
			Talk dto,
			HttpSession session) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			dto.setSenderId(info.getUserId());
			service.insertTalk(dto);
		}catch(Exception e) {

		}

		return "redirect:/talk/send/list";
	}
	
	// 친구 리스트
	@GetMapping(value="listFriend")
	@ResponseBody
	public Map<String, Object> listFriend(
			@RequestParam String condition,
			@RequestParam String keyword) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "UTF-8");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		List<Talk> list=service.listFriend(map);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listFriend", list);
		return model;
	}

	// 받은 쪽지 / 보낸 쪽지 - 글보기 
	@RequestMapping(value="{menuItem}/article")
	public String article(
			@PathVariable String menuItem,
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue="") String condition,
			@RequestParam(defaultValue="") String keyword,
			Model model,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");

		keyword = URLDecoder.decode(keyword, "UTF-8");
		
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
	    map.put("condition", condition);
	    map.put("keyword", keyword);
	    map.put("userId", info.getUserId());
	    map.put("num", num);

	    Talk dto=null;
	    Talk preDto=null;
	    Talk nextDto=null;
		if(menuItem.equals("send")) { // 보낸 쪽지 보기
			dto=service.readSend(num);
			preDto=service.preReadSend(map);
			nextDto=service.nextReadSend(map);
		} else {// 받은 쪽지 보기
			// 확인 상태로 변경
			service.updateIdentifyDay(num);
			dto=service.readReceive(num);
			preDto=service.preReadReceive(map);
			nextDto=service.nextReadReceive(map);
		}	    

		if(dto==null) {
			return "redirect:/talk/"+menuItem+"/list?"+query;
		}
				
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		model.addAttribute("dto", dto);
		model.addAttribute("preDto", preDto);
		model.addAttribute("nextDto", nextDto);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("menuItem", menuItem);
		
		model.addAttribute("menuIndex", 5);
		
		return ".talk.article";
	}
	
	@RequestMapping(value="{menuItem}/delete")
	public String delete(
			@PathVariable String menuItem,
			@RequestParam List<Integer> nums,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			Model model,
			HttpSession session) throws Exception {

		keyword = URLDecoder.decode(keyword, "UTF-8");
		
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		if(menuItem.equals("receive")) {
			map.put("field1", "receiveDelete");
			map.put("field2", "sendDelete");
		} else {
			map.put("field1", "sendDelete");
			map.put("field2", "receiveDelete");
		}		
		
	    map.put("numList", nums);
	    
	    try {
	    	service.deleteTalk(map);
		} catch (Exception e) {

		}
		
		return "redirect:/talk/"+menuItem+"/list?"+query;
	}

}
