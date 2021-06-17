package com.pet.app.shopping;

import java.util.List;
import java.util.Map;

public interface OrderService {
	public long insertOrder(Order dto) throws Exception;
	public Order readOrder(long orderIdx);
	public void updateState(Map<String, Object> map) throws Exception;
	public void deleteOrder(long orderIdx) throws Exception;
	
	public List<Order> listOrder(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	// 배송정보
	public void insertDeliveryInfo(Order dto) throws Exception;
	
	// 주문상세 가져오기
	public OrderDetail findOrderDetail(long detailId, int count);
	
	// 찜, 장바구니
//	public void insertWish(Wish wish) throws Exception;
	public void insertCart(Cart cart) throws Exception;
	public List<OrderDetail> listItemInCart(long userIdx);
	public List<OrderDetail> listItemInCart(List<Long> cartIdxs);
	public void deleteCart(Map<String, Object> map) throws Exception;
	public Cart readCart(Cart cart);
	public void updateCart(Cart cart) throws Exception;
	
	public void test() throws Exception;
	
}
