<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.lang.*" %>
<%
	List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("list");
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>board</title>
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
		.headerLeft{
			display: flex;
			position: absolute;
			z-index: 20;
			left: 0;
			padding-left: 30px;
			padding-top: 10px;
		}
		.banner{
			margin: 0 auto;
			padding-top: 63px;
		}
		.nav ul li{
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
		}
		.nav ul{
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
		.section1{
			margin: 0 auto;
			width: 800px;
			font-weight: bold;
			padding-top: 40px;
		}
		.first li{
    		border-top: 2px solid black;
		}
		.no{
			width: 5%;
		}
		.section1 ul{
			margin: 0 auto;
			list-style: none;
		    margin-bottom: 0;
		    clear: both;
		    display: table-row-group;
    		padding-left: 0;
		}
		.section1 ul li{
			padding-top: 10px;
		    padding-bottom: 10px;
		    padding-left: 7px;
		    padding-right: 7px;
		    text-align: center;
		    display: table-cell;
		    vertical-align: middle;
		    border-bottom: 1px solid #e5e7eb;
		    height: 20px;
		}
		.title{
			width: auto;
		}
		.writer{
			width: 10%;
		}
		.read{
			width: 5%;
		}
		.date{
			width: 15%;
		}
		.gray{
			color: #c5c5c5;
		}
		.writing{
			padding: 10px 25px 10px 25px;
			border: 1px solid lightgray;
			border-radius: 2px;
			margin-top: 20px;
			background-color: white;
			font-size: 16px;
			font-weight: bold;
			color: black;
			float: right;
			font-size: 12px;
		}
		.writing:hover{
			background-color: #e2b1b1;
		    border-color: #e2b1b1;
		    color: #ffffff;
		}
		.paging_block{
			text-align: center;
			margin: 0 auto;
			padding-top: 47px;
		    width: 100%;
		    display: flex;
		    align-items: center;
		}
		.paging_block ul li{
			text-align: center;
		    display: table-cell;
		    vertical-align: middle;
		    height: 24px;
    		width: 24px;
    		font-size: 14px;
    		color: #c5c5c5;
    		border: none;
    		margin: 0 auto;
		}
		.paging_block ul li a:hover{
			color: black;
			cursor: pointer;
			top: -4px;
			position: relative;
		}
		.active{
			background-color: #e4a1a6;
			border-radius: 70px;
		}
		.active a{
			color: white;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<header>
		<div class="headerLeft">
			<h3>${name }(${id })님 안녕하세요!</h3>
		</div>
		<div class="title">
			<a href="">
				<img src="https://cdn.imweb.me/thumbnail/20220913/ecfd06b7e407a.png" alt="강아지파양 유기견분양 빅토리아펫 보호소 - 무료분양 애견분양 시바견분양 유기묘무료분양 강아지무료분양 무료분양 고양이무료분양" width="244.075418994" style="max-width: 100%;height: auto; image-rendering: -webkit-optimize-contrast;">
			</a>
		</div>
		<div class="headerRight">
			<div class="loginbox">
				<a href="logout"><span class="login" id="logout_btn">로그아웃</span></a>
			</div>
			<div class="loginbox">
				<a href="memberOut?member_id=${member_id }"><span class="login" id="memberout_btn" style="padding-right: 30px;">회원탈퇴</span></a>
			</div>
		</div>
	</header>
	<main>
		<div class="banner">
			<img style="width:100%;" src="https://cdn.imweb.me/thumbnail/20220314/f7c4e264122d0.png" alt="">
		</div>
		<div class="nav">
			<ul>
				<li><a href="" class="menu">입양절차</a></li>
				<li><a href="board?member_id=${member_id }&id=${id }&name=${name}" class="menu1">입양게시판</a></li>
				<li><a href="chatting?member_id=${ member_id}&id=${id }&name=${ name}" class="menu">냥이뭉이채팅</a></li>
			</ul>
		</div>
		<div class="section1">
			<ul class="first">
				<li class="no">No</li>
				<li class="title">Title</li>
				<li class="writer">Writer</li>
				<li class="read">Hits</li>
				<li class="date">Date</li>
			</ul>
			<% 
				int cnt = 0;
				for(int i = 0; i<=list.size()-1; i++){
					cnt += 1;
				String date1 = String.valueOf(list.get(i).get("creation_date"));
				String date2 = date1.substring(0,10);
			%>
			<ul>
				<li class="no"><%=cnt %></li>
				<li class="title" style="text-align: left; padding-left: 30px;"><a href="reading?document_id=<%= list.get(i).get("document_id")%>&member_id=${member_id }&id=${id }&name=${name}"><%= list.get(i).get("title") %></a></li> 
				<li class="writer gray"><%= list.get(i).get("name") %></li>
				<li class="read gray"><%= list.get(i).get("hits") %></li>
				<li class="date gray"><%= date2 %></li>
			</ul>
			<%
				}
			%>
			<div>
				<a href="writing?member_id=${member_id }" class="writing">글쓰기</a>
			</div>
			<div class="paging_block">
				<ul>
					<li><a>&#60;</a></li>
					<li class="active"><a>1</a></li>
					<li><a>2</a></li>
					<li><a>3</a></li>
					<li><a>4</a></li>
					<li><a>5</a></li>
					<li><a>6</a></li>
					<li><a>7</a></li>
					<li><a>8</a></li>
					<li><a>9</a></li>
					<li><a>&#62;</a></li>
				</ul>
			</div>
		</div>
		
	</main>
</body>
</html>