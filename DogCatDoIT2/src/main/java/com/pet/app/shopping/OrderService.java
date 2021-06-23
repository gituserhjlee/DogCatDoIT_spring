package com.pet.app.shopping;

import java.util.List;
import java.util.Map;

public interface OrderService {
	public long insertOrder(Order dto) throws Exception;
	
	// 배송정보
	public void insertDeliveryInfo(Order dto) throws Exception;
	
	// 주문상세 가져오기
	public OrderDetail findOrderDetail(long detailId, int count);
	
	
	// 장바구니
	public void insertCart(Cart cart) throws Exception;
	public int cartCount(long userIdx);
	public List<OrderDetail> listItemInCart(long userIdx);
	public List<OrderDetail> listItemInCart(List<Long> cartIdxs);
	public void deleteCart(Map<String, Object> map) throws Exception;
	public Cart readCart(Cart cart);
	public void updateCart(Cart cart) throws Exception;
	public CartSessionInfo getCartSessionInfo(long userIdx);
	
	// 쿠폰
	public Coupon readCoupon(String couponName);
	
	// 쇼핑몰등급
	public ShopLevel readSlevelInfo(long userIdx);
	
}
