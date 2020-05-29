<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유머 게시판</title>
<c:import url="../common/commonUtil.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/humor.css" />
<style>

	.row{
	background-image: url("${pageContext.request.contextPath}/resources/Images/member/KHinfo.jpg");
	
	}
</style>
<script>
	function humorForm() {
		var userNo = '${member.userNo}';
		location.href = "${pageContext.request.contextPath}/humorBoard/humorForm.do?userNo="
				+ userNo;
	}

	$(function() {
		$("article[id]")
				.on(
						"click",
						function() {
							var humorWriter = $(this).children('td').eq(2)
									.text();
							var humorbNo = $(this).attr("id");
							console.log("humorbNo=" + humorbNo);
							console.log(humorWriter);
							location.href = "${pageContext.request.contextPath}/humorBoard/humorView.do?bno="
									+ humorbNo ;
						});
	});
</script>
</head>
<body
	style="background: #f4f4f4; ! important; max-width: 1011px; text-align: center; font-weight: normal; margin: 0 auto;"
	onload="onload();">

	<c:import url="../common/navbar.jsp" />

	<div id="content">

		<div class="sub-header">
			<div class="sub-header-info">
				<h2 class="sub-header__title">
					<a>유머 게시판</a>
				</h2>
				<ul class="sub-header-button">
					<li class="sub-header-button__item sub-header-button__item--search">
						<button id="search-toggle-button" class="button">검색하기</button>
					</li>
					<c:if test="${ !empty member }">
					<li class="sub-header-button__item">
					<a onclick="humorForm();"> <img
							src="https://talk.op.gg/images/icon-write@2x.png" alt="글쓰기"
							width="24"></a></li>
							</c:if>
				</ul>
			</div>
			<div class="sub-link" id="sub-menu"
				style="z-index: auto; position: static; top: auto;">
				<ul class="sub-link__list">
					<li class="sub-link__item sub-link__item--active"><a> <img
							src="https://talk.op.gg/images/icon-hot-on@2x.png" width="24"
							alt=""><span>총 ${totalContents }건의 게시물이 있습니다.</span>
					</a></li>
					
				</ul>
				<div class="sub-header-search">
					<form action="" id="sub-search">
						<label><select name="target"
							class="sub-header-search__select">
								<option value="title">제목</option>


								<option value="user_name">작성자</option>
						</select></label> <input type="text" name="q" class="sub-header-search__input"
							id="search-input" placeholder="검색">
						<button class="sub-header-search__button">
							<img src="https://talk.op.gg/images/icon-search@2x.png"
								width="24" alt="검색">
						</button>
					</form>
				</div>
			</div>
			<div style="display: none; width: 728px; height: 48px; float: none;"></div>
		</div>

		<div class="ads__gpt__mobile__dynamic">
			<div
				style="height: 100px; display: flex; align-items: center; justify-content: center; background: url('//hb.vntsm.com/assets/op_loader.gif') center center no-repeat #fff; position: relative; margin: 0 auto; overflow: hidden;">
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
		<div class="ads__gpt__728-90__mid">
    <div id="ok123" style="
        height: 90px;
        display: flex;
        align-items: center;
        justify-content: center;
        background: url('//hb.vntsm.com/assets/op_loader.gif') center center no-repeat #ebeef1;
        position: relative;
        margin: 0 auto;
        overflow: hidden;
    ">
				<div id="div-gpt-ad-1562917435090-0"
					data-google-query-id="COnH9Iy-lOcCFQ0ulgodgoIIXA">

						
						<div class="row"
							id="google_ads_iframe_/114726905/NEW_OP.GG_Talk_Top_728x90_0__container__"
							style="border: 0pt none; display: inline-block; width: 728px; height: 90px; margin:auto">
							<iframe frameborder="0"
								src="https://tpc.googlesyndication.com/safeframe/1-0-37/html/container.html"
								id="google_ads_iframe_/114726905/NEW_OP.GG_Talk_Top_728x90_0"
								title="3rd party ad content" name="" scrolling="no"
								marginwidth="0" marginheight="0" width="728" height="90"
								data-is-safeframe="true"
								sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation"
								data-google-container-id="2"
								style="border: 0px; vertical-align: bottom;"
								data-load-complete="true"></iframe>
						</div>
					
				</div>
			</div>
</div>

		<section class="article-list article-list--fixed"></section>
		<section class="article-list">
		<c:forEach items="${list}" var="hb"> 
			<article id="${hb.humorbNo }" class="article-list-item ">
				<div class="article-list-item__vote">
					
					<div><h6><strong>${hb.humorbNo}</strong><h6></div>
				</div>
				<div class="article-list-item__content">
					<a
						
						class="article-list-item__info">
						<div class="article-list-item__title">
							<span>${hb.humorTitle}</span> <em>[헤헷]</em>
						</div>
					</a>
					<div class="article-list-item-meta">
						<div class="article-list-item-meta__item"><strong>${hb.humorDate}</strong></div>
						<div class="article-list-item-meta__item">
							<span ><strong>작성자 :</strong> </span>
					
							 <a><strong>${hb.humorWriter}</strong> </a>
						</div>
					</div>
					
				</div>
				<div class="article-list-item-thumbnail"> <img src="https://talk.op.gg/images/icon-vote-up.png" alt="">
                   <h6><strong>${hb.humorBoardCount }</strong></h6>
                </div>
			</article>
			</c:forEach>
			





			<section class="article-list-paging">
				<div class="article-list-paging-content">
					<ul class="article-list-paging-list">


						<li>
							<a> ${pageBar}
								
						</a>
						</li>
					</ul>
				</div>
			</section>
		</section>

	</div>

</body>

</html>


