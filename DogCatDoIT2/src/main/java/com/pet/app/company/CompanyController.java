package com.pet.app.company;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

import com.pet.app.common.FileManager;
import com.pet.app.common.MyUtil;
import com.pet.app.member.SessionInfo;

@Controller("company.companyController")
@RequestMapping("/company/*")
public class CompanyController {
	@Autowired
	private CompanyService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
   	    String cp = req.getContextPath();
   	    
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
   	    
		if(req.getMethod().equalsIgnoreCase("GET")) { 
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
  
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("condition", condition);
        map.put("keyword", keyword);

        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows, dataCount) ;

        
        if(total_page < current_page) 
            current_page = total_page;

        
        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);

       
        List<Company> list = service.listCompany(map);

        
        int listNum, n = 0;
        for(Company dto : list) {
            listNum = dataCount - (offset + n);
            dto.setListNum(listNum);
            n++;
        }
        
        String query = "";
        String listUrl = cp+"/company/list";
        String articleUrl = cp+"/company/article?page=" + current_page;
        if(keyword.length()!=0) {
        	query = "condition=" +condition + 
        	         "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl = cp+"/company/list?" + query;
        	articleUrl = cp+"/company/article?page=" + current_page + "&"+ query;
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);

        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		model.addAttribute("menuIndex", 2);
		
		return ".company.list";
	}
	
	@RequestMapping(value="created", method=RequestMethod.GET)
	public String createdForm(
			Model model) throws Exception {
		
		model.addAttribute("mode", "created");
		model.addAttribute("menuIndex", 2);
		return ".company.created";
	}
	
	@RequestMapping(value="/company/created", method=RequestMethod.POST)
	public String createdSubmit(
			Company dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"company";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertCompany(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/company/list";
	}
	
	@RequestMapping(value="article")
	public String article(
			@RequestParam int boardnum,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			Model model) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}

		service.updateHitCount(boardnum);

		
		Company dto = service.readCompany(boardnum);
		if(dto==null)
			return "redirect:/company/list?"+query;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("boardnum", boardnum);

		Company preReadDto = service.preReadCompany(map);
		Company nextReadDto = service.nextReadCompany(map);
        
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);

		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("menuIndex", 2);
		
        return ".company.article";
	}
	
	@RequestMapping(value = "article2")
	public String article2() throws Exception{
		return ".company.article2";
	}
	@RequestMapping(value = "article3")
	public String article3() throws Exception{
		return ".company.article3";
	}
	@RequestMapping(value = "article4")
	public String article4() throws Exception{
		return ".company.article4";
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int boardnum,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Company dto = service.readCompany(boardnum);
		if(dto==null) {
			return "redirect:/company/list?page="+page;
		}

		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/company/list?page="+page;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("menuIndex", 2);
		
		return ".company.created";
	}

	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updateSubmit(
			Company dto, 
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"company";		

		try {
			service.updateCompany(dto, pathname);		
		} catch (Exception e) {
		}
		
		return "redirect:/company/list?page="+page;
	}
	
	@RequestMapping(value="deleteFile")
	public String deleteFile(
			@RequestParam int boardnum,
			@RequestParam String page,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"company";
		
		Company dto=service.readCompany(boardnum);
		if(dto==null) {
			return "redirect:/company/list?page="+page;
		}
		
		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/company/list?page="+page;
		}
		
		try {
			if(dto.getSaveFilename()!=null) {
				fileManager.doFileDelete(dto.getSaveFilename(), pathname); // 실제파일삭제
				dto.setSaveFilename("");
				dto.setOriginalFilename("");
				service.updateCompany(dto, pathname); // DB 테이블의 파일명 변경(삭제)
			}
		} catch (Exception e) {
		}
		
		return "redirect:/company/update?num="+boardnum+"&page="+page;
	}
	
	@RequestMapping(value="delete")
	public String delete(
			@RequestParam int boardnum,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"company";
		
		service.deleteCompany(boardnum, pathname, info.getUserId());
		
		return "redirect:/company/list?"+query;
	}
	
	@RequestMapping(value="download")
	public void download(
			@RequestParam int boardnum,
			HttpServletRequest req,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception {
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"company";
		
		Company dto=service.readCompany(boardnum);
		
		if(dto!=null) {
			boolean b=fileManager.doFileDownload(dto.getSaveFilename(),
					                   dto.getOriginalFilename(), pathname, resp);
			if(b) return;
		}
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		out.print("<script>alert('파일 다운로드가 실패 했습니다.');history.back();</script>");
	}
	
	@RequestMapping(value="insertCompanyLike", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertCompanyLike(
			@RequestParam int boardnum,
			HttpSession session
			) {
		String state="true";
		int companyLikeCount=0;
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> paramMap=new HashMap<>();
		paramMap.put("boardnum", boardnum);
		paramMap.put("userId", info.getUserId());
		
		try {
			service.insertCompanyLike(paramMap);
		} catch (Exception e) {
			state="false";
		}
			
		companyLikeCount = service.companyLikeCount(boardnum);
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		model.put("boardLikeCount", companyLikeCount);
		
		return model;
	}
	
	@RequestMapping(value="listReview")
	public String listReview(
			@RequestParam int boardnum,
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			Model model
			) throws Exception {
		
		int rows=5;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("boardnum", boardnum);
		
		dataCount=service.reviewCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);
		List<Review> listReview=service.listReview(map);
		
		for(Review dto : listReview) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("listReview", listReview);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("reviewCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "company/listReview";
	}
	
	@RequestMapping(value="insertReview", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReview(
			Review dto,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertReview(dto);
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="deleteReview", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReview(
			@RequestParam Map<String, Object> paramMap
			) {
		
		String state="true";
		try {
			service.deleteReview(paramMap);
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		return map;
	}
}

