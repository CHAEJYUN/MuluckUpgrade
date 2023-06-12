package com.multi.muluckup.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FollowController {

	@Autowired
	FollowDAO dao;

	//팔로우
	@RequestMapping("community/ff_ok")
	public void follow(FollowVO followVO, HttpSession session) {
		dao.follow(followVO);
	}

	//언팔로우
	@RequestMapping("community/ff_no")
	public void unfollow(FollowVO followVO, HttpServletRequest session) {
		dao.unfollow(followVO);
	}

}
