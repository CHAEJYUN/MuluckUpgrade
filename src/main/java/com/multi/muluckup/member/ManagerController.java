package com.multi.muluckup.member;

import java.io.File;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "../../manager/managerLogin";
	}
	
	//회원가입
	@RequestMapping("join")
	public String join(MemberVO bag) {
		System.out.println(bag);
		int result = dao.join(bag);
		
		if (result != 0) {
			//이메일 전송
			String setFrom = "hhhj0525@gmail.com"; //보내는 이메일
			String toMail = bag.getMember_email(); //받는 사람 이메일
			String title = "[무우럭] 매니저 등록 신청하셨습니다.";
			String content = 
					"<h4>WELCOME! to Muluck 🌱</h4><br><b>" +
							bag.getMember_name() + "</b>님(" + bag.getMember_email() + ") <br>" +		
							"<b>무우럭</b> 플랫폼 관리자승인 대기 상태 입니다.🌱";
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content,true);
				mailSender.send(message);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return "manager/managerJoin";
		}else {
			return "redirect:/managerJoin.jsp?error=true";
		}
	}
	 
	 //전화번호 인증번호 보내기
	 @PostMapping("phoneAuth")
	 @ResponseBody
	 public Boolean phoneAuth(String tel, HttpSession session) {

		 String member_tel = tel;
	     try { // 이미 가입된 전화번호가 있으면
	         if(MemberService.memberTelCount(member_tel) > 0) 
	             return false; 
	     } catch (Exception e) {
	         e.printStackTrace();
	     }
	     
	     String code = memberService.sendRandomMessage(member_tel);
	     session.setAttribute("rand", code);
	     
	     return true;
	 }
	 
	//전화번호 인증번호 확인하기
	 @PostMapping("phoneAuthOk")
	 @ResponseBody
	 public Boolean phoneAuthOk(HttpSession session, HttpServletRequest request) {
	     String rand = (String) session.getAttribute("rand");
	     String code = (String) request.getParameter("code");

	     System.out.println(rand + " : " + code);

	     if (rand.equals(code)) {
	         session.removeAttribute("rand");
	         return true;
	     } 

	     return false;
	 }
	
	//email 중복 체크
	@RequestMapping(value = "emailCheck", method = RequestMethod.POST)
	@ResponseBody
	public int emailCheck(String member_email) {
		int result = dao.emailCheck(member_email);
		return result;
	}
	
	//id 중복 체크
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(String member_id) {
		int result = dao.idCheck(member_id);
		return result;
	}
	
	//nickname 중복 체크
	@RequestMapping(value = "nicknameCheck", method = RequestMethod.POST)
	@ResponseBody
	public int nicknameCheck(String member_nickname) {
		int result = dao.nicknameCheck(member_nickname);
		return result;
	}
	
	//managerPage로 이동할때
	@RequestMapping("managerPage")
	public String managerPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
        int member_no = (Integer) session.getAttribute("member_no");
		MemberVO info = dao.memberInfo(member_no);
		model.addAttribute("info", info); //속성으로 지정
		return "../../manager/managerPage";
	}
	
	//프로필 이미지, 닉네임, 성별, 연령대 변경
	@RequestMapping(value = "profile_up", method = RequestMethod.POST)
	public String profile_up(MemberVO memberVO, HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		
		if(memberVO.getMember_img().equals("myprofile.png")) {
			memberVO.setMember_img("myprofile.png");
		}else {
			if (file != null && !file.isEmpty()) {
				String member_img = file.getOriginalFilename();
				String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/member");
				File directory = new File(uploadPath);
				if (!directory.exists()) {
					directory.mkdirs();
				}
				File target = new File(uploadPath + "/" + member_img);
				file.transferTo(target);
				memberVO.setMember_img(member_img);
			} else {
				// 이미지 파일이 변경되지 않았을 때 기존 이미지 정보를 유지
				MemberVO oldMemberVO = dao.memberInfo(memberVO.getMember_no());
				memberVO.setMember_img(oldMemberVO.getMember_img());
			}
		}

	    System.out.println(memberVO.getMember_img());
	    // 수정된 정보를 다시 조회하여 model에 추가
	    MemberVO updatedMemberVO = dao.profile_up(memberVO);
	    model.addAttribute("memberVO", updatedMemberVO);
	    HttpSession session = request.getSession();
	    session.setAttribute("member_nickname", updatedMemberVO.getMember_nickname());

	    return "forward:/manager/managerPage";
	}
    
	//이메일, pw, 이름, 전화번호 변경
	@RequestMapping(value = "revise_up", method = RequestMethod.POST)
	public String revise_up(MemberVO bag) {
	    if (bag.getMember_pw() == null || bag.getMember_pw().isEmpty()) {
	        // after_pw 값이 비어 있으면 member_pw 정보를 수정하지 않음
	        bag.setMember_pw(null);
	    }
	    dao.revise_up(bag);

	    return "forward:/manager/managerPage";
	}
	 
	//회원 탈퇴
	 @RequestMapping(value = "drop", method = RequestMethod.POST) 
	 public String drop(int member_no, HttpSession session, RedirectAttributes redirectAttributes) {
		System.out.println("회원no입니다" + member_no); 
		dao.drop(member_no); 
		session.invalidate();
		
		 return "redirect:/manager/managerLogin.jsp";
	 }
	 
	 // 답변 대기 문의 목록 가져오기
	 @PostMapping("inquiry_wait")
	 public void inquiry_wait(Model model) {
		 List<ManagerInquiryVO> waitList = dao.waitList();
		 //System.out.println("사이즈: " + waitList.size()); //사이즈를 찍어보세요.
		 model.addAttribute("waitList", waitList);
	 }
	 
	 // 답변 완료 문의 목록 가져오기
	 @PostMapping("inquiry_complete")
	 public void inquiry_complete(Model model) {
		 List<ManagerInquiryVO> completeList = dao.completeList();
		 //System.out.println("사이즈: " + completeList.size()); //사이즈를 찍어보세요.
		 model.addAttribute("completeList", completeList);
	 }
	 
	//문의글 하나 가져오기
	@RequestMapping("one_inquiry")
	public void one_inquiry(int inquiry_no, Model model) {
		//System.out.println(inquiry_no);
		InquiryVO bag = dao.one_inquiry(inquiry_no);
		model.addAttribute("bag", bag);
	}
	
	//manager 정보 가져오기
	@RequestMapping("manager")
	@ResponseBody
	public MemberVO manager(@RequestParam("member_no") Integer inquiry_manager) {
	 	int member_no = inquiry_manager;
	 	//System.out.println("member_no: " + member_no);
		MemberVO result = dao.manager(member_no);
		System.out.println(result);
		return result;
	}
	
	//문의글 답변쓰기
	@RequestMapping(value = "inquiry_answer", method = RequestMethod.POST)
	@ResponseBody
	public boolean inquiry_answer(InquiryVO bag) {
		System.out.println("문의답변 등록");
		int result = dao.inquiry_answer(bag);
		if(result != 0) {
			return true;
		}else {
			return false;
		}
	}
	
	 // 매니저 승인 대기 목록 가져오기
	 @PostMapping("manager_wait")
	 public void manager_wait(Model model) {
		 List<ManagerVO> manager_wait = dao.manager_wait();
		 //System.out.println("사이즈: " + manager_wait.size()); //사이즈를 찍어보세요.
		 model.addAttribute("manager_wait", manager_wait);
	 }
	 
	 // 매니저 목록 가져오기
	 @PostMapping("manager_list")
	 public void manager_list(Model model) {
		 List<ManagerVO> manager_list = dao.manager_list();
		 //System.out.println("사이즈: " + manager_list.size()); //사이즈를 찍어보세요.
		 model.addAttribute("manager_list", manager_list);
	 }
	 
	// 회원 정보 가져오기
	@RequestMapping("manager_information")
	public void manager_information(int member_no, Model model) {
		//System.out.println(member_no);
		ManagerVO bag = dao.manager_information(member_no);
		model.addAttribute("bag", bag);
	}
		
	
	
}
