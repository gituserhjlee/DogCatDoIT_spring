package com.pet.app.shopping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.pet.app.common.MyUtil;

@RestController("shopping.orderManagerController")
@RequestMapping("/ordermanager/*")
public class OrderManagerController {
	@Autowired
	private OrderManagerService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public Map<String, Object> list(
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "orderIdx") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "10") int rows,
			@RequestParam String sDate,
			@RequestParam String eDate
			) {
		
		int total_page, orderCount;
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("sDate", sDate);
		paramMap.put("eDate", eDate);
		paramMap.put("condition", condition);
		paramMap.put("keyword", keyword);
		
		orderCount = service.orderCount(paramMap);
		total_page = myUtil.pageCount(rows, orderCount);
		
		if(current_page > total_page)
			current_page = total_page;
		
		int offset = (current_page - 1) * rows;
		if(offset < 0 )
			offset = 0;
		
		paramMap.put("offset", offset);
		paramMap.put("rows", rows);
		List<Order> listOrder = service.listOrder(paramMap);
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listOrder", listOrder);
		model.put("orderCount", orderCount);
		model.put("total_page", total_page);
		model.put("pageNo", current_page);
		model.put("paging", paging);
		model.put("rows", rows);
		
		return model;
	}
	
	@GetMapping("orderInfo")
	public Map<String, Object> orderInfo(@RequestParam long orderIdx) {
		
		Order order = service.readOrder(orderIdx);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("order", order);
		return model;
	}
	
	@PostMapping("updateState")
	public Map<String, Object> updateState(
			@RequestParam long orderIdx,
			@RequestParam int state
			) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("orderIdx", orderIdx);
		paramMap.put("state", state);
		
		String flag = "true";
		try {
			service.updateState(paramMap);
		} catch (Exception e) {
			flag = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("flag", flag);
		return model;
	}
	
}
