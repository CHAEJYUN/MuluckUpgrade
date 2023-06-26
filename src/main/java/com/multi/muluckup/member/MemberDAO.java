package com.multi.muluckup.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


@Repository
@Component
public class MemberDAO { 
	
	@Autowired
	SqlSessionTemplate my;
	
	//회원가입
	public int join(MemberVO bag) {
		int result = my.insert("member.create", bag);
		return result;
	}

/*
	public void delete(String id) {
		my.delete("member.del", id);
	}
	
	public void update(MemberVO bag) {
		int result = my.update("member.up", bag);
		System.out.println(result);
	}
	
	public MemberVO one(String id) {
		//타입 MemberVo  //one은 selectOne
		MemberVO vo = my.selectOne("member.one", id);
		System.out.println(vo);
		return vo;
	}
	
	public List<MemberVO> list() {
		//row하나당 어떤 vo에 넣을지만 지정하면 my.selectList()를 호출한 경우에는 
		//myBatis가 list vo가 잔뜩 들어간 LIst로 만들어준다.
		//타입 List<MemberVO>  //list는 selectList
		List<MemberVO> list = my.selectList("member.all");
		System.out.println(list.size());
		return list;
	}
*/

	//이메일 중복체크
	public int emailCheck(String member_email) {
		int result = my.selectOne("member.emailCheck", member_email);
		return result;
	}
	
	//아이디 중복체크
	public int idCheck(String member_id) {
		int result = my.selectOne("member.idCheck", member_id);
		return result;
	}
	
	//닉네임 중복체크
	public int nicknameCheck(String member_nickname) {
		int result = my.selectOne("member.nicknameCheck", member_nickname);
		return result;
	}
	
	//로그인
	public MemberVO login(MemberVO vo){
        MemberVO result = my.selectOne("member.login", vo);
        return result;
    }
	
	//네이버 회원가입
	public int naverInsert(MemberVO bag) {
		int result = my.insert("member.createN", bag);
		return result;
	}
	
	//네이버 로그인
	public MemberVO naverIdCheck(String member_id) {
		int result = my.selectOne("member.idCheck", member_id);
		MemberVO result2 = null;
		if(result == 1) {
			result2 = my.selectOne("member.naverLogin", member_id);
		}
		return result2;
	}
	
	//id 아이디 찾기
	public String idFind(MemberVO vo) {
		//타입 MemberVo  //one은 selectOne
		String member_id = my.selectOne("member.idFind", vo);
		System.out.println(member_id);
		return member_id;
	}
	
	//pw 패스워드 변경하기
	public int pwFind(MemberVO vo) {
		int result = my.update("member.pwFind", vo);
		return result;
	}
	
	//회원정보 가져오기
	public MemberVO memberInfo(int member_no) {
		MemberVO info = my.selectOne("member.memberInfo", member_no);
		System.out.println(info);
		return info;
	}
	
	//프로필 이미지, 닉네임, 성별, 연령대 변경
	public MemberVO profile_up(MemberVO bag) {
		int result = my.update("member.profile", bag);
		MemberVO info = null;
		if (result != 0) {
			info = my.selectOne("member.memberInfo", bag.getMember_no());
		}
		return info;
	}
	
	//이메일, pw, 이름, 전화번호 변경
	public void revise_up(MemberVO bag) {
		int result = my.update("member.revise_up", bag);
		System.out.println(result);
	}
	
	//회원탈퇴
	public void drop(int member_no) {
		my.delete("member.drop", member_no);
	}
	
	//전화번호 중복체크
	public int telCheck(String member_tel) {
		int result = my.selectOne("member.telCheck", member_tel);
		return result;
	}
	
	// 카카오 회원가입 로그인
	public MemberVO createK(MemberVO vo) {
		System.out.println(vo);
        int result = my.insert("member.createK", vo);
        MemberVO result2 = null;
        if(result != 0) {
			result2 = my.selectOne("member.kakaoLogin", vo.getMember_email());
		}
        
        return result2;
	}
		
	//카카오 로그인
	public MemberVO kakaoEmailCheck(String member_email) {
		MemberVO result = my.selectOne("member.kakaoLogin", member_email);
		
		return result;
	}
	
	//게시글 갯수
	public int count_post(String member_no) {
		int no = Integer.parseInt(member_no);
		int count_post = my.selectOne("member.count_post", no);
		//System.out.println("게시글 갯수: " + count_post);
		return count_post;
	}
	
	//내가쓴 댓글 갯수
	public int count_reply(String member_no) {
		int no = Integer.parseInt(member_no);
		int count_reply = my.selectOne("member.count_reply", no);
		//System.out.println("내가쓴 댓글수: " + count_reply);
		return count_reply;
	}
	
	//북마크 갯수
	public int count_bookmark(String member_no) {
		int no = Integer.parseInt(member_no);
		int count_bookmark = my.selectOne("member.count_bookmark", no);
		//System.out.println("북마크 수: " + count_bookmark);
		return count_bookmark;
	}
	
	//받은 좋아요 갯수
	public int count_get_heart(String member_no) {
		int no = Integer.parseInt(member_no);
		int count_get_heart = my.selectOne("member.count_get_heart", no);
		//System.out.println("받은 좋아요 갯수: " + count_get_heart);
		return count_get_heart;
	}
	
	//게시글 list불러오기
	public List<MemberPostVO> postList(String member_no) {
		int no = Integer.parseInt(member_no);
		List<MemberPostVO> postList = my.selectList("member.postList", no);
		return postList;
	}
	
	//게시글 삭제
	public void del_bbs(String bbs_no) {
		int bbs_No = Integer.parseInt(bbs_no);
		my.delete("member.del_bbs", bbs_No);
	}
	
	//댓글 list불러오기
	public List<MemberReplyVO> replyList(String member_no) {
		int no = Integer.parseInt(member_no);
		List<MemberReplyVO> replyList = my.selectList("member.replyList", no);
		return replyList;
	}
	
	//댓글 삭제
	public void del_reply(String reply_no) {
		int reply_No = Integer.parseInt(reply_no);
		my.delete("member.del_reply", reply_No);
	}
	
	//북마크 list불러오기
	public List<MemberBookmarkVO> bookmarkList(String member_no) {
		int no = Integer.parseInt(member_no);
		List<MemberBookmarkVO> bookmarkList = my.selectList("member.bookmarkList", no);
		return bookmarkList;
	}
	
	//북마크 삭제
	public void del_bookmark(String bookmark_no) {
		int bookmark_No = Integer.parseInt(bookmark_no);
		my.delete("member.del_bookmark", bookmark_No);
	}

	//follower 수 (나를 팔로우 한 사람)
	public int count_follower(String member_no) {
		int no = Integer.parseInt(member_no);
		int count_follower = my.selectOne("member.count_follower", no);
		//System.out.println("follower 수: " + count_follower);
		return count_follower;
	}
	
	//following 수 (내가 팔로우 한 사람)
	public int count_following(String member_no) {
		int no = Integer.parseInt(member_no);
		int count_following = my.selectOne("member.count_following", no);
		//System.out.println("following 수: " + count_following);
		return count_following;
	}
	
	//follower 목록 가져오기
	public List<MemberFollowVO> followerList(String member_no) {
		int no = Integer.parseInt(member_no);
		List<MemberFollowVO> followerList = my.selectList("member.followerList", no);
		return followerList;
	}
	
	//following 목록 가져오기
	public List<MemberFollowVO> followingList(String member_no) {
		int no = Integer.parseInt(member_no);
		List<MemberFollowVO> followingList = my.selectList("member.followingList", no);
		return followingList;
	}
	
	// follower 삭제
	public void del_follower(String follow_no) {
		int follow_No = Integer.parseInt(follow_no);
		my.delete("member.del_follower", follow_No);
	}
	
	// following 삭제
	public void del_following(String follow_no) {
		int follow_No = Integer.parseInt(follow_no);
		my.delete("member.del_following", follow_No);
	}
	
	// 문의글 쓰기
	public int inquiry_write(InquiryVO bag) {
		int result = my.insert("member.inquiry_write", bag);
		return result;
	}
	
	
}