package com.pet.app.talk;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.app.common.dao.CommonDAO;

@Service("talk.talkService")
public class TalkServiceImpl implements TalkService{
	@Autowired
	CommonDAO dao;
	
	@Override
	public List<Talk> listFriend(Map<String, Object> map) {
		List<Talk> list=null;
		
		try {
			list=dao.selectList("talk.listFriend", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertTalk(Talk dto) throws Exception {
		try {
			for(String receiver : dto.getReceivers()) {
				dto.setReceiverId(receiver);
				dao.insertData("talk.insertTalk", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCountReceive(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("talk.dataCountReceive", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Talk> listReceive(Map<String, Object> map) {
		List<Talk> list=null;
		
		try {
			list=dao.selectList("talk.listReceive", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCountSend(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("talk.dataCountSend", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Talk> listSend(Map<String, Object> map) {
		List<Talk> list=null;
		
		try {
			list=dao.selectList("talk.listSend", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Talk readReceive(int num) {
		Talk dto=null;
		
		try{
			dto=dao.selectOne("talk.readReceive", num);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Talk preReadReceive(Map<String, Object> map) {
		Talk dto=null;
		
		try{
			dto=dao.selectOne("talk.preReadReceive", map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Talk nextReadReceive(Map<String, Object> map) {
		Talk dto=null;
		
		try{
			dto=dao.selectOne("talk.nextReadReceive", map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public Talk readSend(int num) {
		Talk dto=null;
		
		try{
			dto=dao.selectOne("talk.readSend", num);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Talk preReadSend(Map<String, Object> map) {
		Talk dto=null;
		
		try{
			dto=dao.selectOne("talk.preReadSend", map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Talk nextReadSend(Map<String, Object> map) {
		Talk dto=null;
		
		try{
			dto=dao.selectOne("talk.nextReadSend", map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public void updateIdentifyDay(int num) throws Exception {
		try{
			dao.updateData("talk.updateIdentifyDay", num);
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteTalk(Map<String, Object> map) throws Exception {
		try{
			    // 삭제(삭제상태로 된경우에는 글을 삭제)
				dao.deleteData("talk.deleteTalk", map);
				
				// 삭제 상태가 아닌 경우는 삭제 상태로 수정
				dao.updateData("talk.updateDeleteState", map);
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int newTalkCount(String userId) {
		int result=0;
		try {
			result=dao.selectOne("talk.newTalkCount", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
