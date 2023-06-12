<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>네이버 로그인 Call Back</title>
</head>
<body>
	<script type="text/javascript">
		
		var naver_id_login = new naver_id_login("u4ZSMzPdnSJwhVD6Q0ZO", "http://localhost:8888/muluck/member/callback.jsp");
		naver_id_login.setDomain(".service.com");
		// 접근 토큰 값 출력
		//alert(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			const member_id = naver_id_login.getProfileData('id')
			//member_pw = naver_id_login.getProfileData('pw')
			const member_email = naver_id_login.getProfileData('email')
			const member_name = naver_id_login.getProfileData('name')
			const member_tel = naver_id_login.getProfileData('mobile')
			const member_nickname = naver_id_login
					.getProfileData('nickname')
			const member_img = naver_id_login
					.getProfileData('profile_image')
			const member_gender = naver_id_login.getProfileData('gender')
			const member_birthyear = naver_id_login.getProfileData('birthyear')
			
			/*     alert(naver_id_login.getProfileData('email'));
			 alert(naver_id_login.getProfileData('nickname'));
			 alert(naver_id_login.getProfileData('age')); */
			/*     alert("naverLogin?member_id=" + member_id + "&member_email=" + member_email  
			 + "&member_name=" + member_name + "&member_tel=" + member_tel
			 + "&member_nickname=" + member_nickname + "&member_img=" + member_img
			 + "&member_gender=" + member_gender + "&member_birthyear=" + member_birthyear)
			 */
			 
/* 			 //콘솔에 찍어보기
			 console.log('member_id',member_id)
			 console.log('member_email',member_email) */

			location.href = "naverLogin?member_id=" + member_id
					+ "&member_email=" + member_email + "&member_name="
					+ member_name + "&member_tel=" + member_tel
					+ "&member_nickname=" + member_nickname + "&member_img="
					+ member_img + "&member_gender=" + member_gender
					+ "&member_birthyear=" + member_birthyear 
		}
	</script>
</body>
</html>