<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>chatting</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/dist/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
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
		    height: 70px;
			vertical-align: middle;
		    border-bottom: 1px solid lightgray;
		    padding-left: 40px;
		    position: fixed;
		    background-color: white;
		    top: 0
		}
		.out{
			padding: 10px 20px 10px 20px;
			border: 1px solid lightgray;
			border-radius: 2px;
			margin-top: -60px;
			margin-right: 70px;
			background-color: white;
			font-size: 16px;
			font-weight: bold;
			color: black;
			float: right;
			font-size: 12px;
		}
		.out:hover{
			background-color: #e2b1b1;
		    border-color: #e2b1b1;
		    color: #ffffff;
		}
		main{
			padding: 0;
			margin: 0;
			width: 100%;
			position: relative;
		}
		.sidebar{
			position: fixed;
			left: 0;
		    width: 263px;
		    overflow: hidden;
		    height: 100%;
		    border-right: 1px solid #E5E5E5;
		    text-align: left;
		}
		.s_header{
			position: relative;
    		border-bottom: 1px solid #E5E5E5;
    		width: 100%;
		}
		.profile{
			padding: 7px 8px;
			padding-top: 70px;
			width: 100%;
			overhidden-x: hidden;
			display: flex;
	    	flex-direction: row;
		}
		.picture{
			background-image: url(https://ifh.cc/g/NXkxYr.png);
			background-repeat: no-repeat;
			background-size: 50px 50px;
			width: 50px;
			height: 50px;
			margin: 4px;
			padding-top: 4px;
			padding-right: 4px;
		}
		.search{
			height: 56px;
			padding-top: 12px;
    		padding-left: 10px;
    		position: relative;
    		border-top: 1px solid #E5E5E5;
		}
		.search_input{
			height: 32px;
		    padding: 4px 10px 4px 10px;
		    font-weight: 400;
		    font-size: 12px;
		    text-align: left;
		    border-radius: 6px;
		    width: 87%;
		    border: 1px solid #E5E5E5;
		}
		input:focus{
			outline: none;
		}
		.s_body{
			position: relative;
		}
		.chatting_title{
			height: 40px;
		    line-height: 40px;
		    text-align: left;
		    padding: 8px 50px 8px 10px;
		    font-size: 14px;
		    border-bottom: 1px solid #E5E5E5;
		}
		.chatting_room{
			overflow-y: hidden;
			padding: 4px 4px 0;
		}
		.chatting_room2{
			position: relative;
    		height: 100%;
		}
		.chatting_room3{
			height: 35px;
			position: relative;
			overflow-x: hidden;
    		overflow-y: auto;
    		padding-top: 9px;
    		padding-left: 15px;
    		border-bottom: 1px solid #E5E5E5;
		}
		.chatting_room3:hover{
			background-color: #e2b1b1;
		    border-color: #e2b1b1;
		    color: #ffffff;
		}
		.chatting_space{
			position: fixed;
		    top: 52px;
		    left: 263px;
		    width: calc(100% - 263px);
		    height: 100%;
		}
		.space_title{
			position: relative;
		    background-color: #fff;
		    z-index: 9;
		    height: 61px;
		    border-left: 1px solid #E5E5E5;
		    padding-left: 20px;
		    padding-top: 16px;
		    border-bottom: 1px solid #E5E5E5;
		}
		.speaker{
			font-weight: bold;
		    padding: 4px;
		    padding-left: 20px;
		}
		.message_container{
			padding: 6px 30px;
			margin-top: 4px;
		}
		.message{
			background-color: #ffd8d8;
			border-radius: 8px;
			padding: 6px 8px;
		}
		.message:hover{
			background-color: #fbb7b7;
		}
		.time{
			font-size: 12px;
			color: gray;
			padding-left: 10px;
		}
		.chatting_write{
			border-top: 1px solid #e5e5e5;
			bottom: 0;
			position: fixed;
    		height: 70px;
			width: 100%;
		}
		.message_input_wrapper{
			width: calc(100% - 20px);
		    border-radius: 8px;
		    margin: 10px 8px 8px 10px;
		}
		.message_input{
			overflow-x: hidden;
			padding: 12px 50px 12px 12px;
		    width: 75%;
		    vertical-align: middle;
		    border-radius: 4px;
		    background: 0 0;
		    color: #3d3c40;
		    line-height: 19px;
		    font-size: 14px;
		    outline: 0;
		    border: 0;
		    border: 1px solid #e5e5e5;
		}
		.send{
			padding: 10px 20px 10px 20px;
			border: 1px solid lightgray;
			border-radius: 2px;
			background-color: white;
			font-size: 16px;
			font-weight: bold;
			color: black;
			font-size: 12px;
		}
		.send:hover{
			background-color: #e2b1b1;
		    border-color: #e2b1b1;
		    color: #ffffff;
		}
	</style>
</head>
<body>
	<header>
		<div><h1>채팅</h1></div>
		<a href="javascript:history.back();" class="out">나가기</a>
	</header>
	<main>
		<div class="sidebar">
			<div class="s_header">
				<div class="profile">
					<div class="picture"></div>
					<div><h4>김유라(아이디)님</h4></div>
				</div>
				<div class="search">
					<input type="text" name="search" maxlength="60" placeholder="대화상대 아이디로 검색" class="search_input"/>
				</div>
			</div>
			
			<div class="s_body">
				<div class="chatting_title">
					<h3 style="margin: 0;">채팅방</h3>
				</div>
				<div class="chatting_room">
					<div class="chatting_room2">
						<div class="chatting_room3">
							나와의 채팅방
						</div>
						<div class="chatting_room3">
							꼬리
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="chatting_space">
			<div class="space_title">
				<h3>나와의 채팅방</h3>
			</div>
			<div>
				<div class="speaker">
					<span>김유라</span>
				</div>
				<div class="message_container">
					<span class="message">오늘 뭐해?</span><span class="time">2022.9.10.15:30</span>
				</div>
				<div class="message_container">
					<span class="message">이따 뭐해?</span><span class="time">2022.9.10.16:30</span>
				</div>
				<div class="message_container">
					<span class="message">끝나고 뭐해?</span><span class="time">2022.9.10.16:40</span>
				</div>
			</div>
			<div class="chatting_write">
				<div class="message_input_wrapper">
					<input type="text" placeholder="메세지를 입력하세요" name="message" class="message_input"/>
					<span style="padding-left: 20px;"><button class="send">보내기</button></span>
				</div>
			</div>
		</div>
	</main>
</body>
</html>