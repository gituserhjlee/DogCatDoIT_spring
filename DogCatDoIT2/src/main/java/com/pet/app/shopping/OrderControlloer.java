package com.pet.app.shopping;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.app.common.ShopUtil;
import com.pet.app.member.Member;
import com.pet.app.member.MemberService;
import com.pet.app.member.SessionInfo;

@Controller("shopping.orderContoroller")
@RequestMapping("/order/*")
public class OrderControlloer {
	@Autowired
	private ShopUtil shopUtil;
	@Autowired
	private OrderService orderService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private MemberService memberService;

	@GetMapping("orderForm")
	public String orderForm(
			@RequestParam long detailId, 
			@RequestParam int count, 
			HttpSession session,
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

		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member mdto = memberService.readMember(info.getUserId());
		mdto = shopUtil.transformTelAddr(mdto);
		model.addAttribute("mdto", mdto);
		
		return ".shopping.order";
	}

	@PostMapping("insert")
	public String purchaseSubmit(Order dto, HttpSession session) throws Exception {

//		SessionInfo info = (SessionInfo)session.getAttribute("member");
//		dto.setUserIdx(info.getMemberIdx());
		dto.setUserIdx(1);
		orderService.insertOrder(dto);
		
		return "redirect:/shopping/complete";
	}

	
	
	@RequestMapping("wishlist")
	public String wish(HttpSession session) throws Exception {
		
//		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		
		return "shopping/jjim";
	}
	
	@RequestMapping(value = "insertCart", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertCart(
			Cart cart,
			HttpSession session
			) throws Exception {
		
		// Cart 객체에 userIdx 담기
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		cart.setUserIdx(info.getUserIdx());
		
		Map<String, Object> model = new HashMap<String, Object>();
		String state = "true";
		try {
			orderService.insertCart(cart);
		} catch (Exception e) {
			state = "false";
		}
		model.put("state", state);
		return model;
	}
	
	@GetMapping("cart")
	public String cart() throws Exception {
		return ".shopping.cart";
	}
	
	@RequestMapping(value = "cartList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cartList(
			String str,
			HttpSession session
			) throws Exception {
		
		Map<String, Object> pMap = new HashMap<String, Object>();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		long userIdx = info.getUserIdx();
		pMap.put("userIdx", userIdx);
		pMap.put("detailIds", str);
		
		Map<String, Object> model = new HashMap<String, Object>();
		List<OrderDetail> itemList = null;
		try {
			itemList = orderService.listItem(userIdx);
			
			model.put("state", "true");
			model.put("itemList",itemList);
		} catch (Exception e) {
			e.printStackTrace();
			model.put("state", "false");
		}
		
		return model;
	}
	
	@RequestMapping("test1")
	public String test1() throws Exception {
		return ".shopping.test";
	}
	
	@RequestMapping("deleteCart")
	@ResponseBody
	public Map<String, Object> deleteCart(
			String detailIds,
			HttpSession session
			) throws Exception {
		
		Map<String, Object> pMap = new HashMap<String, Object>();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		long userIdx = memberService.readMember(info.getUserId()).getUserIdx();
		pMap.put("userIdx", userIdx);
		pMap.put("detailIds", detailIds);
		
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			orderService.deleteCart(pMap);
			model.put("state", "true");
		} catch (Exception e) {
			e.printStackTrace();
			model.put("state", "false");
		}
		
		return model;
	}
	
	
	
	
}
