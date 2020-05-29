<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		.row1{
			background-image: url("${pageContext.request.contextPath}/resources/Images/member/KHinfo.jpg");

		}
		.row{
			background-image: url("${pageContext.request.contextPath}/resources/Images/member/KHinfo.jpg");

		}
	</style>
	<title>유머 게시판 상세보기</title>
	<link rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/humor.css" />
	<c:import url="../common/commonUtil.jsp" />

</head>
<body style="background: #f4f4f4; !important; max-width: 1011px; text-align: center; font-weight: normal; margin: 0 auto;"
	  onload="onload();">
<c:import url="../common/navbar.jsp" />
<div id="content">
	<div class="ads__gpt__dynamic__right">
		<div class="row"
			 style="height: 600px; display: flex; align-items: center; position: relative; margin: 0 auto; overflow: hidden;">
			<div id="div-gpt-ad-1566383347315-0"
				 data-google-query-id="COD8sJL-lecCFcssvQodzpMMlg">

				<div
						id="google_ads_iframe_/114726905/NEW_OP.GG_Talk_Right_160x600_0__container__"
						style="border: 0pt none;">
					<iframe
							id="google_ads_iframe_/114726905/NEW_OP.GG_Talk_Right_160x600_0"
							title="3rd party ad content"
							name="google_ads_iframe_/114726905/NEW_OP.GG_Talk_Right_160x600_0"
							width="300" height="600" scrolling="no" marginwidth="0"
							marginheight="0" frameborder="0" srcdoc=""
							style="border: 0px; vertical-align: bottom;"
							data-google-container-id="3" data-load-complete="true"></iframe>
				</div>
			</div>
		</div>
	</div>

	<div id="view">
		<div class="article">
			<div class="article-header__ad">
				<div class="ads__gpt__mobile__dynamic">
					<div
							style="height: 100px; display: flex; align-items: center; justify-content: center; position: relative; margin: 0 auto; overflow: hidden;">
						<div id="div-gpt-ad-1563172599378-0">
							<script>
								if (window.innerWidth < 1000) {
									googletag.cmd
											.push(function() {
												googletag
														.display('div-gpt-ad-1563172599378-0');
											});
								}
							</script>
						</div>
					</div>
				</div>
			</div>
			<div class="article-header">
				<input type="hidden" name="userNo" value="${userNo }" />
				<div class="article__title">${humorBoard.humorTitle }</div>
				<div class="article-meta">
					<div class="article-meta-list">
						<div class="article-list-item-meta__item">

						</div>
						<div class="article-meta__item">

						</div>
						<div class="article-meta__item article-meta__item--name">

						</div>
					</div>
					<div class="article-meta-list article-meta-list--right">
						<div class="article-meta__item">
                        <span data-tooltip=""
							  title="오늘 날짜">${humorBoard.humorDate} </span>

						</div>
						<div class="article-meta__item">

							<span data-tooltip="" title="작성자">${humorBoard.humorWriter}</span>
						</div>
					</div>
				</div>
			</div>
			<div class="article-content-wrap">
				<div class="article-content">
					<p>
						${humorBoard.humorContent }
					</p>
				</div>
			</div>

			<div class="article-footer">
				<ul class="article-footer__list">
					<li class="article-footer__item article-footer__item--share">

						<c:if test="${member.userNo eq humorBoard.userNo }">
							<input type="button" class="btn btn-outline-dark " value="수정하기" onclick="location.href='${pageContext.request.contextPath}/humorBoard/humorUpdateView.do?humorbNo=${humorBoard.humorbNo}'"/>
							<input type="button" class="btn btn-outline-danger" id="delete" value="삭제" onclick="location.href='${pageContext.request.contextPath}/humorBoard/humorDelete.do?humorbNo=${humorBoard.humorbNo}'"/>
							&nbsp;&nbsp;&nbsp;
						</c:if>


					</li>
					<li class="article-footer__item">


						<div data-v-a4ce8e2a="">
							<!---->
						</div>

					</li>
				</ul>
			</div>
		</div>


		<div class="ads__gpt__mobile__dynamic">
			<div
					style="height: 100px; display: flex; align-items: center; justify-content: center; position: relative; margin: 0 auto; overflow: hidden;">
				<div id="div-gpt-ad-1563869439961-0">
					<script>
						if (window.innerWidth < 1024) {
							googletag.cmd
									.push(function() {
										googletag
												.display('div-gpt-ad-1563869439961-0');
									});
						}
					</script>
				</div>
			</div>
		</div>

<%--		<div class="ads__gpt__728-90__mid" style="margin:auto;">--%>
<%--			<div class="row1"--%>
<%--				 style="height: 90px; display: flex; align-items: center; justify-content: center; position: relative; margin: 0 auto; overflow: hidden;">--%>
<%--				<div id="div-gpt-ad-1562917435090-0"--%>
<%--					 data-google-query-id="COK-spL-lecCFcssvQodzpMMlg">--%>

<%--					<div--%>
<%--							id="google_ads_iframe_/114726905/NEW_OP.GG_Talk_Top_728x90_0__container__"--%>
<%--							style="border: 0pt none;">--%>
<%--						<iframe--%>
<%--								id="google_ads_iframe_/114726905/NEW_OP.GG_Talk_Top_728x90_0"--%>
<%--								title="3rd party ad content"--%>
<%--								name="google_ads_iframe_/114726905/NEW_OP.GG_Talk_Top_728x90_0"--%>
<%--								width="728" height="90" scrolling="no" marginwidth="0"--%>
<%--								marginheight="0" frameborder="0" srcdoc=""--%>
<%--								sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation"--%>
<%--								style="border: 0px; vertical-align: bottom;"--%>
<%--								data-google-container-id="2" data-load-complete="true"></iframe>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>

		<div id="comment">
			<div data-v-4a6d76c9="" data-post="1757489">
				<div data-v-4a6d76c9="" class="comment-wrap">

					<div data-v-4a6d76c9="" class="comment-header">
						<h2 data-v-4a6d76c9="" class="comment__title">댓글</h2>



						<!---->
					</div>
					<div data-v-4a6d76c9="" class="comment-list">

						<div data-v-4a6d76c9="" class="comment-l">

							<div class="container">
								<label for="content"></label>
								<form name="commentInsertForm" id="commentInsertForm">
									<div class="input-group">
										<input type="hidden" name="bno" value="${humorBoard.humorbNo}"/>
										<input type="text" class="form-control" id="cmtContent" name="cmtContent" placeholder="내용을 입력하세요.">
										<span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn" onclick="cmtWrite();">등록</button>
               </span>
									</div>
								</form>
							</div>
							<div class="container">
								<div class="commentList" id ="comment-list" name= "commentList"></div>
							</div>
							<!---->
							<div data-v-4a6d76c9="">
								<div data-v-4a6d76c9="" class="comment">
									<div data-v-4a6d76c9="" class="comment-vote">




										<!---->
									</div>

								</div>
							</div>
							<!---->
						</div>

					</div>
					<!---->
				</div>
			</div>
			<!---->
			<!---->
		</div>






	</div>


	<section class="article-list article-list--compact">
		<article class="article-list-item ">
			<div class="article-list-item__content">
				<div class="article-list-item__info">

				</div>
				<div class="article-list-item-meta">


				</div>
			</div>
		</article>
	</section>
</div>

<script>
	$(function(){
		getCommentList();
	});
	function getCommentList(){
		var formData = $("#commentInsertForm").serialize();
		$.ajax({
			cache : false,
			url : "${pageContext.request.contextPath}/humorBoard/cmtList.do", // 요기에

			type : 'POST',
			dataType: 'json',
			data : formData,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {

				var html = "";
				var cCnt = data.length;



				if(data.length > 0){


					for(i in data){

						console.log("cno : " + data[i].cno);

						html += "<div>";
						html += "<br>"
						html += "<div><table class='hcm'><h6 id='hc'><strong>"+data[i].writer+"."+data[i].date+"</strong></h6>";
						html += "<p id='hc'>"+data[i].comment+"</p>"
						if(data[i].uno == '${member.userNo}') {
							html += "<a href='${pageContext.request.contextPath}/humorBoard/hcommentDelete.do?cno=" +data[i].cno  + "'>삭제</a>" + "<tr><td></td></tr>"
						} else if(data[i].uno != '${member.userNo}'){
							html += "<p></p>"
						}
						html += "<hr>";
						html += "</table></div>";
						html += "</div>";
					}


				} else {

					html += "<div>";
					html += "<br>";
					html += "<div><table class='hcmt'><h6 id='h'><strong>등록된 댓글이 없습니다.</strong></h6>";
					html += "</table></div>";
					html += "</div>";

				}


				$("#comment-list").html(html);

				//var jsonObj = JSON.parse(data);
			}, // success

			error : function(xhr, status) {
				//alert(xhr + " : " + status);
			}
		}); // $.ajax */
		// 댓글 작성 부분//
	}
	function cmtWrite(){
		if($("#cmtContent").val().trim()==null || $("#cmtContent").val().trim() ==''){
			alert("댓글을 입력해주세요");
			$("#cmtContent").focus();

		}
		else{
			var formData = $("#commentInsertForm").serialize();
			$.ajax({
				cache : false,
				url : "${pageContext.request.contextPath}/humorBoard/cmtWrite.do", // 요기에
				type : 'POST',
				data : formData,
				success : function(data) {

					getCommentList();

					//var jsonObj = JSON.parse(data);
				}, // success

				error : function(xhr, status) {
					//alert(xhr + " : " + status);
				}
			}); // $.ajax */
		}

	}

</script>

</body>

</html>