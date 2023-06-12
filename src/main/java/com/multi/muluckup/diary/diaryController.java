package com.multi.muluckup.diary;

import java.io.File;
import java.text.Normalizer;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller //스프링에서 제어하는 역할로 등록
public class diaryController {

	@Autowired 
	//MemberDAO의 싱글톤 객체가 ram의 어디에 있는지 찾아서 그 주소를 아래 변수에 넣어
	diaryDAO dao; //전역변수(글로벌 변수)
	//컨트롤 하는 기능(CRUD)
	//회원가입, 수정, 탈퇴, 정보검색
	
	//클래스 내에서 기능처리 담당
	//멤버변수 + 멤버메서드(기능처리 담당)
	
	//하나의 요청당 하나의 메서드
	//하나의 버튼 호출당 하나의 함수 연결!
	//요청된 주소가 어떻게 될 때
	//바로 아래에 있는 메서드가 호출이 될지를 써주어야 한다.
	
	//식물일기 등록 시 cardview로 이동할 수 있도록 하는 controller
	@RequestMapping(value = "diary/insert3", method = RequestMethod.POST)
	public String insert(diaryVO bag, Model model, HttpServletRequest request, MultipartFile file, String dropdown) throws Exception {
		System.out.println("cardview insert 요청됨.");
		System.out.println(bag);
		bag.setDiary_mood(dropdown);
		System.out.println(dropdown);
		
		if (file != null && !file.isEmpty()) {
			/* String savedName = file.getOriginalFilename(); */
			String savedName = Normalizer.normalize(file.getOriginalFilename(), Normalizer.Form.NFC);
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload/diary");
			File target = new File(uploadPath + "/" + savedName);
			file.transferTo(target);
		
			model.addAttribute("savedName", savedName);
			bag.setDiary_img(savedName);
		} else {
			model.addAttribute("errorMessage", "Please select a file to upload.");
		}
		
		dao.insert(bag);
		//DAO에게 insert 요청
		
		List<diaryVO> list = dao.list();
		System.out.println("controller list : "+list);
		model.addAttribute("list", list);
		
		return "redirect:cardview.jsp";
	}
		
	//첫 식물일기 등록 시 cardview로 이동할 수 있도록 하는 controller
	@RequestMapping("diary/insert2")
	public String insert2(diaryVO bag, Model model, HttpServletRequest request, MultipartFile file, String dropdown) throws Exception {
		System.out.println("cardview insert2 요청됨.");
		System.out.println(bag);
		bag.setDiary_mood(dropdown);
		System.out.println(dropdown);
		
		if (file != null && !file.isEmpty()) {
			/* String savedName = file.getOriginalFilename(); */
			String savedName = Normalizer.normalize(file.getOriginalFilename(), Normalizer.Form.NFC);
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload/diary");
			File target = new File(uploadPath + "/" + savedName);
			file.transferTo(target);
		
			model.addAttribute("savedName", savedName);
			bag.setDiary_img(savedName);
		} else {
			model.addAttribute("errorMessage", "Please select a file to upload.");
		}
		
		dao.insert2(bag);
		//DAO에게 insert 요청
	
	 List<diaryVO> list = dao.list();
	 System.out.println("controller list : "+list);
	 System.out.println("file=" + file);
	 model.addAttribute("list", list);
	 
	 return "redirect:cardview.jsp";
	}

	// cardview의 리스트를 보여주는 controller
	 @RequestMapping("diary/cardview_list") 
	 public void list(Model model) {
		 List<diaryVO> list = dao.list();
		 LinkedHashSet<diaryVO> list2 = new LinkedHashSet<diaryVO>(list);
		 System.out.println("controller list : "+list2);
		 model.addAttribute("list", list2); 
		 
		 
	 }
	 
	 // cardview의 nickname을 클릭하였을 때 해당 nickname의 일기 목록을 출력하는 controller
	 @RequestMapping("diary/cardview_individual") 
	 public void one(diaryVO bag, Model model) { //Model은 컨트롤러의 list를 views/list.jsp까지만 전달할 수 있는 객체
//		 String id = session.getAttruie("id")
		 List<diaryVO> list = dao.list2(bag);
		 System.out.println("controller list : "+list.size());
		 model.addAttribute("list", list); 
		 model.addAttribute("diary_nickname", list.get(0).getDiary_nickname());
	 }
}
