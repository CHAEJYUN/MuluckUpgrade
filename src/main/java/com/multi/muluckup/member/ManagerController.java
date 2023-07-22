package com.multi.muluckup.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller

@RequestMapping("manager")
public class ManagerController {
	
	@Autowired
	ManagerDAO dao;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	JavaMailSender mailSender;
	
	//로그인
	@RequestMapping(value = "mLogin", method = RequestMethod.POST)
	@ResponseBody
	public boolean mLogin(MemberVO bag, HttpSession session) {
		//System.out.println(bag);
		MemberVO result = dao.mLogin(bag);
		System.out.println("result : "+result);
		if(result != null && result.getMember_manager() == 1) {
			session.setAttribute("member_no", result.getMember_no());
			session.setAttribute("member_id", result.getMember_id());//로그인 아이디 저장 기능 이용하기 위해
			session.setAttribute("member_nickname", result.getMember_nickname());
			//session.setAttribute("member_email", result.getMember_email());
			return true;
		}else {
			return false;
		}
    }
	
	
}
