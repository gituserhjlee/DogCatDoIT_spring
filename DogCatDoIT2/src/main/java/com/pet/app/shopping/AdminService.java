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
		int result=0;	
		try{
			result=dao.selectOne("shop.dataCount");			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int dataDogCatCount(int num) {
		int result=0;	
		try{
			result=dao.selectOne("shop.dataCountDogCat",num);			
		} catch(Exception e) {
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
	public void insertOption(long num, String name) throws Exception {
		try {
			Map<String, Object> map=new HashMap<String, Object>();
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
		DetailOption d=new DetailOption();
		try {
			d=dao.selectOne("shop.findbydetailOptionid", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}
	
	
	public void insertdetailoptions(long optionNum,int stock, String name) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
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

	public List<Item> listItem(Map<String, Object> map) {
		List<Item> items = new ArrayList<Item>();
		try {
			items = dao.selectList("shop.selectItemList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return items;

	}
	
	public List<Item> listCategoryItem(int num) {
		List<Item> items = new ArrayList<Item>();
		try {
			items = dao.selectList("shop.selectCategoryItemList",num);
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
		long result=0;
		try {
			result=dao.selectOne("shop.isDogOrCat",id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Item findById(long num) {
		Item item=null;
		try {
			item=dao.selectOne("shop.readItem", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return item;
	}
}
