package com.pet.app.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("store.storeController")
@RequestMapping("/store/*")
public class StoreController {
	
	@RequestMapping(value = "store")
	public String main() throws Exception{
		return ".store.store";
	}
	
	@RequestMapping(value = "list")
	public String list() throws Exception{
		return ".store.list";
	}
}

