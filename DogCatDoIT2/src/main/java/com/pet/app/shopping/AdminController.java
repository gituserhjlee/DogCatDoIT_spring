package com.pet.app.shopping;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pet.app.common.MyUtil;

@Controller
@RequestMapping("/shopping/*")
public class AdminController {
	@Autowired
	private AdminService service;

	@Autowired
	private MyUtil myUtil;

	@GetMapping("mainPage")
	public String mainPage(Model model, HttpSession session) {

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
	public String adminPage() {
		return ".shopping.admin.dashboard";
	}

	@GetMapping("admin/ItemManage")
	public String ItemManage(HttpServletRequest req, Model model,
			@RequestParam(value = "page", defaultValue = "1") int current_page) {
		String cp = req.getContextPath();

		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;

		// 전체 페이지 수
		dataCount = service.dataCount();
		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		// 리스트에 출력할 데이터를 가져오기
		Map<String, Object> map = new HashMap<String, Object>();
		int offset = (current_page - 1) * rows;
		if (offset < 0)
			offset = 0;
		map.put("offset", offset);
		map.put("rows", rows);

		// 글 리스트
		List<Item> items = service.listItem(map);

		String listUrl = cp + "/shopping/admin/ItemManage";
		String paging = myUtil.paging(current_page, total_page, listUrl);

		List<ShopStore> ss = service.listStore();
		List<ItemCategory> ic = service.listCategory();
		List<ItemCategory> newic = new ArrayList<ItemCategory>();
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
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);

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

	@GetMapping("dog")
	public String dogPage(HttpServletRequest req, Model model) {	
		int dataCount = 0;
		// 전체 페이지 수
		dataCount = service.dataDogCatCount(1);
		// 글 리스트
		List<Item> items = service.listCategoryItem(1);
		for (Item i : items) {
			i.setDiscountedPrice((long) (Math.round((100 - i.getDiscountRate()) / 100.0 * i.getItemSalePrice())));
		}
		
		model.addAttribute("items", items);
		model.addAttribute("dataCount", dataCount);
     
		return ".shopping.dog";

	}
	
	@GetMapping("cat")
	public String catPage(HttpServletRequest req, Model model) {	
		int dataCount = 0;
		// 전체 페이지 수
		dataCount = service.dataDogCatCount(2);
		// 글 리스트
		List<Item> items = service.listCategoryItem(2);
		for (Item i : items) {
			i.setDiscountedPrice((long) (Math.round((100 - i.getDiscountRate()) / 100.0 * i.getItemSalePrice())));
		}
		
		model.addAttribute("items", items);
		model.addAttribute("dataCount", dataCount);
     
		return ".shopping.cat";

	}

}
