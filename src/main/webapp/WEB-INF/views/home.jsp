<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>
<%@ page import = "com.yg.dto.*" %>
<%
	HttpSession session = request.getSession();
	int member_id = 0;
	String name = "";
	String id = "";
	int manager = 0;
	if(session.getAttribute("member_id") != null){
		member_id = (Integer)session.getAttribute("member_id");
		name = (String)session.getAttribute("name");
		id = (String)session.getAttribute("id");
		manager = (Integer)session.getAttribute("manager");
	}
	
%>
<html>
<head>
	<title>Home</title>
	﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
		.headerLeft{
			display: flex;
			position: absolute;
			z-index: 20;
			left: 0;
			padding-left: 30px;
			padding-top: 10px;
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
		h2{
			font-size: 24px;
		    font-weight: bold;
		    text-align: center;
		    margin: 0;
		    line-height: 1.2;
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
			width: 100%;
			height: 40px;
		}
		.login_modal_input:focus{
			outline: none;
		}
		input::placeholder{
			line-height: 1.2;
			font-size: 15px;
			font-weight: bold;
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
		    padding: 0px 24px 28px 24px;
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
		ul li{
			list-style: none;
			height: 50px;
			background-color: white;
			float: left;
			padding: 0;
			width: 150px;
			text-align: center;
			vertical-align: middle;
		}
		.nav{
			text-align: center;
			vertical-align: middle;
			display: flex;
			padding-top: 78px;
		}
		ul{
			margin: auto;
			padding-top: 30px;
		}
		.menu{
			font-size: 17px;
			font-weight: bold;
    		color: rgba(71, 66, 66, 0.5);
		}
		.menu:hover{
			cursor: pointer;
			color: rgba(71, 66, 66, 1);
			top: -4px;
			position: relative;
		}
		.menu1{
			font-size: 17px;
			font-weight: bold;
			border-color: #e4a1a6;
			background-color: #e4a1a6;
			border-radius: 30px;
			padding-left: 25px;
			padding-right: 25px;
			padding-top: 10px;
			padding-bottom: 10px;
			color: white;
		}
		.menu1:hover{
			cursor: pointer;
			color: rgba(71, 66, 66, 1);
			top: -4px;
			position: relative;
		}
		footer{
			background-color: #f9f9f9;
			height: 263px;
			width: 100%;
			font-weight: bold;
		    margin: 0 auto;
		    padding-top: 70px;
		    z-index: 100;
    		position: absolute;
		}
		.section2{
			display: flex;
		    flex-direction: row;
		    -webkit-box-pack: justify;
		    justify-content: space-between;
		    -webkit-box-align: center;
		    align-items: center;
		    width: 100%;
			font-weight: bold;
		}
		table{
			border-collapse: collapse;
			text-align: left;
			margin: 0 auto;
		}
		h6{
			font-size: 14px;
    		color: rgb(61, 65, 68);
    		margin: 0;
		}
		td{
			width: 400px;
			padding-top: 17px;
		}
		.td{
			width: 200px;
		}
		.phone{
			font-size: 50px;
			color: rgb(61, 65, 68);
		}
		.footer3{
			color: rgb(61, 65, 68);
    		font-size: 14px;
		}
		.footer_img{
			width: 200px;
		}
		h1{
			color: #501515;
			font-size: 100px;
			margin: 0;
			padding-bottom: 30px;
			padding-right: 28px;
    		text-align: right;
		}
		h4{
			margin: 0;
			margin-top: -41px;
			padding-bottom: 20px;
			padding-right: 28px;
    		text-align: right;
		}
		hr{
			height:316px;
 			width: 10px;
		    padding: 0;
		    background-color: #e4a1a6;
		    border: none;
		    margin: 0 0 0 400px;
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
			
			$("#only, #only2").click(function(e){
				var have = <%= session.getAttribute("member_id") %>;
				if(have == null){
					alert("로그인 또는 회원가입을 먼저 해달라냥");
					e.preventDefault();
				}
			});
			
			$(document).ready(function(){
				var message = "${msg}";
				if(message != ""){
					alert(message);
				}
			});
			
			$(document).on("click", "#naverIdLogin_loginButton", function(){ 
				location.href="${url}";
			});
			
		});
	</script>
	<script>
		Kakao.init('d039a1f16e66ad71d5f1c8b4cafff5c9'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		function kakaoLogin() {
		    Kakao.Auth.login({
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
		        	  console.log(response)
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		  }
		//카카오로그아웃  
		function kakaoLogout() {
		    if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
		  }  
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
				<form name="login_form" action="loginCheck" method="post">
					<input type="text" name="id" class="login_modal_input" placeholder="아이디" required/><br/>
					<input type="password" name="pw" class="login_modal_input" style="border-top: none;" placeholder="비밀번호" required/><br/>
					<input type="submit" class="login_modal_submit" value="로그인"/>
				</form>
			</div>
			<div class="login_modal_footer">
				<div>
					<button class="move_register" id="move_register">회원가입</button>
				</div>
				<div>
					 <div id="naverIdLogin" style="float: left;">
					 	<button id="naverIdLogin_loginButton" class="naver_login"></button>
					 </div>
					<button class="kakao_login" onclick="kakaoLogin();"></button>
				</div>
			</div>
		</div>
	</div>
<!-- 메인화면 -->	
	<header>
		<%
		if(session.getAttribute("member_id") != null){
		%>
		<div class="headerLeft">
			<h3><%=name %>(<%=id %>)님 안녕하세요!</h3>
		</div>
		<%
		}
		%>
		<div class="title">
			<a href="">
				<img src="https://cdn.imweb.me/thumbnail/20220926/74beccb665b8f.png" alt="강아지파양 유기견분양 빅토리아펫 보호소 - 무료분양 애견분양 시바견분양 유기묘무료분양 강아지무료분양 무료분양 고양이무료분양" width="244.075418994" style="max-width: 100%;height: auto; image-rendering: -webkit-optimize-contrast;">
			</a>
		</div>
		<div class="headerRight">
			<%
			if(session.getAttribute("member_id") == null){
			%>
			<div class="loginbox">
				<a><span class="login" id="login_btn">로그인</span></a>
			</div>
			<div class="loginbox">
				<a href="register"><span class="login" id="register_btn" style="padding-right: 30px;">회원가입</span></a>
			</div>
			<%
			}else{
			%>
			<div class="loginbox">
				<a href="logout"><span class="login" id="logout_btn">로그아웃</span></a>
			</div>
			<div class="loginbox">
				<a href="memberOut?member_id=<%=member_id %>"><span class="login" id="memberout_btn" style="padding-right: 30px;">회원탈퇴</span></a>
			</div>
			<%
			}
			%>
		</div>
	</header>
	<div class="aside" style="position:fixed; right:0;">
		<div><hr><h1>Free</h1><br/><h1 style="margin-top: -80px;">Adoption</h1><br/><h4>무료 입양 절차</h4><hr></div>
	</div>
	<main>
		<div class="nav">
			<ul>
				<li><a href="" class="menu1">입양절차</a></li>
				<li><a href="board?member_id=<%=member_id %>&id=<%=id %>&name=<%=name %>" class="menu" id="only">입양게시판</a></li>
				<li><a href="chatting?member_id=<%=member_id %>&id=<%=id %>&name=<%=name %>" class="menu" id="only2">냥이뭉이채팅</a></li>
			</ul>
		</div>
		<div class="section1">
			<img src="https://cdn.imweb.me/thumbnail/20220316/b35c310c9effc.png" style="visibility: visible; image-rendering: -webkit-optimize-contrast; display: inline-block; width: 1430px; height: 566px; margin: 34.4px auto;" alt="">
		</div>
		<div class="section2">
			<img src="https://cdn.imweb.me/thumbnail/20220316/7d4458bdf9a96.png" style="visibility: visible; image-rendering: -webkit-optimize-contrast; display: inline-block; width: 850px; height: 2456px;" alt="">
			
		</div>
	</main>
	<footer>
		<table>
			<tr>
				<td><h6>위례점, 인천부평점, 영통점, 부산남구점 24시 운영</h6></td>
				<td colspan="2"><h6>빅토리아펫 보호소</h6></td>
			</tr>
			<tr>
				<td><span class="phone">070.4349.5578</span></td>
				<td colspan="2"><span class="footer3">대표 박혜정</span><br/><span class="footer3">사업자등록번호 101-32-15428</span><br/><span class="footer3">동물판매등록번호 3530000-037-2020-0022</span></td>
			</tr>
			<tr>
				<td><span class="footer3">24시간 콜센터 운영 연중무휴</span><br/><span class="footer3">운영시간 PM 12:00 - PM 21:00</span><br/><span class="footer3">제휴문의 pch919788@naver.com</span></td>
				<td>VictoriaPet Shelter Corp.</td>
				<td class="td"><img class="footer_img" src="https://cdn.imweb.me/thumbnail/20220314/ee965e6aaf99d.png" alt=""></td>
			</tr>
		</table>
	</footer>
</body>
</html>
