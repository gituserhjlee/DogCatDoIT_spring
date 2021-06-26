package com.pet.app.shopping;

import java.util.List;
import java.util.Map;

public interface OrderManagerService {
	public int orderCount(Map<String, Object> paramMap);
	public List<Order> listOrder(Map<String, Object> paramMap);
	public Order readOrder(long orderIdx);
	public String updateState(Map<String, Object> paramMap) throws Exception;
}
