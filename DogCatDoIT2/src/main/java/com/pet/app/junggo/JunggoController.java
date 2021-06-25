package com.pet.app.junggo;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.app.common.MyUtil;
import com.pet.app.member.SessionInfo;


@Controller("junggo.junggoController")
@RequestMapping("/junggo/*")
public class JunggoController {
	@Autowired
	private JunggoService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="main")
	public String main(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mode", "enabled");
		List<Junggo> listCategory=service.listCategory(map);

		model.addAttribute("listCategory", listCategory);
		model.addAttribute("categoryNum", "0");
		model.addAttribute("pageNo", current_page);
		
		model.addAttribute("menuIndex", 4);
		
		return ".junggo.main";
	}
	
	// AJAX-Text(HTML)
	@RequestMapping(value="list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="0") int categoryNum,
			HttpServletRequest req,
			Model model) throws Exception {

		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
   	    
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("condition", condition);
        map.put("keyword", keyword);
        map.put("categoryNum", categoryNum);

        dataCount = service.dataCount(map);
        if(dataCount != 0) {
            total_page = myUtil.pageCount(rows,  dataCount) ;
        }
        
        if(total_page < current_page) { 
            current_page = total_page;
        }

        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);

        List<Junggo> list = service.listJunggo(map);
		int listNum, n = 0;
		for (Junggo dto : list) {
			listNum = dataCount - (offset + n);
			dto.setListNum(listNum);
			n++;
		}

		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		return "junggo/list";
	}

	@RequestMapping(value="created", method=RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("mode", "enabled");
		List<Junggo> listCategory=service.listCategory(map);
		
		
		model.addAttribute("pageNo", "1");
		model.addAttribute("mode", "created");
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("menuIndex", 4);
		
		return ".junggo.created";
	}

	@RequestMapping(value="created", method=RequestMethod.POST)
	public String createdSubmit(
			Junggo dto,
			HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info.getUserId().equals("admin")) {
			try {
				dto.setUserId(info.getUserId());
				service.insertJunggo(dto);
			} catch (Exception e) {
			}
		}
		
		return "redirect:/junggo/main?pageNo=1";
	}

	@RequestMapping(value = "article")
	public String article(@RequestParam int num,
			@RequestParam String pageNo,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletResponse resp,
			Model model) throws Exception {

		keyword = URLDecoder.decode(keyword, "utf-8");
		service.updateHitCount(num);

		Junggo dto = service.readJunggo(num);
		System.out.println(dto);
		if (dto == null) {
			resp.sendError(410, "삭제된 게시물입니다.");
			return null;
		}
		
		/*
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("num", num);
		*/
	
		model.addAttribute("dto", dto);
		model.addAttribute("pageNo", pageNo);

		return "junggo/article";
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int num,
			@RequestParam String pageNo,
			HttpSession session,			
			Model model	) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");

		Junggo dto = service.readJunggo(num);
		if(dto==null) {
			return "redirect:/junggo/main?pageNo="+pageNo;
		}

		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/junggo/main?pageNo="+pageNo;
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("mode", "enabled");
		List<Junggo> listCategory=service.listCategory(map);

		
		model.addAttribute("mode", "update");
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("dto", dto);
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("menuIndex", 4);
		
		return ".junggo.created";
	}

	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updateSubmit(
			Junggo dto,
			@RequestParam String pageNo,
			HttpSession session) throws Exception {

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info.getUserId().equals("admin")) {
			try {
				dto.setUserId(info.getUserId());
				service.updateJunggo(dto);
			} catch (Exception e) {
			}
		}
		
		return "redirect:/junggo/main?pageNo="+pageNo;
	}

	@RequestMapping(value="delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int num,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="false";
		
		if(info.getUserId().equals("admin")) {
			try {
				Map<String, Object> map = new HashMap<>();
				map.put("num", num);
				
				service.deleteJunggo(map);
				state="true";
			} catch (Exception e) {
			}
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}

	@RequestMapping(value="listAllCategory")
	public String listAllCategory(Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mode", "all");
		List<Junggo> listCategory=service.listCategory(map);
		model.addAttribute("listAllCategory", listCategory);
		return "junggo/listAllCategory";
	}

	@RequestMapping(value="listCategory")
	@ResponseBody
	public Map<String, Object> listCategory(@RequestParam String mode) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mode", mode);
		List<Junggo> listCategory=service.listCategory(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("listCategory", listCategory);
		return model;
	}
	
	@RequestMapping(value="insertCategory", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertCategory(
			Junggo dto) throws Exception {

		String state="false";
		try {
			service.insertCategory(dto);
			state="true";
		} catch (Exception e) {
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}

	@RequestMapping(value="updateCategory", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateCategory(
			Junggo dto) throws Exception {

		String state="false";
		try {
			service.updateCategory(dto);
			state="true";
		} catch (Exception e) {
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="deleteCategory", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteCategory(
			@RequestParam int categoryNum) throws Exception {

		String state="false";
		try {
			service.deleteCategory(categoryNum);
			state="true";
		} catch (Exception e) {
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="listReply")
	public String listReply(
			@RequestParam int num,
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			Model model
			) throws Exception {
		
		int rows=5;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("num", num);
		
		dataCount=service.replyCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);
		List<JReply> listReply=service.listReply(map);
		
		for(JReply dto : listReply) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		// AJAX 용 페이징
		String paging=myUtil.pagingMethod(current_page, total_page, "listReply");
		
		// 포워딩할 jsp로 넘길 데이터
		model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "junggo/listReply";
	}
	@RequestMapping(value="insertReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			JReply dto,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertReply(dto);
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	@RequestMapping(value="deleteReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam Map<String, Object> paramMap
			) {
		
		String state="true";
		try {
			service.deleteReply(paramMap);
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		return map;
	}

}
