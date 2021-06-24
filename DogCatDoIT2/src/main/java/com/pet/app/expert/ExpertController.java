package com.pet.app.expert;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pet.app.common.MyUtil;
import com.pet.app.member.SessionInfo;

@Controller("expert.expertController")
@RequestMapping("/expert/*")
public class ExpertController {
	@Autowired
	private ExpertService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(value = "rows", defaultValue = "10") int rows,
			HttpServletRequest req,
			Model model
			) throws Exception{
	
	int total_page;
	int dataCount;
	
	if (req.getMethod().equalsIgnoreCase("GET")) {
		keyword = URLDecoder.decode(keyword, "UTF-8");
	}
	
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("condition", condition);
	map.put("keyword", keyword);
	
	dataCount = service.dataCount(map);
	total_page = myUtil.pageCount(rows, dataCount);
	
	if(total_page < current_page)
		current_page = total_page;
	
	int offset = (current_page-1) * rows;
	if(offset < 0) offset = 0;
	map.put("offset", offset);
	map.put("rows", rows);
	
	List<Expert> list = service.listExpert(map);
	
	/*
	 * // 글번호 만드는 부분 Date endDate = new Date(); long gap; int listNum, n = 0;
	 * for(Expert dto : list) { listNum = dataCount - (offset + n);
	 * dto.setListNum(listNum);
	 * 
	 * SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 * Date beginDate = formatter.parse(dto.getCreated());
	 * 
	 * // 날짜차이(일) // gap=(endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60*
	 * 1000); // data.setGap(gap); // dto.setGap(gap);
	 * 
	 * dto.setCreated(dto.getCreated().substring(0, 10)); n++; }
	 */
	
	String cp = req.getContextPath();
	String query = "rows="+rows;
	String listUrl = cp + "/expert/list";
	String articleUrl = cp + "expert/article?page=" + current_page;
	
	if (keyword.length() !=0) {
		query += "&condition="+ condition + "&keyword="
				+ URLEncoder.encode(keyword, "UTF-8");
	}
	listUrl += "?" + query;
	articleUrl += "&" + query;
	
	String paging = myUtil.paging(current_page, total_page, listUrl);
	
	model.addAttribute("list", list);
	model.addAttribute("dataCount", dataCount);
	model.addAttribute("page", current_page);
	model.addAttribute("total_page", total_page);
	model.addAttribute("articleUrl", articleUrl);
	model.addAttribute("paging", paging);
	
	model.addAttribute("rows", rows);
	model.addAttribute("condition", condition);
	model.addAttribute("keyword", keyword);
	
	model.addAttribute("menuIndex", 2);
	
	return ".expert.list";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String createdForm(HttpSession session, Model model) throws Exception{
		model.addAttribute("mode", "created");
		model.addAttribute("menuIndex", 2);
		return ".expert.created";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.POST)
	public String createdSubmit(Expert dto, HttpSession session) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		try {
			dto.setUserId(info.getUserId());;
			service.insertExpert(dto, "created");
		} catch (Exception e) {

		}
		return "redirect:/expert/list";
	}
	
	@RequestMapping(value = "article")
	public String article(
			@RequestParam int expertNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam int rows,
			Model model
			) throws Exception{
	
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page="+page+"&rows="+rows;
		if(keyword.length()!=0) {
			query += "&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");

		}
		
		service.updateHitCount(expertNum);
		Expert dto = service.readExpert(expertNum);
		
		if(dto==null) {
			return "redirect:/expert/list?"+query;
		}
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		// 이전, 다음글
		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("groupNum", dto.getGroupNum());
		map.put("orderNo", dto.getOrderNo());
		Expert preReadDto = service.preReadExpert(map);
		Expert nextReadDto = service.nextReadExpert(map);
		
		// 관련글
		List<Expert> listArticle = service.listArticleExpert(dto.getGroupNum());
	
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("query", query);
		model.addAttribute("rows", rows);
		model.addAttribute("page", page);
		model.addAttribute("listArticle", listArticle);
		model.addAttribute("menuIndex", 2);
		
		return ".expert.article";
	}
	
	@RequestMapping(value="reply", method = RequestMethod.GET)
	public String replyForm(
			@RequestParam int expertNum,
			@RequestParam String page,
			@RequestParam int rows,
			Model model
			) throws Exception{
		
		Expert dto = service.readExpert(expertNum);
		if(dto==null) {
			return "redirect:/expert/list?page="+page+"&rows="+rows;
		}
		
		dto.setContent("["+dto.getSubject()+"] 에 대한 답변입니다.\n");

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("rows", rows);
		model.addAttribute("mode", "reply");
		model.addAttribute("menuIndex", 2);
		
		return ".expert.created";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int expertNum,
			@RequestParam String page,
			@RequestParam int rows,
			HttpSession session,
			Model model
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Expert dto = service.readExpert(expertNum);
		if(dto == null || !dto.getUserId().equals(info.getUserId())) {
			return "redirect:/expert/list?page="+page+"&rows="+rows;
		}
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("rows", rows);
		model.addAttribute("mode", "update");
		model.addAttribute("menuIndex", 2);
		
		return ".expert.created";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(
			Expert dto,
			@RequestParam int rows,
			@RequestParam String page,
			HttpSession session
			) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.updateExpert(dto);
		} catch (Exception e) {

		}
		return "redirect:/expert/list?page="+page+"&rows="+rows;
	}
	
	@RequestMapping(value = "reply", method = RequestMethod.POST)
	public String replySubmit(
			Expert dto,
			@RequestParam int rows,
			@RequestParam String page,
			HttpSession session
			) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertExpert(dto, "reply");			
		} catch (Exception e) {
		}
		
		return "redirect:/expert/list?page="+page+"&rows="+rows;
	}
	
	@RequestMapping(value = "delete")
	public String delete(
			@RequestParam int expertNum,
			@RequestParam String page,
			@RequestParam int rows,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session
			)throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String query = "page="+page+"&rows="+rows;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
			
		}
		
		try {
			service.deleteExpert(expertNum, info.getUserId());
		} catch (Exception e) {

		}
		return "redirect:/expert/list?page="+query;
	}
}
