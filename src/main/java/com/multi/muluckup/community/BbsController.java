package com.multi.muluckup.community;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BbsController {

	@Autowired
	BbsDAO dao;

	// 각 bbs 글 목록
	// 자유게시판
	@RequestMapping("community/bbs1")
	public void bbs_list1(Model model) {
		List<BbsVO> bbs_list = dao.bbs_list1();
		model.addAttribute("list", bbs_list);
	}
	// 질문게시판
	@RequestMapping("community/bbs2")
	public void bbs_list2(Model model) {
		List<BbsVO> bbs_list = dao.bbs_list2();
		model.addAttribute("list", bbs_list);
	}
	// 자랑게시판
	@RequestMapping("community/bbs3")
	public void bbs_list3(Model model) {
		List<BbsVO> bbs_list = dao.bbs_list3();
		model.addAttribute("list", bbs_list);
	}
		
	//게시판 -> 글쓰기 이동(카테고리별)
	@RequestMapping("community/bbs_insert1")
	public void showPage1(HttpServletRequest request) {
	}
	@RequestMapping("community/bbs_insert2")
	public void showPage2(HttpServletRequest request) {
	}
	@RequestMapping("community/bbs_insert3")
	public void showPage3(HttpServletRequest request) {
	}
	
	//게시판 글쓰기(카테고리별)
	@RequestMapping("community/bbs_insert_ok1")
	public void bbs_insert1(BbsVO bbsVO, HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		if (file != null && !file.isEmpty()) {
			String savedName = file.getOriginalFilename();
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload/community");
			File target = new File(uploadPath + "/" + savedName);
			file.transferTo(target);
	
			model.addAttribute("savedName", savedName);
			bbsVO.setBbs_img(savedName);	
		}
		else {
			model.addAttribute("errorMessage", "Please select a file to upload.");
		}
			dao.bbs_insert1(bbsVO);
			//세션 값 가져오기
			HttpSession session = request.getSession();
			int member_no = (Integer)session.getAttribute("member_no");
			System.out.println("세션 값 : "+ member_no);
	}
	@RequestMapping("community/bbs_insert_ok2")
	public void bbs_insert2(BbsVO bbsVO, HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		if (file != null && !file.isEmpty()) {
			String savedName = file.getOriginalFilename();
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload/community");
			File target = new File(uploadPath + "/" + savedName);
			file.transferTo(target);
	
			model.addAttribute("savedName", savedName);
			bbsVO.setBbs_img(savedName);	
		}
		else {
			model.addAttribute("errorMessage", "Please select a file to upload.");
		}
			dao.bbs_insert2(bbsVO);
			//세션 값 가져오기
			HttpSession session = request.getSession();
			int member_no = (Integer)session.getAttribute("member_no");
			System.out.println("세션 값 : "+ member_no);
	}
	@RequestMapping("community/bbs_insert_ok3")
	public void bbs_insert3(BbsVO bbsVO, HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		if (file != null && !file.isEmpty()) {
			String savedName = file.getOriginalFilename();
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload/community");
			File target = new File(uploadPath + "/" + savedName);
			file.transferTo(target);
	
			model.addAttribute("savedName", savedName);
			bbsVO.setBbs_img(savedName);	
		}
		else {
			model.addAttribute("errorMessage", "Please select a file to upload.");
		}
			dao.bbs_insert3(bbsVO);
			//세션 값 가져오기
			HttpSession session = request.getSession();
			int member_no = (Integer)session.getAttribute("member_no");
			System.out.println("세션 값 : "+ member_no);
	}

	//상세페이지 -> 수정/삭제로 이동
	@RequestMapping("community/bbs_update1")
	public void showPage5(HttpServletRequest request) {
	}
	@RequestMapping("community/bbs_update2")
	public void showPage6(HttpServletRequest request) {
	}
	@RequestMapping("community/bbs_update3")
	public void showPage7(HttpServletRequest request) {
	}
	@RequestMapping("community/bbs_update4")
	public void showPage8(HttpServletRequest request) {
	}
	@RequestMapping("community/bbs_delete1")
	public void showPage9(HttpServletRequest request) {
	}
	@RequestMapping("community/bbs_delete2")
	public void showPage10(HttpServletRequest request) {
	}
	@RequestMapping("community/bbs_delete3")
	public void showPage11(HttpServletRequest request) {
	}

	//게시글 수정(본인만)
	@RequestMapping("community/bbs_update_ok1")
	public void bbs_update1(BbsVO bag) {
		dao.bbs_update1(bag);
	}
	@RequestMapping("community/bbs_update_ok2")
	public void bbs_update2(BbsVO bag) {
		dao.bbs_update2(bag);
	}
	@RequestMapping("community/bbs_update_ok3")
	public void bbs_update3(BbsVO bag) {
		dao.bbs_update3(bag);
	}

	//게시글 삭제(본인만)
	@RequestMapping("community/bbs_delete_ok1")
	public void bbs_delete1(int bbs_no) {
		dao.bbs_delete1(bbs_no);
	}
	@RequestMapping("community/bbs_delete_ok2")
	public void bbs_delete2(int bbs_no) {
		dao.bbs_delete2(bbs_no);
	}
	@RequestMapping("community/bbs_delete_ok3")
	public void bbs_delete3(int bbs_no) {
		dao.bbs_delete3(bbs_no);
	}
	
	//게시글 검색(카테고리별)
	@RequestMapping("community/bbs_one1")
	public void bbs_one1(int bbs_no, Model model) {
		BbsVO bag = dao.bbs_one1(bbs_no);
		model.addAttribute("bag", bag);
	}
	@RequestMapping("community/bbs_one2")
	public void bbs_one2(int bbs_no, Model model) {
		BbsVO bag = dao.bbs_one2(bbs_no);
		model.addAttribute("bag", bag);
	}
	@RequestMapping("community/bbs_one3")
	public void bbs_one3(int bbs_no, Model model) {
		BbsVO bag = dao.bbs_one3(bbs_no);
		model.addAttribute("bag", bag);
	}

	// 댓글 작성
	@RequestMapping("community/rr")
	public void reply_insert(ReplyVO bag, HttpServletRequest request) {
		dao.reply_insert(bag);
		// 세션 값 가져오기
		HttpSession session = request.getSession();
		int member_no = (Integer)session.getAttribute("member_no");
		System.out.println("세션 값 : " + member_no);
	}
	// 댓글 목록
	@RequestMapping("community/rr_list")
	public void reply_list(int bbs_no, Model model) {
		List<ReplyVO> reply_list = dao.reply_list(bbs_no);
		model.addAttribute("list", reply_list);
	}
	// 댓글 삭제
	@RequestMapping("community/rr_delete")
	public void reply_delete(ReplyVO bag) {
		dao.reply_delete(bag);
	}

	//좋아요
	@RequestMapping("community/heart_ok")
	public void heart_ok(HeartVO bag) {
		//System.out.println(bag);
		dao.heart_ok(bag);
	}
	//좋아요 취소
	@RequestMapping("community/heart_no")
	public void heart_no(HeartVO bag) {
		//System.out.println(bag);
		dao.heart_no(bag);
	}
	
	//북마크
	@RequestMapping("community/bookmark_ok")
	public void bookmark_ok(BookmarkVO bag) {
		//System.out.println(bag);
		dao.bookmark_ok(bag);
	}
	//북마크 취소
	@RequestMapping("community/bookmark_no")
	public void bookmark(BookmarkVO bag) {
		//System.out.println(bag);
		dao.bookmark_no(bag);
	}
	
}
