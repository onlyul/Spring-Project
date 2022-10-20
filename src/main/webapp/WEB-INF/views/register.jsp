<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>register</title>
	﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<style>
		body{
			margin: 0 auto;
		}
		* {
			font-family: 'Daum','Apple SD Gothic Neo', 'Malgun Gothic','Nanum Gothic', 'Noto Sans','sans-serif';
		}
		a{
			text-decoration: none;
			color: black;
		}
		header{
    		z-index: 10;
		    color: #474242;
		    font-size: 13px;
		    line-height: 1.5;
		    font-weight: bold;
		    width: 100%;
		    margin: 0 auto;
		    height: 83px;
		    text-align: center;
			vertical-align: middle;
		    border-bottom: 1px solid lightgray;
		    position: fixed;
		    background-color: white;
		    top: 0
		}
		main{
			padding: 0;
			margin: 0;
			width: 100%;
			position: relative;
		}
		.title{
			position: relative;
			display: inline-block;
			vertical-align: middle;
			padding-top: 10px;
		    padding-bottom: 10px;
		    height: 62px;
		    vertical-align: middle;
		    width: 100%;
		}
		.loginbox{
			padding-right: 20px;
		}
		.login{
			color: rgba(83, 83, 83, 0.75);
			font-size: 16px;
			font-weight: bold;
			line-height: 1.5;
			font-style: normal;
		}
		.login:hover{
			color: black;
		}
		.headerRight{
			display: flex;
		    flex-direction: row;
		    -webkit-box-pack: justify;
			margin-top: -53px;
			position: absolute;
		    z-index: 20;
		    right: 0;
		}
		.register_modal{
			background-color: white;
			border-radius: 4px;
			width: 400px;
    		border: none;
    		margin: 0 auto;
    		padding-top: 120px;
		}
		.register_modal_submit{
			width: 100%;
			height: 40px;
			border: 1px solid #605757;;
			border-radius: 2px;
			margin-top: 20px;
			background-color: #605757;;
			font-size: 16px;
			font-weight: bold;
			color: white;
		}
		.register_modal_submit:hover{
			background-color: #e2b1b1;
		    border-color: #e2b1b1;
		    color: #ffffff;
		}
		.register_modal_header{
			padding: 35px 0 0;
		}
		h2{
			font-size: 24px;
		    font-weight: bold;
		    text-align: center;
		    margin: 0;
		    line-height: 1.2;
		}
		.register_modal_main{
			padding: 32px 24px 0px 24px;
		}
		.register_modal_input{
			padding-left: 20px;
			border: 1px solid lightgray;
			border-radius: 2px;
			margin: 0;
			width: 93%;
			height: 40px;
		}
		.register_modal_input:focus{
			outline: none;
		}
		input::placeholder{
			line-height: 1.2;
			font-size: 15px;
			font-weight: bold;
		}
		.div_background{
			display: none;
			z-index: 100;
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			bottom : 0;
			width: 100%;
			height: 100%;
			background-color: rgba(0,0,0,0.3);
			overflow-x: hidden;
			overflow-y: hidden;
		}
		.login_modal{
			background-color: white;
			border-radius: 4px;
			width: 370px;
			box-shadow: 0 5px 15px rgb(0 0 0 / 20%);
    		border: none;
    		top: 30%;
    		left: 40%;
    		position: absolute;
		}
		.login_modal_header{
			padding: 35px 0 0;
		}
		.login_modal_main{
			padding: 32px 24px 0px 24px;
		}
		.login_modal_close{
			position: absolute;
		    right: 16px;
		    top: 3px;
		    padding: 8px;
		    float: none;
		    opacity: 0.3;
		    outline: 0;
		    border: none;
		    font-size: 30px;
		    background:transparent;
		}
		.login_modal_close:hover{
			opacity: 1;
			cursor: pointer;
		}
		.login_modal_input{
			padding-left: 20px;
			border: 1px solid lightgray;
			border-radius: 2px;
			margin: 0;
			width: 93%;
			height: 40px;
		}
		.login_modal_input:focus{
			outline: none;
		}
		.login_modal_submit{
			width: 100%;
			height: 40px;
			border: 1px solid lightgray;
			border-radius: 2px;
			margin-top: 20px;
			background-color: white;
			font-size: 16px;
			font-weight: bold;
			color: black;
		}
		.login_modal_submit:hover{
			background-color: #e2b1b1;
		    border-color: #e2b1b1;
		    color: #ffffff;
		}
		.login_modal_footer{
			display: flex;
		    flex-direction: row;
		    -webkit-box-pack: justify;
		    justify-content: space-between;
		    -webkit-box-align: center;
		    align-items: center;
		    padding: 18px 24px 28px 24px;
		}
		.move_register{
			border: none;
			font-size: 13px;
			color: black;
			font-weight: bold;
			background: transparent;
		}
		.move_register, .naver_login, .kakao_login:hover{
			cursor: pointer;
		}
		.naver_login{
			background-image: url(https://www.apkmirror.com/wp-content/uploads/2019/03/5ca729695cde8.png);
			background-size: cover;
	    	background-position: center center;
	    	width: 30px;
		    height: 30px;
		    border-radius: 4px;
		    top: 0;
		    left: 0;
		    border: none;
		    margin-right: 8px;
		}
		.kakao_login{
			background-image: url(https://blog.kakaocdn.net/dn/Sq4OD/btqzlkr13eD/dYwFnscXEA6YIOHckdPDDk/img.jpg);
			background-size: cover;
	    	background-position: center center;
	    	width: 30px;
		    height: 30px;
		    border-radius: 4px;
		    border: none;
		}
		footer{
			width: 100%;
			position: absolute;
			bottom: 0;
		}
		.cbox{
			float: right;
			margin-top: -16px;
		}
		ul{
			padding: 0;
		}
		ul li{
			list-style: none;
			padding: 0;
			margin: 0;
			font-size: 15px;
		}
		textarea{
			resize: none;
			width: 99%;
			height: 70px;
			margin-bottom: 20px;
		}
	</style>
	<script>
	$(function(){
		$("#login_modal_x").click(function(){
			$("#login_background").css("display","none");
		});
		
		$("#login_btn").click(function(){
			$("#login_background").css("display","block");
		});
		
		$("#login_background").click(function(e){
			//alert(e.target.id);
			if(e.target.id == 'login_background'){
				$("#login_background").css("display","none");
			}
		});
		
		$("#move_register").click(function(){
			location.href = 'register';
		});
		
		$("#register_submit").click(function(){
			var id = $("#register_id").value();
			var pw = $("#register_password").value();
			var name = $("#register_name").value();
			if(id != "" && pw != "" && name != ""){
				alert("가입완료! 로그인을 다시 해달라냥");
			}
		});
	});
	</script>
</head>
<body style="margin: 0 auto; overflow-x: hidden;">
<!-- 로긴 -->
	<div class="div_background" id="login_background">
		<div class="login_modal" id="login_modal">
			<div class="login_modal_header">
				<h2>로그인</h2>
				<button class="login_modal_close" id="login_modal_x">&times;</button>
			</div>
			<div class="login_modal_main">
				<form name="login_form" action="" method="post">
					<input type="text" name="id" class="login_modal_input" placeholder="아이디"/><br/>
					<input type="password" name="pw" class="login_modal_input" style="border-top: none;" placeholder="비밀번호"/><br/>
					<input type="submit" class="login_modal_submit" value="로그인"/>
				</form>
			</div>
			<div class="login_modal_footer">
				<div>
					<button class="move_register" id="move_register">회원가입</button>
				</div>
				<div>
					<button id="naverIdLogin_loginButton" class="naver_login"></button>
					<button class="kakao_login"></button>
				</div>
			</div>
		</div>
	</div>
	<!-- 메인화면 -->
	<header>
		<div class="title">
			<a href="">
				<img src="https://cdn.imweb.me/thumbnail/20220913/ecfd06b7e407a.png" alt="강아지파양 유기견분양 빅토리아펫 보호소 - 무료분양 애견분양 시바견분양 유기묘무료분양 강아지무료분양 무료분양 고양이무료분양" width="244.075418994" style="max-width: 100%;height: auto; image-rendering: -webkit-optimize-contrast;">
			</a>
		</div>
		<div class="headerRight">
			<div class="loginbox">
				<a><span class="login" id="login_btn">로그인</span></a>
			</div>
			<div class="loginbox">
				<a href="register"><span class="login" id="register_btn" style="padding-right: 30px;">회원가입</span></a>
			</div>
		</div>
	</header>
	<main>
		<div class="register_modal" id="register_modal">
			<div class="register_modal_header">
				<h2>회원가입</h2>
			</div>
			<div class="register_modal_main">
				<form action="insertMember" method="post">
					<ul>
						<li>이용약관, 개인정보 수집 및 이용에 동의합니다.</li>
						<li><input type="checkbox" class="cbox" title="필수" required/></li>
					</ul>
					<textarea readonly>제1조(목적) 이 법은 개인정보의 처리 및 보호에 관한 사항을 정함으로써 개인의 자유와 권리를 보호하고, 나아가 개인의 존엄과 가치를 구현함을 목적으로 한다. 개정 2014. 3. 24.&#10;&#10;제3조(개인정보 보호 원칙) ① 개인정보처리자는 개인정보의 처리 목적을 명확하게 하여야 하고 그 목적에 필요한 범위에서 최소한의 개인정보만을 적법하고 정당하게 수집하여야 한다.</textarea>
					<input type="text" id="register_name" name="name" class="register_modal_input" placeholder="이름" required/><br/>
					<input type="text" id="register_id" name="id" class="register_modal_input" style="border-top: none;" placeholder="아이디" required/><br/>
					<input type="password" id="register_password" name="pw" class="register_modal_input" style="border-top: none;" placeholder="비밀번호" required/><br/>
					<input type="submit" class="register_modal_submit" id="register_submit" value="가입하기"/>
				</form>
			</div>
		</div>
	</main>
	<footer>
		<img src="https://cdn.imweb.me/thumbnail/20220314/316b69cb0637a.png" style="width: 100%;" alt="">
	</footer>
</body>
</html>