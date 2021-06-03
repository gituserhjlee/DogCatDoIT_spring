package com.pet.app.common;

import org.springframework.stereotype.Service;

import com.pet.app.member.Member;

@Service("orderUtil")
public class OrderUtil {
	/**
	 * 전화번호와 주소 형식 변환 메소드
	 * tel : 'tel1'-'tel2'-'tel3'
	 * addr : 'addr' + 'addr' 
	 * @param dto 변환하려는 Member 객체
	 * @return dto 변환된 member 객체
	 */
	public Member transformTelAddr(Member dto) {
		if(dto==null)
			return null;
		
		String tel = dto.getTel();
		dto.setTel1(tel.substring(0, tel.indexOf("-")));
		dto.setTel2(tel.substring(tel.indexOf("-")+1, tel.lastIndexOf("-")));
		dto.setTel3(tel.substring(tel.lastIndexOf("-")+1));
		
		String addr = String.join(" ", dto.getAddr1(),dto.getAddr2());
		dto.setAddr(addr);
		
		return dto;
	}
}
