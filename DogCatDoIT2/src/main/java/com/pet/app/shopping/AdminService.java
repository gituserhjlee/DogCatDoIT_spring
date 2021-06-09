package com.pet.app.shopping;

import java.util.ArrayList;
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

	public List<Item> listCategoryItem(int num) {
		List<Item> items = new ArrayList<Item>();
		try {
			items = dao.selectList("shop.selectCategoryItemList", num);
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
}
