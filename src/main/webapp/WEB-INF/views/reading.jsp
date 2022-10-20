<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ page import = "com.yg.dto.*" %>
<%
	SelectBoardDto dto = (SelectBoardDto)request.getAttribute("dto");
	String same = String.valueOf(request.getAttribute("same"));
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>reading</title>
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
		.section1{
			margin: 0 auto;
			padding-top: 100px;
			text-align: center;
			width: 100%;
		}
		table{
			border-collapse: collapse;
			text-align: left;
			margin: 0 auto;
		}
		footer{
			position: absolute;
			bottom: 0;
			margin: 0 auto;
			width: 100%;
		}
		table{
			border-collapse: collapse;
			border: 1px solid black;
		}
		td, tr{
			border: 1px solid #ddd;
		}
		.td{
			width: 80px;
			padding: 10px;
			font-size: 20px;
			font-weight: bold;
			background-color: #e2b1b1;
			color: white;
			height: 40px;
		}
		td{
			padding: 10px;
			width: 500px;
			font-size: 18px;
		}
		table tr:nth-child(even){background-color: #f2f2f2;}
		input:focus{
			outline: none;
		}
		.input_box{
			width: 100%;
			height: 100%;
			background-color: #f2f2f2;
			font-size: 18px;
			border: none;
		}
		.input_box1{
			width: 100%;
			height: 100%;
			font-size: 18px;
			border: none;
		}
		.out:hover{
			cursor: pointer;
		}
	</style>
	<script>
		$(function(){
			var same = <%= same %>;
			$(document).ready(function(){
				if(same.equals("no")){
					$('.input_box1').prop('readonly', true);
					$('.input_box').prop('readonly', true);
				}else{
					$('.input_box1').removeAttr('readonly');
					$('.input_box').removeAttr('readonly');
					$('.input_box1').focus();
				}
			});
		
			$("#updateBoard").click(function(){
				var document_id = $("#document_id").val();
				var title = $("#title").val();
				var content = $("#content").val();
				$.ajax({
					type: "post",
					url: "updateBoard?member_id=${member_id }&id=${id }&name=${name}",
					data:{ "document" : document_id, "title" : title, "content" : content },
					datatype: "json",
					success: function(d){
						alert("글이 수정되었다냥");
					},
					error:function(r,s,e){
						alert("error");
					}
				});
			});
			
			$("#deleteBoard").click(function(){
				var document_id = $("#document_id").val();
				$.ajax({
					type: "get",
					url: "deleteBoard?member_id=${member_id }&id=${id }&name=${name}",
					data:{ "document" : document_id },
					datatype: "json",
					success: function(){
						location.href = "board?member_id=${member_id }&id=${id }&name=${name}";
					},
					error:function(r,s,e){
						alert("error");
					}
				});
			});
		});
	</script>
</head>
<body>
	<header>
		<div><h1>게시글 보기</h1></div>
		<%
			if(same.equals("same")){
		%>
		<a id="updateBoard" class="out" style="margin-right: 260px;">수정하기</a>
		<a id="deleteBoard" class="out" style="margin-right: 160px;">삭제하기</a>
		<%
			}
		%>
		<a href="javascript:history.back();" class="out">나가기</a>
	</header>
	<main>
		<div class="section1">
			<table>
				<tr>
					<td class="td">Document_Number</td>
					<td><input class="input_box1" id="document_id" value="<%= dto.getDocument_id() %>" readonly/></td>
				</tr>
				<tr>
					<td class="td">Writer</td>
					<td><input class="input_box" value="<%= dto.getName() %>" readonly/></td>
				</tr>
				<tr>
					<td class="td">Hits</td>
					<td><input class="input_box1" value="<%= dto.getHits() %>" readonly/></td>
				</tr>
				<tr>
				<%
					String date1 = dto.getCreation_Date();
					String date2 = date1.substring(0,19);
				%>
					<td class="td">Date</td>
					<td><input class="input_box" value="<%= date2 %>" readonly/></td>
				</tr>
				<tr>
					<td class="td">Title</td>
					<td><input class="input_box1" id="title" value="<%= dto.getTitle() %>"/></td>
				</tr>
				<tr>
					<td class="td">Content</td>
					<td><input class="input_box" id="content" value="<%= dto.getContent() %>"/></td>
				</tr>
			</table>
		</div>
	</main>
	<footer>
		<img src="https://cdn.imweb.me/thumbnail/20220316/61c1a2f2145fb.png" style="margin: 0 auto; visibility: inherit; image-rendering: -webkit-optimize-contrast; display: block; width: 60%; height: 300;" class="" alt="">
	</footer>
</body>
</html>