package com.pet.app.shopping;

import java.util.List;
import java.util.Map;

public interface OrderService {
	public void insertOrder(Order dto) throws Exception;
	public Order readOrder(long orderIdx);
	public void updateState(Map<String, Object> map) throws Exception;
	public void deleteOrder(long orderIdx) throws Exception;
	
	public List<Order> listOrder(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	// 배송정보
	public void insertDeliveryInfo(Order dto) throws Exception;
	
	// 테스트
	public Item findItemBydetailId(long detailId);
}
