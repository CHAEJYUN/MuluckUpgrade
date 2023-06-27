package com.multi.muluckup.diary;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class diaryDAO {

	@Autowired
	SqlSessionTemplate my;

	/* diary와 연결 DAO */
	public int insert(diaryVO bag) {
		int result = my.insert("diary.create", bag);
		//						namespace.id 
		return result;
	}

	/* diary_first와 연결 DAO */
	public int insert2(diaryVO bag) {
		int result = my.insert("diary.create2", bag);
		//						namespace.id 
		return result;
	}

/*		public int delete(String id) {
		int result = my.delete("kids.del", id);
		return result;
	}

	public int update(kidsVO bag) {
		int result = my.update("kids.up", bag);
		return result;
	}


	public kidsVO one(String id) {
		kidsVO result = my.selectOne("kids.one", id);
		return result;
	}*/

	public List<diaryVO> list() {
		List<diaryVO> list = my.selectList("diary.list");
		System.out.println("diaryDAO : " + list);
		return list;
	}
	
	public List<diaryVO> list2(diaryVO bag) {
		List<diaryVO> list = my.selectList("diary.list2", bag);
		System.out.println("diaryDAO : " + list);
		return list;
	}

}