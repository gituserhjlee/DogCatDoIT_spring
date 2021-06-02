package com.pet.app.shopping;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shopping/*")
public class AdminController {
	@Autowired
	private AdminService service;
	

	@GetMapping("main")
	public String mainPage(Model model,HttpSession session) {

		List<Item> onsale = service.bestDiscountRate();
		for (Item i : onsale) {
			i.setDiscountedPrice((long) (Math.round((100 - i.getDiscountRate()) / 100.0 * i.getItemSalePrice())));
		}
		List<Item> all = service.listRecentItem();
		List<Item> dog = new ArrayList<Item>();
		List<Item> cat = new ArrayList<Item>();

		for (Item i : all) {
			i.setDiscountedPrice((long) (Math.round((100 - i.getDiscountRate()) / 100.0 * i.getItemSalePrice())));

			long result = service.isDogorCat(i.getItemId());
			if (result == 1) {
				dog.add(i);
			} else {
				cat.add(i);
			}

		}

		model.addAttribute("onSale", onsale);
		model.addAttribute("all", all);
		model.addAttribute("dog", dog);
		model.addAttribute("cat", cat);

		return ".shopping.mainPage";
	}

	@GetMapping("admin/dashboard")
	public String adminPage(HttpSession session) {
		return ".shopping.admin.dashboard";
	}

	@GetMapping("admin/ItemManage")
	public String ItemManage(Model model, HttpSession session) {
		
		List<ShopStore> ss = service.listStore();
		List<ItemCategory> ic = service.listCategory();
		List<ItemCategory> newic = new ArrayList<ItemCategory>();
		List<Item> items = service.listItem();
		for (ItemCategory i : ic) {
			if (i.getParentNum() != 0) {
				newic.add(i);
			}
		}

		for (ItemCategory i : newic) {
			String parent = service.findByCategoryId(i.getParentNum()).getItemCategoryName();
			i.setItemCategoryName('(' + parent + ')' + i.getItemCategoryName());
		}

		model.addAttribute("mode", "insert");
		model.addAttribute("category", newic);
		model.addAttribute("store", ss);
		model.addAttribute("items", items);

		return ".shopping.admin.ItemManage";
	}

	@PostMapping("admin/item/insert")
	public String insertItem(Item item, HttpSession session) {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "item";
		System.out.println("파일경로" + pathname);
		try {
			service.insertItem(item, pathname);
		} catch (Exception e) {
			e.printStackTrace();
			return ".error.error";
		}
		return "redirect:/shopping/admin/ItemManage";
	}
}
