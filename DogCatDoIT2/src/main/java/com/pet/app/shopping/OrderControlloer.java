package com.pet.app.shopping;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	// 상품상세페이지에서 주문하는 경우
	@GetMapping("orderForm")
	public String orderForm(
			@RequestParam long detailId, 
			@RequestParam int count, 
			HttpSession session,
			Model model) {
		// 구매가능 여부 검사
		DetailOption itemOption = new DetailOption();
		itemOption = adminService.findbydetailOptionid(detailId);
		if(itemOption == null || !itemOption.isEnabled()) {
			model.addAttribute("msg", "구매가 불가능합니다.");
			return ".error.error";
		}
		// 재고 검사
		if (itemOption.getStock() < count) {
			model.addAttribute("msg", "재고가 부족합니다.");
			return ".error.error";
		}
		
		OrderDetail od = orderService.findOrderDetail(detailId, count);
		List<OrderDetail> itemList = new ArrayList<OrderDetail>();
		itemList.add(od);
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member mdto = memberService.readMember(info.getUserId());
		mdto = shopUtil.transformTelAddr(mdto);
		ShopLevel slevelInfo = orderService.readSlevelInfo(info.getSlevel());
		
		model.addAttribute("slevelInfo", slevelInfo);
		model.addAttribute("itemList", itemList);
		model.addAttribute("mdto", mdto);
		model.addAttribute("from", "item");
		
		return ".shopping.order";
	}
	
	// 장바구니에서 주문하는 경우
	@PostMapping("orderForm")
	public String orderFormByCart(
			@RequestParam List<Long> cartIdx, 
			HttpSession session,
			Model model) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Member mdto = memberService.readMember(info.getUserId());
		mdto = shopUtil.transformTelAddr(mdto);
		ShopLevel slevelInfo = orderService.readSlevelInfo(info.getSlevel());
		
		List<OrderDetail> itemList = null;
		itemList = orderService.listItemInCart(cartIdx);
		
		// 주문 가능한지 검사
		for(OrderDetail od : itemList) {
			DetailOption itemOption = adminService.findbydetailOptionid(od.getDetailId());
			// 구매가능 상태 검사
			if(itemOption == null || !itemOption.isEnabled()) {
				String msg = "구매가 불가능합니다.<br>";
				msg += od.getItemName()+" [옵션: "+od.getOptionName()+" "+od.getDetailName()+"]";
				model.addAttribute("msg", msg);
				return ".error.error";
			}
			// 재고 검사
			if (itemOption.getStock() < od.getCount()) {
				String msg = "재고가 부족합니다.<br>";
				msg += od.getItemName()+" [옵션: "+od.getOptionName()+" "+od.getDetailName()+"]";
				model.addAttribute("msg", msg);
				return ".error.error";
			}
		}
		
		model.addAttribute("mdto", mdto);
		model.addAttribute("slevelInfo", slevelInfo);
		model.addAttribute("itemList",itemList);
		model.addAttribute("from", "cart");
		return ".shopping.order";
	}

	@PostMapping("insert")
	public String purchaseSubmit(
			Order dto, 
			HttpSession session,
			Model model,
			final RedirectAttributes reAttr) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setUserIdx(info.getUserIdx());
		
		Date order_date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dto.setOrder_date(sdf.format(order_date));
		dto.setState(OrderStateCode.PAY_COMPLETE.getCode());
		
		try {
			long orderIdx = orderService.insertOrder(dto);
			dto.setOrderIdx(orderIdx);
		} catch (Exception e) {
			model.addAttribute("msg", "주문 실패");
			return ".error.error";
		}
		
		reAttr.addFlashAttribute("dto", dto);
		
		return "redirect:/order/complete";
	}

	@RequestMapping("complete")
	public String complete(@ModelAttribute("dto") Order dto) throws Exception {
		if(dto == null)
			return "redirect:/";
		
		return ".shopping.complete";
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
			itemList = orderService.listItemInCart(userIdx);
			
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
		
		return ".shopping.admin.orderManager";
	}
	
	@RequestMapping("deleteCart")
	@ResponseBody
	public Map<String, Object> deleteCart(
			String cartIdxs,
			HttpSession session
			) throws Exception {
		
		Map<String, Object> pMap = new HashMap<String, Object>();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		long userIdx = info.getUserIdx();
		pMap.put("userIdx", userIdx);
		pMap.put("cartIdxs", cartIdxs);
		
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
	
	@GetMapping("readCoupon")
	@ResponseBody
	public Map<String, Object> readCoupon(@RequestParam String couponName) {
		Map<String, Object> model = new HashMap<String, Object>();

		Coupon coupon = orderService.readCoupon(couponName);
		if(coupon == null) {
			model.put("state", "false");
			return model;
		}
		
		model.put("coupon", coupon);
		model.put("state", "true");
		
		return model;
	}
	
	
	
}
