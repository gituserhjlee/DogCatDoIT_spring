package com.pet.app.shopping;

public enum OrderStateCode {
	ORDER_COMPLETE(1, "주문완료"),
	ORDER_CANCEL(2, "주문취소"),
	PAY_COMPLETE(3, "결제완료"),
	DELIVERY_READY(4, "배송준비"),
	DELIVERY_START(5, "배송출발"),
	PURCHASE_CONFIRM(6, "구매확정"),
	REFUND_APPLY(7, "환불신청"),
	REFUND_COMPLETE(8, "환불완료"),
	EXCHANGE_APPLY(9, "교환신청"),
	EXCHANGE_COMPLETE(10, "교환완료");
	
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
	
	public static String codeToState(int code) {
		String result = "";
		switch (code) {
		case 1:
			result = "주문완료";
			break;
		case 2:
			result = "주문취소";
			break;
		case 3:
			result = "결제완료";
			break;
		case 4:
			result = "배송준비";
			break;
		case 5:
			result = "배송출발";
			break;
		case 6:
			result = "구매확정";
			break;
		case 7:
			result = "환불신청";
			break;
		case 8:
			result = "환불완료";
			break;
		case 9:
			result = "교환신청";
			break;
		case 10:
			result = "교환완료";
			break;
		default:
			result = "기타";
			break;
		}
		return result;
	}
}
