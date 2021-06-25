package com.pet.app.zau;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.app.common.dao.CommonDAO;

@Service("zau.boardService")
public class ZauServiceImpl implements ZauService {
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertBoard(Zau dto) throws Exception {
		// TODO Auto-generated method stub
		try {

			dao.insertData("zau.insertBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Zau> listBoard(Map<String, Object> map) {

		List<Zau> list = null;

		try {
			list = dao.selectList("zau.listBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int result = 0;

		try {
			result = dao.selectOne("zau.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public Zau readBoard(int num) {
		// TODO Auto-generated method stub
		Zau dto = null;

		try {
			dto = dao.selectOne("zau.readBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateHitCount(int num) throws Exception {
		// TODO Auto-generated method stub
		try {
			dao.updateData("zau.updateHitCount", num);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Zau preReadBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Zau dto = null;

		try {
			dto = dao.selectOne("zau.preReadBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;

	}

	@Override
	public Zau nextReadBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Zau dto = null;

		try {
			dto = dao.selectOne("zau.nextReadBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateBoard(Zau dto) throws Exception {
		// TODO Auto-generated method stub
		try {

			dao.updateData("zau.updateBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void deleteBoard(int num, String userId) throws Exception {
		// TODO Auto-generated method stub
		try {
			Zau dto = readBoard(num);
			if (dto == null || (!userId.equals("admin") && !userId.equals(dto.getUserId())))
				return;

			dao.deleteData("zau.deleteBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public List<Zau> categoryList() {
		List<Zau> list = null;

		try {
			list = dao.selectList("zau.categoryList");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("zau.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list=null;
		try {
			list=dao.selectList("zau.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("zau.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public void deleteReply(Map<String, Object> map) throws Exception{
		try {
			dao.deleteData("zau.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	@Override
	public List<Reply> listReplyAnswer(int answer) {
		List<Reply> list=null;
		try {
			list=dao.selectList("zau.listReplyAnswer", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyAnswerCount(int answer) {
		int result=0;
		try {
			result=dao.selectOne("zau.replyAnswerCount", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception{
		try {
			dao.insertData("zau.insertReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		Map<String, Object> countMap=null;
		try {
			countMap=dao.selectOne("zau.replyLikeCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return countMap;
	}

	@Override
	public void insertBoardLike(Map<String, Object> map) throws Exception{
		try {
			dao.insertData("zau.insertBoardLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public int boardLikeCount(int num) {
		int result=0;
		try {
			result=dao.selectOne("zau.boardLikeCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
