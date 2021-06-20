package com.pet.app.shopping;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.app.common.FileManager;
import com.pet.app.common.MyUtil;
import com.pet.app.member.SessionInfo;

@Controller
@RequestMapping("/shopping/*")
public class AdminController {
	@Autowired
	private AdminService service;

	@Autowired
	private MyUtil myUtil;

	@Autowired
	FileManager fileManager;

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
	public String adminPage(Model model) {
		List<BestItemDTO> list=new ArrayList<BestItemDTO>();
		list=service.dashboardbestitem();
		int datacount = service.dataCount();
		int ordercount = service.allShoporderCount();
		int customercount = service.allShopCustomerCount();
		long sumoriginalPrice = service.sumoriginalPrice();
		long sumsalesPrice = service.sumsalesPrice();

		model.addAttribute("list", list);
		model.addAttribute("datacount", datacount);
		model.addAttribute("ordercount", ordercount);
		model.addAttribute("customercount", customercount);
		model.addAttribute("profit", sumsalesPrice - sumoriginalPrice);
		return ".shopping.admin.dashboard";
	}

	@RequestMapping("admin/chart")
	@ResponseBody
	public Map<String, Object> chart() throws Exception {
		DashboardDTO review = null;
		review = service.saleforday();
		Map<String, Object> model = new HashMap<String, Object>();

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map;
		map = new HashMap<String, Object>();
		map.put("name", "현황");
		map.put("data", new double[] { review.getM1(), review.getM2(), review.getM3(), review.getM4(), review.getM5(), review.getM6(),
				review.getM7(), review.getM8(), review.getM9(), review.getM10(), review.getM11(), review.getM12()});
		list.add(map);
		model.put("series", list);

		return model;

	}

	@GetMapping("admin/ItemManage")
	public String ItemManage(HttpServletRequest req, Model model,
			@RequestParam(value = "page", defaultValue = "1") int current_page) {
		String cp = req.getContextPath();

		int rows = 12; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;

		// 전체 페이지 수
		dataCount = service.dataCount();
		System.out.println("개수는" + dataCount);
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

	@GetMapping("admin/item/insert")
	public String ItemInsert(Model model) {

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

		return ".shopping.admin.ItemInsert";
	}

	@PostMapping("admin/item/insert")
	public String insertItem(Item item, HttpSession session, Model model) {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "item";
		try {
			service.insertItem(item, pathname);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "상품등록실패! 모든 내용을 채우셨나요?");
			return ".error.error";
		}
		return "redirect:/shopping/admin/ItemManage";
	}

	@GetMapping("admin/item/update")
	public String ItemInsert(Model model, @RequestParam long id, @RequestParam int page) {

		List<ShopStore> ss = service.listStore();
		List<ShopStore> ss2 = new ArrayList<ShopStore>();
		List<ItemCategory> ic = service.listCategory();
		List<ItemCategory> newic = new ArrayList<ItemCategory>();
		Item item = service.findById(id);
		ItemCategory c = service.findByCategoryId(item.getItemCategoryId());
		String p = service.findByCategoryId(c.getParentNum()).getItemCategoryName();
		c.setItemCategoryName('(' + p + ')' + c.getItemCategoryName());

		ShopStore s = service.findByShopStoreId(item.getShopStoreId());
		for (ItemCategory i : ic) {
			if (i.getParentNum() != 0 && i.getItemCategoryId() != item.getItemCategoryId()) {
				newic.add(i);
			}
		}
		for (ShopStore a : ss) {
			if (a.getShopStoreId() != item.getShopStoreId()) {
				ss2.add(a);
			}
		}

		for (ItemCategory i : newic) {
			String parent = service.findByCategoryId(i.getParentNum()).getItemCategoryName();
			i.setItemCategoryName('(' + parent + ')' + i.getItemCategoryName());
		}
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");
		model.addAttribute("category", newic);
		model.addAttribute("store", ss2);
		model.addAttribute("item", item);
		model.addAttribute("itemCategoryName", c.getItemCategoryName());
		model.addAttribute("shopStoreName", s.getShopStoreName());

		return ".shopping.admin.ItemInsert";
	}

	@PostMapping("admin/item/update")
	public String updateItem(Item dto, @RequestParam int page, HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "item";

		try {
			service.updateItem(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/shopping/admin/ItemManage?page=" + page;
	}

	@PostMapping("admin/item/delete")
	public String deleteItem(@RequestParam long num, @RequestParam int page, HttpSession session) {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "item";
		List<ItemOption> options=new ArrayList<ItemOption>();
		try {
			//아이템과 연관된 모든 옵션의 기본키 찾기 
			options=service.listoptions(num);
			service.deleteItem(num, pathname);
			for(ItemOption o:options) {
				service.deleteOptionsbyitemId(num);
				service.deletedetailoptions(o.getOptionId());
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ".error.error";
		}
		return "redirect:/shopping/admin/ItemManage?page=" + page;
	}

	@RequestMapping("admin/deleteFile")
	public String deleteFile(@RequestParam long num, HttpSession session) {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "item";

		Item dto = service.findById(num);
		if (dto == null) {
			return "redirect:/shopping/admin/ItemManage";
		}
		try {
			if (dto.getSaveFileName() != null) {
				fileManager.doFileDelete(dto.getSaveFileName(), pathname);
				dto.setSaveFileName("");
				service.updateItem(dto, pathname);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/shopping/admin/item/update?id=" + num;

	}

	@GetMapping("admin/optionManage")
	public String optionManage(@RequestParam long num, Model model) {
		model.addAttribute("num", num);
		model.addAttribute("mode", "insert");

		return ".shopping.admin.optionManage";
	}

	@GetMapping("admin/itemOption")
	public String insertOption(@RequestParam long itemid, Model model) {
		List<ItemOption> options = new ArrayList<ItemOption>();
		options = service.listoptions(itemid);
		model.addAttribute("options", options);
		return "shopping/admin/itemoption";
	}

	@PostMapping("admin/itemOption")
	public String insertOption(@RequestParam long itemid, @RequestParam String optionName, Model model) {
		List<ItemOption> options = new ArrayList<ItemOption>();

		try {
			service.insertOption(itemid, optionName);
			options = service.listoptions(itemid);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("options", options);
		return "shopping/admin/itemoption";
	}
	
	@PostMapping("admin/itemOptionDelete")
	public String deleteOption(@RequestParam long itemid,@RequestParam long optionid, Model model) {
		List<ItemOption> options = new ArrayList<ItemOption>();

		try {
			service.deletedetailoptions(optionid);
			service.deleteOptions(optionid);
			options = service.listoptions(itemid);

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("options", options);
		return "shopping/admin/itemoption";

	}

	@GetMapping("admin/itemOptionUpdate")
	public String updateOptionForm(@RequestParam long itemid,@RequestParam long optionid, Model model) {
		ItemOption option=new ItemOption();
		option=service.optionfindbyoptionid(optionid);
		model.addAttribute("num", itemid);
		model.addAttribute("name", option.getOptionName());
		model.addAttribute("mode", "update");
		model.addAttribute("optionid", option.getOptionId());
		
		return ".shopping.admin.optionManage";

	}
	@PostMapping("admin/itemOptionUpdate")
	public String updateOption(@RequestParam long optionid,@RequestParam long itemid,@RequestParam String optionName, Model model) {
		List<ItemOption> options = new ArrayList<ItemOption>();
		try {
			service.updateOptions(optionid, optionName);
			options = service.listoptions(itemid);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("options", options);
		return "shopping/admin/itemoption";
	}
	@GetMapping("admin/itemdetailOption")
	public String detailOption(@RequestParam long itemoptionid, @RequestParam long itemid, Model model) {
		List<DetailOption> options = new ArrayList<DetailOption>();
		options = service.listdetailoptions(itemoptionid);
		model.addAttribute("options", options);
		model.addAttribute("itemid", itemid);
		return "shopping/admin/detailoption";
	}

	@PostMapping("admin/itemdetailOption")
	@ResponseBody
	public Map<String, Object> insertdetailOption(@RequestParam long itemoptionid, @RequestParam int stock,
			@RequestParam String detailname) {
		String state = "false";

		try {
			service.insertdetailoptions(itemoptionid, stock, detailname);
			state = "true";

		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}

	@PostMapping("admin/itemdetailOptionDelete")
	public String itemdetailOptionDelete(@RequestParam long itemid,@RequestParam long detailid, Model model) {
		List<ItemOption> options = new ArrayList<ItemOption>();

		try {
			service.deletedetailoptions2(detailid);
			options = service.listoptions(itemid);

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("options", options);
		return "shopping/admin/itemoption";

	}
	@GetMapping("admin/itemdetailOptionUpdate")
	public String itemdetailOptionUpdateForm(@RequestParam long itemid,@RequestParam long detailid, Model model) {
		
		DetailOption d=service.findbydetailOptionid(detailid);
		model.addAttribute("mode", "detailupdate");
		model.addAttribute("num", itemid);
		model.addAttribute("d", d);
		
		return ".shopping.admin.optionManage";

	}
	
	@PostMapping("admin/itemdetailOptionUpdate")
	@ResponseBody
	public String itemdetailOptionUpdate(@RequestParam long detailid,@RequestParam int stock,@RequestParam String detailname, Model model) {
		String result="success";
		try {
			service.updatedetailOptions(stock, detailname, detailid);
		} catch (Exception e) {
			e.printStackTrace();
			result="fail";
		}

		return result;
		
	}
	@GetMapping("admin/BaljuStore")
	public String BaljuStoreList(Model model) {
		List<ShopStore> shops = service.selectAllShopStore();
		model.addAttribute("shops", shops);
		return "shopping/admin/BaljuStoreList";
	}

	@PostMapping("admin/BaljuStore")
	public String BaljuStoreDelete(Model model, @RequestParam long shopStoreId) {
		try {
			service.deleteShopStore(shopStoreId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<ShopStore> shops = service.selectAllShopStore();
		model.addAttribute("shops", shops);
		return "shopping/admin/BaljuStoreList";
	}

	@GetMapping("admin/Balju")
	public String baljuPage(Model model) {
		model.addAttribute("mode", "insert");
		return ".shopping.admin.Balju";
	}

	@PostMapping("admin/Balju/insert")
	public String insertBalju(ShopStore shop, Model model) {
		List<ShopStore> shops = new ArrayList<ShopStore>();
		try {
			service.insertShopStore(shop);
			shops = service.selectAllShopStore();

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("shops", shops);
		return "shopping/admin/BaljuStoreList";

	}

	@GetMapping("admin/BaljuUpdate")
	public String updateBaljuForm(@RequestParam long id, Model model) {
		ShopStore store = new ShopStore();
		store = service.findByShopStoreId(id);
		model.addAttribute("mode", "update");
		model.addAttribute("store", store);
		return ".shopping.admin.Balju";
	}

	@PostMapping("admin/Balju/update")
	public String updateBalju(ShopStore shop, Model model) {
		List<ShopStore> shops = new ArrayList<ShopStore>();
		try {
			service.updateShopStore(shop);
			shops = service.selectAllShopStore();

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("shops", shops);
		System.out.println("성공");
		return "redirect:/shopping/admin/Balju";

	}

	@GetMapping("admin/stockManage")
	public String stockManage(Model model) {
		List<DetailOption> ic = new ArrayList<DetailOption>();
		ic = service.Alldetailoptions();
		model.addAttribute("options", ic);
		System.out.println(ic.size());
		return ".shopping.admin.stockManage";
	}

	@PostMapping("admin/insertBalju")
	public String insertBalju(@RequestParam long id, @RequestParam int count, Model model) {
		List<ShopStoreOrder> list = new ArrayList<ShopStoreOrder>();
		try {
			service.insertShopStoreOrder(id, count);
			list = service.selectShopStoreOrder();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("list", list);
		return "redirect:/shopping/admin/BaljuOrder";
	}

	@GetMapping("admin/BaljuOrder")
	public String baljuorder(Model model) {
		List<ShopStoreOrder> list = new ArrayList<ShopStoreOrder>();
		try {
			list = service.selectShopStoreOrder();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("list", list);

		return ".shopping.admin.BaljuOrder";
	}

	@GetMapping("dog")
	public String dogPage(HttpServletRequest req, Model model, @RequestParam(defaultValue = "forRecent") String sort) {
		int dataCount = 0;
		// 전체 페이지 수
		dataCount = service.dataDogCatCount(1);
		// 글 리스트
		List<Item> items = service.listCategoryItem(1, sort);
		for (Item i : items) {
			i.setDiscountedPrice((long) (Math.round((100 - i.getDiscountRate()) / 100.0 * i.getItemSalePrice())));
		}

		model.addAttribute("items", items);
		model.addAttribute("dataCount", dataCount);

		return ".shopping.dog";

	}

	@GetMapping("cat")
	public String catPage(HttpServletRequest req, Model model, @RequestParam(defaultValue = "forRecent") String sort) {
		int dataCount = 0;
		// 전체 페이지 수
		dataCount = service.dataDogCatCount(2);
		// 글 리스트
		List<Item> items = service.listCategoryItem(2, sort);
		for (Item i : items) {
			i.setDiscountedPrice((long) (Math.round((100 - i.getDiscountRate()) / 100.0 * i.getItemSalePrice())));
		}

		model.addAttribute("items", items);
		model.addAttribute("dataCount", dataCount);

		return ".shopping.cat";

	}

	@GetMapping("article")
	public String article(@RequestParam long num, Model model) {
		Item item = null;
		List<DetailOption> d = new ArrayList<DetailOption>();
		int count = 0;
		double average = 0;
		item = service.findById(num);
		item.setDiscountedPrice((long) (Math.round((100 - item.getDiscountRate()) / 100.0 * item.getItemSalePrice())));
		d = service.listAllOptions(num);
		count = service.countReview(num);
		if (service.sumReview(num) > 0) {
			average = (double) service.sumReview(num) / count;
		}

		model.addAttribute("item", item);
		model.addAttribute("options", d);
		model.addAttribute("count", count);
		model.addAttribute("average", Double.parseDouble(String.format("%.2f", average)));
		model.addAttribute("mode", "insert");

		return ".shopping.article";
	}

	@GetMapping("review")
	public String listReview(@RequestParam long itemId, Model model) {
		System.out.println("아이템번호" + itemId);
		List<ShopReview> reviews = new ArrayList<ShopReview>();

		try {
			reviews = service.selectReview(itemId);

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("reviews", reviews);

		return "/shopping/reviewList";
	}

	@PostMapping("review")
	public String insertReview(ShopReview review, HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		// 배송완료 아닌 사람은 못쓰게
		int bought = service.isUserBought(info.getUserIdx(), review.getItemId());// 상품을 구매한 개수
		if (bought < 1) {
			model.addAttribute("msg", "배송완료된 상품에 대해 리뷰 작성이 가능합니다");
			return "/error/error";
		}
		// 리뷰는 주문개수만큼만 쓸 수 있음
		int reviewCount = service.itemReviewCount(info.getUserIdx(), review.getItemId());// 이미 작성한 리뷰개수
		if (reviewCount >= bought) {
			model.addAttribute("msg", "리뷰는 주문 개수 만큼만 쓸 수 있습니다");
			return "/error/error";

		}

		List<ShopReview> reviews = new ArrayList<ShopReview>();

		review.setUseridx(info.getUserIdx());
		try {
			service.insertReview(review);
			reviews = service.selectReview(review.getItemId());

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("reviews", reviews);

		return "/shopping/reviewList";
	}

	@GetMapping("updatereview")
	public String updateReviewForm(@RequestParam long reviewNum, @RequestParam long useridx, @RequestParam long itemId,
			HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info.getUserIdx() != useridx) {
			model.addAttribute("msg", "자신의 글만 수정 가능합니다");
			return ".error.error";
		}

		ShopReview review = service.findByReviewId(reviewNum);
		Item item = null;
		List<DetailOption> d = new ArrayList<DetailOption>();
		int count = 0;
		double average = 0;
		item = service.findById(itemId);
		item.setDiscountedPrice((long) (Math.round((100 - item.getDiscountRate()) / 100.0 * item.getItemSalePrice())));
		d = service.listAllOptions(itemId);
		count = service.countReview(itemId);
		average = (double) service.sumReview(itemId) / count;

		model.addAttribute("item", item);
		model.addAttribute("options", d);
		model.addAttribute("count", count);
		model.addAttribute("average", Double.parseDouble(String.format("%.2f", average)));
		model.addAttribute("review", review);
		model.addAttribute("mode", "update");
		return ".shopping.article";
	}

	@PostMapping("updatereview")
	public String updateReview(ShopReview review, HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info.getUserIdx() != review.getUseridx()) {
			model.addAttribute("msg", "자신의 글만 수정 가능합니다");
			return ".error.error";
		}
		List<ShopReview> reviews = new ArrayList<ShopReview>();

		try {
			service.updateReview(review);
			reviews = service.selectReview(review.getItemId());

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("reviews", reviews);

		return "/shopping/reviewList";

	}

	@PostMapping("deletereview")
	public String deleteReview(@RequestParam long reviewNum, @RequestParam long useridx, @RequestParam long itemId,
			HttpServletRequest req, Model model) {
		List<ShopReview> reviews = new ArrayList<ShopReview>();
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info.getUserIdx()!=1 && info.getUserIdx() != useridx) {
			model.addAttribute("msg", "자신의 글만 삭제 가능합니다");
			return "/error/error";
		}

		try {
			service.deleteReview(reviewNum, info.getUserIdx());
			reviews = service.selectReview(itemId);

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("reviews", reviews);

		return "/shopping/reviewList";
	}

	@GetMapping("admin/CouponList")
	public String CouponList(Model model) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<Coupon> coupons = new ArrayList<Coupon>();
		coupons = service.couponList();

		for (Coupon c : coupons) {
			Date today = new Date();

			String today2 = sdf.format(today);
			String deadline = c.getDeadline();
			int compare = sdf.parse(deadline).compareTo(sdf.parse(today2));
			if (compare < 0) {
				c.setEnd(true);
			} else {
				c.setEnd(false);
			}
		}
		model.addAttribute("coupons", coupons);

		return "/shopping/admin/CouponList";
	}

	@GetMapping("admin/CouponManage")
	public String couponManage() {

		return ".shopping.admin.CouponManage";
	}

	@PostMapping("admin/CouponManage")
	public String couponinsert(Coupon coupon, Model model) throws ParseException {
		Calendar cal=Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(coupon.getDeadline());
		Date date=sdf2.parse(coupon.getDeadline());
		cal.setTime(date);
		cal.add(Calendar.HOUR, 24);
		cal.add(Calendar.SECOND, -1);
		coupon.setDeadline(sdf.format(cal.getTime()));
		System.out.println(coupon.getDeadline());
		List<Coupon> coupons = new ArrayList<Coupon>();
		try {
			service.insertCoupon(coupon);
			coupons = service.couponList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (Coupon c : coupons) {
			Date today = new Date();

			String today2 = sdf.format(today);
			String deadline = c.getDeadline();
			int compare = sdf.parse(deadline).compareTo(sdf.parse(today2));

			if (compare < 0) {
				c.setEnd(true);
			} else {
				c.setEnd(false);
			}
		}
		model.addAttribute("coupons", coupons);
		return "/shopping/admin/CouponList";
	}

	
	@PostMapping("admin/couponCheck")
	@ResponseBody
	public Map<String, Object> couponCheck(
			@RequestParam String couponName
			) throws Exception {
		
		String p="true";
		Coupon dto=service.findByCouponName(couponName);
		if(dto!=null) {
			p="false";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("passed", p);
		return model;
	}
	
	@GetMapping("admin/levelManage")
	public String levelManage(Model model) {
		model.addAttribute("mode", "insert");
		return ".shopping.admin.levelManage";
	}
	
	@GetMapping("admin/LevelList")
	public String levelList(Model model) {
		  List<ShopLevel> list=new ArrayList<ShopLevel>();
		  list=service.selectShopLevels(); 
		  model.addAttribute("list", list);
		  return "/shopping/admin/levelList";
	}
	
	@PostMapping("admin/levels")
	public String insertLevel(ShopLevel level,Model model) {
		try {
			service.insertShoplevels(level);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		 List<ShopLevel> list=new ArrayList<ShopLevel>();
		  list=service.selectShopLevels(); model.addAttribute("list", list);
		  model.addAttribute("list", list);
		  return "/shopping/admin/levelList";		
	}
	
	@GetMapping("admin/updatelevels")
	public String updateLevelForm(@RequestParam long levelId, Model model) {
		ShopLevel level=service.findByLevelId(levelId);
		model.addAttribute("mode", "update");
		model.addAttribute("level", level);
		return ".shopping.admin.levelManage";
	}
	
	@PostMapping("admin/updatelevels")
	@ResponseBody
	public String updateLevel(ShopLevel level) {
		String result="true";
		try {
			service.updateShoplevels(level);
		} catch (Exception e) {
			e.printStackTrace();
			result="false";
		}
		return result;
	}

	@PostMapping("admin/deletelevels")
	@ResponseBody
	public String deletelevelsLevel(@RequestParam long levelId, Model model) {
		String result="true";
		try {
			service.deleteShoplevels(levelId);
		} catch (Exception e) {
			e.printStackTrace();
			result="false";
		}
		return result;
	}
	
	@PostMapping("admin/levelCheck")
	@ResponseBody
	public Map<String, Object> levelCheck(
			@RequestParam String levelName
			) throws Exception {
		
		String p="true";
		ShopLevel dto=service.findByLevelName(levelName);
		if(dto!=null) {
			p="false";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("passed", p);
		return model;
	}
	
	@GetMapping("admin/orderManage")
	public String orderManage() {
		return ".shopping.admin.orderManager";
	}
}
