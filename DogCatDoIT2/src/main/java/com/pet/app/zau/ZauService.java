package com.pet.app.zau;

import java.util.List;
import java.util.Map;

public interface ZauService {
	public void insertBoard(Zau dto) throws Exception;
	public List<Zau> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Zau readBoard(int num);
	public void updateHitCount(int num) throws Exception;
	public Zau preReadBoard(Map<String, Object> map);
	public Zau nextReadBoard(Map<String, Object> map);
	public void updateBoard(Zau dto) throws Exception;
	public void deleteBoard(int num, String userId) throws Exception;
	public List<Zau> categoryList();
	
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void insertReply(Reply dto) throws Exception;
	Map<String, Object> replyLikeCount(Map<String, Object> map);
	void insertBoardLike(Map<String, Object> map) throws Exception;
	public int boardLikeCount(int num);
	void insertReplyLike(Map<String, Object> map) throws Exception;
	int replyAnswerCount(int answer);
	List<Reply> listReplyAnswer(int answer);
	void deleteReply(Map<String, Object> map) throws Exception;
}
