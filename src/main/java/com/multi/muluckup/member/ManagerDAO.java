package com.multi.muluckup.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class ManagerDAO {

	@Autowired
	SqlSessionTemplate my;
	
	//회원가입
	public int join(MemberVO bag) {
		int result = my.insert("manager.create", bag);
		return result;
	}
	
	//이메일 중복체크
	public int emailCheck(String member_email) {
		int result = my.selectOne("manager.emailCheck", member_email);
		return result;
	}
	
	//아이디 중복체크
	public int idCheck(String member_id) {
		int result = my.selectOne("manager.idCheck", member_id);
		return result;
	}
	
	//닉네임 중복체크
	public int nicknameCheck(String member_nickname) {
		int result = my.selectOne("manager.nicknameCheck", member_nickname);
		return result;
	}
	
	//매니저 로그인
	public MemberVO mLogin(MemberVO vo){
		MemberVO result = my.selectOne("manager.login", vo);
		return result;
	}
	
	//회원정보 가져오기
	public MemberVO memberInfo(int member_no) {
		MemberVO info = my.selectOne("manager.memberInfo", member_no);
		System.out.println(info);
		return info;
	}
	
	//프로필 이미지, 닉네임, 성별, 연령대 변경
	public MemberVO profile_up(MemberVO bag) {
		int result = my.update("manager.profile", bag);
		MemberVO info = null;
		if (result != 0) {
			info = my.selectOne("manager.memberInfo", bag.getMember_no());
		}
		return info;
	}
	
	//이메일, pw, 이름, 전화번호 변경
	public void revise_up(MemberVO bag) {
		int result = my.update("manager.revise_up", bag);
		System.out.println(result);
	}
	
	//회원탈퇴
	public void drop(int member_no) {
		my.delete("manager.drop", member_no);
	}
	
}
