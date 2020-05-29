<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css" />
	<c:import url="../common/commonUtil.jsp"/>
<style>
div#board-container{width:400px; margin:0 auto; text-align:center;}
div#board-container input,div#board-container button{margin-bottom:15px;}
		
#wrapper {
	font-family:verdana;
	margin: 30px auto ;
	padding: 30px;
	background: #4D6879; /* You can change the main color of thew form here. */
	font-size: 14px;
	width:100%;
	max-width:500px;
	box-sizing: border-box;
}

label {
	display: block;
	font-size: 24px;
	padding: 13px 0;
	color: #fff;
	text-shadow: 1px 1px 1px #666;
	text-align:left;
}

input {
	height: 18px;
	padding: 20px;
	width: 100%;
	box-sizing: border-box;
	-webkit-border-radius: 6px;
	-khtml-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
	-webkit-box-shadow: 0 0 10px #444;
	-moz-box-shadow: 0 0 10px #444;
	box-shadow: 0 0 10px #444;
	border: 1px solid #fff;
}

textarea {
	height: 150px;
	width: 100%;
	box-sizing: border-box;
	padding: 15px;
	border: 1px solid #fff;
	-webkit-border-radius: 6px;
	-khtml-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
	-webkit-box-shadow: 0 0 10px #444;
	-moz-box-shadow: 0 0 10px #444;
	box-shadow: 0 0 10px #444;
}

input[type="text"]:hover, textarea:hover {
	border: 1px solid #fff;
	-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, 0.25) inset, 0 0 5px rgba(255, 255, 255, 0.4);
	-moz-box-shadow: 0 0 20px rgba(0, 0, 0, 0.25) inset, 0 0 5px rgba(255, 255, 255, 0.4);
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.25) inset, 0 0 5px rgba(255, 255, 255, 0.4);
}

input#btnDelete{
	text-align: center;
	color: #fff;
	height: 50px;
	padding: 0;
	text-shadow: 1px 1px 1px #000;
	font-size: 18px;
	text-transform: uppercase;
	margin-top: 50px;
	border: 1px solid #000;
	background: #000;
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #3b3b3b), color-stop(100%, #000000));
	background: -webkit-linear-gradient(top, #3b3b3b 0%,#000000 100%);
	background: -moz-linear-gradient(top, #3b3b3b 0%,#000000 100%);
	background: -o-linear-gradient(top, #3b3b3b 0%,#000000 100%);
	background: -ms-linear-gradient(top, #3b3b3b 0%,#000000 100%);
	background: linear-gradient(top, #3b3b3b 0%,#000000 100%);
	opacity: 0.5;
	width:50%;
}

input#btnDelete:hover {
	color: #ccc;
	cursor: pointer;
	opacity: 0.8;
}

label {
	text-transform: uppercase;
	font-size: 20px;
}
html, body {
    height: -webkit-fill-available;
}
</style>
</head>

<body style="height: -webkit-fill-available; !important;
			max-width: 1200px;
    		font-weight: normal;
   			margin:0 auto;">
	<c:import url="../common/navbar.jsp"/>
	<div id="wrapper">
		<form id="form">
			<label><b>제목</b></label>
			<input type="text"  name="boardTitle" value="${tipboard.tipTitle }" readonly required />
			<label ><b>작성자</b></label>
			<input type="text"  name="boardWriter" value="${tipboard.nickName }" readonly required />
			<label for="message"><b>내용</b></label>
			<textarea name="message" id="message" cols="30" rows="10" readonly required>${tipboard.tipContent }</textarea><br />
			<div>
			<input type="button" class="btnDelete" name="btnDelete" id="btnDelete" value="돌아가기" style="width: 200px; height: 50px; display: inline-block;" onclick="location.href='${pageContext.request.contextPath}/champion/championDetail.do?name=${champion.name}'"/>
			<c:if test="${member.userNo eq tipboard.tipWriter}">
			<input type="button" class="btnDelete" name="btnDelete" id="btnDelete" value="삭제"/ style="width: 200px; height: 50px;" onclick="location.href='${pageContext.request.contextPath}/champion/tipBoardDelete.do?tipBno=${tipboard.tipBno}'">
			</c:if>
			</div>
		</form>
</div>
</body>
</html>