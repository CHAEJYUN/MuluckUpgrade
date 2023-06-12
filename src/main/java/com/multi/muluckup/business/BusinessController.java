package com.multi.muluckup.business;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class BusinessController {
	@Autowired
	BusinessDAO dao;

	@PostMapping("business/insert")

	public void insert(BusinessVO bag, HttpServletRequest request, MultipartFile file,HttpSession session,  Model model) throws Exception {
		System.out.println(request.getParameter("latitude"));
		System.out.println(request.getParameter("longitude"));
		System.out.println(session.getAttribute("member_no").toString());
		
		//위도 경도 값을 가져와서 VO에 설정
		double latitude =Double.parseDouble(request.getParameter("latitude"));
		double longitude=Double.parseDouble(request.getParameter("longitude"));
		
		//가져온 세션 값을 콘솔에 출력
		System.out.println(bag.toString());
		
		
		//파일 업로드를 위한 경로 설정
		if (file != null && !file.isEmpty()) { //파일이 비어있지 않을때 밑에 조건문 실행
		    String savedName = file.getOriginalFilename();
		    String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
		    System.err.println("uploadPath : " + uploadPath);
		    File target = new File(uploadPath + "/" + savedName);
		    file.transferTo(target);

		    model.addAttribute("savedName", savedName);
		    bag.setBusiness_image(savedName);
		    System.out.println(uploadPath + "/" + savedName);
		}
		
		bag.setMember_no(Integer.parseInt(session.getAttribute("member_no").toString())); //세션에서 받아온 member_no를 int형으로 변환+
		bag.mapsLatitudeLongitude(latitude, longitude);
		

		//전달된 값 콘솔에 출력
		System.out.println("insert");
		System.out.println(bag);
		System.out.println(session.getAttribute("member_no"));
		System.out.println(session.getAttribute("member_id"));
		System.out.println(session.getAttribute("member_nickname"));
		dao.insert(bag);
	}
	
	

	@RequestMapping("business/shareList")
	public void shareList(PageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<BusinessVO> list = dao.all(vo);
		int count = dao.count();
		System.out.println("all count>> " + count);
		int pages = count / 10 + 1;//전체 페이지 개수 구하기
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
	}
	
	@RequestMapping("business/dealList")
	public void dealList(PageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<BusinessVO> list = dao.all(vo);
		int count1 = dao.count1();
		System.out.println("all count>> " + count1);
		int pages = count1 / 10 + 1;//전체 페이지 개수 구하기
		model.addAttribute("list", list);
		model.addAttribute("count1", count1);
		model.addAttribute("pages", pages);
	}
	
	@RequestMapping("business/businessList")
	public void businessList(BusinessVO vo, Model model) {
		BusinessVO vo2 = dao.one(vo);
		System.out.println(vo2 + "=======================");
		
		String business_place=vo2.getBusiness_place(); //business_place값만 따로 추출
		
		if (business_place != null && !business_place.isEmpty()) { //
	
		String place[]=business_place.split("/");//추출한 값을 place배열에 저장 후 "/" 기준으로 나눔
		
		double latitude=Double.parseDouble(place[0]); //나눠진 문자열을 double형으로 전환
		double longitude=Double.parseDouble(place[1]);
		
		model.addAttribute("latitude",latitude);
		model.addAttribute("longitude",longitude);
		}
		//model에 전달
		model.addAttribute("vo",vo2);
		
		
	}
	
	
	

}
