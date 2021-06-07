package com.pet.app.shopping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pet.app.common.ShopUtil;
import com.pet.app.member.Member;

@Controller("shopping.orderContoroller")
@RequestMapping("/order/*")
public class OrderControlloer {
	@Autowired
	private ShopUtil shopUtil;
	@Autowired
	private OrderService orderService;
	@Autowired
	private AdminService adminService;

	@GetMapping("orderForm")
	public String orderForm(@RequestParam long detailId, @RequestParam int count, @RequestParam String str,
			Model model) {
		// 상품 옵션 가져오기
		DetailOption itemOption = new DetailOption();
		itemOption = adminService.findbydetailOptionid(detailId);
		if (itemOption == null) {
			model.addAttribute("msg", "잘못된 접근입니다. - OrderController:35 line");
			return ".error.error";
		}
		// 상품 정보 가져오기
		Item item = adminService.findItemByItemOption(detailId);
		if (item == null) {
			model.addAttribute("msg", "잘못된 접근입니다. - OrderController:41 line");
			return ".error.error";
		}

		// 재고검사
		if (itemOption.getStock() < count) {
			model.addAttribute("msg", "수량초과");
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
		mdto = shopUtil.transformTelAddr(mdto);
		// 테스트 케이스 작성 끝
		model.addAttribute("mdto", mdto);

		if (str.equals("cart")) {
			return ".shopping.cart";
		} else if (str.equals("jjim")) {
			return ".shopping.jjim";
		}
		
		// 테스트용
		System.out.println(shopUtil.getDiscountedPrice(3, 3700));
		
		return ".shopping.order";
	}

	@PostMapping("insert")
	public String purchaseSubmit(Order dto, HttpSession session) throws Exception {

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
	public String test(Model model) {
		// 입력 예시
		// 1. 맵이 제품 1개를 의미
		Map<String, Object> m1 = new HashMap<String, Object>();
		Map<String, Object> m2 = new HashMap<String, Object>();
		m1.put("detailId", 18);
		m1.put("count", 3);
		m2.put("detailId", 4);
		m2.put("count", 1);

		// 2. 제품을 담은 맵을 리스트에 담아서 호출
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list.add(m1);
		list.add(m2);

		// 상품 옵션 가져오기
		DetailOption itemOption = null;
		Item item = null;
		try {
			for (Map<String, Object> m : list) {
				long detailId = (long)m.get("detailId");
				itemOption = adminService.findbydetailOptionid(detailId);
				item = adminService.findItemByItemOption(detailId);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 상품 정보 가져오기
//		Item item = adminService.findItemByItemOption(detailId);
//		if(item == null) {
//			model.addAttribute("msg", "잘못된 접근입니다. - OrderController:41 line");
//			return ".error.error";
//		}
//		
//		// 재고검사
//		if(itemOption.getStock()<count) {
//			model.addAttribute("msg","수량초과");
//			return ".error.error";
//		}
//		model.addAttribute("item", item);
//		model.addAttribute("itemOption", itemOption);
//		model.addAttribute("count", count); 
//
		return ".shopping.order2";
	}

}
