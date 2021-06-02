package com.pet.app.shopping;

import java.util.ArrayList;
import java.util.List;

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

	public List<Item> listItem() {
		List<Item> items = new ArrayList<Item>();
		try {
			items = dao.selectList("shop.selectItemList");
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
}
