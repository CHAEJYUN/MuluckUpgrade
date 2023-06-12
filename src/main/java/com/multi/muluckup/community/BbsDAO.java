package com.multi.muluckup.community;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BbsDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	//각 bbs 글 목록
	//자유게시판
	public List<BbsVO> bbs_list1() {
		List<BbsVO> list = my.selectList("bbs.all_category1");
		return list;
	}
	//질문게시판
	public List<BbsVO> bbs_list2() {
		List<BbsVO> list = my.selectList("bbs.all_category2");
		return list;
	}
	//자랑게시판
	public List<BbsVO> bbs_list3() {
		List<BbsVO> list = my.selectList("bbs.all_category3");
		return list;
	}
	
	//게시판 글쓰기(카테고리별)
	public int bbs_insert1(BbsVO bag) {
		int result = my.insert("bbs.create1", bag);
		return result;
	}
	public int bbs_insert2(BbsVO bag) {
		int result = my.insert("bbs.create2", bag);
		return result;
	}
	public int bbs_insert3(BbsVO bag) {
		int result = my.insert("bbs.create3", bag);
		return result;
	}
	
	//update(카테고리별)
	public int bbs_update1(BbsVO bag) {
		int result = my.update("bbs.update1", bag);
		return result;
	}
	public int bbs_update2(BbsVO bag) {
		int result = my.update("bbs.update2", bag);
		return result;
	}
	public int bbs_update3(BbsVO bag) {
		int result = my.update("bbs.update3", bag);
		return result;
	}
	
	//delete(카테고리별)
	public int bbs_delete1(int bbs_no) {
		int result = my.delete("bbs.delete1", bbs_no);
		return result;
	}
	public int bbs_delete2(int bbs_no) {
		int result = my.delete("bbs.delete2", bbs_no);
		return result;
	}	
	public int bbs_delete3(int bbs_no) {
		int result = my.delete("bbs.delete3", bbs_no);
		return result;
	}
	
	//게시글 검색(카테고리별)
	public BbsVO bbs_one1(int bbs_no) {
		BbsVO bag = my.selectOne("bbs.one1", bbs_no);
		return bag;
	}
	public BbsVO bbs_one2(int bbs_no) {
		BbsVO bag = my.selectOne("bbs.one2", bbs_no);
		return bag;
	}
	public BbsVO bbs_one3(int bbs_no) {
		BbsVO bag = my.selectOne("bbs.one3", bbs_no);
		return bag;
	}

	// 댓글 작성
	public int reply_insert(ReplyVO bag) {
		int result = my.insert("bbs.reply_create", bag);
		return result;
	}
	// 댓글 목록
	public List<ReplyVO> reply_list(int bbs_no) {
		List<ReplyVO> list = my.selectList("bbs.reply_all", bbs_no);
		return list;
	}
	// 댓글 삭제
	public int reply_delete(ReplyVO bag) {
		int result = my.delete("bbs.reply_delete", bag);
		return result;
	}

	//좋아요
	public int heart_ok(HeartVO bag) {
		int result = my.insert("bbs.heart_ok", bag);
		return result;
	}
	//좋아요 취소
	public int heart_no(HeartVO bag) {
		int result = my.insert("bbs.heart_no", bag);
		return result;
	}
	
	//북마크
	public int bookmark_ok(BookmarkVO bag) {
		int result = my.insert("bbs.bookmark_ok", bag);
		return result;
	}
	//북마크 취소
	public int bookmark_no(BookmarkVO bag) {
		int result = my.insert("bbs.bookmark_no",bag);
		return result;
	}

}
