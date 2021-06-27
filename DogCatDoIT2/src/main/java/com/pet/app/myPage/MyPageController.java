package com.pet.app.myPage;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pet.app.common.FileManager;
import com.pet.app.common.MyUtil;
import com.pet.app.member.Member;
import com.pet.app.member.MemberService;
import com.pet.app.member.SessionInfo;

@Controller("myPage.myPageController")
@RequestMapping("/myPage/*")
public class MyPageController {
	@Autowired
	private MyPageService service;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "main")
	public String main() throws Exception{
		return ".myPage.main";
	}
	
	@RequestMapping(value = "attendance")
	public String attendance(
			HttpSession session,
			Model model
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		Attendance dto = service.readAttendance(userId);
		
		int count = 0;
		count = service.countAttendance(userId);
		
		if(dto!=null) {
			String checked = "출석완료";
			model.addAttribute("checked", checked);
		}
		model.addAttribute("count",count);
		
		return ".myPage.attendance";
	}
	
	@RequestMapping(value = "insertAttendance", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> attendanceSubmit(
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		String state = "true";
		Attendance dto = service.readAttendance(userId);
		int count = 0;
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		
		try {
			if(dto!=null) {
				model.put("state", "false");
				return model;
			}
			service.insertAttendance(userId);
			count = service.countAttendance(userId);
			service.updateAttendancePoint(userId);
			
			PointHistory ph = new PointHistory();
			ph.setAmount(50);
			ph.setBy_what("출석체크");
			ph.setUserId(userId);
			service.insertPointHistory(ph);
			
			int accumulation = 0;
			accumulation = service.readAccumulation(userId);
			
			Member vo = mService.readMember(userId);
			
			if(accumulation>=5000 && vo.getClevel()==0) {
				service.updateClevel(userId);
			} else if(accumulation>=15000 && vo.getClevel()==1) {
				service.updateClevel(userId);
			} else if(accumulation>=30000 && vo.getClevel()==2) {
				service.updateClevel(userId);
			} else if(accumulation>=50000 && vo.getClevel()==3) {
				service.updateClevel(userId);
			}
		} catch (Exception e) {
			e.printStackTrace();
			state = "false";
		}
		
		model.put("count", count);
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value = "userCalendar")
	public ModelAndView userCalendar(Model model) throws Exception{
		ModelAndView mav = new ModelAndView(".myPage.userCalendar");
		model.addAttribute("menuIndex", 5);
		return mav;
	}
	
	@RequestMapping(value="month")
	@ResponseBody
	public Map<String, Object> month(
			@RequestParam String start,
			@RequestParam String end,
			@RequestParam(defaultValue="all") String group,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("group", group);
		map.put("start", start);
		map.put("end", end);
		map.put("userId", info.getUserId());
		
		List<UserCalendar> list=service.listMonth(map);
		for(UserCalendar dto:list) {
	    	if(dto.getStime()==null) {
	    		dto.setAllDay(true);
	    	} else {
	    		dto.setAllDay(false);
	    	}
	    	
	    	if(dto.getStime()!=null && dto.getStime().length()!=0) {
	    		dto.setStart(dto.getSday()+"T" + dto.getStime());
	    	} else {
	    		dto.setStart(dto.getSday());
	    	}
	    	
	    	if(dto.getEtime()!=null && dto.getEtime().length()!=0) {
	    		dto.setEnd(dto.getEday()+"T" + dto.getEtime());
	    	} else {
	    		dto.setEnd(dto.getEday());
	    	}
	    	
	    	if(dto.getRepeat()!=0) { // 반복 일정인 경우
	    		if( dto.getStart().substring(0,4).compareTo(start.substring(0,4)) != 0 ) {
	    			dto.setStart(start.substring(0,4)+dto.getStart().substring(5));
	    			System.out.println("::::"+dto.getStart());
	    		}
	    	}	    	
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("list", list);
		return model;
	}
	
	@PostMapping("insertUserCalendar")
	@ResponseBody
	public Map<String, Object> insertUserCalendarSubmit(UserCalendar dto,
			HttpSession session) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String state="true";
		try {
			dto.setUserId(info.getUserId());
			service.insertUserCalendar(dto);
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@PostMapping("updateUserCalendar")
	@ResponseBody
	public Map<String, Object> updateUserCalendarSubmit(UserCalendar dto,
			HttpSession session) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String state="true";
		try {
			dto.setUserId(info.getUserId());
			service.updateUserCalendar(dto);
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@PostMapping("deleteUserCalendar")
	@ResponseBody
	public Map<String, Object> deleteUserCalendar(
			@RequestParam int userCalendarNum,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");

		String state = "true";
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("userId", info.getUserId());
			map.put("userCalendarNum", userCalendarNum);
			service.deleteUserCalendar(map);
		}catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value = "userProfile", method = RequestMethod.GET)
	public String userProfile(
			HttpSession session,
			Model model) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		int countUserProfile = 0;
		countUserProfile = service.countUserProfile(userId);
		
		if(countUserProfile==0) {
			model.addAttribute("countUserProfile", countUserProfile);
			model.addAttribute("mode", "insert");
			return ".myPage.setUserProfile";
		}
		
		List<UserProfile> list = service.listUserProfile(userId);
		for(UserProfile dto : list) {
			dto.setAnimalAge(service.setAge(dto.getProfileNum()));
		}
		
		model.addAttribute("countUserProfile", countUserProfile);
		model.addAttribute("list", list);

		return ".myPage.userProfile";
	}
	
	@RequestMapping(value = "insertUserProfile", method = RequestMethod.GET)
	public String insertUserProfile(Model model) throws Exception{
		
		model.addAttribute("mode", "insert");
		
		return ".myPage.setUserProfile";
	}
	
	@RequestMapping(value = "updateUserProfile", method = RequestMethod.GET)
	public String updateUserProfile(
			@RequestParam int profileNum,
			HttpSession session,
			Model model
			) throws Exception{
		
		UserProfile dto = service.readUserProfile(profileNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode","update");
		
		return ".myPage.setUserProfile";
	}
	
	@RequestMapping(value = "insertUserProfile", method = RequestMethod.POST)
	public String insertUserProfileSubmit(
			UserProfile dto,
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setUserId(info.getUserId());
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+"uploads"+File.separator+"userProfile";
		
		try {
			service.insertUserProfile(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/myPage/userProfile";
	}
	
	@RequestMapping(value = "updateUserProfile", method = RequestMethod.POST)
	public String updateUserProfileSubmit(
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
		
		return "redirect:/myPage/userProfile";
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
		
		return "redirect:/myPage/userProfile";
	}
	
	@RequestMapping(value = "listQualification")
	public String listQualification(
			HttpSession session,
			Model model) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		try {
			List<Qualification> list = service.listRequestQualification(userId);
			int n=1;
			for(Qualification dto : list) {
				dto.setListNum(n);
				n++;
			}
			
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ".myPage.listQualification";
	}
	
	@RequestMapping(value = "download")
	public void download(
			@RequestParam int requestNum,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception{
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "requestQualification";
		
		Qualification dto = service.readRequestQualification(requestNum);
		if(dto!=null) {
			boolean b = fileManager.doFileDownload(dto.getSaveFilename(), dto.getOriginalFilename(), pathname , resp);
			
			if(b) return;
		}
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print("<script>alert('파일다운로드가 실패했습니다.'); history.back();</script>");
	}
	
	@RequestMapping(value = "insertRequestQualification", method = RequestMethod.GET)
	public String requestQualification(
			HttpSession session,
			Model model) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		Member dto = mService.readMember(userId);
		
		model.addAttribute("mode", "insert");
		model.addAttribute("userId", dto.getUserId());
		model.addAttribute("name", dto.getName());
		model.addAttribute("tel", dto.getTel());
		
		return ".myPage.qualification";
	}
	
	@RequestMapping(value = "insertRequestQualification", method = RequestMethod.POST)
	String requestQualificationSubmit(
			Qualification dto,
			HttpSession session,
			final RedirectAttributes rattr
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setUserId(info.getUserId());
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"requestQualification";
		rattr.addFlashAttribute("title", "자격신청");
		rattr.addFlashAttribute("msg", "신청이 완료되었습니다.<br>감사합니다.");
		try {
			service.insertRequestQualification(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/myPage/complete";
	}
	
	@RequestMapping(value = "complete")
	public String complete(@ModelAttribute("msg") String msg) throws Exception{
		
		if(msg==null || msg.length()==0)
			return "redirect:/myPage/main";
		
		return ".myPage.complete";
	}
	
	@RequestMapping(value = "updateRequestQualification", method = RequestMethod.GET)
	public String updateRequestQualification(
			@RequestParam int requestNum,
			Model model
			) throws Exception{
		Qualification dto = service.readRequestQualification(requestNum);
		
		if(dto == null) {
			return "redirect:/myPage/listQualification";
		}
		
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		model.addAttribute("userId", dto.getUserId());
		model.addAttribute("name", dto.getName());
		model.addAttribute("tel", dto.getTel());
		
		return ".myPage.qualification";
	}
	
	@RequestMapping(value = "updateRequestQualification", method = RequestMethod.POST)
	public String updateRequestQualificationSubmit(
			Qualification dto,
			HttpSession session
			) throws Exception{
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"requestQualification";
		
		try {
			service.updateRequestQualification(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/myPage/listQualification";
	}
	
	@RequestMapping(value = "deleteRequestQualification")
	public String deleteRequestQualification(
			@RequestParam int requestNum,
			HttpSession session
			) throws Exception{
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"requestQualification";
		
		service.deleteRequestQualification(requestNum, pathname);
		
		return "redirect:/myPage/listQualification";
	}
	
	@RequestMapping(value = "checkPwd", method = RequestMethod.GET)
	public String checkPwd(@RequestParam int mode, Model model) throws Exception{
		
		if(mode==1) {
			model.addAttribute("mode", "set");
		} else {
			model.addAttribute("mode", "delete");
		}
		
		return ".myPage.checkPwd";
	}
	
	@RequestMapping(value = "checkPwd", method = RequestMethod.POST)
	public String checkPwdSubmit(
			@RequestParam String pwd,
			@RequestParam String mode,
			final RedirectAttributes reAttr,
			Model model,
			HttpSession session
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Member dto = mService.readMember(info.getUserId());
		if(dto==null) {
			session.invalidate();
			return "redirect:/";
		}
		
		if(! dto.getPwd().equals(pwd)) {
			if(mode.equals("set")) {
				model.addAttribute("mode", "set");
			} else {
				model.addAttribute("mode", "delete");
			}
			model.addAttribute("message", "패스워드가 일치하지 않습니다.");
			return ".myPage.checkPwd";
		}
		
		if(mode.equals("delete")) {
			model.addAttribute("dto", dto);
			return ".myPage.deleteMember";
		}
		model.addAttribute("dto", dto);
		
		return ".myPage.setMember";
	}
	
	@RequestMapping(value = "setMember", method = RequestMethod.GET)
	public String setMember() throws Exception{
		
		return ".myPage.setMember";
	}
	
	@RequestMapping(value = "setMember", method = RequestMethod.POST)
	public String setMemberSubmit(
			Member dto,
			final RedirectAttributes reAttr,
			Model model
			) throws Exception{
		
		try {
			service.setMember(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		StringBuilder sb=new StringBuilder();
		sb.append(dto.getName()+ "님의 회원정보가 정상적으로 변경되었습니다.<br>");
		sb.append("메인화면으로 이동 하시기 바랍니다.<br>");
		
		reAttr.addFlashAttribute("title", "회원 정보 수정");
		reAttr.addFlashAttribute("msg", sb.toString());
		
		return "redirect:/myPage/complete";
	}
	
	@RequestMapping(value = "deleteMember", method = RequestMethod.GET)
	public String deleteMember(Model model, Member dto) throws Exception{
		model.addAttribute("dto", dto);
		return ".myPage.deleteMember";
	}
	
	@RequestMapping(value = "deleteMember", method = RequestMethod.POST)
	public String deleteMemberSubmit(
			HttpSession session,
			final RedirectAttributes reAttr,
			Member dto
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		try {
			service.deleteMember(userId);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		session.removeAttribute("member");
		session.invalidate();
		
		
		StringBuilder sb=new StringBuilder();
		sb.append(dto.getName()+ "님의 회원 탈퇴 처리가 정상적으로 처리되었습니다.<br>");
		sb.append("메인화면으로 이동 하시기 바랍니다.<br>");
		
		reAttr.addFlashAttribute("title", "회원 탈퇴");
		reAttr.addFlashAttribute("msg", sb.toString());
		
		return "redirect:/member/complete";
	}
	
	@RequestMapping(value = "written")
	public String written() throws Exception{
		return ".myPage.written";
	}
	
	@RequestMapping(value = "reserve")
	public String reserve() throws Exception{
		return ".myPage.reserve";
	}
	
	@RequestMapping(value = "point/HistoryList", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> pointHistoryList(
			@RequestParam(value = "pageNum", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "1") int month,
			HttpSession session
			) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		int total_page, dataCount, offset;
		int point;
		String paging;
		int rows = 10;
		
		map.put("userId", info.getUserId());
		map.put("month", month);
		dataCount = service.pointHistoryCount(map);
		
		total_page = myUtil.pageCount(rows, dataCount);
		if(current_page > total_page)
			current_page = total_page;
		
		offset = (current_page - 1) * rows;
		if(offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("rows", rows);
		List<PointHistory> list = service.readPointHistory(map);
		
		paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		point = service.readPoint(info.getUserId());
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("pageNum", current_page);
		model.put("total_page", total_page);
		model.put("dataCount", dataCount);
		model.put("list", list);
		model.put("offset", offset);
		model.put("paging", paging);
		model.put("point", point);
		
		return model;
	}
	
	@GetMapping("point")
	public String point() throws Exception{
		return ".myPage.point";
	}
	
	@RequestMapping("posting")
	public String posting(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			Model model,
			HttpServletRequest req,
			HttpSession session
			) throws Exception{
		String cp = req.getContextPath();
		Map<String, Object> map = new HashMap<String, Object>();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		int total_page=0;
		int dataCount=0;
		int offset;
		String paging;
		int rows = 10;
		
		map.put("userId", info.getUserId());
		dataCount = service.countPosting(info.getUserId());
		
		if(dataCount!=0)
			total_page = myUtil.pageCount(rows, dataCount);
		if(current_page > total_page)
			current_page = total_page;
		
		offset = (current_page - 1) * rows;
		if(offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Posting> list = service.listPosting(map);
		int listNum, n = 0;
        for(Posting dto : list) {
            listNum = dataCount - (offset + n);
            dto.setListNum(listNum);
            n++;
        }
        
        String listUrl = cp+"/myPage/posting";
        
        paging = myUtil.paging(current_page, total_page, listUrl);
        
        model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        
		return ".myPage.posting";
	}
	
}
