package com.pet.app.shopping;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pet.app.common.OrderUtil;
import com.pet.app.member.Member;

@Controller("shopping.orderContoroller")
@RequestMapping("/order/*")
public class OrderControlloer {
	@Autowired
	private OrderUtil orderUtil;
	
	@RequestMapping(value = "purchase")
	public String purchase(
			Model model
			) throws Exception {
		
		// 테스트 케이스 작성 시작
		Member mdto = new Member();
		mdto.setName("테스터");
		mdto.setEmail("test@naver.com");
		mdto.setTel("010-1234-5678");
		mdto.setZip("123456");
		mdto.setAddr1("서울특별시 마포구 월드컵로 14길");
		mdto.setAddr2("마포아파트 1002동 802호");
//		mdto.setPoint(100000); // 결제금액 < 포인트
		mdto.setPoint(10000); // 결제금액 > 포인트
		mdto = orderUtil.transformTelAddr(mdto);
		// 테스트 케이스 작성 끝
		
		
		model.addAttribute("mdto", mdto);
		
		return "shopping/order";
	}
	
	
	@RequestMapping(value = "wish")
	public String wish(
			
			) throws Exception {
		return "";
	}
	
}
