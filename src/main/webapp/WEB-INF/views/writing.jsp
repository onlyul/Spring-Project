<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>writing</title>
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
		.ok{
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
		.ok:hover{
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
		.t{
			width: 650px;
			border: none;
			border-bottom: 1px solid #ddd;
			height: 40px;
			padding-left: 10px;
		}
		.c{
			width: 700px;
			height: 300px;
			border: 1px solid #ddd;
			resize: none;
			padding: 20px;
			line-height: 1.2;
			font-size: 25px;
			background-color:#ffd8d8;
		}
		textarea::placeholder{
			line-height: 1.2;
			font-size: 25px;
			font-weight: bold;
		}
		input:focus{
			outline: none;
		}
		textarea:focus{
			outline: none;
		}
		footer{
			position: absolute;
			bottom: 0;
			margin: 0 auto;
			width: 100%;
		}
	</style>
	<script>
		$(function(){
			var member_id = "${member_id}"; 
			$("#ok").click(function(){
				var title = $("#title").val();
				var content = $("#content").val();
				$.ajax({
					type: "post",
					url: "insertBoard",
					data: {
						'member_id' : member_id, 'title' : title, 'content' : content
					},
					datatype: "json",
					success:function(data){
						alert("게시글 작성이 되었다냥");
						location.href="board";
					},
					error:function(r,s,e){
						alert("error!");
					}
				});
			});
		});
	</script>
</head>
<body>
	<header>
		<div><h1>게시글 작성</h1></div>
		<a href="javascript:history.back();" class="ok" style="margin-right: 150px;">취소</a>
		<a href="board" class="ok" id="ok">확인</a>
	</header>
	<main>
		<div class="section1">
			<h2>Title : <input type="text" name="title" class="t" id="title" required/></h2>
			<textarea name="content" class="c" placeholder="content" id="content" required></textarea>
		</div>
	</main>
	<footer>
		<img src="https://cdn.imweb.me/thumbnail/20220316/4332978600491.png" style="margin: 0 auto; visibility: inherit; image-rendering: -webkit-optimize-contrast; display: block; width: 60%; height: 300;" alt="">
	</footer>
</body>
</html>