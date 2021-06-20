package com.pet.app.talk;

import java.util.List;
import java.util.Map;

public interface TalkService {
	public List<Talk> listFriend(Map<String, Object> map);
	
	public void insertTalk(Talk dto) throws Exception;

	public int dataCountReceive(Map<String, Object> map);
	public List<Talk> listReceive(Map<String, Object> map);
	
	public int dataCountSend(Map<String, Object> map);
	public List<Talk> listSend(Map<String, Object> map);
	
	public Talk readReceive(int num);
	public Talk preReadReceive(Map<String, Object> map);
	public Talk nextReadReceive(Map<String, Object> map);
	
	public Talk readSend(int num);
	public Talk preReadSend(Map<String, Object> map);
	public Talk nextReadSend(Map<String, Object> map);
	
	public void updateIdentifyDay(int num) throws Exception;
	
	public void deleteTalk(Map<String, Object> map) throws Exception;
	
	public int newTalkCount(String userId);
}
