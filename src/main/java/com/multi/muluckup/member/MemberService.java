package com.multi.muluckup.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class MemberService {
	//전화번호 인증 난수 생성
	public String sendRandomMessage(String tel) {
	    Naver_Sens_V2 message = new Naver_Sens_V2();
	    Random rand = new Random();
	    String numStr = "";
	    for (int i = 0; i < 6; i++) {
	        String ran = Integer.toString(rand.nextInt(10));
	        numStr += ran;
	    }
	    System.out.println("회원가입 문자 인증 => " + numStr);

	    message.send_msg(tel, numStr);

	    return numStr;
	}

	public static int memberTelCount(String member_tel) {
		MemberDAO dao = new MemberDAO();
		int result = dao.telCheck(member_tel);
		return result;
	}
	
	
	
	//카카오 로그인
	@Autowired
	MemberDAO dao;
	
	public String getAccessToken (String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
            
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true); // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			
			sb.append("&client_id=30ebd1d9b39e44cffc3efc0e21f64df4"); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8888/muluckup/member/kakaoLogin"); // 본인이 설정한 주소
			
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
//			JsonParser parser = new JsonParser();
//			JsonElement element = parser.parse(result);
			//위애애들 노란불 떠서 아래로 만듦
			JsonElement element = JsonParser.parseString(result);
            
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
			
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
    
	public MemberVO getUserInfo(String access_Token) {
		MemberVO vo = new MemberVO();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
//		int result = 0;
//		MemberVO result2 = null;
//		String total = "";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			
			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			
//			JsonParser parser = new JsonParser();
//			JsonElement element = parser.parse(result);
			//위애애들 노란불 떠서 아래로 만듦
			JsonElement element = JsonParser.parseString(result);

			
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			String member_email = kakao_account.getAsJsonObject().get("email").getAsString();
			String member_nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String member_img = properties.getAsJsonObject().get("profile_image").getAsString();
			String member_gender = kakao_account.getAsJsonObject().get("gender").getAsString();
			
			vo.setMember_id(member_email); //아이디가 필수기때문에.. 이메일을 id에도 넣어주게 해둠..
			vo.setMember_nickname(member_nickname);
			vo.setMember_email(member_email);
			vo.setMember_img(member_img);
			vo.setMember_gender(member_gender);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	
	
}
