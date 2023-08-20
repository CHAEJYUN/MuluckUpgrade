package com.multi.muluckup.member;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


//@RequestMapping("member")
public class MemberController {

	@Autowired
	MemberDAO dao;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	JavaMailSender mailSender;

	//회원가입
	@RequestMapping("member/join")
	public String join(MemberVO bag) {
		System.out.println(bag);
		int result = dao.join(bag);
		
		if (result != 0) {
			//이메일 전송
			String setFrom = "hhhj0525@gmail.com"; //보내는 이메일
			String toMail = bag.getMember_email(); //받는 사람 이메일
			String title = "[무우럭] 회원가입을 축하드립니다.";
			String content = 
					"<h4>WELCOME! to Muluck 🌱</h4><br><b>" +
							bag.getMember_name() + "</b>님(" + bag.getMember_email() + ") <br>" +		
							"<b>무우럭</b> 플랫폼 회원으로 등록해주셔서 감사드립니다.<br>" +
							"진심으로 환영합니다.🌱";
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
			
			return "member/join";
		}else {
			return "../../member/join";
		}
	}
	
	//로그인
	@RequestMapping(value = "member/login", method = RequestMethod.POST)
	@ResponseBody
	public boolean login(MemberVO bag, HttpSession session) {
		//System.out.println(bag);
		MemberVO result = dao.login(bag);
		System.out.println("result : "+result);
		if(result != null) {
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
	@RequestMapping("member/logout")
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "../../member/login";
	}
	
	// 네이버 로그인 (회원가입)
	@RequestMapping("member/naverLogin")
	public String naverLogin(MemberVO bag, HttpSession session) {
		System.out.println("bag :"+bag);
		MemberVO result = dao.naverIdCheck(bag.getMember_id());
		if (result != null) {
			session.setAttribute("member_no", result.getMember_no());
			session.setAttribute("member_nickname", result.getMember_nickname());
			return "../../main/home";
		} else {
			int result2 = dao.naverInsert(bag);
			if (result2 != 0) {
				session.setAttribute("member_no", bag.getMember_no());
				session.setAttribute("member_nickname", bag.getMember_nickname());
				return "../../main/home";
			} else {
				return "redirect:/login.jsp?error=true";
			}
		}
	}
	
	// 카카오 로그인
	@RequestMapping(value = "member/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session)
			throws Exception {
		System.out.println("#########" + code);
	
		String access_Token = memberService.getAccessToken(code);
		
		System.out.println("###access_Token#### : " + access_Token);
		
		MemberVO result = memberService.getUserInfo(access_Token);
		
		//System.out.println("###id#### : " + result.getMember_email());
		//System.out.println("###email#### : " + result.getMember_email());
		//System.out.println("###nickname#### : " + result.getMember_nickname());
		//System.out.println("###img#### : " + result.getMember_img());
		//System.out.println("###gender#### : " + result.getMember_gender());
		
		if(result.getMember_gender().equals("female")){
			result.setMember_gender("F");
		}else if(result.getMember_gender().equals("male")) {
			result.setMember_gender("M");
		}else {
			result.setMember_gender("U");
		}
		
		//이메일이 있는지 확인하고
		int emailCheck = dao.emailCheck(result.getMember_email());
		
		MemberVO result2 = null;
		if(emailCheck != 1) {
			result2 = dao.createK(result);
			//세션잡기 jsp에서 ${sessionScope.member_no} 이런 형식으로 사용할 수 있다.
			session.setAttribute("member_no", result2.getMember_no());
			session.setAttribute("member_nickname", result2.getMember_nickname());
			return "../../main/home";
		}else {
			result2 = dao.kakaoEmailCheck(result.getMember_email());
			//세션잡기 jsp에서 ${sessionScope.member_no} 이런 형식으로 사용할 수 있다.
			session.setAttribute("member_no", result2.getMember_no());
			session.setAttribute("member_nickname", result2.getMember_nickname());
			return "../../main/home";
		}
		
	}
	
	
	//email 중복 체크
	@RequestMapping(value = "member/emailCheck", method = RequestMethod.POST)
	@ResponseBody
	public int emailCheck(String member_email) {
		int result = dao.emailCheck(member_email);
		return result;
	}
	
	//id 중복 체크
	@RequestMapping(value = "member/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(String member_id) {
		int result = dao.idCheck(member_id);
		return result;
	}
	
	//nickname 중복 체크
	@RequestMapping(value = "member/nicknameCheck", method = RequestMethod.POST)
	@ResponseBody
	public int nicknameCheck(String member_nickname) {
		int result = dao.nicknameCheck(member_nickname);
		return result;
	}
	
	//id 아이디 찾기
	@RequestMapping(value = "member/idFind", method = RequestMethod.POST)
	@ResponseBody
	public String idFind(MemberVO vo) {
		String member_id = dao.idFind(vo);
		return member_id;
	}
	
	//pw 패스워드 변경하기
	@RequestMapping(value = "member/pwFind", method = RequestMethod.POST)
	@ResponseBody
	public int pwFind(MemberVO vo) {
		int result = dao.pwFind(vo);
		return result;
	}
	
	//mypage로 이동할때
	@RequestMapping("member/mypage")
	public String mypage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
        int member_no = (Integer) session.getAttribute("member_no");
		MemberVO info = dao.memberInfo(member_no);
		model.addAttribute("info", info); //속성으로 지정
		return "../../member/myPage";
	}
	
	//프로필 이미지, 닉네임, 성별, 연령대 변경
	@RequestMapping(value = "member/profile_up", method = RequestMethod.POST)
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

	    return "forward:/member/mypage";
	}
    
	//이메일, pw, 이름, 전화번호 변경
	@RequestMapping(value = "member/revise_up", method = RequestMethod.POST)
	public String revise_up(MemberVO bag) {
	    if (bag.getMember_pw() == null || bag.getMember_pw().isEmpty()) {
	        // after_pw 값이 비어 있으면 member_pw 정보를 수정하지 않음
	        bag.setMember_pw(null);
	    }
	    dao.revise_up(bag);

	    return "forward:/member/mypage";
	}
	 
	//회원 탈퇴
	 @RequestMapping(value = "member/drop", method = RequestMethod.POST) 
	 public String drop(int member_no, HttpSession session, RedirectAttributes redirectAttributes) {
		System.out.println("회원no입니다" + member_no); 
		dao.drop(member_no); 
		session.invalidate();
		
		 return "redirect:/member/login.jsp";
	 }	 
	 
	 //전화번호 인증번호 보내기
	 @PostMapping("member/phoneAuth")
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
	 @PostMapping("member/phoneAuthOk")
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
	 
	 //myActivity.jsp의 시작하자마자 갯수가져오기
	 @PostMapping("member/load")
	 @ResponseBody
	 public Map<String, Integer> load(@RequestParam("member_no") String member_no) {
	   Map<String, Integer> result = new HashMap<String, Integer>();
	   int count_post = dao.count_post(member_no);
	   int count_reply = dao.count_reply(member_no);
	   int count_bookmark = dao.count_bookmark(member_no);
	   int count_get_heart = dao.count_get_heart(member_no);

	   result.put("count_post", count_post);
	   result.put("count_reply", count_reply);
	   result.put("count_bookmark", count_bookmark);
	   result.put("count_get_heart", count_get_heart);

	   return result;
	 }
	 
	 // 게시글 목록 가져오기
	 @PostMapping("member/my_post")
	 public void my_post(@RequestParam("member_no") String member_no, Model model) {
		 List<MemberPostVO> postList = dao.postList(member_no);
		 //System.out.println("사이즈: " + postList.size()); //사이즈를 찍어보세요.
		 model.addAttribute("postList", postList);
	 }
	 
	//게시물 삭제
	@RequestMapping("member/del_bbs")
	public String del_bbs(String bbs_no) {
	    dao.del_bbs(bbs_no);
	    return "forward:/member/myActivity.jsp";
	}
	 
	 // 댓글 목록 가져오기
	 @PostMapping("member/my_reply")
	 public void my_reply(@RequestParam("member_no") String member_no, Model model) {
		 List<MemberReplyVO> replyList = dao.replyList(member_no);
		 //System.out.println("사이즈: " + replyList.size()); //사이즈를 찍어보세요.
		 model.addAttribute("replyList", replyList);
	 }
	 
	// 댓글 삭제
	@RequestMapping("member/del_reply")
	public String del_reply(String reply_no) {
	    dao.del_reply(reply_no);
	    return "forward:/member/myActivity.jsp";
	}
	
	 // 북마크 목록 가져오기
	 @PostMapping("member/my_bookmark")
	 public void my_bookmark(@RequestParam("member_no") String member_no, Model model) {
		 List<MemberBookmarkVO> bookmarkList = dao.bookmarkList(member_no);
		 //System.out.println("사이즈: " + bookmarkList.size()); //사이즈를 찍어보세요.
		 model.addAttribute("bookmarkList", bookmarkList);
	 }
	 
	// 북마크 삭제
	@RequestMapping("member/del_bookmark")
	public String del_bookmark(String bookmark_no) {
	    dao.del_bookmark(bookmark_no);
	    return "forward:/member/myActivity.jsp";
	}
	
	//myActivity.jsp의 시작하자마자 갯수가져오기
	@PostMapping("member/count_follow")
	@ResponseBody
	public Map<String, Integer> count_follow(@RequestParam("member_no") String member_no) {
	  Map<String, Integer> result = new HashMap<String, Integer>();
	  int count_follower = dao.count_follower(member_no); //follower: 나를 팔로우 한 사람
	  int count_following = dao.count_following(member_no); //following: 내가 팔로우 한 사람
	
	  result.put("count_follower", count_follower);
	  result.put("count_following", count_following);
	
	  return result;
	}
	
	// follower 목록 가져오기
	@PostMapping("member/follower")
	public void follower(@RequestParam("member_no") String member_no, Model model) {
		List<MemberFollowVO> followerList = dao.followerList(member_no);
		//System.out.println("사이즈: " + followerList.size()); //사이즈를 찍어보세요.
		model.addAttribute("followerList", followerList);
	}
	 
	// following 목록 가져오기
	@PostMapping("member/following")
	public void following(@RequestParam("member_no") String member_no, Model model) {
		List<MemberFollowVO> followingList = dao.followingList(member_no);
		//System.out.println("사이즈: " + followingList.size()); //사이즈를 찍어보세요.
		model.addAttribute("followingList", followingList);
	}
	 
	// follower 삭제
	@RequestMapping("member/del_follower")
	public String del_follower(String follow_no) {
	    dao.del_follower(follow_no);
	    return "forward:/member/myFollow.jsp";
	}
	
	// following 삭제
	@RequestMapping("member/del_following")
	public String del_following(String follow_no) {
		dao.del_following(follow_no);
		return "forward:/member/myFollow.jsp";
	}
	
	// 문의글 쓰기
	@RequestMapping("member/inquiry_write")
	@ResponseBody
	public boolean inquiry_write(InquiryVO bag) {
		System.out.println("문의글 보내기");
		int result = dao.inquiry_write(bag);
		if(result != 0) {
			return true;
		}else {
			return false;
		}
	}
	
	// 문의글 목록 가져오기
	@PostMapping("member/my_inquiry")
	public void my_inquiry(String inquiry_writer, Model model) {
		 //System.out.println(inquiry_writer);
		 List<MemberInquiryVO> inquiryList = dao.inquiryList(inquiry_writer);
		 //System.out.println("사이즈: " + postList.size()); //사이즈를 찍어보세요.
		 model.addAttribute("inquiryList", inquiryList);
	 }
	 
	//문의글 하나 가져오기
	@RequestMapping("member/one_inquiry")
	public void one_inquiry(int inquiry_no, Model model) {
		//System.out.println(inquiry_no);
		InquiryVO bag = dao.one_inquiry(inquiry_no);
		model.addAttribute("bag", bag);
	}
	 
	//manager 정보 가져오기
	@RequestMapping("member/manager")
	@ResponseBody
	public MemberVO manager(@RequestParam("member_no") Integer inquiry_manager) {
	 	int member_no = inquiry_manager;
	 	//System.out.println("member_no: " + member_no);
		MemberVO result = dao.manager(member_no);
		System.out.println(result);
		return result;
	}
	
	//문의글 삭제
	@RequestMapping("member/del_inquiry")
	public String del_inquiry(int inquiry_no) {
		dao.del_inquiry(inquiry_no);
		return "forward:/member/myInquiry.jsp";
	}
	 
}
