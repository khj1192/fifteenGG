<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="${pageContext.request.contextPath}">15.GG</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/champion/championList.do">챔피언 공략<span class="sr-only">(current)</span></a>
            </li>
             <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/humorBoard/humorBoardList.do">유머 게시판<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/partyBoard/partyBoardList.do">파티 찾기<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/statisticsBoard/objectWinPercentageView.do">통계<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/statisticsBoard/dataTablePackageBoardView.do">통계테이블<span class="sr-only">(current)</span></a>
            </li>

        </ul>
    </div>
    <ul class="navbar-nav ml-md-auto">
        <li class="nav-item d-flex">
            <c:if test="${ empty member }">
                <a class="nav-link" href="${pageContext.request.contextPath}/member/loginMemberView.do">로그인</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/member/email.do">회원가입</a>
            </c:if><c:if test="${ !empty member }">
            <a class="nav-link" href="${pageContext.request.contextPath}/member/updateMemberView.do">정보 수정</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/member/memberLogout.do">로그아웃</a>
        </c:if>
        </li>
    </ul>
</nav>