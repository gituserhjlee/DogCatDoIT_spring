package com.pet.app.shopping;

public enum OrderStateCode {
	ORDER_COMPLETE(1, "주문완료"),
	ORDER_CANCEL(2, "주문취소"),
	PAY_COMPLETE(3, "결제완료"),
	DELIVERY_READY(4, "배송준비중"),
	DELIVERY_START(5, "배송중"),
	PURCHASE_CONFIRM(6, "구매확정"),
	RETURN_APPLY(7, "반품신청"),
	RETURN_COMPLETE(8, "반품완료"),
	REFUND_APPLY(9, "환불신청"),
	REFUND_COMPLETE(10, "환불완료"),
	EXCHANGE_APPLY(11, "교환신청"),
	EXCHANGE_COMPLETE(12, "교환완료");
	
	private final int code;
	private final String state;
	
	OrderStateCode(int code, String state) {
		this.code = code;
		this.state = state;
	}
	
	public String getState() {
		return state;
	}
	
	public int getCode() {
		return code;
	}
}
