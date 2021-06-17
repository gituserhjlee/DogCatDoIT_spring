package com.pet.app.shopping;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.app.common.FileManager;
import com.pet.app.common.dao.CommonDAO;

@Service
public class AdminService {

	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;

	public int dataCount() {
		int result = 0;
		try {
			result = dao.selectOne("shop.dataCount");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public int dataDogCatCount(int num) {
		int result = 0;
		try {
			result = dao.selectOne("shop.dataCountDogCat", num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public void insertItem(Item dto, String pathname) throws Exception {
		try {

			String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
			if (saveFilename != null) {
				dto.setSaveFileName(saveFilename);
			}
			dto.setEnabled(true);
			dao.insertData("shop.insertItem", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	public void deleteItem(long num, String pathname) throws Exception {
		try {
			Item dto=findById(num);
			if(dto==null)
				return;
			fileManager.doFileDelete(dto.getSaveFileName(), pathname);
			dao.updateData("shop.deleteItem", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	public void updateItem(Item dto, String pathname) throws Exception{
		try{
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename != null) {
				if(dto.getSaveFileName()!=null && dto.getSaveFileName().length()!=0)
					fileManager.doFileDelete(dto.getSaveFileName(), pathname);
				
				dto.setSaveFileName(saveFilename);
			}
			
			dao.updateData("shop.updateItem", dto);
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	public void insertOption(long num, String name) throws Exception {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("num", num);
			map.put("name", name);
			dao.insertData("shop.insertOption", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public ItemOption optionfindbyoptionid(long optionid) {
		ItemOption option=new ItemOption();
		try {
			option=dao.selectOne("shop.optionfindbyoptionid", optionid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return option;
	}
	
	public void deleteOptions(long optionid) throws Exception{
		try {
			dao.deleteData("shop.deleteOptions", optionid);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public void deleteOptionsbyitemId(long itemid) throws Exception{
		try {
			dao.deleteData("shop.deleteOptionsbyitemId", itemid);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public void updateOptions(long optionid, String optionname) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("optionname", optionname);
		map.put("optionid", optionid);
		try {
			dao.updateData("shop.updateOptions", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	public void deletedetailoptions(long optionid) throws Exception{
		try {
			dao.deleteData("shop.deletedetailoptions", optionid);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	public void deletedetailoptions2(long detailid) throws Exception{
		try {
			dao.deleteData("shop.deletedetailoptions2", detailid);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	public void updatedetailOptions(int stock, String detailname, long detailid ) throws Exception{
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("stock", stock);
		map.put("detailname", detailname);
		map.put("detailid", detailid);
		try {
			dao.updateData("shop.updatedetailOptions", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	public List<ItemOption> listoptions(long num) {
		List<ItemOption> ic = new ArrayList<ItemOption>();
		try {
			ic = dao.selectList("shop.selectOptions", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ic;
	}
	public List<DetailOption> Alldetailoptions(){
		List<DetailOption> ic = new ArrayList<DetailOption>();
		try {
			ic=dao.selectList("shop.AlldetailOptions");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ic;
	}

	public List<DetailOption> listdetailoptions(long num) {
		List<DetailOption> ic = new ArrayList<DetailOption>();
		try {
			ic = dao.selectList("shop.selectdetailOptions", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ic;
	}

	public DetailOption findbydetailOptionid(long num) {
		DetailOption d = new DetailOption();
		try {
			d = dao.selectOne("shop.findbydetailOptionid", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}

	public Item findItemByItemOption(long num) {
		Item d = new Item();
		try {
			d = dao.selectOne("shop.findItemByItemOption", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}

	public void insertdetailoptions(long optionNum, int stock, String name) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("optionNum", optionNum);
		map.put("stock", stock);
		map.put("name", name);

		try {
			dao.insertData("shop.insertdetailOptions", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	public List<DetailOption> listAllOptions(long num) {
		List<DetailOption> ic = new ArrayList<DetailOption>();
		try {
			ic = dao.selectList("shop.selectAllOptions", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ic;
	}

	public List<ItemCategory> listCategory() {
		List<ItemCategory> ic = new ArrayList<ItemCategory>();
		try {
			ic = dao.selectList("shop.selectItemCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ic;
	}

	public ItemCategory findByCategoryId(long id) {
		ItemCategory ic = null;
		try {
			ic = dao.selectOne("shop.findItemCategory", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ic;
	}

	public List<ShopStore> listStore() {
		List<ShopStore> ss = new ArrayList<ShopStore>();
		try {
			ss = dao.selectList("shop.selectShopStore");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ss;

	}
	public void deleteShopStore(long shopStoreId) throws Exception {
		try {
			dao.updateData("shop.deleteShopStore", shopStoreId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public List<Item> listItem(Map<String, Object> map) {
		List<Item> items = new ArrayList<Item>();
		try {
			items = dao.selectList("shop.selectItemList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return items;

	}

	public List<Item> listCategoryItem(int num, String sort) {
		Map<String,Object > map=new HashMap<String, Object>();
		map.put("num", num);
		map.put("sort", sort);
		List<Item> items = new ArrayList<Item>();
		try {
			items = dao.selectList("shop.selectCategoryItemList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return items;

	}

	public List<Item> bestDiscountRate() {
		List<Item> items = new ArrayList<Item>();
		try {
			items = dao.selectList("shop.selectOnSale");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return items;

	}

	public List<Item> listRecentItem() {
		List<Item> items = new ArrayList<Item>();
		try {
			items = dao.selectList("shop.selectRecentItem");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return items;

	}

	public long isDogorCat(long id) {
		long result = 0;
		try {
			result = dao.selectOne("shop.isDogOrCat", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public Item findById(long num) {
		Item item = null;
		try {
			item = dao.selectOne("shop.readItem", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return item;
	}

	public void insertShopStore(ShopStore shop) throws Exception {
		try {
			shop.setEnabled(true);
			dao.insertData("shop.insertShopStore", shop);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public void updateShopStore(ShopStore shop) throws Exception{
		try {
			dao.updateData("shop.updateShopStore", shop);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public List<ShopStore> selectAllShopStore(){
		List<ShopStore> shops=new ArrayList<ShopStore>();
		try {
			shops=dao.selectList("shop.selectAllShopStore");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return shops;
	}
	public ShopStore findByShopStoreId(long num) {
		ShopStore ss=new ShopStore();
		try {
			ss=dao.selectOne("shop.findByShopStoreId", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ss;
	}
	public List<ShopStoreOrder> selectShopStoreOrder(){
		List<ShopStoreOrder> list=new ArrayList<ShopStoreOrder>();
		try {
			list=dao.selectList("shop.selectShopStoreOrder");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public void insertShopStoreOrder(long detailid, int count) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("detailid", detailid);
		map.put("count", count);
		try {
			dao.insertData("shop.insertShopStoreOrder", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
			
		}
	}
	
	public void insertCoupon(Coupon coupon) throws Exception {
		try {
			dao.insertData("shop.insertCoupon", coupon);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public List<Coupon> couponList(){
		List<Coupon> list=new ArrayList<Coupon>();
		try {
			list=dao.selectList("shop.selectCouponList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Coupon findByCouponName(String couponName) {
		Coupon c=new Coupon();
		try {
			c=dao.selectOne("shop.findByCouponName", couponName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	
	public void insertReview(ShopReview review) throws Exception {
		try {
			dao.insertData("shop.insertReview", review);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public List<ShopReview> selectReview(long itemId){
		List<ShopReview> review=new ArrayList<ShopReview>();
		try {
			review=dao.selectList("shop.selectReview", itemId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return review;
		
	}
	
	public int countReview(long itemId) {
		int result=0;
		try {
			result=dao.selectOne("shop.countReview", itemId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	public int sumReview(long itemId) {
		int result=0;
		try {
			result=dao.selectOne("shop.sumReview", itemId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void deleteReview(long reviewNum, long useridx) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("reviewNum", reviewNum);
		map.put("useridx", useridx);
		try {
			dao.deleteData("shop.deletereview", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	public ShopReview findByReviewId(long reviewNum) {
		ShopReview review=null;
		try {
			review=dao.selectOne("shop.findByReviewId", reviewNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return review;
		
	}
	
	public void updateReview(ShopReview review) throws Exception {
		try {
			dao.updateData("shop.updateReview", review);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public int isUserBought(long useridx, long itemId) {
		int result=0;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("useridx", useridx);
		map.put("itemId", itemId);
		try {
			result=dao.selectOne("shop.isUserBought", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int itemReviewCount(long useridx, long itemId) {
		int result=0;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("useridx", useridx);
		map.put("itemId", itemId);
		try {
			result=dao.selectOne("shop.ItemReviewCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int allShoporderCount() {
		int result=0;
		try {
			result=dao.selectOne("shop.AllshoporderCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int allShopCustomerCount() {
		int result=0;
		try {
			result=dao.selectOne("shop.AllShopCustomerCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public long sumoriginalPrice() {
		long result=0;
		try {
			result=dao.selectOne("shop.sumoriginalPrice");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public long sumsalesPrice() {
		long result=0;
		try {
			result=dao.selectOne("shop.sumsalesPrice");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public DashboardDTO saleforday(){
		Map<String, Object> map=new HashMap<String, Object>();
		DashboardDTO review=new DashboardDTO();
		Calendar cal = Calendar.getInstance();
		String year =Integer.toString(cal.get(Calendar.YEAR));
		String m1=year+"-01";
		String m2=year+"-02";
		String m3=year+"-03";
		String m4=year+"-04";
		String m5=year+"-05";
		String m6=year+"-06";
		String m7=year+"-07";
		String m8=year+"-08";
		String m9=year+"-09";
		String m10=year+"-010";
		String m11=year+"-011";
		String m12=year+"-012";
		map.put("m1", m1);
		map.put("m2", m2);
		map.put("m3", m3);
		map.put("m4", m4);
		map.put("m5", m5);
		map.put("m6", m6);
		map.put("m7", m7);
		map.put("m8", m8);
		map.put("m9", m9);
		map.put("m10", m10);
		map.put("m11", m11);
		map.put("m12", m12);
		try {
			review=dao.selectOne("shop.saleforday",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return review;
	}
	
	public List<BestItemDTO> dashboardbestitem(){
		List<BestItemDTO> list=new ArrayList<BestItemDTO>();
		try {
			list=dao.selectList("shop.dashboardbestitem");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<ShopLevel> selectShopLevels(){
		List<ShopLevel> list=new ArrayList<ShopLevel>();
		try {
			list=dao.selectList("shop.selectShoplevels");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void insertShoplevels(ShopLevel level) throws Exception {
		try {
			dao.insertData("shop.insertShoplevels", level);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public void updateShoplevels(ShopLevel level) throws Exception {
		try {
			dao.insertData("shop.updateShoplevels", level);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public void deleteShoplevels(long levelId) throws Exception {
		try {
			dao.deleteData("shop.deleteShoplevels", levelId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;		}
	}
	public ShopLevel findByLevelId(long levelId ) {
		ShopLevel level=null;
		try {
			level=dao.selectOne("shop.findByLevelId", levelId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return level;
	}
	
	public ShopLevel findByLevelName(String levelName) {
		ShopLevel level=new ShopLevel();
		try {
			level=dao.selectOne("shop.findByLevelName", levelName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return level;
	}
}
