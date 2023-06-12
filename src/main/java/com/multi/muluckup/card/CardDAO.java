package com.multi.muluckup.card;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CardDAO {
	
	@Autowired
	SqlSessionTemplate my;
	 //반려식물 등록증 만들기
	public void insert(CardVO vo) {
		my.insert("card.insert", vo);
	}
	
	// 반려식물 등록증 전체 목록
	public List<CardVO> list() {
		List<CardVO> list = my.selectList("card.all"); 
		return list;
	}
	
	// 반려식물 등록증 상세 페이지
	public CardVO one(int card_no) {
		return my.selectOne("card.one", card_no);
	}
	
	// 수정 전, 수정 페이지 불러오기
	public CardVO card_update(int card_no) {
		return my.selectOne("card.card_update", card_no);
	}
	
	// 반려식물 등록증 이미지, MMTI 변경
	
	public CardVO update(CardVO bag) {
		int result = my.update("card.update", bag);
		CardVO info = null;
		if (result != 0) {
			info = my.selectOne("card.one", bag.getCard_no());
		}
		return info;
		
//		public int update(CardVO bag) {
//		int result = my.update("card.update", bag);
//		return result;	
//	}
	}
	
	// 반려식물 등록증 삭제
	public int delete(int card_no) {
		int result = my.delete("card.del", card_no);
		return result;
	}
	
}