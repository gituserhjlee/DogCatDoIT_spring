package com.pet.app.shopping;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.app.common.dao.CommonDAO;

@Service("shopping.orderService")
public class OrderServiceImpl implements OrderService {
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertOrder(Order dto) throws Exception {
		try {
			long orderIdx = dao.selectOne("order.getOrderSeq");
			dto.setOrderIdx(orderIdx);
			String diTel = String.join("-", dto.getDiTel1(),dto.getDiTel2(),dto.getDiTel3());
			dto.setDiTel(diTel);
			
			dao.insertData("order.insertOrder", dto);
			dao.insertData("order.insertDeliveryInfo", dto);
			dao.insertData("order.insertPayInfo", dto);
			
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public Order readOrder(long orderIdx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateState(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOrder(long orderIdx) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Order> listOrder(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertDeliveryInfo(Order dto) throws Exception {
		try {
			dao.insertData("order.insertDeliveryInfo", dto);
		} catch (Exception e) {
			throw e;
		}
		
	}
	
	public void insertPayInfo(Order dto) throws Exception {
		try {
			dao.insertData("order.insertPayInfo", dto);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	@Override
	public OrderDetail getOrderDetailByDetailId(long detailId) {
		OrderDetail dto = null;
		try {
			dto = dao.selectOne("order.getOrderDetailByDetailId", detailId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertWish(Wish wish) throws Exception {
		try {
			dao.insertData("order.insertWish", wish);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertCart(Cart cart) throws Exception {
		try {
			dao.insertData("order.insertCart", cart);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<OrderDetail> listItem(long userIdx) {
		List<OrderDetail> itemlist = null;
		try {
			itemlist = dao.selectList("order.cartListOrderDetail", userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemlist;
	}

	@Override
	public void deleteCart(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("order.deleteCart", map);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int cartCount(long userIdx) {
		int result = 0;
		try {
			result = dao.selectOne("order.cartCount", userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	

	
	
	
}
