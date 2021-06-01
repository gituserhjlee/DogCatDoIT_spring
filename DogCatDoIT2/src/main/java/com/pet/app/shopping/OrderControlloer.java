package com.pet.app.shopping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("shopping.orderContoroller")
@RequestMapping("/order/*")
public class OrderControlloer {
	
	@RequestMapping(value = "purchase")
	public String purchase(
			
			) throws Exception {
		
		
		return "shopping/order";
	}
	
	
	@RequestMapping(value = "wish")
	public String wish(
			
			) throws Exception {
		return "";
	}
	
}
