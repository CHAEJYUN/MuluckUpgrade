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
	
	
	//매니저 로그인
	public MemberVO mLogin(MemberVO vo){
		MemberVO result = my.selectOne("manager.login", vo);
		return result;
	}

}
