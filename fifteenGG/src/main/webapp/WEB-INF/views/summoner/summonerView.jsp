<%@ page import="java.util.Date" %>
<%@ page import="org.joda.time.DateTime" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>15.GG</title>
    <c:import url="../common/commonUtil.jsp"/>
    <style>
        .profile-tier {
            width: 60px;
            height: 60px;
        }
        .wrap-loading{ /*화면 전체를 어둡게 합니다.*/
            position: fixed;
            left:0;
            right:0;
            top:0;
            bottom:0;
            background: rgba(0,0,0,0.2); /*not in ie */
            filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',endColorstr='#20000000');    /* ie */
        }
        .wrap-loading div{ /*로딩 이미지*/
            position: fixed;
            top:50%;
            left:50%;
            margin-left: -21px;
            margin-top: -21px;
        }
        .display-none{ /*감추기*/
            display:none;
        }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">

</head>

<body>

<%-- nav 영역 --%>
<c:import url="../common/navbar.jsp"/>

<%-- nav 와 div 사이의 영역 --%>
<div class="row">
    <!-- 나중에 광고 혹은 분석 관련 탭이 들어갈 위치 -->
</div>

<!-- 전적 관련 영역 -->
<div class="container-fluid">

    <!-- 소환사명 ~ 티어 -->
    <div class="row bg-white align-items-center" style="margin-top: 10px">
        <!-- 소환사 아이콘 & 소환사 명 -->
        <div class="col-lg-4 d-flex justify-content-start align-items-center py-2 px-3">
            <div>
                <a href="#">
                    <img class="rounded-circle"
                         src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/profileicon/${summoner.profileIconId}.png"
                         width="80" height="80"/>
                </a>
            </div>
            <div class="px-3 d-flex flex-column">
                <div class="gg-summoner-name gg-important-text"
                     href="/kr/profile/View">
                    <input type="hidden" id="summonerName" value="${summoner.name}">
                    ${summoner.name}
                </div>
                <div>
                    <a class="btn btn-primary btn-block mt-0 mb-0 ml-0 mr-0"
                       id="profileUpdateBtn"
                       style="font-size: 0.875rem"
                       href="${pageContext.request.contextPath}/search/UpdateMatch.do?accountId=${summoner.accountId}&summonerName=${summoner.name}"
                       role="button">
                        <i class="fas fa-sync"></i>
                        <span id="profileUpdateProgressImg" class="fa fa-spinner fa-spin fa-3x"
                              style="display: none !important;"></span>
                        업데이트
                    </a>

                    <button class="btn btn-rose btn-round btn-block mt-0 mb-0 ml-0 mr-0 btn-disabled"
                            id="profileUpdateProgressBtn"
                            style="font-size: 0.875rem; display: none !important;">
                        <span class="fa fa-spinner fa-spin fa-3x"></span>
                        업데이트
                    </button>


                </div>
                <div>
                    <%--                    날짜--%>
                </div>
            </div>
        </div>

        <!-- 빈 공간 -->
        <div class="col-lg-3">
        </div>

        <!-- 티어 표시 -->
        <div class="col-lg-5 py-2 px-3 gg-mobile-division">
            <div class="d-flex align-items-center justify-content-around">


                <!-- 아무것도 없을 떄 -->
                <c:if test="${empty leagueEntry}">
                    <input id="tierInfo" type="hidden" value="Unranked">
                    <div class="px-2">
                        <div class="d-flex align-items-center flex-column">
                            <img class="gg-profile-tier"
                                 src="${pageContext.request.contextPath}/resources/Images/ranked-emblems/default.png"/>
                        </div>
                    </div>
                    <div class="px-2 text-left">

                    <span class="gg-sub-description">
                        솔로랭크
                    </span>
                        <span class="gg-summoner-navigation-tier">
                        Unranked
                    </span>
                        <span class="d-block">
                        N/A
                    </span>
                        <span class="d-block">
                        N/A
                    </span>

                    </div>

                    <div class="px-2">
                        <div class="d-flex align-items-center flex-column">
                            <img class="profile-tier"
                                 src="${pageContext.request.contextPath}/resources/Images/ranked-emblems/default.png"/>
                        </div>
                    </div>

                    <div class="px-2 text-left">

                    <span class="gg-sub-description">
                       자유랭크
                    </span>
                        <span class="gg-summoner-navigation-tier">
                        Unranked
                    </span>
                        <span class="d-block">
                       N/A
                    </span>
                        <span class="d-block">
                        N/A
                    </span>

                    </div>
                </c:if>

                <!-- 솔로랭크만 있을 때 -->
                <c:if test="${leagueEntry.size() == 1 && leagueEntry.get(0).queueType == 'RANKED_SOLO_5x5'}">
                    <input id="tierInfo" type="hidden" value="${leagueEntry.get(0).tier}">
                    <div class="px-2">
                        <div class="d-flex align-items-center flex-column">
                            <img class="gg-profile-tier"
                                 src="${pageContext.request.contextPath}/resources/Images/ranked-emblems/${leagueEntry.get(0).tier}.png"/>
                        </div>
                    </div>
                    <div class="px-2 text-left">

                    <span class="gg-sub-description">
                    솔로랭크
                    </span>
                        <span class="gg-summoner-navigation-tier">
                                ${leagueEntry.get(0).tier}
                        </span>
                        <span class="d-block">
                    <fmt:formatNumber
                            value="${(leagueEntry.get(0).wins/(leagueEntry.get(0).losses + leagueEntry.get(0).wins))*100}"
                            type="number"/>%
                    ${leagueEntry.get(0).leaguePoints}LP
                    </span>
                        <span class="d-block">
                    ${leagueEntry.get(0).wins}W ${leagueEntry.get(0).losses}L
                    </span>
                    </div>

                    <div class="px-2">
                        <div class="d-flex align-items-center flex-column">
                            <img class="gg-profile-tier"
                                 src="${pageContext.request.contextPath}/resources/Images/ranked-emblems/default.png"/>
                        </div>
                    </div>
                    <div class="px-2 text-left">

                    <span class="gg-sub-description">
                    자유랭크
                    </span>
                        <span class="gg-summoner-navigation-tier">
                        Unranked
                    </span>
                        <span class="d-block">
                        N/A
                    </span>
                        <span class="d-block">
                        N/A
                    </span>

                    </div>
                </c:if>

                <!-- 자유랭크만 있을 경우 -->
                <c:if test="${leagueEntry.size() == 1 && leagueEntry.get(0).queueType == 'RANKED_FLEX_SR'}">
                    <input id="tierInfo" type="hidden" value="${leagueEntry.get(0).tier}">
                    <div class="px-2">
                        <div class="d-flex align-items-center flex-column">
                            <img class="gg-profile-tier"
                                 src="${pageContext.request.contextPath}/resources/Images/ranked-emblems/default.png"/>
                        </div>
                    </div>
                    <div class="px-2 text-left">

                    <span class="gg-sub-description">
                    솔로랭크
                    </span>
                        <span class="gg-summoner-navigation-tier">
                            Unranked
                        </span>
                        <span class="d-block">
                            N/A
                    </span>
                        <span class="d-block">
                    N/A
                    </span>
                    </div>

                    <div class="px-2">
                        <div class="d-flex align-items-center flex-column">
                            <img class="gg-profile-tier"
                                 src="${pageContext.request.contextPath}/resources/Images/ranked-emblems/${leagueEntry.get(0).tier}.png"/>
                        </div>
                    </div>
                    <div class="px-2 text-left">

                    <span class="gg-sub-description">
                    자유랭크
                    </span>
                        <span class="gg-summoner-navigation-tier">
                                ${leagueEntry.get(0).tier}
                        </span>
                        <span class="d-block">
                         <fmt:formatNumber
                                 value="${(leagueEntry.get(0).wins/(leagueEntry.get(0).losses + leagueEntry.get(0).wins))*100}"
                                 type="number"/>%
                    ${leagueEntry.get(0).leaguePoints}LP
                    </span>
                        <span class="d-block">
                        ${leagueEntry.get(0).wins}W ${leagueEntry.get(0).losses}L
                    </span>

                    </div>
                </c:if>

                <!-- 둘 다  있을 경우 -->
                <c:if test="${leagueEntry.size() > 1 }">
                    <input id="tierInfo" type="hidden" value="${leagueEntry.get(0).tier}">
                    <div class="px-2">
                        <div class="d-flex align-items-center flex-column">
                            <img class="gg-profile-tier"
                                 src="${pageContext.request.contextPath}/resources/Images/ranked-emblems/${leagueEntry.get(1).tier}.png"/>
                        </div>
                    </div>
                    <div class="px-2 text-left">

                    <span class="gg-sub-description">
                    솔로랭크
                    </span>
                        <span class="gg-summoner-navigation-tier">
                                ${leagueEntry.get(1).tier}
                        </span>
                        <span class="d-block">
                              <fmt:formatNumber
                                      value="${(leagueEntry.get(1).wins/(leagueEntry.get(1).losses + leagueEntry.get(1).wins))*100}"
                                      type="number"/>%
                    ${leagueEntry.get(1).leaguePoints}LP
                    </span>
                        <span class="d-block">
                   ${leagueEntry.get(1).wins}W ${leagueEntry.get(1).losses}L
                    </span>
                    </div>

                    <div class="px-2">
                        <div class="d-flex align-items-center flex-column">
                            <img class="gg-profile-tier"
                                 src="${pageContext.request.contextPath}/resources/Images/ranked-emblems/${leagueEntry.get(0).tier}.png"/>
                        </div>
                    </div>
                    <div class="px-2 text-left">

                    <span class="gg-sub-description">
                    자유랭크
                    </span>
                        <span class="gg-summoner-navigation-tier">
                                ${leagueEntry.get(0).tier}
                        </span>
                        <span class="d-block">
                         <fmt:formatNumber
                                 value="${(leagueEntry.get(0).wins/(leagueEntry.get(0).losses + leagueEntry.get(0).wins))*100}"
                                 type="number"/>%
                    ${leagueEntry.get(0).leaguePoints}LP
                    </span>
                        <span class="d-block">
                        ${leagueEntry.get(0).wins}W ${leagueEntry.get(0).losses}L
                    </span>

                    </div>
                </c:if>

            </div>
        </div>
    </div>

    <!-- 색 있는 라인 -->
    <div class="row py-2 py-lg-0 px-3 bg-white">

        <div class="flex-grow gg-bg-negative" style="height: 1px"></div>

        <div class="flex-grow gg-bg-negative" style="height: 1px"></div>

        <div class="flex-grow gg-bg-negative" style="height: 1px"></div>

        <div class="flex-grow gg-bg-positive" style="height: 1px"></div>

        <div class="flex-grow gg-bg-negative" style="height: 1px"></div>

        <div class="flex-grow gg-bg-positive" style="height: 1px"></div>

        <div class="flex-grow gg-bg-positive" style="height: 1px"></div>

        <div class="flex-grow gg-bg-positive" style="height: 1px"></div>

        <div class="flex-grow gg-bg-positive" style="height: 1px"></div>

        <div class="flex-grow gg-bg-negative" style="height: 1px"></div>

        <div class="flex-grow gg-bg-positive" style="height: 1px"></div>

        <div class="flex-grow gg-bg-negative" style="height: 1px"></div>

        <div class="flex-grow gg-bg-positive" style="height: 1px"></div>

        <div class="flex-grow gg-bg-negative" style="height: 1px"></div>

        <div class="flex-grow gg-bg-positive" style="height: 1px"></div>

        <div class="flex-grow gg-bg-negative" style="height: 1px"></div>

        <div class="flex-grow gg-bg-negative" style="height: 1px"></div>

        <div class="flex-grow gg-bg-positive" style="height: 1px"></div>

        <div class="flex-grow gg-bg-positive" style="height: 1px"></div>

        <div class="flex-grow gg-bg-positive" style="height: 1px"></div>


    </div>

    <!-- 모스트 영역 -->


    <!-- 모스트 큐 -->
    <div class="row bg-white">

<%--    1    --%>
        <c:if test="${myStat.MostQueue.size() == 1}">
            <c:set value="${myStat.MostQueue.get(0).QUEUECOUNT*100/(myStat.MostQueue.get(0).QUEUECOUNT)}"
                   var="queue1"/>

            <div class="col-lg-2 d-flex align-items-center justify-content-center">
                <div class="gg-division flex-grow">

                    <div>
                        <div class="gg-action-area" data-href="/kr/profile/View/stats?c=Normal"
                             data-event="MostMatchCategoryTopStats">
                            <div class="gg-important-text">${myStat.MostQueue.get(0).QUEUENAME}</div>
                            <span class="gg-sub-description">
                                 <fmt:formatNumber value="${queue1}"/>%
                            </span>
                            <div class="progress progress-line-primary mb-1">
                                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="100"
                                     aria-valuemin="0" aria-valuemax="100" style="width: ${queue1}%;">
                                    <span class="sr-only"><fmt:formatNumber value="${queue1}"/>%</span>
                                </div>
                            </div>
                        </div>
                        <div class="row no-gutters justify-content-md-center">

                            <div class="gg-action-area col-6 pr-1" data-href="/kr/profile/View/stats?c=FreeRank"
                                 data-event="MostMatchCategoryStats">
                                <span class="gg-important-text-sm">데이터 없음</span>
                                <span class="gg-sub-description"> <fmt:formatNumber value="0"/>%</span>
                                <div class="progress progress-line-primary mb-2">
                                    <div class="progress-bar progress-bar-primary" role="progressbar"
                                         aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                        <span class="sr-only"> <fmt:formatNumber value="0"/>%</span>
                                    </div>
                                </div>
                            </div>

                            <div class="gg-action-area col-6 pl-1" data-href="/kr/profile/View/stats?c=SoloRank"
                                 data-event="MostMatchCategoryStats">
                                <span class="gg-important-text-sm">데이터 없음</span>
                                <span class="gg-sub-description"> <fmt:formatNumber value="0"/>%</span>
                                <div class="progress progress-line-primary mb-2">
                                    <div class="progress-bar progress-bar-primary" role="progressbar"
                                         aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                        <span class="sr-only"> <fmt:formatNumber value="0"/>%</span>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </c:if>

<%--    2--%>

        <c:if test="${myStat.MostQueue.size() == 2}">
            <c:set value="${myStat.MostQueue.get(0).QUEUECOUNT*100/(myStat.MostQueue.get(0).QUEUECOUNT+myStat.MostQueue.get(1).QUEUECOUNT)}"
                   var="queue1"/>
            <c:set value="${myStat.MostQueue.get(1).QUEUECOUNT*100/(myStat.MostQueue.get(0).QUEUECOUNT+myStat.MostQueue.get(1).QUEUECOUNT)}"
                   var="queue2"/>

            <div class="col-lg-2 d-flex align-items-center justify-content-center">
                <div class="gg-division flex-grow">

                    <div>
                        <div class="gg-action-area" data-href="/kr/profile/View/stats?c=Normal"
                             data-event="MostMatchCategoryTopStats">
                            <div class="gg-important-text">${myStat.MostQueue.get(0).QUEUENAME}</div>
                            <span class="gg-sub-description">
                                 <fmt:formatNumber value="${queue1}"/>%
                            </span>
                            <div class="progress progress-line-primary mb-1">
                                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="100"
                                     aria-valuemin="0" aria-valuemax="100" style="width: ${queue1}%;">
                                    <span class="sr-only"><fmt:formatNumber value="${queue1}"/>%</span>
                                </div>
                            </div>
                        </div>
                        <div class="row no-gutters justify-content-md-center">

                            <div class="gg-action-area col-6 pr-1" data-href="/kr/profile/View/stats?c=FreeRank"
                                 data-event="MostMatchCategoryStats">
                                <span class="gg-important-text-sm">${myStat.MostQueue.get(1).QUEUENAME}</span>
                                <span class="gg-sub-description"> <fmt:formatNumber value="${queue2}"/>%</span>
                                <div class="progress progress-line-primary mb-2">
                                    <div class="progress-bar progress-bar-primary" role="progressbar"
                                         aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: ${queue2+10}%;">
                                        <span class="sr-only"> <fmt:formatNumber value="${queue2}"/>%</span>
                                    </div>
                                </div>
                            </div>

                            <div class="gg-action-area col-6 pl-1" data-href="/kr/profile/View/stats?c=SoloRank"
                                 data-event="MostMatchCategoryStats">
                                <span class="gg-important-text-sm">데이터 없음</span>
                                <span class="gg-sub-description"> <fmt:formatNumber value="0"/>%</span>
                                <div class="progress progress-line-primary mb-2">
                                    <div class="progress-bar progress-bar-primary" role="progressbar"
                                         aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                        <span class="sr-only"> <fmt:formatNumber value="0"/>%</span>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${myStat.MostQueue.size() > 2}">
            <c:set value="${myStat.MostQueue.get(0).QUEUECOUNT*100/(myStat.MostQueue.get(0).QUEUECOUNT+myStat.MostQueue.get(1).QUEUECOUNT+myStat.MostQueue.get(2).QUEUECOUNT)}"
                   var="queue1"/>
            <c:set value="${myStat.MostQueue.get(1).QUEUECOUNT*100/(myStat.MostQueue.get(0).QUEUECOUNT+myStat.MostQueue.get(1).QUEUECOUNT+myStat.MostQueue.get(2).QUEUECOUNT)}"
                   var="queue2"/>
            <c:set value="${myStat.MostQueue.get(2).QUEUECOUNT*100/(myStat.MostQueue.get(0).QUEUECOUNT+myStat.MostQueue.get(1).QUEUECOUNT+myStat.MostQueue.get(2).QUEUECOUNT)}"
                   var="queue3"/>

            <div class="col-lg-2 d-flex align-items-center justify-content-center">
                <div class="gg-division flex-grow">

                    <div>
                        <div class="gg-action-area" data-href="/kr/profile/View/stats?c=Normal"
                             data-event="MostMatchCategoryTopStats">
                            <div class="gg-important-text">${myStat.MostQueue.get(0).QUEUENAME}</div>
                            <span class="gg-sub-description">
                                 <fmt:formatNumber value="${queue1}"/>%
                            </span>
                            <div class="progress progress-line-primary mb-1">
                                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="100"
                                     aria-valuemin="0" aria-valuemax="100" style="width: ${queue1}%;">
                                    <span class="sr-only"><fmt:formatNumber value="${queue1}"/>%</span>
                                </div>
                            </div>
                        </div>
                        <div class="row no-gutters justify-content-md-center">

                            <div class="gg-action-area col-6 pr-1" data-href="/kr/profile/View/stats?c=FreeRank"
                                 data-event="MostMatchCategoryStats">
                                <span class="gg-important-text-sm">${myStat.MostQueue.get(1).QUEUENAME}</span>
                                <span class="gg-sub-description"> <fmt:formatNumber value="${queue2}"/>%</span>
                                <div class="progress progress-line-primary mb-2">
                                    <div class="progress-bar progress-bar-primary" role="progressbar"
                                         aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: ${queue2+10}%;">
                                        <span class="sr-only"> <fmt:formatNumber value="${queue2}"/>%</span>
                                    </div>
                                </div>
                            </div>

                            <div class="gg-action-area col-6 pl-1" data-href="/kr/profile/View/stats?c=SoloRank"
                                 data-event="MostMatchCategoryStats">
                                <span class="gg-important-text-sm">${myStat.MostQueue.get(2).QUEUENAME}</span>
                                <span class="gg-sub-description"> <fmt:formatNumber value="${queue3}"/>%</span>
                                <div class="progress progress-line-primary mb-2">
                                    <div class="progress-bar progress-bar-primary" role="progressbar"
                                         aria-valuenow="100"
                                         aria-valuemin="0" aria-valuemax="100" style="width: ${queue3+10}%;">
                                        <span class="sr-only"> <fmt:formatNumber value="${queue3}"/>%</span>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </c:if>



        <c:if test="${myStat.MostPosition.size() > 2}">
            <c:set value="${myStat.MostPosition.get(0).POSITIONCOUNT*100/(myStat.MostPosition.get(0).POSITIONCOUNT+myStat.MostPosition.get(1).POSITIONCOUNT+myStat.MostPosition.get(2).POSITIONCOUNT)}"
                   var="postion1"/>
            <c:set value="${myStat.MostPosition.get(1).POSITIONCOUNT*100/(myStat.MostPosition.get(0).POSITIONCOUNT+myStat.MostPosition.get(1).POSITIONCOUNT+myStat.MostPosition.get(2).POSITIONCOUNT)}"
                   var="postion2"/>
            <c:set value="${myStat.MostPosition.get(2).POSITIONCOUNT*100/(myStat.MostPosition.get(0).POSITIONCOUNT+myStat.MostPosition.get(1).POSITIONCOUNT+myStat.MostPosition.get(2).POSITIONCOUNT)}"
                   var="postion3"/>
            <div class="col-lg-2 d-flex align-items-center justify-content-center">
                <div class="gg-division flex-grow">


                    <div class="gg-action-area" data-href="/kr/profile/View/stats?l=Adc&amp;c=FreeRank"
                         data-event="MostLaneTopStats">
                        <div class="gg-important-text">${myStat.MostPosition.get(0).POSITIONNAME}</div>
                        <span class="gg-sub-description"><fmt:formatNumber value="${postion1}"/>%</span>
                        <div class="progress progress-line-primary mb-1">
                            <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="100"
                                 aria-valuemin="0" aria-valuemax="100" style="width: ${postion1}%;">
                                <span class="sr-only"><fmt:formatNumber value="${postion1}"/>%</span>
                            </div>
                        </div>
                    </div>
                    <div class="row no-gutters justify-content-md-center">

                        <div class="gg-action-area col-6 pr-1" data-href="/kr/profile/View/stats?l=Mid&amp;c=SoloRank"
                             data-event="MostLaneStats">
                            <span class="gg-important-text-sm">${myStat.MostPosition.get(1).POSITIONNAME}</span>
                            <span class="gg-sub-description"><fmt:formatNumber value="${postion2}"/>%</span>
                            <div class="progress progress-line-primary mb-2">
                                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="100"
                                     aria-valuemin="0" aria-valuemax="100" style="width: ${postion2+10}%;">
                                    <span class="sr-only"><fmt:formatNumber value="${postion2}"/>%</span>
                                </div>
                            </div>
                        </div>

                        <div class="gg-action-area col-6 pl-1" data-href="/kr/profile/View/stats?l=Sup&amp;c=FreeRank"
                             data-event="MostLaneStats">
                            <span class="gg-important-text-sm">${myStat.MostPosition.get(2).POSITIONNAME}</span>
                            <span class="gg-sub-description"><fmt:formatNumber value="${postion3}"/>%</span>
                            <div class="progress progress-line-primary mb-2">
                                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="100"
                                     aria-valuemin="0" aria-valuemax="100" style="width: ${postion3+10}%;">
                                    <span class="sr-only"><fmt:formatNumber value="${postion3}"/>%</span>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </c:if>

        <!-- 모스트 챔프 -->
        <div class="col-lg-4 d-flex align-items-center justify-content-center">
            <div class="gg-division flex-grow">

                <table class="table">

                    <c:forEach var="MostChamp" items="${myStat.MostChamp}">
                    <tbody>
                    <tr class="gg-action-area" data-event="SummonerNavigationStats"
                        data-href="/kr/profile/View/stats?cId=523&amp;c=FreeRank">
                        <td class="d-flex align-items-center justify-content-center">
                            <img class="img-circled"
                                 src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${MostChamp.CHAMPFULLIMG}"
                                 width="30px" height="30px">
                        </td>

                        <td class="text-left">

                            <span class="badge badge-pill badge-default">${MostChamp.CHAMPNAME}</span>

                        </td>

                        <td class="text-center">
                                ${MostChamp.TOTALCOUNT}
                            <span class="gg-sub-description">경기</span>
                        </td>
                        <td class="text-center">
                                <span class="gg-text-negative">
                                    <fmt:formatNumber value="${MostChamp.RATE}" type="percent"/>
                                </span>
                            <span class="gg-sub-description">${MostChamp.WIN}W ${MostChamp.LOSE}L</span>
                        </td>
                        <td class="text-center">
                            <span class=" gg-text-negative">${MostChamp.KDA}</span>
                            <span class="gg-sub-description">KDA</span>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="gg-thin-line mx-3 d-block d-lg-none"></div>
        <div id="ratingArea" class="col-lg-4 align-items-center">
                <span>
                    <%--                    미구현 영역--%>
                </span>
        </div>

        <div class="gg-thin-line mx-3"></div>
        <div class="col-12 d-flex align-items-center justify-content-center justify-content-lg-start gg-text-normal py-2 bg-white">
            <span><i class="material-icons gg-text-normal text-info">Notice</i></span>
            <span class="ml-1 gg-sub-description text-left">사이트 출시 이전의 데이터는 통계 할 수 없습니다.</span>
        </div>
    </div>

    <!-- 선 -->
    <div class="row no-gutters my-5">
        <div class="col-12">
            <div class="row no-gutters ad">
                <div class="col-lg-12 ml-0 mr-0 pl-0 pr-0">
                    <ins class="adsbygoogle" style="display:block;margin-top: 0.5rem !important;"
                         data-ad-client="ca-pub-7895542192161438" data-ad-slot="6685595608" data-ad-format="auto"
                         data-full-width-responsive="true">
                    </ins>
                </div>
            </div>

        </div>
    </div>

    <!-- 매치 리스트 영역 -->
    <div id="content" class="gg-action-areas collapse" style="display: block;">

        <!-- 게임 종류 선택 버튼 -->
        <div class="row gg-division">
            <ul class="nav nav-pills justify-content-start flex-nowrap align-content-center nav-pills-info gg-matchlist-menu"
                role="tablist">
                <li class="nav-item bg-white">
                    <a class="nav-link active rounded-0 gg-box-title" href="#matchAll" data-toggle="tab"
                       role="tablist">
                        최근
                        <span class="mx-1 badge badge-info border rounded-circle border-white"></span>
                    </a>
                </li>

                <li class="nav-item bg-white">
                    <a class="nav-link rounded-0 gg-box-title" href="#matchSoloRank" data-id="SoloRank"
                       data-toggle="tab" role="tablist" onclick="showMatchCategory(this)">
                        솔로랭크
                    </a>
                </li>

                <li class="nav-item bg-white">
                    <a class="nav-link rounded-0 gg-box-title" href="#matchFreeRank" data-id="FreeRank"
                       data-toggle="tab" role="tablist" onclick="showMatchCategory(this)">
                        자유랭크
                    </a>
                </li>

                <li class="nav-item bg-white">
                    <a class="nav-link rounded-0 gg-box-title" href="#matchNormal" data-id="Normal"
                       data-toggle="tab"
                       role="tablist" onclick="showMatchCategory(this)">
                        일반
                    </a>
                </li>

                <li class="nav-item bg-white">
                    <a class="nav-link rounded-0 gg-box-title" href="#matchAram" data-id="Aram" data-toggle="tab"
                       role="tablist" onclick="showMatchCategory(this)">
                        칼바람
                    </a>
                </li>

            </ul>
        </div>

        <!-- 게임 종류에 따른 매치 -->
        <div class="row gg-division tab-content">

            <!-- 모든 매치 -->
            <div class="col-12 tab-pane active" id="matchAll">

                <div class="row">

                    <!-- 좌측 영역 -->
                    <div class="col-lg-4 px-0">
                        <div class="row no-gutters">
                            <div class="col-12 px-0">

                                <div class="gg-box gg-division">

                                    <div class="row">
                                        <div class="col-6">
                                            <span class="gg-box-title">최근 정상인 플레이</span>

                                            <div class="pt-1">
                                                <i class="far fa-thumbs-up fa-2x"></i>
                                                <span class="gg-important-text py-4">
                                                    <fmt:formatNumber value="${(myStat.qualityPlay)*10}" type="number"/>%</span>
                                            </div>
                                            <span class="gg-sub-description">최근10경기 KDA2.5이상 </span>

                                        </div>
                                        <div class="col-6">
                                            <span class="gg-box-title">최근 트롤 플레이</span>

                                            <div class="pt-1">
                                                <i class="far fa-thumbs-down fa-2x"></i>
                                                <span class="gg-important-text">
                                                    <fmt:formatNumber value="${(myStat.trollPlay)*10}"
                                                                      type="number"/>%</span>
                                            </div>
                                            <span class="gg-sub-description">최근10경기 KDA 1이하</span>

                                        </div>

                                    </div>
                                </div>

                                <div class="gg-box gg-division">


                                    <div class="row">
                                        <div class="col-12 d-flex flex-column">
                                        <span class="gg-box-title">
                                            CS 역량
                                            - 분당 CS
                                        </span>
                                            <span class="d-flex justify-content-center pt-1" style="color:orangered;">
                                            <%-- <span><img
                                                    src="${pageContext.request.contextPath}/resources/Images/ranked-emblems/GOLD.png"
                                                    class="gg-img-30x30"></span> --%>
                                            <span class="gg-important-number ml-2">
                                            <fmt:formatNumber value="${(myStat.totalCS/(myStat.totalDuration/60))}"
                                                              type="number" pattern="0.0"/></span>
                                        </span>
                                            <span class="gg-sub-description pt-2">
                                            <a href="/kr/profile/View/feedback" class="gg-text-soso"
                                               data-event="Link-CsTierFeedback">
                                                <!-- 골드 평균 근접 ... 더보기 -->
                                            </a>
                                        </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="gg-box gg-division">


                                    <div class="row justify-content-center">

                                        <div class="col-6">
                                            <span class="gg-box-title">최근 10경기 KDA</span>
                                            <span class="gg-important-text pt-1 gg-text-negative">
												<fmt:formatNumber value="${(myStat.totalKDA/10)}" type="number"
                                                                  pattern="0.0"/></span>
                                            <!-- <span class="gg-sub-description">1W 4L 0.78 인분</span> -->
                                        </div>


                                        <div class="col-6">
                                            <span class="gg-box-title">최근 10경기 승률</span>
                                            <span class="gg-important-text pt-1 gg-text-soso">
                                                <fmt:formatNumber value="${(myStat.totalWin1*10)}"
                                                                  type="number"/>%</span>
                                            <span class="gg-sub-description">${myStat.totalWin1}W ${myStat.totalWin0}L</span>
                                        </div>

                                    </div>
                                </div>

                                <%--                                    <div class="gg-box gg-division">--%>

                                <%--                                <span class="gg-box-title">--%>
                                <%--                                    최근 듀오--%>
                                <%--                                </span>--%>

                                <%--                                        <table class="table gg-friends-table">--%>

                                <%--                                            <tbody>--%>
                                <%--                                            <tr class="gg-action-area" data-href="/kr/profile/KooNH"--%>
                                <%--                                                data-event="DuoHistory">--%>
                                <%--                                                <td class="text-center"><span--%>
                                <%--                                                        class="gg-summoner-name gg-text-normal">KooNH</span></td>--%>
                                <%--                                                <td class="text-center">--%>
                                <%--                                                    <span>9</span>--%>
                                <%--                                                    <span class="gg-sub-description">Matches</span>--%>
                                <%--                                                </td>--%>
                                <%--                                                <td class="text-center">--%>
                                <%--                                                    <span class="gg-text-positive">66%</span>--%>
                                <%--                                                    <span class="gg-sub-description">6W 3L</span>--%>
                                <%--                                                </td>--%>
                                <%--                                            </tr>--%>

                                <%--                                            <tr class="gg-action-area" data-href="/kr/profile/BONS"--%>
                                <%--                                                data-event="DuoHistory">--%>
                                <%--                                                <td class="text-center"><span--%>
                                <%--                                                        class="gg-summoner-name gg-text-normal">BONS</span></td>--%>
                                <%--                                                <td class="text-center">--%>
                                <%--                                                    <span>8</span>--%>
                                <%--                                                    <span class="gg-sub-description">Matches</span>--%>
                                <%--                                                </td>--%>
                                <%--                                                <td class="text-center">--%>
                                <%--                                                    <span class="gg-text-positive">62%</span>--%>
                                <%--                                                    <span class="gg-sub-description">5W 3L</span>--%>
                                <%--                                                </td>--%>
                                <%--                                            </tr>--%>

                                <%--                                            <tr class="gg-action-area"--%>
                                <%--                                                data-href="/kr/profile/%EB%B0%A9%EB%8C%95%EC%9D%B4"--%>
                                <%--                                                data-event="DuoHistory">--%>
                                <%--                                                <td class="text-center"><span--%>
                                <%--                                                        class="gg-summoner-name gg-text-normal">방댕이</span></td>--%>
                                <%--                                                <td class="text-center">--%>
                                <%--                                                    <span>8</span>--%>
                                <%--                                                    <span class="gg-sub-description">Matches</span>--%>
                                <%--                                                </td>--%>
                                <%--                                                <td class="text-center">--%>
                                <%--                                                    <span class="gg-text-positive">62%</span>--%>
                                <%--                                                    <span class="gg-sub-description">5W 3L</span>--%>
                                <%--                                                </td>--%>
                                <%--                                            </tr>--%>

                                <%--                                            </tbody>--%>
                                <%--                                        </table>--%>

                                <%--                                    </div>--%>


                                <div class="row no-gutters ad">
                                    <div class="col-lg-12 ml-0 mr-0 pl-0 pr-0">
                                        <ins class="adsbygoogle"
                                             style="display:block;margin-top: 0.5rem !important;"
                                             data-ad-client="ca-pub-7895542192161438" data-ad-slot="5280841216"
                                             data-ad-format="auto" data-full-width-responsive="true">
                                        </ins>
                                    </div>
                                </div>


                                <div class="row d-flex justify-content-center">
                                    <div class="col-6">


                                        <div class="row no-gutters ad">
                                            <div class="col-lg-12 ml-0 mr-0 pl-0 pr-0">
                                                <ins class="adsbygoogle"
                                                     style="display:block;margin-top: 0.5rem !important;"
                                                     data-ad-client="ca-pub-7895542192161438"
                                                     data-ad-slot="5280841216"
                                                     data-ad-format="auto" data-full-width-responsive="true">
                                                </ins>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row d-flex justify-content-center">
                                    <div class="col-10">


                                        <div class="row no-gutters ad">
                                            <div class="col-lg-12 ml-0 mr-0 pl-0 pr-0">
                                                <ins class="adsbygoogle"
                                                     style="display:block;margin-top: 0.5rem !important;"
                                                     data-ad-client="ca-pub-7895542192161438"
                                                     data-ad-slot="5280841216"
                                                     data-ad-format="auto" data-full-width-responsive="true">
                                                </ins>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- 좌측 영역 끝 -->

                    <!-- 우측 영역 -->
                    <div class="col-lg-8 px-0">

                        <!-- 듀오 게시판 추천 글 -->
                        <div class="col-12 px-0">
                            <div class="col-12 px-0 gg-action-area"
                                 data-show-interaction="DuoRequestRecommendation">
                                <div class="gg-box gg-division text-left bg-primary text-white">
                                    <div class="d-flex align-items-center">
                                        <i class="fas fa-info"></i>
                                        <span class="gg-box-title ml-2"> ${summoner.name} 님 같은 분을 찾고 있습니다!</span>
                                    </div>
                                </div>
                                <div class="gg-box gg-action-area" data-event="DuoRequestRecommendationProfile"
                                     data-href="/kr/profile/%EC%A0%84%EC%82%B0%EC%9D%98%EC%86%90%EB%86%80%EB%A6%BC">
                                    <div class="d-flex justify-content-between py-2">
                                        <div class="d-flex align-items-center gg-profile-duo-request-list-title">
                                            <div id="partyTier" class="aa"></div>
                                            <div class="px-1"></div>
                                            <div id="partyPosition"></div>
                                            <div class="px-1"></div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-end">
                                            <div class="gg-text-normal">
                                                <i class="fas fa-user-edit"></i>
                                                <span id="partyWriter"></span>
                                            </div>
                                            <div class="px-1"></div>
                                        </div>
                                    </div>
                                    <div id="partyContent" class="d-flex text-secondary text-left my-font">
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between py-1 bg-white">
                                <div class="col-12 d-flex justify-content-end gg-sub-description">
                                    <a href="${pageContext.request.contextPath}/partyBoard/partyBoardList.do">
                                        듀오 구하기 더보기 ···
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- 최근 매치 리스트 -->
                        <div id="matchAllArea" class="gg-matchlist-box gg-division"></div>


                        <div class="col-12 py-2 gg-bg-gray">
                            <button type="button" class="btn btn-info" onclick="moreMatch();">
                                더보기
                            </button>
                            <input type="hidden" id="cPage">
                        </div>
                        <!-- 우측 영역 끝 -->
                    </div>
                </div>

            </div>
        </div>

    </div>

</div>
<%--페이징--%>
<script>
    var $cPage = $('#cPage');
    var $tierInfo = $('#tierInfo');
    function moreMatch() {
        $.ajax({
            url: "${pageContext.request.contextPath}/search/MatchSearch.do",
            data: {summonerName: '${summoner.name}',
                cPage : $cPage.val(),
                tierInfo : $tierInfo.val()},
            type: "POST",
            dataType: "json",
            success: function (data) {
                $('#matchAllArea').empty();
                var name = $('#summonerName').val();
                $cPage.val(data.cPage);
                for (var i = 0; i < data.matchViewList.length; i++) {
                    $('#matchAllArea').append('<div class="tab-pane active">');
                    $('#matchAllArea>div').eq(i).append('<div class="Normal gg-thin-line">').append('<div id="matchListAllArea" class="row no-gutters gg-action gg-matchlist FreeRank">');
                    for (var j = 0; j < 10; j++) {
                        if (data.matchViewList[i][j].summonerName == name) {
                            // ===== 승패 포지션
                            $('.gg-matchlist').eq(i).append('<div id="myStatView" class="col-md-8 d-flex flex-column justify-content-between gg-matchlist-' + data.matchViewList[i][j].win + '">\n' +
                                '                                                <div class="row no-gutters myMatchInfoArea">');
                            $('.myMatchInfoArea').eq(i).append('<div class="col-2 position d-flex flex-column gg-bg-' + data.matchViewList[i][j].win + ' text-white">');
                            $('.position').eq(i).append('<div class="d-flex flex-column my-auto justify-content-center py-2 durationtime">');
                            var time = data.matchViewList[i][j].gameCreation;
                            console.log(time);
                            var date = new Date();
                            date.setTime(time);
                            dateString = date.getMonth()+ 1 + "/" + date.getDate();
                            $('.durationtime').eq(i).append('<span class="gg-matchlist-meta-text">'+ dateString +'');
                            $('.durationtime').eq(i).append('<div class="d-block"><img class="py-1 gg-img-25x25" src="${pageContext.request.contextPath}/resources/Images/position/' + data.matchViewList[i][j].position + '.svg">');
                            if (data.matchViewList[i][j].win == true) {
                                $('.position').eq(i).append('<div class="d-flex justify-content-center py-lg-2 py-1">승리');
                            } else if (data.matchViewList[i][j].win == false) {
                                $('.position').eq(i).append('<div class="d-flex justify-content-center py-lg-2 py-1">패배');
                            }
                            // ======= 내 정보
                            var rankType = data.matchViewList[i][j].queueName.substr(0, 1);
                            var gameDuration = data.matchViewList[i][j].gameDuration;
                            var min = parseInt((gameDuration%3600)/60);
                            var sec = gameDuration%60;
                            if (min.toString().length==1) min = "0" + min;
                            if (sec.toString().length==1) sec = "0" + sec;
                            $('.myMatchInfoArea').eq(i).append('<div class="col-10 myMatchInfo" >');
                            $('.myMatchInfo').eq(i).append(' <div class="row no-gutters px-2 pt-2 itq ">');
                            $('.myMatchInfo').eq(i).append(' <div class="row no-gutters pt-1">');
                            $('.itq').eq(i).append('<div class="col-2 col-lg-2 my-auto px-1 position-relative">\n' +
                                '                                                                <div class="position-relative matchduration">\n' +
                                '                                                                    <img class="img-md img-circled full-width" src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/' + data.matchViewList[i][j].champFullImg + '">\n' +
                                '                                                                    <span class="gg-matchlist-meta-text gg-matchlist-matchcategory rounded-circle">'+rankType+'');
                            $('.matchduration').eq(i).append('<span class="d-block text-sm">'+min+':'+sec+'');
                            $('.myMatchInfo>div:eq(1)').eq(i).append('<div class="col-12 text-left d-flex align-items-center pl-2">').append('<span class="badge badge-default">');
                            $('.itq').eq(i).append(' <div class="col-2 col-lg-1 d-flex justify-content-center justify-content-lg-start px-0 my-auto">\n' +
                                '                                                                <div class="col-xs-12 gg-padding-1px spellImg">');
                            $('.spellimg').eq(i).append(' <img class="d-block img-xs rounded" alt="img"\n' +
                                '                                                                         src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/spell/' + data.matchViewList[i][j].spell1Id + '.png">\n' +
                                '\n' +
                                '                                                                    <img class="d-block img-xs rounded" alt="img"\n' +
                                '                                                                         src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/spell/' + data.matchViewList[i][j].spell2Id + '.png">');
                            $('.itq').eq(i).append(' <div class="col-2 col-lg-1 d-flex justify-content-center justify-content-lg-start px-0 my-auto">\n' +
                                '                                                                <div class="col-xs-12 gg-padding-1px perkImg">');
                            $('.perkImg').eq(i).append(' <img class="rune d-block img-xs rounded" alt="img"\n' +
                                '                                                                         src="https://opgg-static.akamaized.net/images/lol/perk/' + data.matchViewList[i][j].perk0 + '.png">\n' +
                                '\n' +
                                '                                                                    <img class="rune d-block img-xs rounded" alt="img"\n' +
                                '                                                                         src="https://opgg-static.akamaized.net/images/lol/perkStyle/' + data.matchViewList[i][j].perkSubStyle + '.png">');
                            $('.itq').eq(i).append('<div class="col-2 col-lg-2 d-flex flex-column my-auto mykda">');
                            $('.mykda').eq(i).append('<span class="gg-important-number gg-text-negative">' + ((data.matchViewList[i][j].kills + data.matchViewList[i][j].assists) / data.matchViewList[i][j].deaths).toFixed(1)).append('<span class="gg-matchlist-sub-description text-truncate">KDA');
                            $('.itq').eq(i).append('<div class="col-lg-2 d-lg-flex flex-column my-auto d-none myCS">');
                            $('.myCS').eq(i).append('<span><img src="${pageContext.request.contextPath}/resources/Images/ranked-emblems/GRANDMASTER.png" class="gg-img-25x25 pr-1"></span>').append('<span>' + data.matchViewList[i][j].totalMinionKilled + '').append('<span class="gg-sub-description">분당 CS');
                            $('.itq').eq(i).append('<div class="col-4 col-lg-3 d-flex py-0 my-auto justify-content-lg-start justify-content-center myItem">');
                            $('.myItem').eq(i).append('<div>\n' +
                                '     <img class="d-block img-xs rounded" src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/item/' + data.matchViewList[i][j].item0 + '.png">\n' +
                                '     <img class="d-block img-xs rounded" src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/item/' + data.matchViewList[i][j].item1 + '.png">');
                            $('.myItem').eq(i).append('<div>\n' +
                                '     <img class="d-block img-xs rounded" src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/item/' + data.matchViewList[i][j].item2 + '.png">\n' +
                                '     <img class="d-block img-xs rounded" src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/item/' + data.matchViewList[i][j].item3 + '.png">');
                            $('.myItem').eq(i).append('<div>\n' +
                                '     <img class="d-block img-xs rounded" src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/item/' + data.matchViewList[i][j].item4 + '.png">\n' +
                                '     <img class="d-block img-xs rounded" src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/item/' + data.matchViewList[i][j].item5 + '.png">');
                            $('.itq').eq(i).append('<div class="row no-gutters pt-1">\n' +
                                '                                                            <div class="col-12 text-left d-flex align-items-center pl-2">\n' +
                                '                                                                <span class="badge badge-default"></span>\n' +
                                '                                                            </div>\n' +
                                '                                                        </div>');
                            // ======= 팀 정보
                            $('.gg-matchlist').eq(i).append('<div class="teamArea col-md-4 d-none d-lg-flex align-items-center gg-matchlist-' + data.matchViewList[i][j].win + '">');
                            $('.teamArea').eq(i).append('<div class="row no-gutters w-100">\n' +
                                '                                            <div class="col-11">\n' +
                                '                                                <div class="teamMember row no-gutters">');
                            $('.teamMember').eq(i).append('<div class="col-6 team1">').append('<div class="col-6 team2">');
                            for (var m = 0; m < 5; m++) {
                                $('.team1').eq(i).append('<div class="of-ellipsis text-left pl-1 gg-matchlist-item gg-border-' + data.matchViewList[i][m].win + '">\n' +
                                    '                                                                <img class="img-xs img-circled gg-img-18x18"\n' +
                                    '                                                                     src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/' + data.matchViewList[i][m].champFullImg + '" >\n' +
                                    '                                                                <a class="text-secondary" href="${pageContext.request.contextPath}/search/SummonerSearch.do?summonerName=' + data.matchViewList[i][m].summonerName + '">\n' +
                                    '                                                                    <span class="gg-text-soso">' + data.matchViewList[i][m].summonerName + '</span>\n' +
                                    '                                                                </a>\n' +
                                    '                                                            </div>');
                            }
                            for (var m = 5; m < 10; m++) {
                                $('.team2').eq(i).append('<div class="of-ellipsis text-left pl-1 gg-matchlist-item gg-border-' + data.matchViewList[i][m].win + '">\n' +
                                    '                                                                <img class="img-xs img-circled gg-img-18x18"\n' +
                                    '                                                                     src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/' + data.matchViewList[i][m].champFullImg + '" >\n' +
                                    '                                                                <a class="text-secondary" href="${pageContext.request.contextPath}/search/SummonerSearch.do?summonerName=' + data.matchViewList[i][m].summonerName + '">\n' +
                                    '                                                                    <span class="gg-text-soso">' + data.matchViewList[i][m].summonerName + '</span>\n' +
                                    '                                                                </a>\n' +
                                    '                                                            </div>');
                            }
                        }
                    }
                }
                $('img[src*="item/0.png"]').attr('src', '${pageContext.request.contextPath}/resources/Images/none.png');
            }, error: function (e) {
                console.log("ajax 처리 실패");
            },
            beforeSend: function () {
                $('.wrap-loading').removeClass('display-none');
            }
            , complete: function () {
                $('.wrap-loading').addClass('display-none');
            }, timeout:100000
        });
    }
</script>
<%--불러오기--%>
<script>
    $(function () {
        var $cPage = $('#cPage');
        var $partyTier = $('#partyTier');
        var $partyPosition = $('#partyPosition');
        var $partyContent = $('#partyContent');
        var $partyWriter = $('#partyWriter');
        var $tierInfo = $('#tierInfo');
        $.ajax({
            url: "${pageContext.request.contextPath}/search/MatchSearch.do",
            data: {summonerName: '${summoner.name}',
                cPage : $cPage.val(),
                tierInfo : $tierInfo.val()},
            type: "POST",
            dataType: "json",
            success: function (data) {
                console.log(data);
                $partyTier.empty();
                $partyPosition.empty();
                $partyContent.empty();
                $partyWriter.empty();
                if (data.partyBoard != null){
                    $partyTier.text(data.partyBoard.pbRanktype +" "+ data.partyBoard.pbTier);
                    $partyPosition.text(data.partyBoard.pbPosition);
                    $partyContent.text(data.partyBoard.pbContent);
                    $partyWriter.text(data.partyBoard.pbUser);
                }else {
                    $partyContent.text('조건에 맞는 게시글이 없습니다.');
                }
                var name = $('#summonerName').val();
                if (data.matchViewList.length == 0) {
                    alert('데이터가 없습니다. 업데이트를 실행하세요.');
                }
                $cPage.val(data.cPage);
                for (var i = 0; i < data.matchViewList.length; i++) {
                    $('#matchAllArea').append('<div class="tab-pane active">');
                    $('#matchAllArea>div').eq(i).append('<div class="Normal gg-thin-line">').append('<div id="matchListAllArea" class="row no-gutters gg-action gg-matchlist FreeRank">');
                    for (var j = 0; j < 10; j++) {
                        if (data.matchViewList[i][j].summonerName == name) {
                            // ===== 승패 포지션
                            $('.gg-matchlist').eq(i).append('<div id="myStatView" class="col-md-8 d-flex flex-column justify-content-between gg-matchlist-' + data.matchViewList[i][j].win + '">\n' +
                                '                                                <div class="row no-gutters myMatchInfoArea">');
                            $('.myMatchInfoArea').eq(i).append('<div class="col-2 position d-flex flex-column gg-bg-' + data.matchViewList[i][j].win + ' text-white">');
                            $('.position').eq(i).append('<div class="d-flex flex-column my-auto justify-content-center py-2 durationtime">');
                            var time = data.matchViewList[i][j].gameCreation;
                            console.log(time);
                            var date = new Date();
                            date.setTime(time);
                            dateString = date.getMonth()+ 1 + "/" + date.getDate();
                            $('.durationtime').eq(i).append('<span class="gg-matchlist-meta-text">'+ dateString +'');
                            $('.durationtime').eq(i).append('<div class="d-block"><img class="py-1 gg-img-25x25" src="${pageContext.request.contextPath}/resources/Images/position/' + data.matchViewList[i][j].position + '.svg">');
                            if (data.matchViewList[i][j].win == true) {
                                $('.position').eq(i).append('<div class="d-flex justify-content-center py-lg-2 py-1">승리');
                            } else if (data.matchViewList[i][j].win == false) {
                                $('.position').eq(i).append('<div class="d-flex justify-content-center py-lg-2 py-1">패배');
                            }
                            // ======= 내 정보
                            var gameType = data.matchViewList[i][j].queueName.substr(0,1);
                            var gameDuration = data.matchViewList[i][j].gameDuration;
                            var min = parseInt((gameDuration%3600)/60);
                            var sec = gameDuration%60;
                            if (min.toString().length==1) min = "0" + min;
                            if (sec.toString().length==1) sec = "0" + sec;
                            $('.myMatchInfoArea').eq(i).append('<div class="col-10 myMatchInfo" >');
                            $('.myMatchInfo').eq(i).append(' <div class="row no-gutters px-2 pt-2 itq ">');
                            $('.myMatchInfo').eq(i).append(' <div class="row no-gutters pt-1">');
                            $('.itq').eq(i).append('<div class="col-2 col-lg-2 my-auto px-1 position-relative">\n' +
                                ' <div class="position-relative matchduration">\n' +
                                ' <img class="img-md img-circled full-width" src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/' + data.matchViewList[i][j].champFullImg + '">\n' +
                                ' <span class="gg-matchlist-meta-text gg-matchlist-matchcategory rounded-circle">'+gameType+'');
                            $('.matchduration').eq(i).append('<span class="d-block text-sm">'+min+':'+sec+'');
                            $('.myMatchInfo>div:eq(1)').eq(i).append('<div class="col-12 text-left d-flex align-items-center pl-2">').append('<span class="badge badge-default">');
                            $('.itq').eq(i).append(' <div class="col-2 col-lg-1 d-flex justify-content-center justify-content-lg-start px-0 my-auto">\n' +
                                '  <div class="col-xs-12 gg-padding-1px spellImg">');
                            $('.spellimg').eq(i).append(' <img class="d-block img-xs rounded" alt="img"\n' +
                                '  src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/spell/' + data.matchViewList[i][j].spell1Id + '.png">\n' +
                                '\n' +
                                '  <img class="d-block img-xs rounded" alt="img"\n' +
                                '  src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/spell/' + data.matchViewList[i][j].spell2Id + '.png">');
                            $('.itq').eq(i).append(' <div class="col-2 col-lg-1 d-flex justify-content-center justify-content-lg-start px-0 my-auto">\n' +
                                '  <div class="col-xs-12 gg-padding-1px perkImg">');
                            $('.perkImg').eq(i).append(' <img class="rune d-block img-xs rounded" alt="img"\n' +
                                '  src="https://opgg-static.akamaized.net/images/lol/perk/' + data.matchViewList[i][j].perk0 + '.png">\n' +
                                '\n' +
                                '  <img class="rune d-block img-xs rounded" alt="img"\n' +
                                '  src="https://opgg-static.akamaized.net/images/lol/perkStyle/' + data.matchViewList[i][j].perkSubStyle + '.png">');
                            $('.itq').eq(i).append('<div class="col-2 col-lg-2 d-flex flex-column my-auto mykda">');
                            $('.mykda').eq(i).append('<span class="gg-important-number gg-text-negative">' + ((data.matchViewList[i][j].kills + data.matchViewList[i][j].assists) / data.matchViewList[i][j].deaths).toFixed(1)).append('<span class="gg-matchlist-sub-description text-truncate">KDA');
                            $('.itq').eq(i).append('<div class="col-lg-2 d-lg-flex flex-column my-auto d-none myCS">');
                            $('.myCS').eq(i).append('<span><img src="${pageContext.request.contextPath}/resources/Images/ranked-emblems/GRANDMASTER.png" class="gg-img-25x25 pr-1"></span>').append('<span>' + data.matchViewList[i][j].totalMinionKilled + '').append('<span class="gg-sub-description">분당 CS');
                            $('.itq').eq(i).append('<div class="col-4 col-lg-3 d-flex py-0 my-auto justify-content-lg-start justify-content-center myItem">');
                            $('.myItem').eq(i).append('<div>\n' +
                                '     <img class="d-block img-xs rounded" src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/item/' + data.matchViewList[i][j].item0 + '.png">\n' +
                                '     <img class="d-block img-xs rounded" src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/item/' + data.matchViewList[i][j].item1 + '.png">');
                            $('.myItem').eq(i).append('<div>\n' +
                                '     <img class="d-block img-xs rounded" src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/item/' + data.matchViewList[i][j].item2 + '.png">\n' +
                                '     <img class="d-block img-xs rounded" src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/item/' + data.matchViewList[i][j].item3 + '.png">');
                            $('.myItem').eq(i).append('<div>\n' +
                                '     <img class="d-block img-xs rounded" src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/item/' + data.matchViewList[i][j].item4 + '.png">\n' +
                                '     <img class="d-block img-xs rounded" src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/item/' + data.matchViewList[i][j].item5 + '.png">');
                            // $('.itq').eq(i).append('<div class="col-2 d-flex px-0 flex-column justify-content-center teamBalance">');
                            // $('.teamBalance').eq(i).append('<span class="gg-important-text gg-text-soso">보통').append('<span class="gg-matchlist-sub-description gg-text-break">팀운');
                            $('.itq').eq(i).append('<div class="row no-gutters pt-1">\n' +
                                '  <div class="col-12 text-left d-flex align-items-center pl-2">\n' +
                                '  <span class="badge badge-default"></span>\n' +
                                '  </div>\n' +
                                '  </div>');
                            // ======= 팀 정보
                            $('.gg-matchlist').eq(i).append('<div class="teamArea col-md-4 d-none d-lg-flex align-items-center gg-matchlist-' + data.matchViewList[i][j].win + '">');
                            $('.teamArea').eq(i).append('<div class="row no-gutters w-100">\n' +
                                '  <div class="col-11">\n' +
                                '  <div class="teamMember row no-gutters">');
                            $('.teamMember').eq(i).append('<div class="col-6 team1">').append('<div class="col-6 team2">');
                            for (var m = 0; m < 5; m++) {
                                $('.team1').eq(i).append('<div class="of-ellipsis text-left pl-1 gg-matchlist-item gg-border-' + data.matchViewList[i][m].win + '">\n' +
                                    '                                                                <img class="img-xs img-circled gg-img-18x18"\n' +
                                    '                                                                     src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/' + data.matchViewList[i][m].champFullImg + '" >\n' +
                                    '                                                                <a class="text-secondary" href="${pageContext.request.contextPath}/search/SummonerSearch.do?summonerName=' + data.matchViewList[i][m].summonerName + '">\n' +
                                    '                                                                    <span class="gg-text-soso">' + data.matchViewList[i][m].summonerName + '</span>\n' +
                                    '                                                                </a>\n' +
                                    '                                                            </div>');
                            }
                            for (var m = 5; m < 10; m++) {
                                $('.team2').eq(i).append('<div class="of-ellipsis text-left pl-1 gg-matchlist-item gg-border-' + data.matchViewList[i][m].win + '">\n' +
                                    '                                                                <img class="img-xs img-circled gg-img-18x18"\n' +
                                    '                                                                     src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/' + data.matchViewList[i][m].champFullImg + '" >\n' +
                                    '                                                                <a class="text-secondary" href="${pageContext.request.contextPath}/search/SummonerSearch.do?summonerName=' + data.matchViewList[i][m].summonerName + '">\n' +
                                    '                                                                    <span class="gg-text-soso">' + data.matchViewList[i][m].summonerName + '</span>\n' +
                                    '                                                                </a>\n' +
                                    '                                                            </div>');
                            }
                        }
                    }
                }
                $('img[src*="item/0.png"]').attr('src', '${pageContext.request.contextPath}/resources/Images/none.png');
            }, error: function (e) {
                console.log("ajax 처리 실패");
            },
            beforeSend: function () {
                $('.wrap-loading').removeClass('display-none');
            }
            , complete: function () {
                $('.wrap-loading').addClass('display-none');
            }, timeout:100000
        });
    })
</script>

<div class="wrap-loading display-none">
    <div><img src="${pageContext.request.contextPath}/resources/Images/ajaxCall.gif" /></div>
</div>

</body>
</html>