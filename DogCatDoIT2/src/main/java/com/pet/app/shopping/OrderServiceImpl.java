package com.pet.app.shopping;

import java.util.HashMap;
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
	public long insertOrder(Order dto) throws Exception {
		long orderIdx = 0;
		try {
			orderIdx = dao.selectOne("order.getOrderSeq");
			dto.setOrderIdx(orderIdx);
			String diTel = String.join("-", dto.getDiTel1(),dto.getDiTel2(),dto.getDiTel3());
			dto.setDiTel(diTel);
			
			dao.insertData("order.insertOrder", dto); // 주문 테이블 INSERT
			dao.updateData("order.insertSod", dto); // 주문상세 테이블 INSERT
			dao.insertData("order.insertDeliveryInfo", dto); // 배송정보 테이블 INSERT
			dao.insertData("order.insertPayInfo", dto); // 결제정보 테이블 INSERT
			
			// 카트에서 주문했다면 카트에서 삭제
			if(dto.getFrom().equals("cart")) {
				dao.deleteData("order.deleteCart2", dto);
			}
			
			// 회원 포인트 사용했다면 차감
			if(dto.getPointDiscount() != 0) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("userIdx", dto.getUserIdx());
				map.put("operation", "minus");
				map.put("point", dto.getPointDiscount());
				dao.updateData("member.updatePoint", map);
				map.put("amount", -1 * dto.getPointDiscount());
				map.put("by_what", "상품 구매 (포인트 사용)");
				dao.insertData("order.insertPointHistory", map);
			}
			
			// 상품 재고 차감
			for(OrderDetail od : dto.getItemList()) {
				dao.updateData("order.itemStockDown", od);
			}
			
			// 쿠폰 차감
			if(dto.getCouponName() != null)
				dao.updateData("order.couponStockDown", dto.getCouponName());
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return orderIdx;
	}
	
	@Override
	public void insertDeliveryInfo(Order dto) throws Exception {
		try {
			dao.insertData("order.insertDeliveryInfo", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public OrderDetail findOrderDetail(long detailId, int count) {
		OrderDetail dto = null;
		try {
			dto = dao.selectOne("order.findOrderDetailByDetailId", detailId);
			dto.setCount(count);
			dto.setDiscountedPrice((long)(Math.round((100- dto.getDiscountRate()) / 100.0 * dto.getItemSalePrice())) * dto.getCount());
			dto.setDiscountPrice(dto.getItemSalePrice() * dto.getCount() -dto.getDiscountedPrice());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

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
	public int cartCount(long userIdx) {
		int result = 0;
		try {
			result = dao.selectOne("order.cartCount", userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<OrderDetail> listItemInCart(long userIdx) {
		List<OrderDetail> itemlist = null;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userIdx", userIdx);
		try {
			itemlist = dao.selectList("order.cartListOrderDetail", map);
			for(OrderDetail dto : itemlist) {
				dto.setDiscountedPrice((long)(Math.round((100- dto.getDiscountRate()) / 100.0 * dto.getItemSalePrice())) * dto.getCount());
				dto.setDiscountPrice(dto.getItemSalePrice() * dto.getCount() - dto.getDiscountedPrice());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemlist;
	}
	
	@Override
	public List<OrderDetail> listItemInCart(List<Long> cartIdxs) {
		List<OrderDetail> itemlist = null;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cartIdxs", cartIdxs);
		try {
			itemlist = dao.selectList("order.cartListOrderDetail", map);
			for(OrderDetail dto : itemlist) {
				dto.setDiscountedPrice((long)(Math.round((100- dto.getDiscountRate()) / 100.0 * dto.getItemSalePrice())) * dto.getCount());
				dto.setDiscountPrice(dto.getItemSalePrice() * dto.getCount() -dto.getDiscountedPrice());
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
			e.printStackTrace();
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
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Coupon readCoupon(String couponName) {
		Coupon coupon = null;
		try {
			coupon = dao.selectOne("order.readCoupon", couponName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return coupon;
	}

	@Override
	public ShopLevel readSlevelInfo(long userIdx) {
		ShopLevel shopLevel = null;
		try {
			shopLevel = dao.selectOne("order.readSlevelInfo", userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return shopLevel;
	}

	@Override
	public CartSessionInfo getCartSessionInfo(long userIdx) {
		CartSessionInfo cInfo = null;
		try {
			cInfo = dao.selectOne("order.getCartSessionInfo", userIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cInfo;
	}

	
	

	
	
	
}
