package com.pet.app.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("member.memberController")
@RequestMapping(value="/member/*")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="member", method = RequestMethod.GET)
	public String memberForm(Model model) {
		model.addAttribute("mode", "member");
		return ".member.member";
	}
	
	@RequestMapping(value = "member", method = RequestMethod.POST)
	public String memberSubmit(Member dto, final RedirectAttributes reAttr,
			Model model) {
		try {
			service.insertMember(dto);
		} catch (DuplicateKeyException e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "아이디 중복으로 회원가입을 실패했습니다.");
			return ".member.member";
		} catch (DataIntegrityViolationException e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "제약 조건 위반으로 회원가입을 실패했습니다.");
			return ".member.member";
		} catch (Exception e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "회원가입을 실패했습니다.");
			return ".member.member";
		}
		StringBuilder sb = new StringBuilder();
		sb.append(dto.getName()+ "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
		sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");
		
		reAttr.addFlashAttribute("message", sb.toString());
		reAttr.addFlashAttribute("title", "회원가입");
		
		return "redirect:/member/complete";
	}
	
	@RequestMapping(value="complete")
	public String complete(@ModelAttribute("message")String message) throws Exception{
		if(message==null || message.length()==0)
			return "redirect:/";
		
		return ".member.complete";
	}
	
	@RequestMapping(value="login", method = RequestMethod.GET)
	public String loginForm() {
		return ".member.login";
	}
	
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String loginSubmit(
			@RequestParam String userId,
			@RequestParam String pwd,
			HttpSession session,
			Model model
			) {

		Member dto =service.loginMember(userId);
		if(dto==null || ! pwd.equals(dto.getPwd())) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return ".member.login";
		}
	
		// 로그인 부분 시작(세션에 로그인 정보 저장)
		SessionInfo info = new SessionInfo();
		info.setUserId(dto.getUserId());
		info.setUserName(dto.getName());
	
		session.setMaxInactiveInterval(30*60); // 세션 유지 : 30분간 
		
		session.setAttribute("member", info);
		
		// 로그인 이전 URI 이동
		String uri=(String)session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
		if(uri==null)
			uri="redirect:/";
		else
			uri="redirect:"+uri;
		
		return uri;
	}

	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		// 세션에 저장된 정보 지움
		session.removeAttribute("member");
		
		// 세션에 저장된 모든 정보를 지우고, 세션을 초기화
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="pwd", method = RequestMethod.GET)
	public String pwdForm(String dropout, Model model) {
	
		if(dropout==null) {
			model.addAttribute("mode", "update");
		} else {
			model.addAttribute("mode", "dropout");
		}
		return ".member.pwd";
	}
	
	@RequestMapping(value="pwd", method = RequestMethod.POST)
	public String preSubmit(
			@RequestParam String pwd,
			@RequestParam String mode,
			final RedirectAttributes reAttr,
			Model model,
			HttpSession session
		) {

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Member dto=service.readMember(info.getUserId());
		if(dto==null) {
			session.invalidate();
			return "redirect:/";
		}
		
		if(! dto.getPwd().equals(pwd)) {
			if(mode.equals("update")) {
				model.addAttribute("mode", "update");
			} else {
				model.addAttribute("mode", "dropout");
			}
			model.addAttribute("message", "패스워드가 일치하지 않습니다.");
			return ".member.pwd";
		}
	
		if(mode.equals("dropout")) {
			// 세션 정보 삭제 부분
			session.removeAttribute("member");
			session.invalidate();
			
			StringBuilder sb= new StringBuilder();
			sb.append(dto.getName()+ "님의 탈퇴 처리가 정상적으로 처리 되었습니다.<br>");
			sb.append("메인화면으로 이동 하시기 바랍니다.<br>");
			
			reAttr.addFlashAttribute("title", "회원탈퇴");
			reAttr.addFlashAttribute("message", sb.toString());
			
			return "redirect:/member/complete";
		}
		// 회원 정보 수정 폼
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		return ".member.member";
	}
	
	@PostMapping("userIdCheck")
	@ResponseBody
	public Map<String, Object> idCheck(
			@RequestParam String userId
			) throws Exception{
		
		String p = "true";
		Member dto = service.readMember(userId);
		if(dto !=null) {
			p = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("passed", p);
		return model;
	}
	
}
