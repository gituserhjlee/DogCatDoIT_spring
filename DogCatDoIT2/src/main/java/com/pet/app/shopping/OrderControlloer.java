package com.pet.app.shopping;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pet.app.common.OrderUtil;
import com.pet.app.member.Member;

@Controller("shopping.orderContoroller")
@RequestMapping("/order/*")
public class OrderControlloer {
	@Autowired
	private OrderUtil orderUtil;
	@Autowired
	private OrderService orderService;
	@Autowired
	private AdminService adminService;
	
	@GetMapping("orderForm")
	public String orderForm(
			@RequestParam long detailId, 
			@RequestParam int count, 
			Model model) {
		// 상품 옵션 가져오기
		DetailOption itemOption = new DetailOption();
		itemOption = adminService.findbydetailOptionid(detailId);
		if(itemOption == null) {
			model.addAttribute("msg", "잘못된 접근입니다. - OrderController:35 line");
			return ".error.error";
		}
		// 상품 정보 가져오기
		Item item = adminService.findItemByItemOption(detailId);
		if(item == null) {
			model.addAttribute("msg", "잘못된 접근입니다. - OrderController:41 line");
			return ".error.error";
		}
		
		// 재고검사
		if(itemOption.getStock()<count) {
			model.addAttribute("msg","수량초과");
			return ".error.error";
		}
		model.addAttribute("item", item);
		model.addAttribute("itemOption", itemOption);
		model.addAttribute("count", count);
		
		// 주문자 정보 가져오기
		// 테스트 케이스 작성 시작
		Member mdto = new Member();
		mdto.setName("테스터");
		mdto.setEmail("test@naver.com");
		mdto.setTel("010-1234-5678");
		mdto.setZip("123456");
		mdto.setAddr1("서울특별시 마포구 월드컵로 14길");
		mdto.setAddr2("마포아파트 1002동 802호");
		mdto.setPoint(10000);
		mdto = orderUtil.transformTelAddr(mdto);
		// 테스트 케이스 작성 끝
		model.addAttribute("mdto", mdto);
		
		return ".shopping.order";
	}
	
	@PostMapping("insert")
	public String purchaseSubmit(
			Order dto,
			HttpSession session
			)throws Exception {
		
//		SessionInfo info = (SessionInfo)session.getAttribute("member");
//		dto.setUserIdx(info.getMemberIdx());
		dto.setUserIdx(1);
		orderService.insertOrder(dto);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "wish")
	public String wish(
			
			) throws Exception {
		return "";
	}
	
	@RequestMapping("test")
	public String test() {
		return "shopping/order2";
	}
	
}
