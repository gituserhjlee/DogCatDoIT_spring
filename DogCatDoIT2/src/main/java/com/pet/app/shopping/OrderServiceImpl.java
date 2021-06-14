package com.pet.app.shopping;

import java.util.ArrayList;
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
			dao.updateData("order.insertSod", dto);
			dao.insertData("order.insertDeliveryInfo", dto);
			if(dto.getPayCondition()==2)
				dao.insertData("order.insertPayInfo", dto);
			
		} catch (Exception e) {
			throw e;
		}
		
	}
	
	@Override
	public void test() throws Exception {
		Order order = new Order();
//		long orderIdx = dao.selectOne("order.getOrderSeq");
		long orderIdx = 5;
		order.setOrderIdx(orderIdx);
		order.setUserIdx(1);
		order.setTotalItemPrice(10000);
		order.setDeliveryPrice(2500);
		order.setCouponDiscount(0);
		order.setPointDiscount(0);
		order.setTotalDiscount(0);
		order.setTotalPayment(12500);
		order.setOrderMemo("tt");
		List<OrderDetail> itemList = new ArrayList<OrderDetail>();
		OrderDetail od1 = new OrderDetail();
		OrderDetail od2 = new OrderDetail();
		od1.setTotalPrice(6000);
		od1.setDetailId(3);
		od1.setCount(1);
		od2.setTotalPrice(4000);
		od2.setDetailId(11);
		od2.setCount(1);
		itemList.add(od1);
		itemList.add(od2);
		order.setItemList(itemList);
		
		dao.updateData("order.insertSod", order);
		
		try {
		} catch (Exception e) {
			e.printStackTrace();
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
	public OrderDetail findOrderDetailByDetailId(long detailId) {
		OrderDetail dto = null;
		try {
			dto = dao.selectOne("order.findOrderDetailByDetailId", detailId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

//	@Override
//	public void insertWish(Wish wish) throws Exception {
//		try {
//			dao.insertData("order.insertWish", wish);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw e;
//		}
//	}

	@Override
	public void insertCart(Cart cart) throws Exception {
		try {
			// 기존에 장바구니에 있는 상품인지 확인
			Cart dto = dao.selectOne("order.readCart", cart);
			
			// 새로운 장바구니 상품이면 insert
			if(dto == null) {
				dao.insertData("order.insertCart", cart);
				return;
			}
			
			// 기존에 있는 장바구니 상품이면 count 추가
			dao.updateData("order.updateCart", cart);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<OrderDetail> listItemInCart(long userIdx) {
		List<OrderDetail> itemlist = null;
		try {
			itemlist = dao.selectList("order.cartListOrderDetail", userIdx);
			for(OrderDetail dto : itemlist) {
				dto.setDiscountedPrice((long)(Math.round((100- dto.getDiscountRate()) / 100.0 * dto.getItemSalePrice())));
				dto.setDiscountPrice(dto.getItemSalePrice()-dto.getDiscountedPrice());
			}
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
	public Cart readCart(Cart cart) {
		try {
			cart = dao.selectOne("order.readCart", cart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cart;
	}

	@Override
	public void updateCart(Cart cart) throws Exception {
		try {
			dao.updateData("order.updateCart", cart);
		} catch (Exception e) {
			throw e;
		}
		
	}


	

	
	
	
}
