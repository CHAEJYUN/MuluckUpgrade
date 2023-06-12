<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
<link rel="stylesheet" type="text/css" href="../resources/css/login_join.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function() {
	
	//idB을 클릭했을때 아이디 찾기 보이기
    $('#idB').click(function() {
        $('#idFind').show();
        $('#pwFind').hide();
        $("#pwResult").html("");
        $('#idB').css('background-color', 'lightgray');
        $('#pwB').css('background-color', 'white');
    });//#idB
    
    //pwB을 클릭했을때 패스워드 찾기 보이기
    $('#pwB').click(function() {
        $('#idFind').hide();
        $('#pwFind').show();
        $("#idResult").html("");
        $('#idB').css('background-color', 'white');
        $('#pwB').css('background-color', 'lightgray');
    }); //#pwB
    
    //id 아이디 찾기 진행
    $('#idFindForm').submit(function(event) {
        event.preventDefault();
        const member_name = $('#id_member_name').val();
        const member_tel = $('#id_member_tel').val();
        $.ajax({
            url: "idFind",
            type: "post",
            data: { member_name: member_name, member_tel: member_tel },
            dataType: "text",
            success: function(result) {
                console.log('member_id>>' + result);
                if (result !== "") {
                    $("#idResult").html("회원님의 아이디는 " + result + " 입니다.").css('color', 'blue');
                    $('#pw_member_id').val(result);
                    $('#pw_member_tel').val(member_tel);
                    alert("회원님의 아이디는 " + result + " 입니다.");
                } else {
                    $("#idResult").html("회원 정보가 없습니다.").css('color', 'blue');
                    alert("회원 정보가 없습니다.");
                }
            } //success
        }); //ajax
    });//#idFindForm
    
    //pw 패스워드 변경 진행
    $('#pwFindForm').submit(function(event) {
		event.preventDefault();
		const member_id = $('#pw_member_id').val();
		const member_tel = $('#pw_member_tel').val();
		const member_pw = $('#pw_member_pw').val();
		$.ajax({
			url: "pwFind",
			type: "post",
			data: {member_id: member_id, member_tel: member_tel, member_pw: member_pw},
			dataType: "text",
			success: function(result) {
				if(result != 0){
					$("#pwResult").html("패스워드가 변경 되었습니다.").css('color', 'blue');
					alert("패스워드가 변경 되었습니다.");
				}else {
					$("#pwResult").html("회원 정보가 없습니다.").css('color', 'blue');
					alert("회원 정보가 없습니다.");
				}
			}//success
		})// ajax
	})//#pwFindForm
    
    
}); //$

$(document).ready(function() {
    $('#idFind').show();
    $('#pwFind').hide();
    $('#idB').css('background-color', 'lightgray');
    $('#pwB').css('background-color', 'white');
});
</script>
</head>
<body>
    <div class="muluck_logo"><a href="login.jsp"><img src="../resources/assets/img/무우럭.png" alt="로고"></a></div>
    <div class="myform">
    	<div class="go_login"><a href="login.jsp"><button>X</button></a></div>
        <div id="login_title" class="title">아이디/패스워드 찾기</div>
        <div class="center">
            <table id="idpwTable">
                <tr>
                    <td><button id="idB" class="cBc" style="font-family: 'KOTRAHOPE';">아이디</button></td>
                    <td><button id="pwB" class="cBc" style="font-family: 'KOTRAHOPE';">패스워드</button></td>
                </tr>
            </table>
            <div id="result">
                <div id="idFind">
                    <form id="idFindForm" action="idFind" method="post">
                        <input class="input_login" id="id_member_name" name="member_name" placeholder="  이름"/> <!-- 실험 할떄 값넣어놓기 value="황세인"  -->
                        <input class="input_login" id="id_member_tel" name="member_tel" placeholder="  전화번호"/> <!-- value="01012341234"  -->
                        <button class="btn black_btn" type="submit">아이디 찾기</button>
                    </form>
		            <div id="idResult"></div>
                </div>
                <div id="pwFind">
                    <form id="pwFindForm" action="pwFind" method="post">
                        <input class="input_login" id="pw_member_id" name="member_id" placeholder="  아이디" />
                        <input class="input_login" id="pw_member_tel" name="member_tel" placeholder="  전화번호" />
                        <input class="input_login" id="pw_member_pw" name="member_pw" placeholder="  새 비밀번호" />
                        <button class="btn black_btn" type="submit">패스워드 바꾸기</button>
                    </form>
		            <div id="pwResult"></div>
                </div>
            </div>
            <a href="login.jsp"><button class="btn white_btn" id="go_login">로그인 하러가기</button></a>
        </div>
    </div>
</body>
</html>
