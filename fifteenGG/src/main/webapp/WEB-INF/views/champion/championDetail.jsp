
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챔피언 공략 상세보기</title>
<c:import url="../common/commonUtil.jsp"/>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css" />
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<style>
input[type=submit]{

 background-color: #0693cd;
  border: 0;
  border-radius: 5px;
  cursor: pointer;
  color: #fff;
  font-size:16px;
  font-weight: bold;
  line-height: 1.4;
  padding: 10px;
  width: 160px
}


#tbl-board>tr:nth-child(n+2):hover{
	color: #ccc;
	cursor: pointer;
	opacity: 0.8;
}

#tipfont1{

    font-size: 30px;
    font-weight: bold;
    position: relative;
    top: 0px;
    left: -110px;
    text-decoration: underline;
    
}

#tipfont{

    font-size: 30px;
    font-weight: bold;
    position: relative;
    top: -5px;
    left: 30px;
    text-decoration: underline;
    
}
.modal{
background:rgba(0, 0, 0, 0.5);
}

</style>

</head>
<body style="background:#f4f4f4; !important;
	max-width: 1200px;
    font-weight: normal;
    margin:0 auto;">
<c:import url="../common/navbar.jsp"/>


<!-- 챔피언 상단 정보 -->
	<div class="l-champion-statistics">
		<div class="l-champion-statistics-header">
			<div class="champion-stats-header">
				<ul class="champion-stats-position">
					<li
						class="champion-stats-header__position champion-stats-header__position--active"
						><a href="#"> <img
							src="//opgg-static.akamaized.net/images/site/champion/position-jun-none@2x.png"
							class="champion-stats-header__position__image champion-stats-header__position__image--deactive">
							<span class="champion-stats-header__position__role">${champion.tags}</span>
					</a></li>
				</ul>

				<div
					class="champion-stats-header-info champion-stats-header-info--tier-3">
					<div class="champion-stats-header-info__image">
						<img
							src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${champion.image.full}">
						<i></i>
					</div>
					<h1 class="champion-stats-header-info__name"
						style="font-weight: bolder;">${champion.name}</h1>

					<div class="champion-stats-header-info__tier">
						챔피언 티어: <b>당신의 손에 달려있습니다.</b>
					</div>
					<div class="champion-stats-header-info__skill">
						<div class="champion-stat__skill tip"
							title="${champion.passive.description()}">

							<img
								src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/passive/${champion.passive.image.full}">
						</div>
						<div class="champion-stat__skill tip"
							title="${champion.spells.get(0).description }">

							<img
								src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/spell/${champion.spells.get(0).image.full}">
							<span class="key">Q</span>
						</div>
						<div class="champion-stat__skill tip"
							title="${champion.spells.get(1).description }">
							<img
								src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/spell/${champion.spells.get(1).image.full}">
							<span class="key">W</span>
						</div>
						<div class="champion-stat__skill tip"
							title="${champion.spells.get(2).description }">

							<img
								src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/spell/${champion.spells.get(2).image.full}">
							<span class="key">E</span>
						</div>
						<div class="champion-stat__skill tip"
							title="${champion.spells.get(3).description }">

							<img
								src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/spell/${champion.spells.get(3).image.full}">
							<span class="key">R</span>
						</div>
					</div>
				</div>
			</div>
				<!-- 챔피언 상단부분 끝 -->



				

				<div class="champion-stats-header-matchup tabWrap">
					
				</div>
			</div>
		</div>
		



		<!-- 메뉴바 -->
		<div class="champion-stats-menu">
			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				<li class="nav-home"><a class="nav-link active"
					id="pills-home-tab" data-toggle="pill" href="#pills-home"
					role="tab" aria-controls="pills-home" aria-selected="true">종합</a></li>
			
				<li class="nav-trend"><a class="nav-link"
					id="pills-contact-tab" data-toggle="pill" href="#pills-contact"
					role="tab" aria-controls="pills-contact" aria-selected="false">트렌드 그래프</a>
				</li>
				
				<li class="nav-tip"><a class="nav-link" id="pills-contact-tab"
					data-toggle="pill" href="#pills-contact2" role="tab"
					aria-controls="pills-contact" aria-selected="false"
					onclick="tipList();">팁게시판</a></li>
			</ul>
			<!-- 메뉴바 -->

			<!-- 이 부분은 메뉴바 전체 Start -->
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active" id="pills-home"
					role="tabpanel" aria-labelledby="pills-home-tab">

				<!-- 스펠부분 -->
					<div class="l-champion-statistics-content">
						<div class="l-champion-statistics-content__main">
							<table
								class="champion-overview__table champion-overview__table--summonerspell">
								<colgroup>
									<col>
									<col width="86">
									<col width="86">
									<col width="58">
								</colgroup>
								<thead>
									<tr>
										<th class="champion-overview__header">
											<h2>추천 소환사 주문</h2>
										</th>


										<th class="champion-overview__header">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>픽률</span>
										</th>
										<th class="champion-overview__header">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>승률</span>
										</th>
										<th class="champion-overview__header"></th>
									</tr>
								</thead>
								
								<c:forEach items="${spellList }" var="spellList">
									<tbody>
										<tr>
											<td class="champion-overview__data">
												<ul class="champion-stats__list">
													<li class="champion-stats__list__item"><img
														src="http://ddragon.leagueoflegends.com/cdn/10.1.1/img/spell/${spellList.spell2 }.png"
														class="tip"></li>
													<li class="champion-stats__list__arrow"></li>
													<li class="champion-stats__list__item"><img
														src="http://ddragon.leagueoflegends.com/cdn/10.1.1/img/spell/${spellList.spell1 }.png"
														class="tip"></li>

												</ul>
											</td>
											<td
												class="champion-overview__stats champion-overview__stats--pick champion-overview__border">
												<strong>${spellList.pickRate }%</strong>

											</td>
											<td
												class="champion-overview__stats champion-overview__stats--pick champion-overview__border">
												<strong>${spellList.odds }%</strong>
											</td>
											<td
												class="champion-overview__stats champion-overview__stats--pick champion-overview__border"></td>
										</tr>
										<tr>


											<td></td>
										</tr>
									</tbody>
								</c:forEach>
								</table>
							<table class="champion-overview__table">
								<colgroup>
									<col width="102">
									<col>
									<col width="86">
									<col width="86">
									<col width="58">
								</colgroup>
								<thead>
									<tr>
										<th class="champion-overview__header" colspan="2">

											<h2>추천 아이템 빌드</h2>
										</th>
										<th class="champion-overview__header">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</th>
										<th class="champion-overview__header">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</th>
										<th class="champion-overview__header"><a href=""> <img
												src="https://img.icons8.com/nolan/30/info.png" alt="더보기"></a>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr
										class="champion-overview__row champion-overview__row--first">
										<th class="champion-overview__sub-header" rowspan="2">시작아이템
											</th>
										<td
											class="champion-overview__data champion-overview__border champion-overview__border--first">
											<ul class="champion-stats__list">
												<li class="champion-stats__list__item tip"
													>
													<img
													src="//opgg-static.akamaized.net/images/lol/item/${startList.get(0).ITEM0 }.png?image=q_auto,w_42&amp;v=1576566284">
												</li>
												<li class="champion-stats__list__arrow"></li>
												<li class="champion-stats__list__item tip"
													>
													<img
													src="//opgg-static.akamaized.net/images/lol/item/${startList.get(1).ITEM0 }.png?image=q_auto,w_42&amp;v=1576566284">
												</li>
												<li class="champion-stats__list__arrow"></li>
												<li class="champion-stats__list__item tip"
													>
													<img
													src="//opgg-static.akamaized.net/images/lol/item/${startList.get(2).ITEM0 }.png?image=q_auto,w_42&amp;v=1576566284">
												</li>
												
											</ul>
										</td>
										<td
											class="champion-overview__stats champion-overview__stats--pick champion-overview__border">
											
										</td>
										<td
											class="champion-overview__stats champion-overview__stats--win champion-overview__border">
											
										</td>
										<td
											class="champion-overview__border champion-overview__border--last"></td>
									<tr class="champion-overview__row ">


									</tr>
									
									
									
									
									<tr
										class="champion-overview__row champion-overview__row--first">
										<th class="champion-overview__sub-header" rowspan="2">핵심 아이템
											</th>
										<td
											class="champion-overview__data champion-overview__border champion-overview__border--first">
											<ul class="champion-stats__list">
												<li class="champion-stats__list__item tip"
													>
													<img
													src="//opgg-static.akamaized.net/images/lol/item/${itemList.get(0).ITEM0 }.png?image=q_auto,w_42&amp;v=1576566284">
												</li>
												<li class="champion-stats__list__arrow"></li>
												<li class="champion-stats__list__item tip"
													>
													<img
													src="//opgg-static.akamaized.net/images/lol/item/${itemList.get(1).ITEM0 }.png?image=q_auto,w_42&amp;v=1576566284">
												</li>
												<li class="champion-stats__list__arrow"></li>
												<li class="champion-stats__list__item tip"
													>
													<img
													src="//opgg-static.akamaized.net/images/lol/item/${itemList.get(2).ITEM0 }.png?image=q_auto,w_42&amp;v=1576566284">
												</li>
												
											</ul>
										</td>
										<td
											class="champion-overview__stats champion-overview__stats--pick champion-overview__border">
											
										</td>
										<td
											class="champion-overview__stats champion-overview__stats--win champion-overview__border">
											
										</td>
										<td
											class="champion-overview__border champion-overview__border--last"></td>
									<tr class="champion-overview__row ">


									</tr>
									<tr
										class="champion-overview__row champion-overview__row--first">
										<th class="champion-overview__sub-header" rowspan="5">최종 아이템
											</th>
										<td
											class="champion-overview__data champion-overview__border champion-overview__border--first">
											<ul class="champion-stats__list">
													<li class="champion-stats__list__item tip"
													>
													<img
													src="//opgg-static.akamaized.net/images/lol/item/${itemList.get(0).ITEM0 }.png?image=q_auto,w_42&amp;v=1576566284">
												</li>
												<li class="champion-stats__list__arrow"></li>
												<li class="champion-stats__list__item tip"
													>
													<img
													src="//opgg-static.akamaized.net/images/lol/item/${itemList.get(1).ITEM0 }.png?image=q_auto,w_42&amp;v=1576566284">
												</li>
												<li class="champion-stats__list__arrow"></li>
												<li class="champion-stats__list__item tip"
													>
													<img
													src="//opgg-static.akamaized.net/images/lol/item/${itemList.get(2).ITEM0 }.png?image=q_auto,w_42&amp;v=1576566284">
												</li>
												<li class="champion-stats__list__arrow"></li>
												<li class="champion-stats__list__item tip"
													>
													<img
													src="//opgg-static.akamaized.net/images/lol/item/${itemList.get(3).ITEM0 }.png?image=q_auto,w_42&amp;v=1576566284">
												</li>
												<li class="champion-stats__list__arrow"></li>
												<li class="champion-stats__list__item tip"
													>
													<img
													src="//opgg-static.akamaized.net/images/lol/item/${itemList.get(4).ITEM0 }.png?image=q_auto,w_42&amp;v=1576566284">
												</li>
												<li class="champion-stats__list__arrow"></li>
												<li class="champion-stats__list__item tip"
													>
													<img
													src="//opgg-static.akamaized.net/images/lol/item/${itemList.get(5).ITEM0 }.png?image=q_auto,w_42&amp;v=1576566284">
												</li>
											</ul>
											
										</td>
										<td
											class="champion-overview__stats champion-overview__stats--pick champion-overview__border">
											
										</td>
										<td
											class="champion-overview__stats champion-overview__stats--win champion-overview__border">
											
										</td>
										<td
											class="champion-overview__border champion-overview__border--last"></td>
									</tr>
									<tr class="champion-overview__row ">

									</tr>
									<tr class="champion-overview__row ">

									</tr>
									<tr class="champion-overview__row ">

									</tr>
									<tr class="champion-overview__row ">

									</tr>
									<tr
										class="champion-overview__row champion-overview__row--first">
										<th class="champion-overview__sub-header" rowspan="3">신발</th>
										<td
											class="champion-overview__data champion-overview__border champion-overview__border--first">
											<ul class="champion-stats__list">
												<li class="champion-stats__list__item tip">
													<img
													src="//opgg-static.akamaized.net/images/lol/item/${shoesList.get(0).ITEM0 }.png?image=q_auto,w_42&amp;v=1576566284">
												</li>
												<li class="champion-stats__list__arrow"><img
													src="//opgg-static.akamaized.net/images/site/champion/blet.png"
													alt=""></li>
												<li class="champion-stats__list__item tip">
													<img
													src="//opgg-static.akamaized.net/images/lol/item/${shoesList.get(1).ITEM0 }.png?image=q_auto,w_42&amp;v=1576566284">
												</li>
												<li class="champion-stats__list__arrow"><img
													src="//opgg-static.akamaized.net/images/site/champion/blet.png"
													alt=""></li>
												<li class="champion-stats__list__item tip">
													<img
													src="//opgg-static.akamaized.net/images/lol/item/${shoesList.get(2).ITEM0 }.png?image=q_auto,w_42&amp;v=1576566284">
												</li>
											</ul>
										</td>
										<td
											class="champion-overview__stats champion-overview__stats--pick champion-overview__border">
											
										</td>
										<td
											class="champion-overview__stats champion-overview__stats--win champion-overview__border">
											
										</td>
										<td
											class="champion-overview__border champion-overview__border--last"></td>
									</tr>
									<tr class="champion-overview__row ">

									</tr>
									<tr class="champion-overview__row ">

									</tr>
								</tbody>
							</table>


							<div class="tabWrap">
								<table
									class="champion-overview__table champion-overview__table--rune tabItems">
									<colgroup>
										<col>
										<col width="100">
									</colgroup>
<!------------------------------------- 룬 시작 ------------------------------------------------>
									<thead>
										<tr>
											<th class="champion-overview__header" colspan="3">
												<h2>룬</h2>
											</th>
											<th class="champion-overview__header"><a href=""> <img
													src="https://img.icons8.com/nolan/30/info.png" alt="더보기"
													style="position: relative; left: 15px;"></a></th>
											<th
												class="champion-overview__header champion-overview__header-icon">

											</th>
										</tr>
								
									</thead>
									
									
									
									<tbody class="tabItem ChampionKeystoneRune-1">
										<tr>
											<td class="champion-overview__data">
												<div class="perk-page-wrap" id="RunePerk0" >
													
													<!-- MainPerk -->
													
													
													
													<!-- 정밀 -->
													<c:if test="${RunList.get(0).perkPrimaryStyle eq 8000}">
													
													<div class="perk-page">
														<div class="perk-page__row">
															<div class="perk-page__item perk-page__item--mark perk-page__item--active">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8000.png?image=q_auto&amp;v=1576566284"
																	class="perk-page__image tip"
																	title="&lt;b style=&#039;color: #ffc659&#039;&gt;정밀&lt;/b&gt;&lt;br&gt;&lt;span&gt;공격 강화 및 지속적 피해&lt;/span&gt;">
															</div>
														</div>
														<div class="perk-page__row">
															<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8005.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;집중 공격&lt;/b&gt;&lt;br&gt;&lt;span&gt;적 챔피언에게 연속으로 3회 기본 공격을 가하면 레벨에 따라 40 ~ 180의 추가 &lt;lol-uikit-tooltipped-keyword key=&#039;LinkTooltip_Description_AdaptiveDmg&#039;&gt;&lt;font color=&#039;#48C4B7&#039;&gt;적응형 피해&lt;/font&gt;&lt;/lol-uikit-tooltipped-keyword&gt;를 입히고 적의 약점을 노출시킵니다. 약점이 노출된 적은 6초 동안 모든 상대에게서 8 ~ 12%의 추가 피해를 받습니다.&lt;/span&gt;"
																		alt="집중 공격">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8008.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;치명적 속도&lt;/b&gt;&lt;br&gt;&lt;span&gt;적 챔피언에게 피해를 주고 1.5초 후, 3초 동안 레벨에 따라 공격 속도가 40~110% 증가합니다. 적 챔피언을 공격하면 효과 지속시간이 6초까지 증가합니다.&lt;br&gt;&lt;br&gt;재사용 대기시간: 6초&lt;br&gt;&lt;br&gt;치명적 속도 상태에서는 일시적으로 최고 공격 속도 제한을 초과할 수 있습니다.&lt;/span&gt;"
																		alt="치명적 속도">
																</div>
															</div>
															<div
																class="perk-page__item perk-page__item--keystone perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8021.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;기민한 발놀림&lt;/b&gt;&lt;br&gt;&lt;span&gt;공격 또는 이동 시 충전 중첩이 쌓입니다. 중첩이 100회 쌓이면 충전 상태로 다음 공격을 할 수 있습니다.&lt;br&gt;&lt;br&gt;충전 상태로 공격 시 3~60(+추가 공격력의 0.3, +주문력의 0.3)에 해당하는 체력이 회복되며 1초 동안 이동 속도가 20% 증가합니다.&lt;br&gt;&lt;br&gt;원거리 챔피언의 경우 미니언으로부터 받는 회복 효과가 20%만 적용됩니다.&lt;/span&gt;"
																		alt="기민한 발놀림">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8010.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;정복자&lt;/b&gt;&lt;br&gt;&lt;span&gt;적 챔피언에게 기본 공격 또는 스킬로 피해를 입히면 6초 동안 정복자 중첩을 2만큼 얻어 중첩마다 2~5의 &lt;lol-uikit-tooltipped-keyword key=&#039;LinkTooltip_Description_Adaptive&#039;&gt;&lt;font color=&#039;#48C4B7&#039;&gt;적응형 능력치&lt;/font&gt;&lt;/lol-uikit-tooltipped-keyword&gt;를 얻습니다. 최대 10회까지 중첩됩니다. 원거리 챔피언은 기본 공격으로 중첩을 1만 획득할 수 있습니다.&lt;br&gt;&lt;br&gt;최대로 중첩되면 챔피언에게 입힌 피해량의 15%만큼 체력을 회복합니다. (원거리 챔피언은 8%)&lt;/span&gt;"
																		alt="정복자">
																</div>
															</div>
														</div>
														<div class="perk-page__row">
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/9101.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;과다치유&lt;/b&gt;&lt;br&gt;&lt;span&gt;자신에 대한 체력 회복 초과분이 보호막으로 전환됩니다. 보호막은 10&lt;scaleHealth&gt;(+최대 체력의 10%)&lt;/scaleHealth&gt;에 해당하는 피해까지 흡수할 수 있습니다.&lt;br&gt;&lt;br&gt;보호막 전환율은 자신 또는 아군으로부터의 체력 회복 초과분의 20~100%입니다.&lt;/span&gt;"
																		alt="과다치유">
																</div>
															</div>
															<div class="perk-page__item  perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/9111.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;승전보&lt;/b&gt;&lt;br&gt;&lt;span&gt;챔피언 처치 또는 어시스트 시 잃은 체력의 12%를 회복하며 추가로 20골드를 획득합니다. &lt;br&gt;&lt;br&gt;&lt;hr&gt;&lt;br&gt;&lt;i&gt;&#039;가장 위험한 게임을 하는 자만이 진정 승리의 환희를 맛보았다고 말할 수 있다.&#039; &lt;br&gt;—녹서스 검투사&lt;/i&gt;&lt;/span&gt;"
																		alt="승전보">
																</div>
															</div>
															<div class="perk-page__item  perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8009.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;침착&lt;/b&gt;&lt;br&gt;&lt;span&gt;처치 관여 시 최대 마나 또는 기력의 20%를 회복하고 최대 마나를 100(최대 500)만큼, 최대 기력을 10(최대 50)만큼 증가시킵니다. &lt;/span&gt;"
																		alt="침착">
																</div>
															</div>
														</div>
														<div class="perk-page__row">
															<div class="perk-page__item  perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/9104.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;전설: 민첩함&lt;/b&gt;&lt;br&gt;&lt;span&gt;공격 속도가 3% 증가하며 &lt;i&gt;전설&lt;/i&gt; 중첩당 1.5%의 공격 속도가 추가로 증가합니다. (&lt;statGood&gt;최대 전설 중첩 횟수: 10&lt;/statGood&gt;)&lt;br&gt;&lt;br&gt;챔피언 처치 관여, 에픽 몬스터 처치 관여, 대형 몬스터 처치, 미니언 처치 시마다 &lt;i&gt;전설&lt;/i&gt; 중첩을 얻습니다.&lt;/span&gt;"
																		alt="전설: 민첩함">
																</div>
															</div>
															<div class="perk-page__item  perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/9105.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;전설: 강인함&lt;/b&gt;&lt;br&gt;&lt;span&gt;강인함이 5% 증가하며 &lt;i&gt;전설&lt;/i&gt; 중첩당 2.5%의 강인함이 추가로 증가합니다. (&lt;statGood&gt;최대 전설 중첩 횟수: 10&lt;/statGood&gt;)&lt;br&gt;&lt;br&gt;챔피언 처치 관여, 에픽 몬스터 처치 관여, 대형 몬스터 처치, 미니언 처치 시마다 &lt;i&gt;전설&lt;/i&gt; 중첩을 얻습니다.&lt;/span&gt;"
																		alt="전설: 강인함">
																</div>
															</div>
															<div class="perk-page__item  perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/9103.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;전설: 핏빛 길&lt;/b&gt;&lt;br&gt;&lt;span&gt;&lt;i&gt;전설&lt;/i&gt; 중첩당 생명력 흡수가 0.6% 증가합니다. (&lt;statGood&gt;최대 전설 중첩 횟수: 20&lt;/statGood&gt;)&lt;br&gt;&lt;br&gt;챔피언 처치 관여, 에픽 몬스터 처치 관여, 대형 몬스터 처치, 미니언 처치 시마다 &lt;i&gt;전설&lt;/i&gt; 중첩을 얻습니다.&lt;/span&gt;"
																		alt="전설: 핏빛 길">
																</div>
															</div>
														</div>
														<div class="perk-page__row">
															<div class="perk-page__item  perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8014.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;최후의 일격&lt;/b&gt;&lt;br&gt;&lt;span&gt;체력이 40% 이하인 적 챔피언에게 주는 피해량이 8% 증가합니다.&lt;/span&gt;"
																		alt="최후의 일격">
																</div>
															</div>
															<div class="perk-page__item  perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8017.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;체력차 극복&lt;/b&gt;&lt;br&gt;&lt;span&gt;적 챔피언의 최대 체력이 자신보다 많은 정도에 비례해 해당 챔피언에게 5%~15%의 추가 피해를 입힙니다.&lt;br&gt;&lt;br&gt;&lt;rules&gt;추가 피해량은 적의 최대 체력이 10%~100% 더 많을 경우 그에 따라 증가합니다.&lt;/rules&gt;&lt;/span&gt;"
																		alt="체력차 극복">
																</div>
															</div>
															<div class="perk-page__item  perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8299.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;최후의 저항&lt;/b&gt;&lt;br&gt;&lt;span&gt;체력이 60% 이하일 때 적 챔피언 공격 시 5% ~ 11%의 추가 피해를 줍니다. 체력이 30%일 때 최대 피해량에 도달합니다.&lt;/span&gt;"
																		alt="최후의 저항">
																</div>
															</div>
														</div>
													</div>
													
													</c:if>
													
													
													<!-- 지배 -->
													<c:if test="${RunList.get(0).perkPrimaryStyle eq 8100}">
												
													<div class="perk-page">
		<div class="perk-page__row">
			<div class="perk-page__item perk-page__item--mark">
				<img src="//opgg-static.akamaized.net/images/lol/perkStyle/8100.png?image=q_auto&amp;v=1576566284" class="perk-page__image tip tpd-delegation-uid-1" title="">
			</div>
		</div>
								<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8112.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>감전</b><br><span>3초 동안 같은 챔피언에게 <b>개별</b> 공격 또는 스킬을 3회 적중시키면 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_AdaptiveDmg'><font color='#48C4B7'>적응형 피해</font></lol-uikit-tooltipped-keyword>를 입힙니다.<br><br>피해량: 30~180 (+추가 공격력의 0.4, +주문력의 0.25)<br><br>재사용 대기시간: 25~20초<br><br><hr><i>'우리는 그들을 천둥군주라고 부른다. 그들의 번개를 입에 올리는 것은 재앙을 부르는 길이기 때문이다.'</i></span>" alt="감전">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8124.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>포식자</b><br><span>장화에 '<font color='#c60300'>포식자</font>' 사용 효과를 부여합니다.<br><br>전투 중이 아닐 때 1.5초 동안 정신 집중을 한 후 15초 동안 이동 속도가 45% 상승합니다. 공격 또는 스킬로 피해를 가하면 이 효과가 종료되며 60 ~ 180 (+추가 공격력의 <scaleAD>0.4</scaleAD>)(+주문력의 <scaleAP>0.25</scaleAP>)만큼 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_AdaptiveDmg'><font color='#48C4B7'>적응형 피해</font></lol-uikit-tooltipped-keyword>를 줍니다.<br><br>재사용 대기시간: 150 ~ 100초. 게임 시작 시 재사용 대기 상태이며 정신 집중을 방해받으면 50%의 재사용 대기시간이 적용됩니다.</span>" alt="포식자">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8128.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>어둠의 수확</b><br><span>체력이 50%보다 낮은 챔피언에게 피해를 입히면 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_AdaptiveDmg'>적응형 피해</lol-uikit-tooltipped-keyword>를 추가로 입히고 해당 챔피언의 영혼을 수확해 어둠의 수확 효과의 피해량이 영구적으로 5만큼 증가합니다.<br><br>어둠의 수확 피해량: 20~60 (레벨에 비례) (+영혼당 피해량 5) (+추가 공격력의 0.25) (+주문력의 0.15)<br>재사용 대기시간: 45초 (처치 관여 시 1.5초로 초기화)</span>" alt="어둠의 수확">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/9923.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>칼날비</b><br><span>적 챔피언에 대한 3번째 공격까지 공격 속도가 110% 증가합니다.<br><br>2초 안에 다음 공격을 가하지 못하면 효과가 사라집니다.<br><br>재사용 대기시간: 전투에서 벗어나 있을 때 4초<br><br><rules>기본 공격 모션이 취소될 경우 공격 속도 증가 효과가 적용되는 공격 횟수가 1회 늘어납니다.<br>일시적으로 최고 공격 속도 제한을 초과할 수 있습니다.</rules></span>" alt="칼날비">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8126.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>비열한 한 방</b><br><span><b>이동 또는 행동을 방해받은</b> 상태의 챔피언에게 피해를 주면 레벨에 따라 10 ~ 45의 추가 고정 피해를 입힙니다.<br><br>재사용 대기시간: 4초<br><rules>방해 효과 이후 피해를 가할 때 활성화됩니다.</rules></span>" alt="비열한 한 방">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8139.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>피의 맛</b><br><span>적 챔피언에게 피해를 입히면 체력을 회복합니다.<br><br>회복량: 18 ~ 35 (+추가 공격력의 0.2, +주문력의 0.1) (레벨에 비례)<br><br>재사용 대기시간: 20초</span>" alt="피의 맛">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8143.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>돌발 일격</b><br><span>돌진, 도약, 점멸, 순간이동을 사용하거나 은신에서 빠져나온 뒤 적 챔피언에게 피해를 주면 5초 동안 7의 물리 관통력과 6의 마법 관통력을 얻습니다.<br><br>재사용 대기시간: 4초</span>" alt="돌발 일격">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8136.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>좀비 와드</b><br><span>적 와드 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Takedown'>파괴 관여</lol-uikit-tooltipped-keyword> 시 그 자리에 아군 좀비 와드가 생성됩니다.<br><br>좀비 와드가 생성될 때마다 최대 10회까지 중첩되는 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword>으로 추가 공격력 1.2 또는 추가 주문력 2의 효과를 얻습니다. <br><br>좀비 와드를 10개 생성하면 10의 적응형 능력치를 부가적으로 획득합니다.<br><br>좀비 와드는 적이 볼 수 있고 120초 동안 유지되며, 설치 가능 와드 수에 영향을 주지 않습니다.</span>" alt="좀비 와드">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8120.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>유령 포로</b><br><span>자신이 설치한 와드의 지속시간이 끝나면 유령 포로 와드가 남아 60초 동안 시야를 밝힙니다. 적 챔피언이 근처에 오면 유령 포로 와드를 몰아낼 수 있습니다.<br><br>유령 포로 와드가 생성되거나 유령 포로 와드가 적 챔피언을 발견할 때마다 최대 10회까지 중첩되는 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword>으로 추가 공격력 1.2 또는 추가 주문력 2의 효과를 얻습니다. <br><br>10회 중첩되면 10의 적응형 능력치를 부가적으로 획득합니다.</span>" alt="유령 포로">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8138.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>시야 수집</b><br><span>챔피언 처치에 관여하면 감시 중첩을 얻습니다. 감시 중첩 하나당 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword>으로 추가 공격력 1.2 또는 추가 주문력 2의 효과를 얻습니다. <br><br>감시 중첩이 최대치인 10회에 도달하면 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword>으로 추가 공격력 6 또는 추가 주문력 10의 효과를 부가적으로 획득합니다.<br><br>적 챔피언 처치 관여 시마다 감시 중첩 1회를 얻습니다.</span>" alt="시야 수집">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8135.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>굶주린 사냥꾼</b><br><span>스킬로 입힌 피해량의 일부만큼 체력을 회복합니다.<br>체력 회복량: 1.5% + <i>현상금 사냥꾼</i> 중첩 1회당 2.5% <br><br>각 적 챔피언을 처치하는 데 처음으로 관여할 때마다 <i>현상금 사냥꾼</i> 중첩을 얻을 수 있습니다.<br><rules><br>광역 스킬의 경우 체력 회복 효과가 1/3로 감소합니다.</rules></span>" alt="굶주린 사냥꾼">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8134.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>영리한 사냥꾼</b><br><span><b>사용 아이템 재사용 대기시간 감소</b> 효과를 15% + <i>현상금 사냥꾼</i> 중첩 1회당 5%만큼 얻습니다. (장신구 포함)<br><br>각 적 챔피언을 처치하는 데 처음으로 관여할 때마다 <i>현상금 사냥꾼</i> 중첩을 얻을 수 있습니다.</span>" alt="영리한 사냥꾼">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8105.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>끈질긴 사냥꾼</b><br><span><b>전투에서 벗어나 있을 때 이동 속도</b>가 10 + <i>현상금 사냥꾼</i> 중첩 1회당 9만큼 증가합니다.<br><br>각 적 챔피언을 처치하는 데 처음으로 관여할 때마다 <i>현상금 사냥꾼</i> 중첩을 얻을 수 있습니다.</span>" alt="끈질긴 사냥꾼">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8106.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>궁극의 사냥꾼</b><br><span>궁극기에 5%의 <b>재사용 대기시간 감소</b>효과가 적용되고 <i>현상금 사냥꾼</i> 중첩 1회당 4%씩 추가로 감소합니다.<br><br>각 적 챔피언을 처치하는 데 처음으로 관여할 때마다 <i>현상금 사냥꾼</i> 중첩을 얻을 수 있습니다.</span>" alt="궁극의 사냥꾼">
													</div>
					</div>
							</div>
			</div>
													
													</c:if>
													
													<!-- 마법 -->	
													<c:if test="${RunList.get(0).perkPrimaryStyle eq 8200}">
													
													<div class="perk-page">
		<div class="perk-page__row">
			<div class="perk-page__item perk-page__item--mark">
				<img src="//opgg-static.akamaized.net/images/lol/perkStyle/8200.png?image=q_auto&amp;v=1576566284" class="perk-page__image tip tpd-delegation-uid-1" title="">
			</div>
		</div>
								<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8214.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="콩콩이 소환">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8229.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="신비로운 유성">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8230.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="난입">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8224.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>무효화 구체</b><br><span>마법 피해를 받아 체력이 30% 이하가 될 경우, 4초 동안 레벨에 비례해 40 ~ 120 (<scaleAP>+주문력의 0.1</scaleAP> 및 <scaleAD>+추가 공격력의 0.15</scaleAD>)의 마법 피해를 흡수하는 보호막이 생성됩니다.<br><br>재사용 대기시간: 60초</span>" alt="무효화 구체">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8226.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>마나순환 팔찌</b><br><span>적 챔피언에게 스킬을 적중하면 최대 마나가 영구적으로 25만큼 증가합니다. (최대 마나량: 250)<br><br>최대 마나량 250에 도달하면 5초마다 잃은 마나의 1%를 회복합니다.<br><br>재사용 대기시간: 15초</span>" alt="마나순환 팔찌">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8275.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="빛의 망토">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8210.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>깨달음</b><br><span>10레벨에 도달하면 재사용 대기시간이 10% 감소합니다.<br><br>재사용 대기시간 감소 최대치 초과분 1%당 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword>으로 추가 공격력 1.2 또는 추가 주문력 2 효과로 전환됩니다.</span>" alt="깨달음">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8234.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="기민함">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8233.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="절대 집중">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8237.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="주문 작열">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8232.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="물 위를 걷는 자">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8236.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>폭풍의 결집</b><br><span>10분마다 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword>으로 주문력 또는 공격력을 얻습니다.<br><br><i>10분</i>: + 주문력 8 또는 공격력 5 <br><i>20분</i>: + 주문력 24 또는 공격력 14<br><i>30분</i>: + 주문력 48 또는 공격력 29<br><i>40분</i>: + 주문력 80 또는 공격력 48<br><i>50분</i>: + 주문력 120 또는 공격력 72<br><i>60분</i>: + 주문력 168 또는 공격력 101<br>등등...</span>" alt="폭풍의 결집">
													</div>
					</div>
							</div>
			</div>
													
													</c:if>
													
													
													<!-- 결의 -->
													<c:if test="${RunList.get(0).perkPrimaryStyle eq 8400}">
													
													<div class="perk-page">
		<div class="perk-page__row">
			<div class="perk-page__item perk-page__item--mark">
				<img src="//opgg-static.akamaized.net/images/lol/perkStyle/8400.png?image=q_auto&amp;v=1576566284" class="perk-page__image tip" title="<b style='color: #ffc659'>결의</b><br><span>내구력 및 군중 제어</span>">
			</div>
		</div>
								<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8437.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>착취의 손아귀</b><br><span>전투 중 4초마다 챔피언에 대한 기본 공격 시 다음 효과를 얻습니다.<li>자신 최대 체력의 4%에 해당하는 추가 마법 피해</li><li>자신 최대 체력의 2%에 해당하는 체력 회복</li><li>영구적으로 체력 5 증가</li><br><rules><i>원거리 챔피언:</i> 피해량, 회복량, 체력 영구 증가량이 40% 감소합니다.</rules><br></span>" alt="착취의 손아귀">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8439.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>여진</b><br><span>적을 이동 불가 상태로 만들면 2.5초 동안 35+추가 방어력 및 마법 저항력의 80%만큼 방어력과 마법 저항력이 증가하며 폭발이 일어나 근처 적에게 마법 피해를 줍니다.<br><br>피해량: 25~120 (+추가 체력의 8%)<br>재사용 대기시간: 20초<br><br>여진 추가 저항력: 80~150 (레벨에 비례)<br></span>" alt="여진">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8465.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>수호자</b><br><span>자신으로부터 175유닛 내에 있는 아군이나 자신이 스킬의 대상으로 삼은 아군을 2.5초 동안 <i>보호</i>합니다. <i>보호</i>하는 중 자신과 아군 중 한 명이 피해를 입으면 둘 모두에게 보호막이 생성되며 이동 속도가 1.5초 동안 빨라집니다.<br><br>재사용 대기시간: <scaleLevel>70~40</scaleLevel>초<br>보호막 흡수량: <scaleLevel>70~150</scaleLevel> + 주문력의 <scaleAP>25%</scaleAP> + 추가 체력의 <scalehealth>12%</scalehealth><br>이동 속도 증가: +20%</span>" alt="수호자">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8446.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>철거</b><br><span>포탑으로부터 600 범위 안에 있을 경우 3초에 걸쳐 포탑에 대한 강력한 공격을 충전합니다. 충전된 공격은 100(+최대 체력의 35%)에 해당하는 추가 물리 피해를 입힙니다. <br><br>재사용 대기시간: 45초</span>" alt="철거">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8463.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>생명의 샘</b><br><span>적 챔피언의 이동을 방해하면 4초 동안 표식을 남깁니다.<br><br>표식이 남겨진 적을 공격하는 아군 챔피언은 2초에 걸쳐 5 + 나의 최대 체력의 1%에 해당하는 체력을 회복합니다. </span>" alt="생명의 샘">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8401.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>보호막 강타</b><br><span>보호막이 지속되는 동안 레벨에 따라 <scaleLevel>1~10</scaleLevel>의 방어력과 마법 저항력을 얻습니다.<br><br>새로운 보호막을 얻으면 적 챔피언에게 다음 기본 공격 시 <scaleLevel>5~30</scaleLevel><scaleHealth>(+추가 체력의 1.5%)</scaleHealth><scaleMana>(+새로운 보호막 흡수량의 8.5%)</scaleMana>에 해당하는 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword> 피해를 입힙니다.<br><br>이 효과는 보호막이 사라진 후 최대 2초까지 발동 가능합니다.</span>" alt="보호막 강타">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8429.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>사전 준비</b><br><span>10분 후 방어력 +9 및 마법 저항력 +9 증가와 동시에 방어력 및 마법 저항력 5% 증가</span>" alt="사전 준비">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8444.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>재생의 바람</b><br><span>적 챔피언에게 피해를 입으면 10초 동안 잃은 체력의 4% + 6만큼 회복합니다.</span>" alt="재생의 바람">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8473.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>뼈 방패</b><br><span>적 챔피언으로부터 피해를 입은 뒤 해당 적이 가하는 3회의 스킬 및 기본 공격으로부터 30~60만큼 피해를 덜 받습니다.<br><br><br>지속시간: 1.5초<br>재사용 대기시간: 45초</span>" alt="뼈 방패">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8451.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>과잉성장</b><br><span>근처에서 몬스터 또는 적 미니언이 8마리 죽을 때마다 생명의 정수를 흡수해 최대 체력이 영구적으로 3씩 증가합니다.<br><br>몬스터 또는 적 미니언을 120마리 흡수하면 최대 체력이 추가로 3.5% 증가합니다.</span>" alt="과잉성장">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8453.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>소생</b><br><span>자신이 사용하거나 받는 회복과 보호막 효과가 5% 강화됩니다. 체력이 40% 이하인 대상에게는 이 효과가 10% 증가합니다.</span>" alt="소생">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8242.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>불굴의 의지</b><br><span>소환사 주문을 사용한 후 10초 동안 15%의 강인함 및 둔화 저항을 추가로 얻습니다. 또한 소환사 주문이 재사용 대기 상태가 될 때마다 강인함 및 둔화 저항이 10% 증가합니다. </span>" alt="불굴의 의지">
													</div>
					</div>
							</div>
			</div>
													
													</c:if>
													
													
													<!-- 영감 -->
													<c:if test="${RunList.get(0).perkPrimaryStyle eq 8300}">
													
													<div class="perk-page">
		<div class="perk-page__row">
			<div class="perk-page__item perk-page__item--mark">
				<img src="//opgg-static.akamaized.net/images/lol/perkStyle/8300.png?image=q_auto&amp;v=1576566284" class="perk-page__image tip tpd-delegation-uid-1" title="">
			</div>
		</div>
								<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8351.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>빙결 강화</b><br><span>적 챔피언을 기본 공격하면 2초 동안 둔화시킵니다. 둔화 효과는 지속시간 동안 강화됩니다.<li><i>원거리 공격</i>: 최대 30% ~ 40% 둔화</li> <li><i>근접 공격</i>: 최대 45% ~ 55% 둔화</li><br>사용 아이템으로 적 챔피언을 둔화시키면 빙결 광선을 발사해서 주변 지역을 5초 동안 얼립니다. 해당 범위의 모든 유닛은 60% 둔화됩니다.<br><br>재사용 대기시간: 유닛당 7 ~ 4초</span>" alt="빙결 강화">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8360.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="봉인 풀린 주문서">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8358.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="프로토타입: 만능의 돌">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8306.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>마법공학 점멸기</b><br><span>점멸이 재사용 대기 중일 때 <i>마법공학 점멸</i>로 대체됩니다.<br><br><i>마법공학 점멸</i>: 2초간 정신을 집중한 뒤 다른 지점으로 도약합니다.<br><br>재사용 대기시간: 20초. 챔피언과 전투에 돌입할 경우 10초의 재사용 대기시간이 시작됩니다.</span>" alt="마법공학 점멸기">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8304.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>마법의 신발</b><br><span>게임 시작 12분 후 약간 신비한 장화 아이템을 얻습니다. 그 전까지는 신발류 아이템을 구매할 수 없습니다. 챔피언 처치에 관여할 때마다 장화 획득 시점이 45초씩 앞당겨집니다.<br><br>약간 신비한 장화 보유 시 이동 속도가 +10 증가합니다.</span>" alt="마법의 신발">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8313.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>완벽한 타이밍</b><br><span>게임 시작 시 초시계 키트 아이템을 받습니다. 이 아이템은 10분 후 초시계 아이템으로 변합니다. 초시계 아이템은 단 한 번 사용할 수 있으며, 사용 시 경직 효과를 얻습니다.<br><br>존야의 모래시계, 수호 천사, 가고일 돌갑옷의 재사용 대기시간이 15% 감소합니다.</span>" alt="완벽한 타이밍">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8321.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>외상</b><br><span>외상으로 아이템을 구입할 수 있습니다. 외상 한도는 점차 증가합니다.<br><br>외상 비용: 50골드</span>" alt="외상">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8316.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>미니언 해체분석기</b><br><span>게임 시작 시, 공격로 미니언을 즉시 처치하고 흡수하는 미니언 해체분석기 3개를 받습니다. 미니언 해체분석기 아이템은 게임 시작 후 180초 동안 재사용 대기 상태입니다.<br><br>이 아이템으로 미니언을 흡수하면 이후 동일한 종류의 미니언을 대상으로 6%의 추가 피해를 입히며, 동일한 종류의 미니언을 추가 흡수 시마다 3%의 추가 피해를 입힙니다.<br></span>" alt="미니언 해체분석기">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8345.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>비스킷 배달</b><br><span>비스킷 배달: 6분까지 2분마다 굳건한 의지의 완전한 비스킷 아이템을 얻습니다.<br><br>비스킷을 사용하면 잃은 체력과 마나의 10%를 회복합니다. 비스킷 하나를 사용하거나 판매하면 최대 마나가 영구적으로 50만큼 늘어납니다. <br><br><i>마나 없음:</i> 마나가 없는 챔피언은 마나 대신 잃은 체력의 12%를 회복합니다.</span>" alt="비스킷 배달">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8347.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>우주적 통찰력</b><br><span>재사용 대기시간 감소 +5%<br>최대 재사용 대기시간 감소 +5%<br>소환사 주문 재사용 대기시간 감소 +5%<br>아이템 재사용 대기시간 감소 +5%</span>" alt="우주적 통찰력">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8410.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>쾌속 접근</b><br><span>적 챔피언에게 이동 방해기를 맞히고 해당 적에게 이동할 때, 또는 이동 방해기에 맞은 근처의 아군 챔피언에게 이동할 때 이동 속도가 15% 증가합니다. <br><br>범위: 1000</span>" alt="쾌속 접근">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8352.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>시간 왜곡 물약</b><br><span>물약이나 비스킷을 사용하면 체력이나 마나 회복량의 50%를 즉시 회복하지만, 해당 소모품에 짧은 재사용 대기시간이 적용됩니다. 또한 물약이나 비스킷의 효과가 지속되는 동안 이동 속도가 5% 증가합니다.<br><br>재사용 대기시간: 해당 소모품의 지속시간과 동일합니다.</span>" alt="시간 왜곡 물약">
													</div>
					</div>
							</div>
			</div>
													
													</c:if>
													
													
													<div class="page-divider"></div>
													
													
													<!-- SubPerk -->
													
													
						 							<!-- 지배 -->
						 							<c:if test="${RunList.get(0).perkSubStyle eq 8100}">
						 							
													<div class="perk-page">
														<div class="perk-page__row">
															<div class="perk-page__item perk-page__item--mark">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8100.png?image=q_auto&amp;v=1576566284"
																	class="perk-page__image tip"
																	title="&lt;b style=&#039;color: #ffc659&#039;&gt;지배&lt;/b&gt;&lt;br&gt;&lt;span&gt;강력한 피해와 빠른 접근&lt;/span&gt;">
															</div>
														</div>
														<div class="perk-page__row">
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8126.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;비열한 한 방&lt;/b&gt;&lt;br&gt;&lt;span&gt;&lt;b&gt;이동 또는 행동을 방해받은&lt;/b&gt; 상태의 챔피언에게 피해를 주면 레벨에 따라 10 ~ 45의 추가 고정 피해를 입힙니다.&lt;br&gt;&lt;br&gt;재사용 대기시간: 4초&lt;br&gt;&lt;rules&gt;방해 효과 이후 피해를 가할 때 활성화됩니다.&lt;/rules&gt;&lt;/span&gt;"
																		alt="비열한 한 방">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8139.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;피의 맛&lt;/b&gt;&lt;br&gt;&lt;span&gt;적 챔피언에게 피해를 입히면 체력을 회복합니다.&lt;br&gt;&lt;br&gt;회복량: 18 ~ 35 (+추가 공격력의 0.2, +주문력의 0.1) (레벨에 비례)&lt;br&gt;&lt;br&gt;재사용 대기시간: 20초&lt;/span&gt;"
																		alt="피의 맛">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8143.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;돌발 일격&lt;/b&gt;&lt;br&gt;&lt;span&gt;돌진, 도약, 점멸, 순간이동을 사용하거나 은신에서 빠져나온 뒤 적 챔피언에게 피해를 주면 5초 동안 7의 물리 관통력과 6의 마법 관통력을 얻습니다.&lt;br&gt;&lt;br&gt;재사용 대기시간: 4초&lt;/span&gt;"
																		alt="돌발 일격">
																</div>
															</div>
														</div>
														<div class="perk-page__row">
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8136.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;좀비 와드&lt;/b&gt;&lt;br&gt;&lt;span&gt;적 와드 &lt;lol-uikit-tooltipped-keyword key=&#039;LinkTooltip_Description_Takedown&#039;&gt;파괴 관여&lt;/lol-uikit-tooltipped-keyword&gt; 시 그 자리에 아군 좀비 와드가 생성됩니다.&lt;br&gt;&lt;br&gt;좀비 와드가 생성될 때마다 최대 10회까지 중첩되는 &lt;lol-uikit-tooltipped-keyword key=&#039;LinkTooltip_Description_Adaptive&#039;&gt;&lt;font color=&#039;#48C4B7&#039;&gt;적응형&lt;/font&gt;&lt;/lol-uikit-tooltipped-keyword&gt;으로 추가 공격력 1.2 또는 추가 주문력 2의 효과를 얻습니다. &lt;br&gt;&lt;br&gt;좀비 와드를 10개 생성하면 10의 적응형 능력치를 부가적으로 획득합니다.&lt;br&gt;&lt;br&gt;좀비 와드는 적이 볼 수 있고 120초 동안 유지되며, 설치 가능 와드 수에 영향을 주지 않습니다.&lt;/span&gt;"
																		alt="좀비 와드">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8120.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;유령 포로&lt;/b&gt;&lt;br&gt;&lt;span&gt;자신이 설치한 와드의 지속시간이 끝나면 유령 포로 와드가 남아 60초 동안 시야를 밝힙니다. 적 챔피언이 근처에 오면 유령 포로 와드를 몰아낼 수 있습니다.&lt;br&gt;&lt;br&gt;유령 포로 와드가 생성되거나 유령 포로 와드가 적 챔피언을 발견할 때마다 최대 10회까지 중첩되는 &lt;lol-uikit-tooltipped-keyword key=&#039;LinkTooltip_Description_Adaptive&#039;&gt;&lt;font color=&#039;#48C4B7&#039;&gt;적응형&lt;/font&gt;&lt;/lol-uikit-tooltipped-keyword&gt;으로 추가 공격력 1.2 또는 추가 주문력 2의 효과를 얻습니다. &lt;br&gt;&lt;br&gt;10회 중첩되면 10의 적응형 능력치를 부가적으로 획득합니다.&lt;/span&gt;"
																		alt="유령 포로">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8138.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;시야 수집&lt;/b&gt;&lt;br&gt;&lt;span&gt;챔피언 처치에 관여하면 감시 중첩을 얻습니다. 감시 중첩 하나당 &lt;lol-uikit-tooltipped-keyword key=&#039;LinkTooltip_Description_Adaptive&#039;&gt;&lt;font color=&#039;#48C4B7&#039;&gt;적응형&lt;/font&gt;&lt;/lol-uikit-tooltipped-keyword&gt;으로 추가 공격력 0.6 또는 추가 주문력 1의 효과를 얻습니다. &lt;br&gt;&lt;br&gt;감시 중첩이 최대치인 20회에 도달하면 &lt;lol-uikit-tooltipped-keyword key=&#039;LinkTooltip_Description_Adaptive&#039;&gt;&lt;font color=&#039;#48C4B7&#039;&gt;적응형&lt;/font&gt;&lt;/lol-uikit-tooltipped-keyword&gt;으로 추가 공격력 6 또는 추가 주문력 10의 효과를 부가적으로 획득합니다.&lt;br&gt;&lt;br&gt;적 챔피언 처치 관여 시마다 감시 중첩 2회를 얻습니다.&lt;/span&gt;"
																		alt="시야 수집">
																</div>
															</div>
														</div>
														<div class="perk-page__row">
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8135.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;굶주린 사냥꾼&lt;/b&gt;&lt;br&gt;&lt;span&gt;스킬로 입힌 피해량의 일부만큼 체력을 회복합니다.&lt;br&gt;체력 회복량: 1.5% + &lt;i&gt;현상금 사냥꾼&lt;/i&gt; 중첩 1회당 2.5% &lt;br&gt;&lt;br&gt;각 적 챔피언을 처치하는 데 처음으로 관여할 때마다 &lt;i&gt;현상금 사냥꾼&lt;/i&gt; 중첩을 얻을 수 있습니다.&lt;br&gt;&lt;rules&gt;&lt;br&gt;광역 스킬의 경우 체력 회복 효과가 1/3로 감소합니다.&lt;/rules&gt;&lt;/span&gt;"
																		alt="굶주린 사냥꾼">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8134.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;영리한 사냥꾼&lt;/b&gt;&lt;br&gt;&lt;span&gt;&lt;b&gt;사용 아이템 재사용 대기시간 감소&lt;/b&gt; 효과를 15% + &lt;i&gt;현상금 사냥꾼&lt;/i&gt; 중첩 1회당 5%만큼 얻습니다. (장신구 포함)&lt;br&gt;&lt;br&gt;각 적 챔피언을 처치하는 데 처음으로 관여할 때마다 &lt;i&gt;현상금 사냥꾼&lt;/i&gt; 중첩을 얻을 수 있습니다.&lt;/span&gt;"
																		alt="영리한 사냥꾼">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8105.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;끈질긴 사냥꾼&lt;/b&gt;&lt;br&gt;&lt;span&gt;&lt;b&gt;전투에서 벗어나 있을 때 이동 속도&lt;/b&gt;가 10 + &lt;i&gt;현상금 사냥꾼&lt;/i&gt; 중첩 1회당 9만큼 증가합니다.&lt;br&gt;&lt;br&gt;각 적 챔피언을 처치하는 데 처음으로 관여할 때마다 &lt;i&gt;현상금 사냥꾼&lt;/i&gt; 중첩을 얻을 수 있습니다.&lt;/span&gt;"
																		alt="끈질긴 사냥꾼">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8106.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;궁극의 사냥꾼&lt;/b&gt;&lt;br&gt;&lt;span&gt;궁극기에 5%의 &lt;b&gt;재사용 대기시간 감소&lt;/b&gt;효과가 적용되고 &lt;i&gt;현상금 사냥꾼&lt;/i&gt; 중첩 1회당 4%씩 추가로 감소합니다.&lt;br&gt;&lt;br&gt;각 적 챔피언을 처치하는 데 처음으로 관여할 때마다 &lt;i&gt;현상금 사냥꾼&lt;/i&gt; 중첩을 얻을 수 있습니다.&lt;/span&gt;"
																		alt="궁극의 사냥꾼">
																</div>
															</div>
														</div>
													</div>
													
													</c:if>
													
													
													<!-- 마법 -->
													<c:if test="${RunList.get(0).perkSubStyle eq 8200}">
													
													<div class="perk-page">
		<div class="perk-page__row">
			<div class="perk-page__item perk-page__item--mark">
				<img src="//opgg-static.akamaized.net/images/lol/perkStyle/8200.png?image=q_auto&amp;v=1576566284" class="perk-page__image tip tpd-delegation-uid-1" title="">
			</div>
		</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8224.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="무효화 구체">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8226.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="마나순환 팔찌">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8275.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>빛의 망토</b><br><span>소환사 주문 사용 후 2.5초 동안 이동 속도가 증가하며 유닛을 통과할 수 있습니다.<br><br>증가: 소환사 주문 재사용 대기시간에 따라 이동 속도가 15%~35% 증가합니다. (재사용 대기시간이 길수록 이동 속도가 더 많이 증가합니다.) </span>" alt="빛의 망토">
													</div>
					</div>
							</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8210.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="깨달음">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8234.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="기민함">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8233.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>절대 집중</b><br><span>체력이 70% 이상일 경우 레벨에 따라 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword>으로 추가 공격력 최대 18 또는 추가 주문력 최대 30의 효과를 얻습니다. <br><br>1레벨에 1.8의 공격력 또는 3의 주문력을 얻습니다. </span>" alt="절대 집중">
													</div>
					</div>
							</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8237.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>주문 작열</b><br><span>다음 공격 스킬 적중 시 챔피언에게 불을 붙여 1초 후 레벨에 따라 15~35의 추가 마법 피해를 줍니다.<br><br>재사용 대기시간: 10초</span>" alt="주문 작열">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8232.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="물 위를 걷는 자">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8236.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="폭풍의 결집">
													</div>
					</div>
							</div>
			</div>
													
													</c:if>
													
													<!-- 영감 -->
													<c:if test="${RunList.get(0).perkSubStyle eq 8300}">
													
													<div class="perk-page">
		<div class="perk-page__row">
			<div class="perk-page__item perk-page__item--mark">
				<img src="//opgg-static.akamaized.net/images/lol/perkStyle/8300.png?image=q_auto&amp;v=1576566284" class="perk-page__image tip" title="<b style='color: #ffc659'>영감</b><br><span>다양한 방식의 전투 보조</span>">
			</div>
		</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8306.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>마법공학 점멸기</b><br><span>점멸이 재사용 대기 중일 때 <i>마법공학 점멸</i>로 대체됩니다.<br><br><i>마법공학 점멸</i>: 2초간 정신을 집중한 뒤 다른 지점으로 도약합니다.<br><br>재사용 대기시간: 20초. 챔피언과 전투에 돌입할 경우 10초의 재사용 대기시간이 시작됩니다.</span>" alt="마법공학 점멸기">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8304.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>마법의 신발</b><br><span>게임 시작 12분 후 약간 신비한 장화 아이템을 얻습니다. 그 전까지는 신발류 아이템을 구매할 수 없습니다. 챔피언 처치에 관여할 때마다 장화 획득 시점이 45초씩 앞당겨집니다.<br><br>약간 신비한 장화 보유 시 이동 속도가 +10 증가합니다.</span>" alt="마법의 신발">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8313.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="완벽한 타이밍">
													</div>
					</div>
							</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8321.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>외상</b><br><span>외상으로 아이템을 구입할 수 있습니다. 외상 한도는 점차 증가합니다.<br><br>외상 비용: 50골드</span>" alt="외상">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8316.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="미니언 해체분석기">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8345.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>비스킷 배달</b><br><span>비스킷 배달: 6분까지 2분마다 굳건한 의지의 완전한 비스킷 아이템을 얻습니다.<br><br>비스킷을 사용하면 잃은 체력과 마나의 10%를 회복합니다. 비스킷 하나를 사용하거나 판매하면 최대 마나가 영구적으로 50만큼 늘어납니다. <br><br><i>마나 없음:</i> 마나가 없는 챔피언은 마나 대신 잃은 체력의 12%를 회복합니다.</span>" alt="비스킷 배달">
													</div>
					</div>
							</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8347.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>우주적 통찰력</b><br><span>재사용 대기시간 감소 +5%<br>최대 재사용 대기시간 감소 +5%<br>소환사 주문 재사용 대기시간 감소 +5%<br>아이템 재사용 대기시간 감소 +5%</span>" alt="우주적 통찰력">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8410.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>쾌속 접근</b><br><span>적 챔피언에게 이동 방해기를 맞히고 해당 적에게 이동할 때, 또는 이동 방해기에 맞은 근처의 아군 챔피언에게 이동할 때 이동 속도가 15% 증가합니다. <br><br>범위: 1000</span>" alt="쾌속 접근">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8352.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="시간 왜곡 물약">
													</div>
					</div>
							</div>
			</div>
													
													</c:if>
													
													
													<!-- 정밀 -->
													<c:if test="${RunList.get(0).perkSubStyle eq 8000}">
													
													<div class="perk-page">
		<div class="perk-page__row">
			<div class="perk-page__item perk-page__item--mark">
				<img src="//opgg-static.akamaized.net/images/lol/perkStyle/8000.png?image=q_auto&amp;v=1576566284" class="perk-page__image tip tpd-delegation-uid-1" title="">
			</div>
		</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/9101.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>과다치유</b><br><span>자신에 대한 체력 회복 초과분이 보호막으로 전환됩니다. 보호막은 10<scaleHealth>(+최대 체력의 10%)</scaleHealth>에 해당하는 피해까지 흡수할 수 있습니다.<br><br>보호막 전환율은 자신 또는 아군으로부터의 체력 회복 초과분의 20~100%입니다.</span>" alt="과다치유">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/9111.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="승전보">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8009.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="침착">
													</div>
					</div>
							</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/9104.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="전설: 민첩함">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/9105.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="전설: 강인함">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/9103.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="전설: 핏빛 길">
													</div>
					</div>
							</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8014.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="최후의 일격">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8017.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="체력차 극복">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8299.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>최후의 저항</b><br><span>체력이 60% 이하일 때 적 챔피언 공격 시 5% ~ 11%의 추가 피해를 줍니다. 체력이 30%일 때 최대 피해량에 도달합니다.</span>" alt="최후의 저항">
													</div>
					</div>
							</div>
			</div>
													
													</c:if>
													
													
													<!-- 결의 -->
													<c:if test="${RunList.get(0).perkSubStyle eq 8400}">
													
													<div class="perk-page">
		<div class="perk-page__row">
			<div class="perk-page__item perk-page__item--mark">
				<img src="//opgg-static.akamaized.net/images/lol/perkStyle/8400.png?image=q_auto&amp;v=1576566284" class="perk-page__image tip" title="<b style='color: #ffc659'>결의</b><br><span>내구력 및 군중 제어</span>">
			</div>
		</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8446.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>철거</b><br><span>포탑으로부터 600 범위 안에 있을 경우 3초에 걸쳐 포탑에 대한 강력한 공격을 충전합니다. 충전된 공격은 100(+최대 체력의 35%)에 해당하는 추가 물리 피해를 입힙니다. <br><br>재사용 대기시간: 45초</span>" alt="철거">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8463.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>생명의 샘</b><br><span>적 챔피언의 이동을 방해하면 4초 동안 표식을 남깁니다.<br><br>표식이 남겨진 적을 공격하는 아군 챔피언은 2초에 걸쳐 5 + 나의 최대 체력의 1%에 해당하는 체력을 회복합니다. </span>" alt="생명의 샘">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8401.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>보호막 강타</b><br><span>보호막이 지속되는 동안 레벨에 따라 <scaleLevel>1~10</scaleLevel>의 방어력과 마법 저항력을 얻습니다.<br><br>새로운 보호막을 얻으면 적 챔피언에게 다음 기본 공격 시 <scaleLevel>5~30</scaleLevel><scaleHealth>(+추가 체력의 1.5%)</scaleHealth><scaleMana>(+새로운 보호막 흡수량의 8.5%)</scaleMana>에 해당하는 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword> 피해를 입힙니다.<br><br>이 효과는 보호막이 사라진 후 최대 2초까지 발동 가능합니다.</span>" alt="보호막 강타">
													</div>
					</div>
							</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8429.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>사전 준비</b><br><span>10분 후 방어력 +9 및 마법 저항력 +9 증가와 동시에 방어력 및 마법 저항력 5% 증가</span>" alt="사전 준비">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8444.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>재생의 바람</b><br><span>적 챔피언에게 피해를 입으면 10초 동안 잃은 체력의 4% + 6만큼 회복합니다.</span>" alt="재생의 바람">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8473.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>뼈 방패</b><br><span>적 챔피언으로부터 피해를 입은 뒤 해당 적이 가하는 3회의 스킬 및 기본 공격으로부터 30~60만큼 피해를 덜 받습니다.<br><br><br>지속시간: 1.5초<br>재사용 대기시간: 45초</span>" alt="뼈 방패">
													</div>
					</div>
							</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8451.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>과잉성장</b><br><span>근처에서 몬스터 또는 적 미니언이 8마리 죽을 때마다 생명의 정수를 흡수해 최대 체력이 영구적으로 3씩 증가합니다.<br><br>몬스터 또는 적 미니언을 120마리 흡수하면 최대 체력이 추가로 3.5% 증가합니다.</span>" alt="과잉성장">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8453.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>소생</b><br><span>자신이 사용하거나 받는 회복과 보호막 효과가 5% 강화됩니다. 체력이 40% 이하인 대상에게는 이 효과가 10% 증가합니다.</span>" alt="소생">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8242.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>불굴의 의지</b><br><span>소환사 주문을 사용한 후 10초 동안 15%의 강인함 및 둔화 저항을 추가로 얻습니다. 또한 소환사 주문이 재사용 대기 상태가 될 때마다 강인함 및 둔화 저항이 10% 증가합니다. </span>" alt="불굴의 의지">
													</div>
					</div>
							</div>
			</div>
													
													</c:if>
													
													<div class="page-divider"></div>
													
													<!-- statPerk -->
													<div class="fragment-page">
														<div class="fragment__detail">
															<!-- statPerk 시작-->
															<div class="fragment__row" id="statPerk0">
															
															
																<div class="fragment">
																
																
																
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5008.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;OFFENSE&lt;/b&gt;&lt;br&gt;&lt;span&gt;적응형 능력치 +9&lt;/span&gt;"
																			alt="OFFENSE">
																	</div>
																</div>
																<div class="fragment">
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5005.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;OFFENSE&lt;/b&gt;&lt;br&gt;&lt;span&gt;공격속도 +10%&lt;/span&gt;"
																			alt="OFFENSE">
																	</div>
																</div>
																<div class="fragment">
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5007.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;OFFENSE&lt;/b&gt;&lt;br&gt;&lt;span&gt;재사용 대기시간 감소 +1 ~ 10% (레벨에 비례)&lt;/span&gt;"
																			alt="OFFENSE">
																	</div>
																</div>
															</div>
															<div class="fragment__row"  id="statPerk1">
																<div class="fragment">
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5008.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;OFFENSE&lt;/b&gt;&lt;br&gt;&lt;span&gt;적응형 능력치 +9&lt;/span&gt;"
																			alt="OFFENSE">
																	</div>
																</div>
																<div class="fragment">
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5002.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;FLEX&lt;/b&gt;&lt;br&gt;&lt;span&gt;방어력 +6&lt;/span&gt;"
																			alt="FLEX">
																	</div>
																</div>
																<div class="fragment">
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5003.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;FLEX&lt;/b&gt;&lt;br&gt;&lt;span&gt;마법저항력 +8&lt;/span&gt;"
																			alt="FLEX">
																	</div>
																</div>
															</div>
															<div class="fragment__row"  id="statPerk2">
																<div class="fragment">
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5001.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;DEFENSE&lt;/b&gt;&lt;br&gt;&lt;span&gt;체력 +15 ~ 90 (레벨에 비례)&lt;/span&gt;"
																			alt="DEFENSE">
																	</div>
																</div>
																<div class="fragment">
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5002.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;FLEX&lt;/b&gt;&lt;br&gt;&lt;span&gt;방어력 +6&lt;/span&gt;"
																			alt="FLEX">
																	</div>
																</div>
																<div class="fragment">
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5003.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;FLEX&lt;/b&gt;&lt;br&gt;&lt;span&gt;마법저항력 +8&lt;/span&gt;"
																			alt="FLEX">
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<hr style="border: 1px solid rgba(0, 0, 0, 0.1);">
												<!-- 룬시작 2 -->
												<div class="perk-page-wrap" id="RunePerk1" >
													
													<!-- MainPerk -->
													
													
													
													<!-- 정밀 -->
													<c:if test="${RunList.get(1).perkPrimaryStyle eq 8000}">
													
													<div class="perk-page">
														<div class="perk-page__row">
															<div class="perk-page__item perk-page__item--mark perk-page__item--active">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8000.png?image=q_auto&amp;v=1576566284"
																	class="perk-page__image tip"
																	title="&lt;b style=&#039;color: #ffc659&#039;&gt;정밀&lt;/b&gt;&lt;br&gt;&lt;span&gt;공격 강화 및 지속적 피해&lt;/span&gt;">
															</div>
														</div>
														<div class="perk-page__row">
															<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8005.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;집중 공격&lt;/b&gt;&lt;br&gt;&lt;span&gt;적 챔피언에게 연속으로 3회 기본 공격을 가하면 레벨에 따라 40 ~ 180의 추가 &lt;lol-uikit-tooltipped-keyword key=&#039;LinkTooltip_Description_AdaptiveDmg&#039;&gt;&lt;font color=&#039;#48C4B7&#039;&gt;적응형 피해&lt;/font&gt;&lt;/lol-uikit-tooltipped-keyword&gt;를 입히고 적의 약점을 노출시킵니다. 약점이 노출된 적은 6초 동안 모든 상대에게서 8 ~ 12%의 추가 피해를 받습니다.&lt;/span&gt;"
																		alt="집중 공격">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8008.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;치명적 속도&lt;/b&gt;&lt;br&gt;&lt;span&gt;적 챔피언에게 피해를 주고 1.5초 후, 3초 동안 레벨에 따라 공격 속도가 40~110% 증가합니다. 적 챔피언을 공격하면 효과 지속시간이 6초까지 증가합니다.&lt;br&gt;&lt;br&gt;재사용 대기시간: 6초&lt;br&gt;&lt;br&gt;치명적 속도 상태에서는 일시적으로 최고 공격 속도 제한을 초과할 수 있습니다.&lt;/span&gt;"
																		alt="치명적 속도">
																</div>
															</div>
															<div
																class="perk-page__item perk-page__item--keystone perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8021.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;기민한 발놀림&lt;/b&gt;&lt;br&gt;&lt;span&gt;공격 또는 이동 시 충전 중첩이 쌓입니다. 중첩이 100회 쌓이면 충전 상태로 다음 공격을 할 수 있습니다.&lt;br&gt;&lt;br&gt;충전 상태로 공격 시 3~60(+추가 공격력의 0.3, +주문력의 0.3)에 해당하는 체력이 회복되며 1초 동안 이동 속도가 20% 증가합니다.&lt;br&gt;&lt;br&gt;원거리 챔피언의 경우 미니언으로부터 받는 회복 효과가 20%만 적용됩니다.&lt;/span&gt;"
																		alt="기민한 발놀림">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8010.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;정복자&lt;/b&gt;&lt;br&gt;&lt;span&gt;적 챔피언에게 기본 공격 또는 스킬로 피해를 입히면 6초 동안 정복자 중첩을 2만큼 얻어 중첩마다 2~5의 &lt;lol-uikit-tooltipped-keyword key=&#039;LinkTooltip_Description_Adaptive&#039;&gt;&lt;font color=&#039;#48C4B7&#039;&gt;적응형 능력치&lt;/font&gt;&lt;/lol-uikit-tooltipped-keyword&gt;를 얻습니다. 최대 10회까지 중첩됩니다. 원거리 챔피언은 기본 공격으로 중첩을 1만 획득할 수 있습니다.&lt;br&gt;&lt;br&gt;최대로 중첩되면 챔피언에게 입힌 피해량의 15%만큼 체력을 회복합니다. (원거리 챔피언은 8%)&lt;/span&gt;"
																		alt="정복자">
																</div>
															</div>
														</div>
														<div class="perk-page__row">
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/9101.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;과다치유&lt;/b&gt;&lt;br&gt;&lt;span&gt;자신에 대한 체력 회복 초과분이 보호막으로 전환됩니다. 보호막은 10&lt;scaleHealth&gt;(+최대 체력의 10%)&lt;/scaleHealth&gt;에 해당하는 피해까지 흡수할 수 있습니다.&lt;br&gt;&lt;br&gt;보호막 전환율은 자신 또는 아군으로부터의 체력 회복 초과분의 20~100%입니다.&lt;/span&gt;"
																		alt="과다치유">
																</div>
															</div>
															<div class="perk-page__item  perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/9111.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;승전보&lt;/b&gt;&lt;br&gt;&lt;span&gt;챔피언 처치 또는 어시스트 시 잃은 체력의 12%를 회복하며 추가로 20골드를 획득합니다. &lt;br&gt;&lt;br&gt;&lt;hr&gt;&lt;br&gt;&lt;i&gt;&#039;가장 위험한 게임을 하는 자만이 진정 승리의 환희를 맛보았다고 말할 수 있다.&#039; &lt;br&gt;—녹서스 검투사&lt;/i&gt;&lt;/span&gt;"
																		alt="승전보">
																</div>
															</div>
															<div class="perk-page__item  perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8009.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;침착&lt;/b&gt;&lt;br&gt;&lt;span&gt;처치 관여 시 최대 마나 또는 기력의 20%를 회복하고 최대 마나를 100(최대 500)만큼, 최대 기력을 10(최대 50)만큼 증가시킵니다. &lt;/span&gt;"
																		alt="침착">
																</div>
															</div>
														</div>
														<div class="perk-page__row">
															<div class="perk-page__item  perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/9104.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;전설: 민첩함&lt;/b&gt;&lt;br&gt;&lt;span&gt;공격 속도가 3% 증가하며 &lt;i&gt;전설&lt;/i&gt; 중첩당 1.5%의 공격 속도가 추가로 증가합니다. (&lt;statGood&gt;최대 전설 중첩 횟수: 10&lt;/statGood&gt;)&lt;br&gt;&lt;br&gt;챔피언 처치 관여, 에픽 몬스터 처치 관여, 대형 몬스터 처치, 미니언 처치 시마다 &lt;i&gt;전설&lt;/i&gt; 중첩을 얻습니다.&lt;/span&gt;"
																		alt="전설: 민첩함">
																</div>
															</div>
															<div class="perk-page__item  perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/9105.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;전설: 강인함&lt;/b&gt;&lt;br&gt;&lt;span&gt;강인함이 5% 증가하며 &lt;i&gt;전설&lt;/i&gt; 중첩당 2.5%의 강인함이 추가로 증가합니다. (&lt;statGood&gt;최대 전설 중첩 횟수: 10&lt;/statGood&gt;)&lt;br&gt;&lt;br&gt;챔피언 처치 관여, 에픽 몬스터 처치 관여, 대형 몬스터 처치, 미니언 처치 시마다 &lt;i&gt;전설&lt;/i&gt; 중첩을 얻습니다.&lt;/span&gt;"
																		alt="전설: 강인함">
																</div>
															</div>
															<div class="perk-page__item  perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/9103.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;전설: 핏빛 길&lt;/b&gt;&lt;br&gt;&lt;span&gt;&lt;i&gt;전설&lt;/i&gt; 중첩당 생명력 흡수가 0.6% 증가합니다. (&lt;statGood&gt;최대 전설 중첩 횟수: 20&lt;/statGood&gt;)&lt;br&gt;&lt;br&gt;챔피언 처치 관여, 에픽 몬스터 처치 관여, 대형 몬스터 처치, 미니언 처치 시마다 &lt;i&gt;전설&lt;/i&gt; 중첩을 얻습니다.&lt;/span&gt;"
																		alt="전설: 핏빛 길">
																</div>
															</div>
														</div>
														<div class="perk-page__row">
															<div class="perk-page__item  perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8014.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;최후의 일격&lt;/b&gt;&lt;br&gt;&lt;span&gt;체력이 40% 이하인 적 챔피언에게 주는 피해량이 8% 증가합니다.&lt;/span&gt;"
																		alt="최후의 일격">
																</div>
															</div>
															<div class="perk-page__item  perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8017.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;체력차 극복&lt;/b&gt;&lt;br&gt;&lt;span&gt;적 챔피언의 최대 체력이 자신보다 많은 정도에 비례해 해당 챔피언에게 5%~15%의 추가 피해를 입힙니다.&lt;br&gt;&lt;br&gt;&lt;rules&gt;추가 피해량은 적의 최대 체력이 10%~100% 더 많을 경우 그에 따라 증가합니다.&lt;/rules&gt;&lt;/span&gt;"
																		alt="체력차 극복">
																</div>
															</div>
															<div class="perk-page__item  perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8299.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;최후의 저항&lt;/b&gt;&lt;br&gt;&lt;span&gt;체력이 60% 이하일 때 적 챔피언 공격 시 5% ~ 11%의 추가 피해를 줍니다. 체력이 30%일 때 최대 피해량에 도달합니다.&lt;/span&gt;"
																		alt="최후의 저항">
																</div>
															</div>
														</div>
													</div>
													
													</c:if>
													
													
													<!-- 지배 -->
													<c:if test="${RunList.get(1).perkPrimaryStyle eq 8100}">
												
													<div class="perk-page">
		<div class="perk-page__row">
			<div class="perk-page__item perk-page__item--mark">
				<img src="//opgg-static.akamaized.net/images/lol/perkStyle/8100.png?image=q_auto&amp;v=1576566284" class="perk-page__image tip tpd-delegation-uid-1" title="">
			</div>
		</div>
								<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8112.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>감전</b><br><span>3초 동안 같은 챔피언에게 <b>개별</b> 공격 또는 스킬을 3회 적중시키면 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_AdaptiveDmg'><font color='#48C4B7'>적응형 피해</font></lol-uikit-tooltipped-keyword>를 입힙니다.<br><br>피해량: 30~180 (+추가 공격력의 0.4, +주문력의 0.25)<br><br>재사용 대기시간: 25~20초<br><br><hr><i>'우리는 그들을 천둥군주라고 부른다. 그들의 번개를 입에 올리는 것은 재앙을 부르는 길이기 때문이다.'</i></span>" alt="감전">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8124.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>포식자</b><br><span>장화에 '<font color='#c60300'>포식자</font>' 사용 효과를 부여합니다.<br><br>전투 중이 아닐 때 1.5초 동안 정신 집중을 한 후 15초 동안 이동 속도가 45% 상승합니다. 공격 또는 스킬로 피해를 가하면 이 효과가 종료되며 60 ~ 180 (+추가 공격력의 <scaleAD>0.4</scaleAD>)(+주문력의 <scaleAP>0.25</scaleAP>)만큼 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_AdaptiveDmg'><font color='#48C4B7'>적응형 피해</font></lol-uikit-tooltipped-keyword>를 줍니다.<br><br>재사용 대기시간: 150 ~ 100초. 게임 시작 시 재사용 대기 상태이며 정신 집중을 방해받으면 50%의 재사용 대기시간이 적용됩니다.</span>" alt="포식자">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8128.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>어둠의 수확</b><br><span>체력이 50%보다 낮은 챔피언에게 피해를 입히면 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_AdaptiveDmg'>적응형 피해</lol-uikit-tooltipped-keyword>를 추가로 입히고 해당 챔피언의 영혼을 수확해 어둠의 수확 효과의 피해량이 영구적으로 5만큼 증가합니다.<br><br>어둠의 수확 피해량: 20~60 (레벨에 비례) (+영혼당 피해량 5) (+추가 공격력의 0.25) (+주문력의 0.15)<br>재사용 대기시간: 45초 (처치 관여 시 1.5초로 초기화)</span>" alt="어둠의 수확">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/9923.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>칼날비</b><br><span>적 챔피언에 대한 3번째 공격까지 공격 속도가 110% 증가합니다.<br><br>2초 안에 다음 공격을 가하지 못하면 효과가 사라집니다.<br><br>재사용 대기시간: 전투에서 벗어나 있을 때 4초<br><br><rules>기본 공격 모션이 취소될 경우 공격 속도 증가 효과가 적용되는 공격 횟수가 1회 늘어납니다.<br>일시적으로 최고 공격 속도 제한을 초과할 수 있습니다.</rules></span>" alt="칼날비">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8126.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>비열한 한 방</b><br><span><b>이동 또는 행동을 방해받은</b> 상태의 챔피언에게 피해를 주면 레벨에 따라 10 ~ 45의 추가 고정 피해를 입힙니다.<br><br>재사용 대기시간: 4초<br><rules>방해 효과 이후 피해를 가할 때 활성화됩니다.</rules></span>" alt="비열한 한 방">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8139.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>피의 맛</b><br><span>적 챔피언에게 피해를 입히면 체력을 회복합니다.<br><br>회복량: 18 ~ 35 (+추가 공격력의 0.2, +주문력의 0.1) (레벨에 비례)<br><br>재사용 대기시간: 20초</span>" alt="피의 맛">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8143.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>돌발 일격</b><br><span>돌진, 도약, 점멸, 순간이동을 사용하거나 은신에서 빠져나온 뒤 적 챔피언에게 피해를 주면 5초 동안 7의 물리 관통력과 6의 마법 관통력을 얻습니다.<br><br>재사용 대기시간: 4초</span>" alt="돌발 일격">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8136.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>좀비 와드</b><br><span>적 와드 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Takedown'>파괴 관여</lol-uikit-tooltipped-keyword> 시 그 자리에 아군 좀비 와드가 생성됩니다.<br><br>좀비 와드가 생성될 때마다 최대 10회까지 중첩되는 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword>으로 추가 공격력 1.2 또는 추가 주문력 2의 효과를 얻습니다. <br><br>좀비 와드를 10개 생성하면 10의 적응형 능력치를 부가적으로 획득합니다.<br><br>좀비 와드는 적이 볼 수 있고 120초 동안 유지되며, 설치 가능 와드 수에 영향을 주지 않습니다.</span>" alt="좀비 와드">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8120.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>유령 포로</b><br><span>자신이 설치한 와드의 지속시간이 끝나면 유령 포로 와드가 남아 60초 동안 시야를 밝힙니다. 적 챔피언이 근처에 오면 유령 포로 와드를 몰아낼 수 있습니다.<br><br>유령 포로 와드가 생성되거나 유령 포로 와드가 적 챔피언을 발견할 때마다 최대 10회까지 중첩되는 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword>으로 추가 공격력 1.2 또는 추가 주문력 2의 효과를 얻습니다. <br><br>10회 중첩되면 10의 적응형 능력치를 부가적으로 획득합니다.</span>" alt="유령 포로">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8138.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>시야 수집</b><br><span>챔피언 처치에 관여하면 감시 중첩을 얻습니다. 감시 중첩 하나당 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword>으로 추가 공격력 1.2 또는 추가 주문력 2의 효과를 얻습니다. <br><br>감시 중첩이 최대치인 10회에 도달하면 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword>으로 추가 공격력 6 또는 추가 주문력 10의 효과를 부가적으로 획득합니다.<br><br>적 챔피언 처치 관여 시마다 감시 중첩 1회를 얻습니다.</span>" alt="시야 수집">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8135.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>굶주린 사냥꾼</b><br><span>스킬로 입힌 피해량의 일부만큼 체력을 회복합니다.<br>체력 회복량: 1.5% + <i>현상금 사냥꾼</i> 중첩 1회당 2.5% <br><br>각 적 챔피언을 처치하는 데 처음으로 관여할 때마다 <i>현상금 사냥꾼</i> 중첩을 얻을 수 있습니다.<br><rules><br>광역 스킬의 경우 체력 회복 효과가 1/3로 감소합니다.</rules></span>" alt="굶주린 사냥꾼">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8134.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>영리한 사냥꾼</b><br><span><b>사용 아이템 재사용 대기시간 감소</b> 효과를 15% + <i>현상금 사냥꾼</i> 중첩 1회당 5%만큼 얻습니다. (장신구 포함)<br><br>각 적 챔피언을 처치하는 데 처음으로 관여할 때마다 <i>현상금 사냥꾼</i> 중첩을 얻을 수 있습니다.</span>" alt="영리한 사냥꾼">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8105.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>끈질긴 사냥꾼</b><br><span><b>전투에서 벗어나 있을 때 이동 속도</b>가 10 + <i>현상금 사냥꾼</i> 중첩 1회당 9만큼 증가합니다.<br><br>각 적 챔피언을 처치하는 데 처음으로 관여할 때마다 <i>현상금 사냥꾼</i> 중첩을 얻을 수 있습니다.</span>" alt="끈질긴 사냥꾼">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8106.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>궁극의 사냥꾼</b><br><span>궁극기에 5%의 <b>재사용 대기시간 감소</b>효과가 적용되고 <i>현상금 사냥꾼</i> 중첩 1회당 4%씩 추가로 감소합니다.<br><br>각 적 챔피언을 처치하는 데 처음으로 관여할 때마다 <i>현상금 사냥꾼</i> 중첩을 얻을 수 있습니다.</span>" alt="궁극의 사냥꾼">
													</div>
					</div>
							</div>
			</div>
													
													</c:if>
													
													<!-- 마법 -->	
													<c:if test="${RunList.get(1).perkPrimaryStyle eq 8200}">
													
													<div class="perk-page">
		<div class="perk-page__row">
			<div class="perk-page__item perk-page__item--mark">
				<img src="//opgg-static.akamaized.net/images/lol/perkStyle/8200.png?image=q_auto&amp;v=1576566284" class="perk-page__image tip tpd-delegation-uid-1" title="">
			</div>
		</div>
								<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8214.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="콩콩이 소환">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8229.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="신비로운 유성">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8230.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="난입">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8224.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>무효화 구체</b><br><span>마법 피해를 받아 체력이 30% 이하가 될 경우, 4초 동안 레벨에 비례해 40 ~ 120 (<scaleAP>+주문력의 0.1</scaleAP> 및 <scaleAD>+추가 공격력의 0.15</scaleAD>)의 마법 피해를 흡수하는 보호막이 생성됩니다.<br><br>재사용 대기시간: 60초</span>" alt="무효화 구체">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8226.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>마나순환 팔찌</b><br><span>적 챔피언에게 스킬을 적중하면 최대 마나가 영구적으로 25만큼 증가합니다. (최대 마나량: 250)<br><br>최대 마나량 250에 도달하면 5초마다 잃은 마나의 1%를 회복합니다.<br><br>재사용 대기시간: 15초</span>" alt="마나순환 팔찌">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8275.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="빛의 망토">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8210.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>깨달음</b><br><span>10레벨에 도달하면 재사용 대기시간이 10% 감소합니다.<br><br>재사용 대기시간 감소 최대치 초과분 1%당 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword>으로 추가 공격력 1.2 또는 추가 주문력 2 효과로 전환됩니다.</span>" alt="깨달음">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8234.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="기민함">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8233.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="절대 집중">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8237.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="주문 작열">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8232.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="물 위를 걷는 자">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8236.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>폭풍의 결집</b><br><span>10분마다 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword>으로 주문력 또는 공격력을 얻습니다.<br><br><i>10분</i>: + 주문력 8 또는 공격력 5 <br><i>20분</i>: + 주문력 24 또는 공격력 14<br><i>30분</i>: + 주문력 48 또는 공격력 29<br><i>40분</i>: + 주문력 80 또는 공격력 48<br><i>50분</i>: + 주문력 120 또는 공격력 72<br><i>60분</i>: + 주문력 168 또는 공격력 101<br>등등...</span>" alt="폭풍의 결집">
													</div>
					</div>
							</div>
			</div>
													
													</c:if>
													
													
													<!-- 결의 -->
													<c:if test="${RunList.get(1).perkPrimaryStyle eq 8400}">
													
													<div class="perk-page">
		<div class="perk-page__row">
			<div class="perk-page__item perk-page__item--mark">
				<img src="//opgg-static.akamaized.net/images/lol/perkStyle/8400.png?image=q_auto&amp;v=1576566284" class="perk-page__image tip" title="<b style='color: #ffc659'>결의</b><br><span>내구력 및 군중 제어</span>">
			</div>
		</div>
								<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8437.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>착취의 손아귀</b><br><span>전투 중 4초마다 챔피언에 대한 기본 공격 시 다음 효과를 얻습니다.<li>자신 최대 체력의 4%에 해당하는 추가 마법 피해</li><li>자신 최대 체력의 2%에 해당하는 체력 회복</li><li>영구적으로 체력 5 증가</li><br><rules><i>원거리 챔피언:</i> 피해량, 회복량, 체력 영구 증가량이 40% 감소합니다.</rules><br></span>" alt="착취의 손아귀">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8439.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>여진</b><br><span>적을 이동 불가 상태로 만들면 2.5초 동안 35+추가 방어력 및 마법 저항력의 80%만큼 방어력과 마법 저항력이 증가하며 폭발이 일어나 근처 적에게 마법 피해를 줍니다.<br><br>피해량: 25~120 (+추가 체력의 8%)<br>재사용 대기시간: 20초<br><br>여진 추가 저항력: 80~150 (레벨에 비례)<br></span>" alt="여진">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8465.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>수호자</b><br><span>자신으로부터 175유닛 내에 있는 아군이나 자신이 스킬의 대상으로 삼은 아군을 2.5초 동안 <i>보호</i>합니다. <i>보호</i>하는 중 자신과 아군 중 한 명이 피해를 입으면 둘 모두에게 보호막이 생성되며 이동 속도가 1.5초 동안 빨라집니다.<br><br>재사용 대기시간: <scaleLevel>70~40</scaleLevel>초<br>보호막 흡수량: <scaleLevel>70~150</scaleLevel> + 주문력의 <scaleAP>25%</scaleAP> + 추가 체력의 <scalehealth>12%</scalehealth><br>이동 속도 증가: +20%</span>" alt="수호자">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8446.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>철거</b><br><span>포탑으로부터 600 범위 안에 있을 경우 3초에 걸쳐 포탑에 대한 강력한 공격을 충전합니다. 충전된 공격은 100(+최대 체력의 35%)에 해당하는 추가 물리 피해를 입힙니다. <br><br>재사용 대기시간: 45초</span>" alt="철거">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8463.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>생명의 샘</b><br><span>적 챔피언의 이동을 방해하면 4초 동안 표식을 남깁니다.<br><br>표식이 남겨진 적을 공격하는 아군 챔피언은 2초에 걸쳐 5 + 나의 최대 체력의 1%에 해당하는 체력을 회복합니다. </span>" alt="생명의 샘">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8401.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>보호막 강타</b><br><span>보호막이 지속되는 동안 레벨에 따라 <scaleLevel>1~10</scaleLevel>의 방어력과 마법 저항력을 얻습니다.<br><br>새로운 보호막을 얻으면 적 챔피언에게 다음 기본 공격 시 <scaleLevel>5~30</scaleLevel><scaleHealth>(+추가 체력의 1.5%)</scaleHealth><scaleMana>(+새로운 보호막 흡수량의 8.5%)</scaleMana>에 해당하는 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword> 피해를 입힙니다.<br><br>이 효과는 보호막이 사라진 후 최대 2초까지 발동 가능합니다.</span>" alt="보호막 강타">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8429.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>사전 준비</b><br><span>10분 후 방어력 +9 및 마법 저항력 +9 증가와 동시에 방어력 및 마법 저항력 5% 증가</span>" alt="사전 준비">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8444.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>재생의 바람</b><br><span>적 챔피언에게 피해를 입으면 10초 동안 잃은 체력의 4% + 6만큼 회복합니다.</span>" alt="재생의 바람">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8473.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>뼈 방패</b><br><span>적 챔피언으로부터 피해를 입은 뒤 해당 적이 가하는 3회의 스킬 및 기본 공격으로부터 30~60만큼 피해를 덜 받습니다.<br><br><br>지속시간: 1.5초<br>재사용 대기시간: 45초</span>" alt="뼈 방패">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8451.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>과잉성장</b><br><span>근처에서 몬스터 또는 적 미니언이 8마리 죽을 때마다 생명의 정수를 흡수해 최대 체력이 영구적으로 3씩 증가합니다.<br><br>몬스터 또는 적 미니언을 120마리 흡수하면 최대 체력이 추가로 3.5% 증가합니다.</span>" alt="과잉성장">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8453.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>소생</b><br><span>자신이 사용하거나 받는 회복과 보호막 효과가 5% 강화됩니다. 체력이 40% 이하인 대상에게는 이 효과가 10% 증가합니다.</span>" alt="소생">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8242.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>불굴의 의지</b><br><span>소환사 주문을 사용한 후 10초 동안 15%의 강인함 및 둔화 저항을 추가로 얻습니다. 또한 소환사 주문이 재사용 대기 상태가 될 때마다 강인함 및 둔화 저항이 10% 증가합니다. </span>" alt="불굴의 의지">
													</div>
					</div>
							</div>
			</div>
													
													</c:if>
													
													
													<!-- 영감 -->
													<c:if test="${RunList.get(1).perkPrimaryStyle eq 8300}">
													
													<div class="perk-page">
		<div class="perk-page__row">
			<div class="perk-page__item perk-page__item--mark">
				<img src="//opgg-static.akamaized.net/images/lol/perkStyle/8300.png?image=q_auto&amp;v=1576566284" class="perk-page__image tip tpd-delegation-uid-1" title="">
			</div>
		</div>
								<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8351.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>빙결 강화</b><br><span>적 챔피언을 기본 공격하면 2초 동안 둔화시킵니다. 둔화 효과는 지속시간 동안 강화됩니다.<li><i>원거리 공격</i>: 최대 30% ~ 40% 둔화</li> <li><i>근접 공격</i>: 최대 45% ~ 55% 둔화</li><br>사용 아이템으로 적 챔피언을 둔화시키면 빙결 광선을 발사해서 주변 지역을 5초 동안 얼립니다. 해당 범위의 모든 유닛은 60% 둔화됩니다.<br><br>재사용 대기시간: 유닛당 7 ~ 4초</span>" alt="빙결 강화">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8360.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="봉인 풀린 주문서">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--keystone perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8358.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="프로토타입: 만능의 돌">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8306.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>마법공학 점멸기</b><br><span>점멸이 재사용 대기 중일 때 <i>마법공학 점멸</i>로 대체됩니다.<br><br><i>마법공학 점멸</i>: 2초간 정신을 집중한 뒤 다른 지점으로 도약합니다.<br><br>재사용 대기시간: 20초. 챔피언과 전투에 돌입할 경우 10초의 재사용 대기시간이 시작됩니다.</span>" alt="마법공학 점멸기">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8304.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>마법의 신발</b><br><span>게임 시작 12분 후 약간 신비한 장화 아이템을 얻습니다. 그 전까지는 신발류 아이템을 구매할 수 없습니다. 챔피언 처치에 관여할 때마다 장화 획득 시점이 45초씩 앞당겨집니다.<br><br>약간 신비한 장화 보유 시 이동 속도가 +10 증가합니다.</span>" alt="마법의 신발">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8313.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>완벽한 타이밍</b><br><span>게임 시작 시 초시계 키트 아이템을 받습니다. 이 아이템은 10분 후 초시계 아이템으로 변합니다. 초시계 아이템은 단 한 번 사용할 수 있으며, 사용 시 경직 효과를 얻습니다.<br><br>존야의 모래시계, 수호 천사, 가고일 돌갑옷의 재사용 대기시간이 15% 감소합니다.</span>" alt="완벽한 타이밍">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8321.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>외상</b><br><span>외상으로 아이템을 구입할 수 있습니다. 외상 한도는 점차 증가합니다.<br><br>외상 비용: 50골드</span>" alt="외상">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8316.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>미니언 해체분석기</b><br><span>게임 시작 시, 공격로 미니언을 즉시 처치하고 흡수하는 미니언 해체분석기 3개를 받습니다. 미니언 해체분석기 아이템은 게임 시작 후 180초 동안 재사용 대기 상태입니다.<br><br>이 아이템으로 미니언을 흡수하면 이후 동일한 종류의 미니언을 대상으로 6%의 추가 피해를 입히며, 동일한 종류의 미니언을 추가 흡수 시마다 3%의 추가 피해를 입힙니다.<br></span>" alt="미니언 해체분석기">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8345.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>비스킷 배달</b><br><span>비스킷 배달: 6분까지 2분마다 굳건한 의지의 완전한 비스킷 아이템을 얻습니다.<br><br>비스킷을 사용하면 잃은 체력과 마나의 10%를 회복합니다. 비스킷 하나를 사용하거나 판매하면 최대 마나가 영구적으로 50만큼 늘어납니다. <br><br><i>마나 없음:</i> 마나가 없는 챔피언은 마나 대신 잃은 체력의 12%를 회복합니다.</span>" alt="비스킷 배달">
													</div>
					</div>
							</div>
								<div class="perk-page__row">
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8347.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>우주적 통찰력</b><br><span>재사용 대기시간 감소 +5%<br>최대 재사용 대기시간 감소 +5%<br>소환사 주문 재사용 대기시간 감소 +5%<br>아이템 재사용 대기시간 감소 +5%</span>" alt="우주적 통찰력">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8410.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>쾌속 접근</b><br><span>적 챔피언에게 이동 방해기를 맞히고 해당 적에게 이동할 때, 또는 이동 방해기에 맞은 근처의 아군 챔피언에게 이동할 때 이동 속도가 15% 증가합니다. <br><br>범위: 1000</span>" alt="쾌속 접근">
													</div>
					</div>
									<div class="perk-page__item  perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8352.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>시간 왜곡 물약</b><br><span>물약이나 비스킷을 사용하면 체력이나 마나 회복량의 50%를 즉시 회복하지만, 해당 소모품에 짧은 재사용 대기시간이 적용됩니다. 또한 물약이나 비스킷의 효과가 지속되는 동안 이동 속도가 5% 증가합니다.<br><br>재사용 대기시간: 해당 소모품의 지속시간과 동일합니다.</span>" alt="시간 왜곡 물약">
													</div>
					</div>
							</div>
			</div>
													
													</c:if>
													
													
													<div class="page-divider"></div>
													
													
													<!-- SubPerk -->
													
													
						 							<!-- 지배 -->
						 							<c:if test="${RunList.get(1).perkSubStyle eq 8100}">
						 							
													<div class="perk-page">
														<div class="perk-page__row">
															<div class="perk-page__item perk-page__item--mark">
																<img
																	src="//opgg-static.akamaized.net/images/lol/perkStyle/8100.png?image=q_auto&amp;v=1576566284"
																	class="perk-page__image tip"
																	title="&lt;b style=&#039;color: #ffc659&#039;&gt;지배&lt;/b&gt;&lt;br&gt;&lt;span&gt;강력한 피해와 빠른 접근&lt;/span&gt;">
															</div>
														</div>
														<div class="perk-page__row">
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8126.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;비열한 한 방&lt;/b&gt;&lt;br&gt;&lt;span&gt;&lt;b&gt;이동 또는 행동을 방해받은&lt;/b&gt; 상태의 챔피언에게 피해를 주면 레벨에 따라 10 ~ 45의 추가 고정 피해를 입힙니다.&lt;br&gt;&lt;br&gt;재사용 대기시간: 4초&lt;br&gt;&lt;rules&gt;방해 효과 이후 피해를 가할 때 활성화됩니다.&lt;/rules&gt;&lt;/span&gt;"
																		alt="비열한 한 방">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8139.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;피의 맛&lt;/b&gt;&lt;br&gt;&lt;span&gt;적 챔피언에게 피해를 입히면 체력을 회복합니다.&lt;br&gt;&lt;br&gt;회복량: 18 ~ 35 (+추가 공격력의 0.2, +주문력의 0.1) (레벨에 비례)&lt;br&gt;&lt;br&gt;재사용 대기시간: 20초&lt;/span&gt;"
																		alt="피의 맛">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8143.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;돌발 일격&lt;/b&gt;&lt;br&gt;&lt;span&gt;돌진, 도약, 점멸, 순간이동을 사용하거나 은신에서 빠져나온 뒤 적 챔피언에게 피해를 주면 5초 동안 7의 물리 관통력과 6의 마법 관통력을 얻습니다.&lt;br&gt;&lt;br&gt;재사용 대기시간: 4초&lt;/span&gt;"
																		alt="돌발 일격">
																</div>
															</div>
														</div>
														<div class="perk-page__row">
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8136.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;좀비 와드&lt;/b&gt;&lt;br&gt;&lt;span&gt;적 와드 &lt;lol-uikit-tooltipped-keyword key=&#039;LinkTooltip_Description_Takedown&#039;&gt;파괴 관여&lt;/lol-uikit-tooltipped-keyword&gt; 시 그 자리에 아군 좀비 와드가 생성됩니다.&lt;br&gt;&lt;br&gt;좀비 와드가 생성될 때마다 최대 10회까지 중첩되는 &lt;lol-uikit-tooltipped-keyword key=&#039;LinkTooltip_Description_Adaptive&#039;&gt;&lt;font color=&#039;#48C4B7&#039;&gt;적응형&lt;/font&gt;&lt;/lol-uikit-tooltipped-keyword&gt;으로 추가 공격력 1.2 또는 추가 주문력 2의 효과를 얻습니다. &lt;br&gt;&lt;br&gt;좀비 와드를 10개 생성하면 10의 적응형 능력치를 부가적으로 획득합니다.&lt;br&gt;&lt;br&gt;좀비 와드는 적이 볼 수 있고 120초 동안 유지되며, 설치 가능 와드 수에 영향을 주지 않습니다.&lt;/span&gt;"
																		alt="좀비 와드">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8120.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;유령 포로&lt;/b&gt;&lt;br&gt;&lt;span&gt;자신이 설치한 와드의 지속시간이 끝나면 유령 포로 와드가 남아 60초 동안 시야를 밝힙니다. 적 챔피언이 근처에 오면 유령 포로 와드를 몰아낼 수 있습니다.&lt;br&gt;&lt;br&gt;유령 포로 와드가 생성되거나 유령 포로 와드가 적 챔피언을 발견할 때마다 최대 10회까지 중첩되는 &lt;lol-uikit-tooltipped-keyword key=&#039;LinkTooltip_Description_Adaptive&#039;&gt;&lt;font color=&#039;#48C4B7&#039;&gt;적응형&lt;/font&gt;&lt;/lol-uikit-tooltipped-keyword&gt;으로 추가 공격력 1.2 또는 추가 주문력 2의 효과를 얻습니다. &lt;br&gt;&lt;br&gt;10회 중첩되면 10의 적응형 능력치를 부가적으로 획득합니다.&lt;/span&gt;"
																		alt="유령 포로">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8138.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;시야 수집&lt;/b&gt;&lt;br&gt;&lt;span&gt;챔피언 처치에 관여하면 감시 중첩을 얻습니다. 감시 중첩 하나당 &lt;lol-uikit-tooltipped-keyword key=&#039;LinkTooltip_Description_Adaptive&#039;&gt;&lt;font color=&#039;#48C4B7&#039;&gt;적응형&lt;/font&gt;&lt;/lol-uikit-tooltipped-keyword&gt;으로 추가 공격력 0.6 또는 추가 주문력 1의 효과를 얻습니다. &lt;br&gt;&lt;br&gt;감시 중첩이 최대치인 20회에 도달하면 &lt;lol-uikit-tooltipped-keyword key=&#039;LinkTooltip_Description_Adaptive&#039;&gt;&lt;font color=&#039;#48C4B7&#039;&gt;적응형&lt;/font&gt;&lt;/lol-uikit-tooltipped-keyword&gt;으로 추가 공격력 6 또는 추가 주문력 10의 효과를 부가적으로 획득합니다.&lt;br&gt;&lt;br&gt;적 챔피언 처치 관여 시마다 감시 중첩 2회를 얻습니다.&lt;/span&gt;"
																		alt="시야 수집">
																</div>
															</div>
														</div>
														<div class="perk-page__row">
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8135.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;굶주린 사냥꾼&lt;/b&gt;&lt;br&gt;&lt;span&gt;스킬로 입힌 피해량의 일부만큼 체력을 회복합니다.&lt;br&gt;체력 회복량: 1.5% + &lt;i&gt;현상금 사냥꾼&lt;/i&gt; 중첩 1회당 2.5% &lt;br&gt;&lt;br&gt;각 적 챔피언을 처치하는 데 처음으로 관여할 때마다 &lt;i&gt;현상금 사냥꾼&lt;/i&gt; 중첩을 얻을 수 있습니다.&lt;br&gt;&lt;rules&gt;&lt;br&gt;광역 스킬의 경우 체력 회복 효과가 1/3로 감소합니다.&lt;/rules&gt;&lt;/span&gt;"
																		alt="굶주린 사냥꾼">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8134.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;영리한 사냥꾼&lt;/b&gt;&lt;br&gt;&lt;span&gt;&lt;b&gt;사용 아이템 재사용 대기시간 감소&lt;/b&gt; 효과를 15% + &lt;i&gt;현상금 사냥꾼&lt;/i&gt; 중첩 1회당 5%만큼 얻습니다. (장신구 포함)&lt;br&gt;&lt;br&gt;각 적 챔피언을 처치하는 데 처음으로 관여할 때마다 &lt;i&gt;현상금 사냥꾼&lt;/i&gt; 중첩을 얻을 수 있습니다.&lt;/span&gt;"
																		alt="영리한 사냥꾼">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8105.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;끈질긴 사냥꾼&lt;/b&gt;&lt;br&gt;&lt;span&gt;&lt;b&gt;전투에서 벗어나 있을 때 이동 속도&lt;/b&gt;가 10 + &lt;i&gt;현상금 사냥꾼&lt;/i&gt; 중첩 1회당 9만큼 증가합니다.&lt;br&gt;&lt;br&gt;각 적 챔피언을 처치하는 데 처음으로 관여할 때마다 &lt;i&gt;현상금 사냥꾼&lt;/i&gt; 중첩을 얻을 수 있습니다.&lt;/span&gt;"
																		alt="끈질긴 사냥꾼">
																</div>
															</div>
															<div class="perk-page__item perk-page__item--active">
																<div class="perk-page__image">
																	<img
																		src="//opgg-static.akamaized.net/images/lol/perk/8106.png?image=e_grayscale"
																		class="tip"
																		title="&lt;b style=&#039;color: #ffc659&#039;&gt;궁극의 사냥꾼&lt;/b&gt;&lt;br&gt;&lt;span&gt;궁극기에 5%의 &lt;b&gt;재사용 대기시간 감소&lt;/b&gt;효과가 적용되고 &lt;i&gt;현상금 사냥꾼&lt;/i&gt; 중첩 1회당 4%씩 추가로 감소합니다.&lt;br&gt;&lt;br&gt;각 적 챔피언을 처치하는 데 처음으로 관여할 때마다 &lt;i&gt;현상금 사냥꾼&lt;/i&gt; 중첩을 얻을 수 있습니다.&lt;/span&gt;"
																		alt="궁극의 사냥꾼">
																</div>
															</div>
														</div>
													</div>
													
													</c:if>
													
													
													<!-- 마법 -->
													<c:if test="${RunList.get(1).perkSubStyle eq 8200}">
													
													<div class="perk-page">
		<div class="perk-page__row">
			<div class="perk-page__item perk-page__item--mark">
				<img src="//opgg-static.akamaized.net/images/lol/perkStyle/8200.png?image=q_auto&amp;v=1576566284" class="perk-page__image tip tpd-delegation-uid-1" title="">
			</div>
		</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8224.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="무효화 구체">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8226.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="마나순환 팔찌">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8275.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>빛의 망토</b><br><span>소환사 주문 사용 후 2.5초 동안 이동 속도가 증가하며 유닛을 통과할 수 있습니다.<br><br>증가: 소환사 주문 재사용 대기시간에 따라 이동 속도가 15%~35% 증가합니다. (재사용 대기시간이 길수록 이동 속도가 더 많이 증가합니다.) </span>" alt="빛의 망토">
													</div>
					</div>
							</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8210.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="깨달음">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8234.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="기민함">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8233.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>절대 집중</b><br><span>체력이 70% 이상일 경우 레벨에 따라 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword>으로 추가 공격력 최대 18 또는 추가 주문력 최대 30의 효과를 얻습니다. <br><br>1레벨에 1.8의 공격력 또는 3의 주문력을 얻습니다. </span>" alt="절대 집중">
													</div>
					</div>
							</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8237.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>주문 작열</b><br><span>다음 공격 스킬 적중 시 챔피언에게 불을 붙여 1초 후 레벨에 따라 15~35의 추가 마법 피해를 줍니다.<br><br>재사용 대기시간: 10초</span>" alt="주문 작열">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8232.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="물 위를 걷는 자">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8236.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="폭풍의 결집">
													</div>
					</div>
							</div>
			</div>
													
													</c:if>
													
													<!-- 영감 -->
													<c:if test="${RunList.get(1).perkSubStyle eq 8300}">
													
													<div class="perk-page">
		<div class="perk-page__row">
			<div class="perk-page__item perk-page__item--mark">
				<img src="//opgg-static.akamaized.net/images/lol/perkStyle/8300.png?image=q_auto&amp;v=1576566284" class="perk-page__image tip" title="<b style='color: #ffc659'>영감</b><br><span>다양한 방식의 전투 보조</span>">
			</div>
		</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8306.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>마법공학 점멸기</b><br><span>점멸이 재사용 대기 중일 때 <i>마법공학 점멸</i>로 대체됩니다.<br><br><i>마법공학 점멸</i>: 2초간 정신을 집중한 뒤 다른 지점으로 도약합니다.<br><br>재사용 대기시간: 20초. 챔피언과 전투에 돌입할 경우 10초의 재사용 대기시간이 시작됩니다.</span>" alt="마법공학 점멸기">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8304.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>마법의 신발</b><br><span>게임 시작 12분 후 약간 신비한 장화 아이템을 얻습니다. 그 전까지는 신발류 아이템을 구매할 수 없습니다. 챔피언 처치에 관여할 때마다 장화 획득 시점이 45초씩 앞당겨집니다.<br><br>약간 신비한 장화 보유 시 이동 속도가 +10 증가합니다.</span>" alt="마법의 신발">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8313.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="완벽한 타이밍">
													</div>
					</div>
							</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8321.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>외상</b><br><span>외상으로 아이템을 구입할 수 있습니다. 외상 한도는 점차 증가합니다.<br><br>외상 비용: 50골드</span>" alt="외상">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8316.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="미니언 해체분석기">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8345.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>비스킷 배달</b><br><span>비스킷 배달: 6분까지 2분마다 굳건한 의지의 완전한 비스킷 아이템을 얻습니다.<br><br>비스킷을 사용하면 잃은 체력과 마나의 10%를 회복합니다. 비스킷 하나를 사용하거나 판매하면 최대 마나가 영구적으로 50만큼 늘어납니다. <br><br><i>마나 없음:</i> 마나가 없는 챔피언은 마나 대신 잃은 체력의 12%를 회복합니다.</span>" alt="비스킷 배달">
													</div>
					</div>
							</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8347.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>우주적 통찰력</b><br><span>재사용 대기시간 감소 +5%<br>최대 재사용 대기시간 감소 +5%<br>소환사 주문 재사용 대기시간 감소 +5%<br>아이템 재사용 대기시간 감소 +5%</span>" alt="우주적 통찰력">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8410.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>쾌속 접근</b><br><span>적 챔피언에게 이동 방해기를 맞히고 해당 적에게 이동할 때, 또는 이동 방해기에 맞은 근처의 아군 챔피언에게 이동할 때 이동 속도가 15% 증가합니다. <br><br>범위: 1000</span>" alt="쾌속 접근">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8352.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="시간 왜곡 물약">
													</div>
					</div>
							</div>
			</div>
													
													</c:if>
													
													
													<!-- 정밀 -->
													<c:if test="${RunList.get(1).perkSubStyle eq 8000}">
													
													<div class="perk-page">
		<div class="perk-page__row">
			<div class="perk-page__item perk-page__item--mark">
				<img src="//opgg-static.akamaized.net/images/lol/perkStyle/8000.png?image=q_auto&amp;v=1576566284" class="perk-page__image tip tpd-delegation-uid-1" title="">
			</div>
		</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/9101.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>과다치유</b><br><span>자신에 대한 체력 회복 초과분이 보호막으로 전환됩니다. 보호막은 10<scaleHealth>(+최대 체력의 10%)</scaleHealth>에 해당하는 피해까지 흡수할 수 있습니다.<br><br>보호막 전환율은 자신 또는 아군으로부터의 체력 회복 초과분의 20~100%입니다.</span>" alt="과다치유">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/9111.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="승전보">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8009.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="침착">
													</div>
					</div>
							</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/9104.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="전설: 민첩함">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/9105.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="전설: 강인함">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/9103.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="전설: 핏빛 길">
													</div>
					</div>
							</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8014.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="최후의 일격">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8017.png?image=e_grayscale" class="tip tpd-delegation-uid-1" title="" alt="체력차 극복">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8299.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>최후의 저항</b><br><span>체력이 60% 이하일 때 적 챔피언 공격 시 5% ~ 11%의 추가 피해를 줍니다. 체력이 30%일 때 최대 피해량에 도달합니다.</span>" alt="최후의 저항">
													</div>
					</div>
							</div>
			</div>
													
													</c:if>
													
													
													<!-- 결의 -->
													<c:if test="${RunList.get(1).perkSubStyle eq 8400}">
													
													<div class="perk-page">
		<div class="perk-page__row">
			<div class="perk-page__item perk-page__item--mark">
				<img src="//opgg-static.akamaized.net/images/lol/perkStyle/8400.png?image=q_auto&amp;v=1576566284" class="perk-page__image tip" title="<b style='color: #ffc659'>결의</b><br><span>내구력 및 군중 제어</span>">
			</div>
		</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8446.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>철거</b><br><span>포탑으로부터 600 범위 안에 있을 경우 3초에 걸쳐 포탑에 대한 강력한 공격을 충전합니다. 충전된 공격은 100(+최대 체력의 35%)에 해당하는 추가 물리 피해를 입힙니다. <br><br>재사용 대기시간: 45초</span>" alt="철거">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8463.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>생명의 샘</b><br><span>적 챔피언의 이동을 방해하면 4초 동안 표식을 남깁니다.<br><br>표식이 남겨진 적을 공격하는 아군 챔피언은 2초에 걸쳐 5 + 나의 최대 체력의 1%에 해당하는 체력을 회복합니다. </span>" alt="생명의 샘">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8401.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>보호막 강타</b><br><span>보호막이 지속되는 동안 레벨에 따라 <scaleLevel>1~10</scaleLevel>의 방어력과 마법 저항력을 얻습니다.<br><br>새로운 보호막을 얻으면 적 챔피언에게 다음 기본 공격 시 <scaleLevel>5~30</scaleLevel><scaleHealth>(+추가 체력의 1.5%)</scaleHealth><scaleMana>(+새로운 보호막 흡수량의 8.5%)</scaleMana>에 해당하는 추가 <lol-uikit-tooltipped-keyword key='LinkTooltip_Description_Adaptive'><font color='#48C4B7'>적응형</font></lol-uikit-tooltipped-keyword> 피해를 입힙니다.<br><br>이 효과는 보호막이 사라진 후 최대 2초까지 발동 가능합니다.</span>" alt="보호막 강타">
													</div>
					</div>
							</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8429.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>사전 준비</b><br><span>10분 후 방어력 +9 및 마법 저항력 +9 증가와 동시에 방어력 및 마법 저항력 5% 증가</span>" alt="사전 준비">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8444.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>재생의 바람</b><br><span>적 챔피언에게 피해를 입으면 10초 동안 잃은 체력의 4% + 6만큼 회복합니다.</span>" alt="재생의 바람">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8473.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>뼈 방패</b><br><span>적 챔피언으로부터 피해를 입은 뒤 해당 적이 가하는 3회의 스킬 및 기본 공격으로부터 30~60만큼 피해를 덜 받습니다.<br><br><br>지속시간: 1.5초<br>재사용 대기시간: 45초</span>" alt="뼈 방패">
													</div>
					</div>
							</div>
					<div class="perk-page__row">
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8451.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>과잉성장</b><br><span>근처에서 몬스터 또는 적 미니언이 8마리 죽을 때마다 생명의 정수를 흡수해 최대 체력이 영구적으로 3씩 증가합니다.<br><br>몬스터 또는 적 미니언을 120마리 흡수하면 최대 체력이 추가로 3.5% 증가합니다.</span>" alt="과잉성장">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8453.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>소생</b><br><span>자신이 사용하거나 받는 회복과 보호막 효과가 5% 강화됩니다. 체력이 40% 이하인 대상에게는 이 효과가 10% 증가합니다.</span>" alt="소생">
													</div>
					</div>
									<div class="perk-page__item perk-page__item--active">
						<div class="perk-page__image">
															<img src="//opgg-static.akamaized.net/images/lol/perk/8242.png?image=e_grayscale" class="tip" title="<b style='color: #ffc659'>불굴의 의지</b><br><span>소환사 주문을 사용한 후 10초 동안 15%의 강인함 및 둔화 저항을 추가로 얻습니다. 또한 소환사 주문이 재사용 대기 상태가 될 때마다 강인함 및 둔화 저항이 10% 증가합니다. </span>" alt="불굴의 의지">
													</div>
					</div>
							</div>
			</div>
													
													</c:if>
													
													<div class="page-divider"></div>
													
													<!-- statPerk -->
													<div class="fragment-page">
														<div class="fragment__detail">
															<!-- statPerk 시작-->
															<div class="fragment__row" id="statPerk3">
															
															
																<div class="fragment">
																
																
																
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5008.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;OFFENSE&lt;/b&gt;&lt;br&gt;&lt;span&gt;적응형 능력치 +9&lt;/span&gt;"
																			alt="OFFENSE">
																	</div>
																</div>
																<div class="fragment">
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5005.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;OFFENSE&lt;/b&gt;&lt;br&gt;&lt;span&gt;공격속도 +10%&lt;/span&gt;"
																			alt="OFFENSE">
																	</div>
																</div>
																<div class="fragment">
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5007.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;OFFENSE&lt;/b&gt;&lt;br&gt;&lt;span&gt;재사용 대기시간 감소 +1 ~ 10% (레벨에 비례)&lt;/span&gt;"
																			alt="OFFENSE">
																	</div>
																</div>
															</div>
															<div class="fragment__row"  id="statPerk4">
																<div class="fragment">
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5008.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;OFFENSE&lt;/b&gt;&lt;br&gt;&lt;span&gt;적응형 능력치 +9&lt;/span&gt;"
																			alt="OFFENSE">
																	</div>
																</div>
																<div class="fragment">
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5002.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;FLEX&lt;/b&gt;&lt;br&gt;&lt;span&gt;방어력 +6&lt;/span&gt;"
																			alt="FLEX">
																	</div>
																</div>
																<div class="fragment">
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5003.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;FLEX&lt;/b&gt;&lt;br&gt;&lt;span&gt;마법저항력 +8&lt;/span&gt;"
																			alt="FLEX">
																	</div>
																</div>
															</div>
															<div class="fragment__row"  id="statPerk5">
																<div class="fragment">
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5001.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;DEFENSE&lt;/b&gt;&lt;br&gt;&lt;span&gt;체력 +15 ~ 90 (레벨에 비례)&lt;/span&gt;"
																			alt="DEFENSE">
																	</div>
																</div>
																<div class="fragment">
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5002.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;FLEX&lt;/b&gt;&lt;br&gt;&lt;span&gt;방어력 +6&lt;/span&gt;"
																			alt="FLEX">
																	</div>
																</div>
																<div class="fragment">
																	<div class="perk-page__image">
																		<img
																			src="//opgg-static.akamaized.net/images/lol/perkShard/5003.png?image=e_grayscale"
																			class="active tip"
																			title="&lt;b style=&#039;color: #ffc659&#039;&gt;FLEX&lt;/b&gt;&lt;br&gt;&lt;span&gt;마법저항력 +8&lt;/span&gt;"
																			alt="FLEX">
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												
											</td>
											<td
												class="champion-overview__stats champion-overview__stats--pick">
												<span class="pick-ratio__text">픽률</span> <strong>${RunList.get(0).pickRate}%</strong>
												 <span class="win-ratio__text">승률</span>
												<strong>${RunList.get(0).odds}%</strong>
												<br /><br /><br />
												<hr style="border: 1px solid rgba(0, 0, 0, 0.1);">
												<br /><br /><br />
												<span class="pick-ratio__text">픽률</span> <strong>${RunList.get(1).pickRate}%</strong>
												 <span class="win-ratio__text">승률</span>
												<strong>${RunList.get(1).odds}%</strong>
											</td>
										
											
											<td></td>
										</tr>
											
									</tbody>
								
								
								
								
								</table>
							</div>
						</div>
						<!-- 룬 끝! -->


						<!-- 챔피언팁 -->
						<div class="l-champion-statistics-content__side">
							<div class="champion-box champion-stats--tip">
								<div class="champion-box-header">
									<div class="champion-box-header__title">
										<h4>챔피언 팁</h4>
									</div>
									<div class="champion-box-header__more">
										<a href="/champion/graves/jungle/comment"
											class="champion-box-header__link"> <img
											src="https://img.icons8.com/nolan/40/info.png" alt="더보기"
											style="position: absolute; left: -15px; top: 0px;"></a>
									</div>
								</div>
								<div class="champion-box-content">
									<c:forEach items="${list }" var="list">
										<div class="champion-stats-summary-tip">
											<div class="champion-stats-summary-small-tip">
												<div class="champion-stats-summary-small-tip__author">
													제목 :${list.tipTitle }</div>
												<div class="champion-stats-summary-small-tip__message">
													작성자:${list.nickName }</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 전체메뉴바가 End -->

				<!-- 메뉴바 트렌드Start -->
				<div class="tab-pane fade" id="pills-contact" role="tabpanel"
					aria-labelledby="pills-contact-tab" >


					<div class="tabItem Content championLayout-trend"
						style="display: block;">



						<div class="champion-box champion-box--graph">
							<div class="champion-box-header">
								<div class="champion-box-header__title">
									<h4>${ChampChartList.get(0).CHAMPNAME} 승률</h4>
								</div>
							</div>
							<div class="champion-box-content">
								<div class="champion-stats-trend champion-stats-trend--up">
									<div class="champion-stats-trend-rank">
										<div class="champion-stats-trend-rate">10.01.ver =</div>
										 <b>${ChampChartList.get(0).PANSU }</b>판
									</div>
									<div class="champion-stats-trend-rate">${ChampChartList.get(0).ODDS} %</div>
								</div>
								<div id="Trend-Detail-WinRateGraph"
									style="width: 908px; height: 500px; margin: 0 auto;"
									data-highcharts-chart="3">
									<div class="highcharts-container" id="highcharts-16"
										style="position: relative; overflow: hidden; width: 900px; height: 500px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">

										<canvas id="speedChart"></canvas>
									
									</div>
								</div>
							</div>
						</div>
						
						
						<div class="champion-box champion-box--graph">
							<div class="champion-box-header">
								<div class="champion-box-header__title">
									<h4>${ChampChartList.get(0).CHAMPNAME} 픽률</h4>
								</div>
							</div>
							<div class="champion-box-content">
								<div class="champion-stats-trend champion-stats-trend--up">
									
									<div class="champion-stats-trend-rate">10.01.ver = ${ChampChartList.get(0).PICKPERCENT} %</div>
								</div>
								<div id="Trend-Detail-WinRateGraph"
									style="width: 908px; height: 500px; margin: 0 auto;"
									data-highcharts-chart="3">
									<div class="highcharts-container" id="highcharts-16"
										style="position: relative; overflow: hidden; width: 900px; height: 500px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">

										<canvas id="speedChart2"></canvas>
									
									</div>
								</div>
							</div>
						</div>
						
						
						<div class="champion-box champion-box--graph">
							<div class="champion-box-header">
								<div class="champion-box-header__title">
									<h4>${ChampChartList.get(0).CHAMPNAME} 밴률</h4>
								</div>
							</div>
							<div class="champion-box-content">
								<div class="champion-stats-trend champion-stats-trend--up">
									
									<div class="champion-stats-trend-rate">10.01.ver = ${benPercent.get(0).BENPERCENT }%</div>
								</div>
								<div id="Trend-Detail-WinRateGraph"
									style="width: 908px; height: 500px; margin: 0 auto;"
									data-highcharts-chart="3">
									<div class="highcharts-container" id="highcharts-16"
										style="position: relative; overflow: hidden; width: 900px; height: 500px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">

										<canvas id="speedChart3"></canvas>
									
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<!-- 메뉴바 트렌드 End -->
  
  
  
  <!-- 메뉴바 팁 게시판 시작부분 -->
 <div class="tab-pane fade" id="pills-contact2" role="tabpanel" aria-labelledby="pills-contact-tab">
     
      
      <form method="get" action="tipboard.do" style="top-margin:3em;">
         <c:if test="${!empty member }">
         <span id=tipfont1>TIP Board</span>
         <div class="button-1">
    		<div class="eff-1"></div>
         	<a class="btnsuccess" data-toggle="modal"  href="#registerModal" id="btn" style="display: block;">글쓰기</a></div>
         </c:if>
         
         <c:if test="${empty member }">
         <span id=tipfont>TIP Board</span>
         <a  class="btnsuccess" style="display:none; position: relative; left: 880px;" data-toggle="modal"  href="#registerModal" id="btn-add" >글쓰기</a>
         </c:if>
      </form>

      <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="ture">
         <div class="modal-dialog">
            <div class="modal-content" style="width: 120%; border: 4px solid rgba(0, 0, 0, 0.2); ">
               <div class="modal-header">
              	 <h5 class="modal-title" id="modal"><b>챔피언 팁 등록</b></h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #0693cd;">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
               
               <div class="champion-stats-comment-write">
      <form name="tipBoard" action="${pageContext.request.contextPath}/champion/tipBoard.do" method="post">
         <input type="text" name="tipTitle" class="form-control" placeholder="제목을 입력해주세요" maxlength="20">
         <hr />
         <input type="hidden" name="championName" class="form-control" value="${champion.name}" />
         <textarea class="champion-stats-comment-write__textarea" placeholder="이 챔피언에 대한 간단한 팁을 남겨주세요.&#13;&#10;챔피언 팁이 아닌 악성 댓글은 삭제처리됩니다." 
                 name="tipContent"  style="overflow: hidden; overflow-wrap: break-word; height: 50px; width:80%; max;"></textarea>
         <div class="champion-stats-comment-write__footer">
            <center><div class="champion-stats-comment-write__patch">★유저들에게 좋은 정보를 공유해주세요★ </div></center>
                     
                     </div>
      <center><div style="height: 50px;">
         <input type="submit" class="btnsuccess" value="등록">
      </div></center>
      </form>
   </div>
               </div>
            </div>
         </div>
      </div>
         
      
      <br />
      
      <div id="container">
         <section id="board-container" class="container">
            <table id="tbl-board" class="table table-striped table-hover">
               <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>조회수</th>
               </tr>
            </table>
             <c:out value="${pageBar}" escapeXml="false"/> 
         </section> 
      <script>
      function boardForm(){
         location.href = "${pageContext.request.contextPath}/champion/tipboardForm.do";
      }
      
      var cPage = '${ empty param.cPage ? 1 : param.cPage}';
      function tipList(){
         var championName = '${champion.name}';
         $.ajax({
            url : "${pageContext.request.contextPath}/champion/tipBoardList.do",
            data : {championName : championName, cPage : cPage},
            dataType : "json" ,
            success : function(data) {
               console.log("data 확인 : " + data);
               console.log(data);
               var $tbl = $('#tbl-board');
               $tbl.empty();
               
               $tbl.append('<tr>' +
                     '<th>번호</th>'+
                     '<th>제목</th>'+
                     '<th>작성자</th>' +
                     '<th>작성일</th>' +
                     '<th>조회수</th>' +
                  '</tr>');
               
               for(var i in data.list){
                  var $tr = $('<tr>');
                  
                  
                  $tr.append($('<td>').html(data.list[i].tipBno));
                  $tr.append($('<td>').html(data.list[i].tipTitle));
                  $tr.append($('<td>').html(data.list[i].nickName));
                  $tr.append($('<td>').html(formatDate(new Date(data.list[i].tipDate),'yyyy-MM-dd')));
                  $tr.append($('<td>').html(data.list[i].tipreadCount));
                  
                  $tbl.append($tr);
               }
               $('#board-container').children('.pagination').remove();
               $('#board-container').append(data.pageBar);
               
               loadTipViewLink();
               
            }, error : function(){
                   console.log("ajax 처리 실패");
               
            }
         });
      }
      
      var monthNames = [
           "January", "February", "March", "April", "May", "June", "July",
           "August", "September", "October", "November", "December"
         ];
         var dayOfWeekNames = [
           "Sunday", "Monday", "Tuesday",
           "Wednesday", "Thursday", "Friday", "Saturday"
         ];
         function formatDate(date, patternStr){
             if (!patternStr) {
                 patternStr = 'M/d/yyyy';
             }
             var day = date.getDate(),
                 month = date.getMonth(),
                 year = date.getFullYear(),
                 hour = date.getHours(),
                 minute = date.getMinutes(),
                 second = date.getSeconds(),
                 miliseconds = date.getMilliseconds(),
                 h = hour % 12,
                 hh = twoDigitPad(h),
                 HH = twoDigitPad(hour),
                 mm = twoDigitPad(minute),
                 ss = twoDigitPad(second),
                 aaa = hour < 12 ? 'AM' : 'PM',
                 EEEE = dayOfWeekNames[date.getDay()],
                 EEE = EEEE.substr(0, 3),
                 dd = twoDigitPad(day),
                 M = month + 1,
                 MM = twoDigitPad(M),
                 MMMM = monthNames[month],
                 MMM = MMMM.substr(0, 3),
                 yyyy = year + "",
                 yy = yyyy.substr(2, 2)
             ;
             // checks to see if month name will be used
             patternStr = patternStr
               .replace('hh', hh).replace('h', h)
               .replace('HH', HH).replace('H', hour)
               .replace('mm', mm).replace('m', minute)
               .replace('ss', ss).replace('s', second)
               .replace('S', miliseconds)
               .replace('dd', dd).replace('d', day)
               
               .replace('EEEE', EEEE).replace('EEE', EEE)
               .replace('yyyy', yyyy)
               .replace('yy', yy)
               .replace('aaa', aaa);
             if (patternStr.indexOf('MMM') > -1) {
                 patternStr = patternStr
                   .replace('MMMM', MMMM)
                   .replace('MMM', MMM);
             }
             else {
                 patternStr = patternStr
                   .replace('MM', MM)
                   .replace('M', M);
             }
             return patternStr;
         }
         function twoDigitPad(num) {
             return num < 10 ? "0" + num : num;
         }
         
         
         function loadTipViewLink() {
        	 
        	 var $tbl = $('#tbl-board');
        	 var $tr = $('#tbl-board>tr');
        	 $tr.each(function(idx, el){
        		 if(idx > 0){
	 				$(this).on("click",function(){
		 				var tipBno= $(this).children().eq(0).text();
		 				
		 				
		 				//console.log("tipBno="+tipBno);
		 				location.href = "${pageContext.request.contextPath}/champion/tipBoardView.do?no="+tipBno+"&name=${champion.name}";
		 			});    			 
        		 }
        	 })
 		};
      </script>
      
      <!-- 룬관련 스크립트 -->
      <script>
    
      

      $( document ).ready( function() {
          $('#RunePerk0').find('img[src*=${RunList.get(0).perk0}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perk/${RunList.get(0).perk0}.png');
          $('#RunePerk0').find('img[src*=${RunList.get(0).perk1}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perk/${RunList.get(0).perk1}.png');
          $('#RunePerk0').find('img[src*=${RunList.get(0).perk2}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perk/${RunList.get(0).perk2}.png');
          $('#RunePerk0').find('img[src*=${RunList.get(0).perk3}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perk/${RunList.get(0).perk3}.png');
          $('#RunePerk0').find('img[src*=${RunList.get(0).perk4}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perk/${RunList.get(0).perk4}.png');
          $('#RunePerk0').find('img[src*=${RunList.get(0).perk5}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perk/${RunList.get(0).perk5}.png');
          $('#statPerk0').find('img[src*=${RunList.get(0).statPerk0}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perkShard/${RunList.get(0).statPerk0}.png');
          $('#statPerk1').find('img[src*=${RunList.get(0).statPerk1}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perkShard/${RunList.get(0).statPerk1}.png');
          $('#statPerk2').find('img[src*=${RunList.get(0).statPerk2}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perkShard/${RunList.get(0).statPerk2}.png');
          
          $('#RunePerk1').find('img[src*=${RunList.get(1).perk0}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perk/${RunList.get(1).perk0}.png');
          $('#RunePerk1').find('img[src*=${RunList.get(1).perk1}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perk/${RunList.get(1).perk1}.png');
          $('#RunePerk1').find('img[src*=${RunList.get(1).perk2}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perk/${RunList.get(1).perk2}.png');
          $('#RunePerk1').find('img[src*=${RunList.get(1).perk3}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perk/${RunList.get(1).perk3}.png');
          $('#RunePerk1').find('img[src*=${RunList.get(1).perk4}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perk/${RunList.get(1).perk4}.png');
          $('#RunePerk1').find('img[src*=${RunList.get(1).perk5}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perk/${RunList.get(1).perk5}.png');
          $('#statPerk3').find('img[src*=${RunList.get(1).statPerk0}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perkShard/${RunList.get(1).statPerk0}.png');
          $('#statPerk4').find('img[src*=${RunList.get(1).statPerk1}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perkShard/${RunList.get(1).statPerk1}.png');
          $('#statPerk5').find('img[src*=${RunList.get(1).statPerk2}]').attr('src', 'https://opgg-static.akamaized.net/images/lol/perkShard/${RunList.get(1).statPerk2}.png');


      });
  			
		
      var speedCanvas = document.getElementById("speedChart");

      Chart.defaults.global.defaultFontFamily = "Lato";
      Chart.defaults.global.defaultFontSize = 18;

      var speedData = {
        labels: ["10.01","아직 저장 된 데이터가 없습니다."],
        datasets: [{
          label: "${ChampChartList.get(0).CHAMPNAME}챔피언 승률",
          data: [${ChampChartList.get(0).ODDS}],
          lineTension: 0,
          fill: false,
          borderColor: 'black',
          backgroundColor: 'transparent',
          pointBorderColor: 'black',
          pointBackgroundColor: 'black',
          borderDash: [110,0],
          pointRadius: 5,
          pointHoverRadius: 1,
          pointHitRadius: 30,
          pointBorderWidth: 2,
        }]
      };

      var chartOptions = {
        legend: {
          display: true,
          position: 'top',
          labels: {
            boxWidth: 40,
            fontColor: 'red'
          }
        },
        scales: {
          xAxes: [{
            gridLines: {
              display: false,
              color: "black"
            },
            scaleLabel: {
              display: true,
              labelString: "",
              fontColor: "green"
            }
          }],
          yAxes: [{
            gridLines: {
              color: "black",
              borderDash: [2, 5],
            },
            scaleLabel: {
              display: true,
              labelString: "",
              fontColor: "green"
            }
          }]
        }
      };

      var lineChart = new Chart(speedCanvas, {
        type: 'line',
        data: speedData,
        options: chartOptions
        
      });
      
      // 픽률 chartjs
     
      var speedCanvas2 = document.getElementById("speedChart2");

      Chart.defaults.global.defaultFontFamily = "Lato";
      Chart.defaults.global.defaultFontSize = 18;

      var speedData2 = {
        labels: ["10.01","아직 저장 된 데이터가 없습니다."],
        datasets: [{
          label: "${ChampChartList.get(0).CHAMPNAME}챔피언 픽률",
          data: [${ChampChartList.get(0).PICKPERCENT}],
          lineTension: 0,
          fill: false,
          borderColor: 'black',
          backgroundColor: 'transparent',
          pointBorderColor: 'black',
          pointBackgroundColor: 'black',
          borderDash: [110, 0],
          pointRadius: 5,
          pointHoverRadius: 1,
          pointHitRadius: 30,
          pointBorderWidth: 2,
          
        }]
      };

      var chartOptions2 = {
        legend: {
          display: true,
          position: 'top',
          labels: {
            boxWidth: 40,
            fontColor: 'red'
          }
        },
        scales: {
          xAxes: [{
            gridLines: {
              display: false,
              color: "black"
            },
            scaleLabel: {
              display: true,
              labelString: "",
              fontColor: "green"
            }
          }],
          yAxes: [{
            gridLines: {
              color: "black",
              borderDash: [2, 5],
            },
            scaleLabel: {
              display: true,
              labelString: "",
              fontColor: "green"
            }
          }]
        }
      };

      var lineChart2 = new Chart(speedCanvas2, {
        type: 'line',
        data: speedData2,
        options: chartOptions2
      });
      
      // 벤률
      
      var speedCanvas3 = document.getElementById("speedChart3");

      Chart.defaults.global.defaultFontFamily = "Lato";
      Chart.defaults.global.defaultFontSize = 18;

      var speedData3 = {
        labels: ["10.01","10.02","10.03","10.04"],
        datasets: [{
          label: "${ChampChartList.get(0).CHAMPNAME} 챔피언 밴률",
          data: [${benPercent.get(0).BENPERCENT},48,19,80],
          lineTension: 0,
          fill: false,
          borderColor: 'black',
          backgroundColor: 'transparent',
          pointBorderColor: 'black',
          pointBackgroundColor: 'black',
          borderDash: [110, 0],
          pointRadius: 5,
          pointHoverRadius: 10,
          pointHitRadius: 30,
          pointBorderWidth: 2,
          
        }]
      };

      var chartOptions3 = {
        legend: {
          display: true,
          position: 'top',
          labels: {
            boxWidth: 40,
            fontColor: 'red'
          }
        },
        scales: {
          xAxes: [{
            gridLines: {
              display: false,
              color: "black"
            },
            scaleLabel: {
              display: true,
              labelString: "",
              fontColor: "green"
            }
          }],
          yAxes: [{
            gridLines: {
              color: "black",
              borderDash: [2, 5],
            },
            scaleLabel: {
              display: true,
              labelString: "",
              fontColor: "green"
            }
          }]
        }
      };

      var lineChart3 = new Chart(speedCanvas3, {
        type: 'line',
        data: speedData3,
        options: chartOptions3
      });
	      
		
		
      </script>

   </div>
      
  </div>
  <!-- 메뉴바 팁 게시판 끝나는부분 -->
  

</div>
</div>

   
         
</body>
</html>