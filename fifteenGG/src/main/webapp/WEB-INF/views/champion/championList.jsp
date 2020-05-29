<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
		/* 사이드 패치 div 제일 큰놈 */
		.l-champion-index-content .l-champion-index-content--side {
			float: right;
			width: 475px;
			background-color: #f9f9fa;
			border: solid 1px #e9eff4;
			box-sizing: border-box;
		}
		/* 사이드 메뉴 바 */
		.champion-index-trend-header {
			background: #fff;

		}
		/* 사이드바 제목 */
		.champion-index-trend-header h2 {
			float: center;
			line-height: 17px;
			font-size: 14px;
			font-weight: bold;
			color: #222;
			padding: 17px 0 16px 21px;
		}

		.champion-index-trend-content {
			padding: 20px 20px 40px;
		}

		.champion-index-table {
			width: 100%;
			table-layout: fixed;
			border-collapse: collapse;
		}
		thead {
			display: table-header-group;
			vertical-align: middle;
			border-color: inherit;
		}

		tr {
			display: table-row;
			vertical-align: inherit;
			border-color: inherit;
		}
		tbody {
			display: table-row-group;
			vertical-align: middle;
			border-color: inherit;
		}
		.champion-index-table__cell:first-child {
			border-left: solid 1px #e6e6e6;
		}

		.champion-index-trend-position {
			display: table;
			width: 100%;
			table-layout: fixed;
			border-collapse: collapse;
		}
		.champion-index-trend-position__item a {
			display: block;
			padding: 11px 0 10px;
			text-decoration: none;
			text-align: center;
			line-height: 15px;
			font-size: 12px;
			font-weight: bold;
			letter-spacing: -0.9px;
			color: #b6b6b6;
			white-space: nowrap;
			overflow: hidden;
			text-overflow: ellipsis;

		}
		.champion-index-trend-position__item.active a {
			color: #4a4a4a;
		}
		.champion-index-trend-position__item {
			display: table-cell;
			vertical-align: middle;
			background-color: #f9f9fa;
			border: solid 1px #e9eff4;
		}
		dl, dt, dd, ol, ul, li {
			list-style: none;
			margin: 0;
			padding: 0;
		}
		.champion-index-table__cell:first-child {
			border-left: solid 1px #e6e6e6;
		}
		tr {
			display: table-row;
			vertical-align: inherit;
			border-color: inherit;
		}
		.champion-index-table__cell {

			border-top: solid 1px #e6e6e6;
			border-bottom: solid 1px #e6e6e6;
			height: 60px;
			vertical-align: middle;
		}
		
		
		#allClick:visited{
                color: white;
            }

	</style>
	<title>15.GG</title>
	<c:import url="../common/commonUtil.jsp"/>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/championList.css">

</head>
<body style="background: #f4f4f4; !important;
      max-width: 1011px;
      text-align: center;
      font-weight: normal;
      margin: 0 auto;"
	  onload = "onload();">

<%-- nav 영역 --%>
<c:import url="../common/navbar.jsp"/>

<%-- nav 와 div 사이의 영역 --%>
<div class="row">

</div>

<div class="l-champion-index-content--main" >
	<div class="champion-list-filter">
		<ul class="champion-list-filter__type">

			<li class="champion-list-filter__type__item
	          champion-list-filter__type__item--active" data-filter-type="ALL" style="list-style: none" onclick="AllShow();">
				<a href="#"><span>전체</span></a>
			</li>
			<li class="champion-list-filter__type__item " data-filter-type="Fighter" style="list-style: none" onclick="topAllShow();">
				<a href="#"><span>탑</span></a>
			</li>
			<li class="champion-list-filter__type__item " data-filter-type="Tank" style="list-style: none" onclick="jungleAllShow();">
				<a href="#"><span>정글</span></a>
			</li>
			<li class="champion-list-filter__type__item " data-filter-type="Assassin" style="list-style: none" onclick="midAllShow();">
				<a href="#"><span>미드</span></a>
			</li>
			<li class="champion-list-filter__type__item " data-filter-type="Surport" style="list-style: none" onclick="supportAllShow();">
				<a href="#"><span>서포터</span></a>
			</li>
			<li class="champion-list-filter__type__item " data-filter-type="Marksman" style="list-style: none" onclick="adcAllShow();">
				<a href="#"><span>원딜</span></a>
			</li>
		</ul>
	</div> <!-- 선택 메뉴div -->
	
	<table>
	<c:forEach var="champAll" items="${champAll}">
		<div class="champion-index__champion-champAll">
			<div class="champion-index__champion-item">
				<!-- <a href="/champion/garen/statistics"> -->
				<div class="champion-index__champion-item__image">
					<img src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${champAll.champFullIMG}"
						 class="__sprite __spc82 __spc82-33" onclick="championDetail('${champAll.champName}');" style="cursor:pointer"/>
				</div>
				<div class="champion-index__champion-item__name">${champAll.champName}</div>
				<!-- </a> -->
			</div> <!-- 챔피온 칸 -->
		</div> <!-- 챔피언 한칸 제일 큰놈 -->
	</c:forEach>
	
	
	 	<c:forEach var="supportAll" items="${supportAll}">
			<div class="champion-index__champion-supportAll" style="display:none;">
				<div class="champion-index__champion-item">
					<div class="champion-index__champion-item__image">
						<img src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${supportAll.champFullIMG}"	
								class="__sprite __spc82 __spc82-33" onclick="championDetail('${supportAll.champName}');" style="cursor:pointer"/>
					</div>
					<div class="champion-index__champion-item__name">${supportAll.champName}</div>
					<!-- </a> -->
				</div> <!-- 챔피온 칸 -->
			</div> <!-- 챔피언 한칸 제일 큰놈 -->
		</c:forEach> 
		
	 	<c:forEach var="adcAll" items="${adcAll}">
			<div class="champion-index__champion-adcAll" style="display:none;">
				<div class="champion-index__champion-item
						champion-index__champion-item--TOP
						champion-index__champion-item--MID"
					 data-champion-name="가렌"
					 data-champion-key="garen">
					<!-- <a href="/champion/garen/statistics"> -->
					<div class="champion-index__champion-item__image">
						<img src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${adcAll.champFullIMG}"	
								class="__sprite __spc82 __spc82-33" onclick="championDetail('${adcAll.champName}');" style="cursor:pointer"/>
					</div>
					<div class="champion-index__champion-item__name">${adcAll.champName}</div>
					<!-- </a> -->
				</div> <!-- 챔피온 칸 -->
			</div> <!-- 챔피언 한칸 제일 큰놈 -->
		</c:forEach> 
		
	<c:forEach var="midAll" items="${midAll}">
			<div class="champion-index__champion-midAll" style="display:none;">
				<div class="champion-index__champion-item
						champion-index__champion-item--TOP
						champion-index__champion-item--MID"
					 data-champion-name="가렌"
					 data-champion-key="garen">
					<!-- <a href="/champion/garen/statistics"> -->
					<div class="champion-index__champion-item__image">
						<img src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${midAll.champFullIMG}"	
								class="__sprite __spc82 __spc82-33" onclick="championDetail('${midAll.champName}');" style="cursor:pointer"/>
					</div>
					<div class="champion-index__champion-item__name">${midAll.champName}</div>
					<!-- </a> -->
				</div> <!-- 챔피온 칸 -->
			</div> <!-- 챔피언 한칸 제일 큰놈 -->
		</c:forEach> 
	<c:forEach var="topAll" items="${topAll}">
			<div class="champion-index__champion-topAll" style="display:none;">
				<div class="champion-index__champion-item
						champion-index__champion-item--TOP
						champion-index__champion-item--MID"
					 data-champion-name="가렌"
					 data-champion-key="garen">
					<!-- <a href="/champion/garen/statistics"> -->
					<div class="champion-index__champion-item__image">
						<img src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${topAll.champFullIMG}"	
								class="__sprite __spc82 __spc82-33" onclick="championDetail('${topAll.champName}');" style="cursor:pointer"/>
					</div>
					<div class="champion-index__champion-item__name">${topAll.champName}</div>
					<!-- </a> -->
				</div> <!-- 챔피온 칸 -->
			</div> <!-- 챔피언 한칸 제일 큰놈 -->
		</c:forEach> 
	<c:forEach var="jungleAll" items="${jungleAll}">
			<div class="champion-index__champion-jungleAll" style="display:none;">
				<div class="champion-index__champion-item
						champion-index__champion-item--TOP
						champion-index__champion-item--MID"
					 data-champion-name="가렌"
					 data-champion-key="garen">
					<!-- <a href="/champion/garen/statistics"> -->
					<div class="champion-index__champion-item__image">
						<img src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${jungleAll.champFullIMG}"	
								class="__sprite __spc82 __spc82-33" onclick="championDetail('${jungleAll.champName}');" style="cursor:pointer"/>
					</div>
					<div class="champion-index__champion-item__name">${jungleAll.champName}</div>
					<!-- </a> -->
				</div> <!-- 챔피온 칸 -->
			</div> <!-- 챔피언 한칸 제일 큰놈 -->
		</c:forEach> 
	</table>


</div> <!-- 챔피온 리스트 제일 큰놈 -->

<div class="l-champion-index-content--side" style="margin-left: 600px;">

	<div class="champion-index-trend tabWrap _recognized">
		<div class="champion-index-trend-header">
			<h2>패 치 노 트</h2>

		</div>
		<div class="champion-index-trend-content">
			<div class="tabItems">
				<div class="tabItem champion-trend
		  		            champion-trend-tier" style="display:block;">
					<div class="tabWrap _recognized">
						<table class="champion-index-table tabItems" >
							<thead>
							<tr style="font-weight: bolder;">
								<th class="champion-index-table__header" style="height:49px;">
									#
								</th>
								<th class="champion-index-table__header" colspan="3">
									내용
								</th>
								<th class="champion-index-table__header" style="padding-left: 35px;">일자</th>
							</tr>
							</thead>

							<tbody class="PATCH"
								   style="position:absolute;
								   background-color: darkgray; table-low-group;
								   width: 400px;">
							<tr style="font-weight: bolder;">
								<!-- 1번 -->
								<td class="champion-index-table__cell
		  		   	           champion-index-table__cell--rank" style="height:49px; padding-right: 80px; padding-left:30px;">
									1</td>

								<td class="champion-index-table__cell
		  		   	           champion-index-table__cell--rank" style="height:49px; padding-right: 65px;">
									<a href="https://www.leagueoflegends.co.kr/ko/update/patchnote/f1e20492-fc7f-4c73-b1d8-1fdc7f4ac29c">
										#9.24B 패치 노트</a>
								</td>
								<td class="champion-index-table__cell
		  		   	           champion-index-table__cell--rank" style="height:49px;">
									2019.12.19</td>
							</tr>
							<!-- 2번 -->
							<tr style="font-weight: bolder;">
								<td class="champion-index-table__cell
		  		   	           champion-index-table__cell--rank" style="height:49px; padding-right: 80px; padding-left:30px;">
									2</td>

								<td class="champion-index-table__cell
		  		   	           champion-index-table__cell--rank" style="height:49px; padding-right: 65px;">
									<a href="https://www.leagueoflegends.co.kr/ko/update/patchnote/7842d472-e849-41a0-a6c7-250766365fab">
										#9.24 패치 노트</a>
								</td>
								<td class="champion-index-table__cell
		  		   	           champion-index-table__cell--rank" style="height:49px;">
									2019.12.11</td>
							</tr>
							<!-- 3번 -->
							<tr style="font-weight: bolder;">
								<td class="champion-index-table__cell
		  		   	           champion-index-table__cell--rank" style="height:49px; padding-right: 80px; padding-left:30px;">
									3</td>

								<td class="champion-index-table__cell
		  		   	           champion-index-table__cell--rank" style="height:49px; padding-right: 65px;">
									<a href="https://www.leagueoflegends.co.kr/ko/update/patchnote/c81a4acc-e94c-4590-a9d2-098d964b8056">
										#9.23 패치 노트</a>
								</td>
								<td class="champion-index-table__cell
		  		   	           champion-index-table__cell--rank" style="height:49px;">
									2019.11.20</td>
							</tr>
							<!-- 4번 -->
							<tr style="font-weight: bolder;">
								<td class="champion-index-table__cell
		  		   	           champion-index-table__cell--rank" style="height:49px; padding-right: 80px; padding-left:30px;">
									4</td>

								<td class="champion-index-table__cell
		  		   	           champion-index-table__cell--rank" style="height:49px; padding-right: 65px;">
									<a href="https://www.leagueoflegends.co.kr/ko/update/patchnote/f2dd4e1d-df42-4270-807d-309b17d739ad">
										#9.22 패치 노트</a>
								</td>
								<td class="champion-index-table__cell
		  		   	           champion-index-table__cell--rank" style="height:49px;">
									2019.11.06</td>
							</tr>
							<!-- 5번 -->
							<tr style="font-weight: bolder;">
								<td class="champion-index-table__cell
		  		   	           champion-index-table__cell--rank" style="height:49px; padding-right: 80px; padding-left:30px;">
									5</td>

								<td class="champion-index-table__cell
		  		   	           champion-index-table__cell--rank" style="height:49px; padding-right: 65px;">
									<a href="https://www.leagueoflegends.co.kr/ko/update/patchnote/492326f0-8ae2-450a-8789-baac34cbb4bc">
										#9.21 패치 노트</a>
								</td>
								<td class="champion-index-table__cell
		  		   	           champion-index-table__cell--rank" style="height:49px;">
									2019.10.23</td>
							</tr>


							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="champion-index-trend tabWrap _recognized" style="width:400px; margin-top:250px;">
				<div class="champion-index-trend-header">
					<h2>라인별 1티어</h2>

					<div class="champion-index-trend-content">
						<div class="tabItems">
							<div class="tabItem champion-trend champion-trend-tier" style="display:block;">
								<div class="tabWrap _recognized" style="width : 400px; height:1000px;">
									<ul class="champion-index-trend-position tabHeaders">
										<li class="champion-index-trend-position__item tabHeader active Top"
											data-tab-show-class="champion-trend-tier-TOP"
											data-position="TOP" style="width:69px; height:36px; " onclick="topShow();">
											<a href="#" style="font-weight:bolder;">탑</a>
										</li>

										<li class="champion-index-trend-position__item tabHeader active Jungle"
											data-tab-show-class="champion-trend-tier-JUNGLE"
											data-position="JUNGLE" style="width:69px; height:36px; " onclick="jungleShow();">
											<a href="#" style="font-weight:bolder;">정글</a>
										</li>

										<li class="champion-index-trend-position__item tabHeader active Mid"
											data-tab-show-class="champion-trend-tier-MID"
											data-position="MID" style="width:69px; height:36px; " onclick="midShow();">
											<a href="#" style="font-weight:bolder;">미드</a>
										</li>

										<li class="champion-index-trend-position__item tabHeader active ADC"
											data-tab-show-class="champion-trend-tier-ADC"
											data-position="ADC" style="width:69px; height:36px; " onclick="adcShow();">
											<a href="#" style="font-weight:bolder;">원딜</a>
										</li>

										<li class="champion-index-trend-position__item tabHeader active Support"
											data-tab-show-class="champion-trend-tier-SUPPORT"
											data-position="SUPPORT" style="width:69px; height:36px; " onclick="supportShow();">
											<a href="#" style="font-weight:bolder;">서포터</a>
										</li>
									</ul>
									<table class="champion-index-table tabItems" >
										<thead>
										<tr style="font-weight: bolder;">
											<th class="champion-index-table__header" style="height:49px; width:35px;">
												#
											</th>
											<th class="champion-index-table__header" colspan="2" style="width:120px;">
												챔피언
											</th>
											<th class="champion-index-table__header" colspan="1" style="width :50px;">
												승률
											</th>
											<th class="champion-index-table__header" colspan="1" style="width :50px;">
												픽률
											</th>
											<th class="champion-index-table__header" style="padding-right:40px; width:80px;">티어</th>
										</tr>
										</thead>
										<!-- 탑 1티어 -->
									<c:forEach items="${topFiveList}" var="topFiveList">
										<tbody class="tabItem champion-trend-tier-TOP" style="display:table-row-group;">
										<tr class="champion-trend-tier-TOP" style="display:none;">
											<td class="champion-index-table__cell champion-index-table__cell--rank">${topFiveList.rnum}</td>
											<td class="champion-index-table__cell champion-index-table__cell--image">
												<a href="/fifteenGG/champion/championDetail.do?name=${topFiveList.champName}"
												   style="display:inline-block; width:36px; height:36px;">
													<img src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${topFiveList.champFullIMG}"
														 style="width:36px; height:36px; position:absolute;" />
													<i class="__sprite __spc32 __spc32-74"
													   style="display:inline-block; width:36px; height:36px;"></i>
												</a>
											</td>
											<td class="champion-index-table__cell champion-index-table__cell--champion"
												style="font-size: small;">
												<a href="/fifteenGG/champion/championDetail.do?name=${topFiveList.champName}">
													<div class="champion-index-table__name">${topFiveList.champName}</div>
												</a>
											</td>
											<td class="champion-index-table__cell
		  		   						   champion-index-table__cell--value"
												style="font-size: small;">${topFiveList.winPercent}%</td>
											<td class="champion-index-table__cell
		  		   				           champion-index-table__cell--value"
												style="font-size: small;">${topFiveList.picPercent}%</td>
											<td class="champion-index-table__cell
		  		   				          champion-index-table__cell--value" style="padding-right : 40px;">
												<img src="//opgg-static.akamaized.net/images/site/champion/icon-champtier-1.png" alt="" />
											</td>
										</tr>
										</tbody>
									</c:forEach>		
									<!-- 탑 2티어 -->
									<c:forEach items="${topTenList}" var="topTenList">
										<tbody class="tabItem champion-trend-tier-TOP" style="display:table-row-group;">
										<tr class="champion-trend-tier-TOP" style="display:none;">
											<td class="champion-index-table__cell champion-index-table__cell--rank">${topTenList.rnum}</td>
											<td class="champion-index-table__cell champion-index-table__cell--image">
												<a href="/fifteenGG/champion/championDetail.do?name=${topTenList.champName}"
												   style="display:inline-block; width:36px; height:36px;">
													<img src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${topTenList.champFullIMG}"
														 style="width:36px; height:36px; position:absolute;" />
													<i class="__sprite __spc32 __spc32-74"
													   style="display:inline-block; width:36px; height:36px;"></i>
												</a>
											</td>
											<td class="champion-index-table__cell champion-index-table__cell--champion"
												style="font-size: small;">
												<a href="/fifteenGG/champion/championDetail.do?name=${topTenList.champName}">
													<div class="champion-index-table__name">${topTenList.champName}</div>
												</a>
											</td>
											<td class="champion-index-table__cell
		  		   						   champion-index-table__cell--value"
												style="font-size: small;">${topTenList.winPercent}%</td>
											<td class="champion-index-table__cell
		  		   				           champion-index-table__cell--value"
												style="font-size: small;">${topTenList.picPercent}%</td>
											<td class="champion-index-table__cell
		  		   				          champion-index-table__cell--value" style="padding-right : 40px;">
												<img src="//opgg-static.akamaized.net/images/site/champion/icon-champtier-2.png" alt="" />
											</td>
										</tr>
										</tbody>
									</c:forEach>
									<!-- 정글 1티어 -->
									<c:forEach items="${jungleFiveList}" var="jungleFiveList">
										<tbody class="tabItem champion-trend-tier-JUNGLE" style="display:table-row-group;">
										<tr class="champion-trend-tier-JUNGLE" style="display:none;">
											<td class="champion-index-table__cell champion-index-table__cell--rank">${jungleFiveList.rnum}</td>
											<td class="champion-index-table__cell champion-index-table__cell--image">
												<a href="/fifteenGG/champion/championDetail.do?name=${jungleFiveList.champName}"
												   style="display:inline-block; width:36px; height:36px;">
													<img src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${jungleFiveList.champFullIMG}"
														 style="width:36px; height:36px; position:absolute;" />
													<i class="__sprite __spc32 __spc32-74"
													   style="display:inline-block; width:36px; height:36px;"></i>
												</a>
											</td>
											<td class="champion-index-table__cell champion-index-table__cell--champion"
												style="font-size: small;">
												<a href="/fifteenGG/champion/championDetail.do?name=${jungleFiveList.champName}">
													<div class="champion-index-table__name">${jungleFiveList.champName}</div>
												</a>
											</td>
											<td class="champion-index-table__cell
		  		   						   champion-index-table__cell--value"
												style="font-size: small;">${jungleFiveList.winPercent}%</td>
											<td class="champion-index-table__cell
		  		   				           champion-index-table__cell--value"
												style="font-size: small;">${jungleFiveList.picPercent}%</td>
											<td class="champion-index-table__cell
		  		   				          champion-index-table__cell--value" style="padding-right : 40px;">
												<img src="//opgg-static.akamaized.net/images/site/champion/icon-champtier-1.png" alt="" />
											</td>
										</tr>
										</tbody>
									</c:forEach>
									
									<!-- 정글 2티어 -->
									<c:forEach items="${jungleTenList}" var="jungleTenList">
										<tbody class="tabItem champion-trend-tier-JUNGLE" style="display:table-row-group;">
										<tr class="champion-trend-tier-JUNGLE" style="display:none;">
											<td class="champion-index-table__cell champion-index-table__cell--rank">${jungleTenList.rnum}</td>
											<td class="champion-index-table__cell champion-index-table__cell--image">
												<a href="/fifteenGG/champion/championDetail.do?name=${jungleTenList.champName}"
												   style="display:inline-block; width:36px; height:36px;">
													<img src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${jungleTenList.champFullIMG}"
														 style="width:36px; height:36px; position:absolute;" />
													<i class="__sprite __spc32 __spc32-74"
													   style="display:inline-block; width:36px; height:36px;"></i>
												</a>
											</td>
											<td class="champion-index-table__cell champion-index-table__cell--champion"
												style="font-size: small;">
												<a href="/fifteenGG/champion/championDetail.do?name=${jungleTenList.champName}">
													<div class="champion-index-table__name">${jungleTenList.champName}</div>
												</a>
											</td>
											<td class="champion-index-table__cell
		  		   						   champion-index-table__cell--value"
												style="font-size: small;">${jungleTenList.winPercent}%</td>
											<td class="champion-index-table__cell
		  		   				           champion-index-table__cell--value"
												style="font-size: small;">${jungleTenList.picPercent}%</td>
											<td class="champion-index-table__cell
		  		   				          champion-index-table__cell--value" style="padding-right : 40px;">
												<img src="//opgg-static.akamaized.net/images/site/champion/icon-champtier-2.png" alt="" />
											</td>
										</tr>
										</tbody>
									</c:forEach>
									
									<!-- 미드 1티어 -->
									<c:forEach items="${midFiveList}" var="midFiveList">
										<tbody class="tabItem champion-trend-tier-MID" style="display:table-row-group;">
										<tr class="champion-trend-tier-MID" style="display:none;">
											<td class="champion-index-table__cell champion-index-table__cell--rank">${midFiveList.rnum}</td>
											<td class="champion-index-table__cell champion-index-table__cell--image">
												<a href="/fifteenGG/champion/championDetail.do?name=${midFiveList.champName}"
												   style="display:inline-block; width:36px; height:36px;">
													<img src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${midFiveList.champFullIMG}"
														 style="width:36px; height:36px; position:absolute;" />
													<i class="__sprite __spc32 __spc32-74"
													   style="display:inline-block; width:36px; height:36px;"></i>
												</a>
											</td>
											<td class="champion-index-table__cell champion-index-table__cell--champion"
												style="font-size: small;">
												<a href="/fifteenGG/champion/championDetail.do?name=${midFiveList.champName}">
													<div class="champion-index-table__name">${midFiveList.champName}</div>
												</a>
											</td>
											<td class="champion-index-table__cell
		  		   						   champion-index-table__cell--value"
												style="font-size: small;">${midFiveList.winPercent}%</td>
											<td class="champion-index-table__cell
		  		   				           champion-index-table__cell--value"
												style="font-size: small;">${midFiveList.picPercent}%</td>
											<td class="champion-index-table__cell
		  		   				          champion-index-table__cell--value" style="padding-right : 40px;">
												<img src="//opgg-static.akamaized.net/images/site/champion/icon-champtier-1.png" alt="" />
											</td>
										</tr>
										</tbody>
									</c:forEach>
									
									<!-- 미드 2티어 -->
									<c:forEach items="${midTenList}" var="midTenList">
										<tbody class="tabItem champion-trend-tier-MID" style="display:table-row-group;">
										<tr class="champion-trend-tier-MID" style="display:none;">
											<td class="champion-index-table__cell champion-index-table__cell--rank">${midTenList.rnum}</td>
											<td class="champion-index-table__cell champion-index-table__cell--image">
												<a href="/fifteenGG/champion/championDetail.do?name=${midTenList.champName}"
												   style="display:inline-block; width:36px; height:36px;">
													<img src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${midTenList.champFullIMG}"
														 style="width:36px; height:36px; position:absolute;" />
													<i class="__sprite __spc32 __spc32-74"
													   style="display:inline-block; width:36px; height:36px;"></i>
												</a>
											</td>
											<td class="champion-index-table__cell champion-index-table__cell--champion"
												style="font-size: small;">
												<a href="/fifteenGG/champion/championDetail.do?name=${midTenList.champName}">
													<div class="champion-index-table__name">${midTenList.champName}</div>
												</a>
											</td>
											<td class="champion-index-table__cell
		  		   						   champion-index-table__cell--value"
												style="font-size: small;">${midTenList.winPercent}%</td>
											<td class="champion-index-table__cell
		  		   				           champion-index-table__cell--value"
												style="font-size: small;">${midTenList.picPercent}%</td>
											<td class="champion-index-table__cell
		  		   				          champion-index-table__cell--value" style="padding-right : 40px;">
												<img src="//opgg-static.akamaized.net/images/site/champion/icon-champtier-2.png" alt="" />
											</td>
										</tr>
										</tbody>
									</c:forEach>
									
									
									<!-- 원딜 1티어 -->
									<c:forEach items="${adcFiveList}" var="adcFiveList">
										<tbody class="tabItem champion-trend-tier-ADC" style="display:table-row-group;">
										<tr class="champion-trend-tier-ADC" style="display:none;">
											<td class="champion-index-table__cell champion-index-table__cell--rank">${adcFiveList.rnum}</td>
											<td class="champion-index-table__cell champion-index-table__cell--image">
												<a href="/fifteenGG/champion/championDetail.do?name=${adcFiveList.champName}"
												   style="display:inline-block; width:36px; height:36px;">
													<img src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${adcFiveList.champFullIMG}"
														 style="width:36px; height:36px; position:absolute;" />
													<i class="__sprite __spc32 __spc32-74"
													   style="display:inline-block; width:36px; height:36px;"></i>
												</a>
											</td>
											<td class="champion-index-table__cell champion-index-table__cell--champion"
												style="font-size: small;">
												<a href="/fifteenGG/champion/championDetail.do?name=${adcFiveList.champName}">
													<div class="champion-index-table__name">${adcFiveList.champName}</div>
												</a>
											</td>
											<td class="champion-index-table__cell
		  		   						   champion-index-table__cell--value"
												style="font-size: small;">${adcFiveList.winPercent}%</td>
											<td class="champion-index-table__cell
		  		   				           champion-index-table__cell--value"
												style="font-size: small;">${adcFiveList.picPercent}%</td>
											<td class="champion-index-table__cell
		  		   				          champion-index-table__cell--value" style="padding-right : 40px;">
												<img src="//opgg-static.akamaized.net/images/site/champion/icon-champtier-1.png" alt="" />
											</td>
										</tr>
										</tbody>
									</c:forEach>
									
									<!-- 원딜 2티어 -->
									<c:forEach items="${adcTenList}" var="adcTenList">
										<tbody class="tabItem champion-trend-tier-ADC" style="display:table-row-group;">
										<tr class="champion-trend-tier-ADC" style="display:none;">
											<td class="champion-index-table__cell champion-index-table__cell--rank">${adcTenList.rnum}</td>
											<td class="champion-index-table__cell champion-index-table__cell--image">
												<a href="/fifteenGG/champion/championDetail.do?name=${adcTenList.champName}"
												   style="display:inline-block; width:36px; height:36px;">
													<img src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${adcTenList.champFullIMG}"
														 style="width:36px; height:36px; position:absolute;" />
													<i class="__sprite __spc32 __spc32-74"
													   style="display:inline-block; width:36px; height:36px;"></i>
												</a>
											</td>
											<td class="champion-index-table__cell champion-index-table__cell--champion"
												style="font-size: small;">
												<a href="/fifteenGG/champion/championDetail.do?name=${adcTenList.champName}">
													<div class="champion-index-table__name">${adcTenList.champName}</div>
												</a>
											</td>
											<td class="champion-index-table__cell
		  		   						   champion-index-table__cell--value"
												style="font-size: small;">${adcTenList.winPercent}%</td>
											<td class="champion-index-table__cell
		  		   				           champion-index-table__cell--value"
												style="font-size: small;">${adcTenList.picPercent}%</td>
											<td class="champion-index-table__cell
		  		   				          champion-index-table__cell--value" style="padding-right : 40px;">
												<img src="//opgg-static.akamaized.net/images/site/champion/icon-champtier-2.png" alt="" />
											</td>
										</tr>
										</tbody>
									</c:forEach>
									
									<!-- 서포터 1티어 -->
									<c:forEach items="${supportFiveList}" var="supportFiveList">
										<tbody class="tabItem champion-trend-tier-SUPPORT" style="display:table-row-group;">
										<tr class="champion-trend-tier-SUPPORT" style="display:none;">
											<td class="champion-index-table__cell champion-index-table__cell--rank">${supportFiveList.rnum}</td>
											<td class="champion-index-table__cell champion-index-table__cell--image">
												<a href="/fifteenGG/champion/championDetail.do?name=${supportFiveList.champName}"
												   style="display:inline-block; width:36px; height:36px;">
													<img src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${supportFiveList.champFullIMG}"
														 style="width:36px; height:36px; position:absolute;" />
													<i class="__sprite __spc32 __spc32-74"
													   style="display:inline-block; width:36px; height:36px;"></i>
												</a>
											</td>
											<td class="champion-index-table__cell champion-index-table__cell--champion"
												style="font-size: small;">
												<a href="/fifteenGG/champion/championDetail.do?name=${supportFiveList.champName}">
													<div class="champion-index-table__name">${supportFiveList.champName}</div>
												</a>
											</td>
											<td class="champion-index-table__cell
		  		   						   champion-index-table__cell--value"
												style="font-size: small;">${supportFiveList.winPercent}%</td>
											<td class="champion-index-table__cell
		  		   				           champion-index-table__cell--value"
												style="font-size: small;">${supportFiveList.picPercent}%</td>
											<td class="champion-index-table__cell
		  		   				          champion-index-table__cell--value" style="padding-right : 40px;">
												<img src="//opgg-static.akamaized.net/images/site/champion/icon-champtier-1.png" alt="" />
											</td>
										</tr>
										</tbody>
									</c:forEach>
									
									<!-- 서포터 2티어 -->
									<c:forEach items="${supportTenList}" var="supportTenList">
										<tbody class="tabItem champion-trend-tier-SUPPORT" style="display:table-row-group;">
										<tr class="champion-trend-tier-SUPPORT" style="display:none;">
											<td class="champion-index-table__cell champion-index-table__cell--rank">${supportTenList.rnum}</td>
											<td class="champion-index-table__cell champion-index-table__cell--image">
												<a href="/fifteenGG/champion/championDetail.do?name=${supportTenList.champName}"
												   style="display:inline-block; width:36px; height:36px;">
													<img src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${supportTenList.champFullIMG}"
														 style="width:36px; height:36px; position:absolute;" />
													<i class="__sprite __spc32 __spc32-74"
													   style="display:inline-block; width:36px; height:36px;"></i>
												</a>
											</td>
											<td class="champion-index-table__cell champion-index-table__cell--champion"
												style="font-size: small;">
												<a href="/fifteenGG/champion/championDetail.do?name=${supportTenList.champName}">
													<div class="champion-index-table__name">${supportTenList.champName}</div>
												</a>
											</td>
											<td class="champion-index-table__cell
		  		   						   champion-index-table__cell--value"
												style="font-size: small;">${supportTenList.winPercent}%</td>
											<td class="champion-index-table__cell
		  		   				           champion-index-table__cell--value"
												style="font-size: small;">${supportTenList.picPercent}%</td>
											<td class="champion-index-table__cell
		  		   				          champion-index-table__cell--value" style="padding-right : 40px;">
												<img src="//opgg-static.akamaized.net/images/site/champion/icon-champtier-2.png" alt="" />
											</td>
										</tr>
										</tbody>
									</c:forEach>
																													
									</table>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div> <!-- 사이드 메뉴 제일큰놈 -->


<script>
	function onload() {
		console.log(${champions});
		$('.champion-trend-tier-TOP').show();
	
	}

	function championDetail(name){
		location.href = "${pageContext.request.contextPath}/champion/championDetail.do?name="+name;
	}
	
	function topShow(){
		$('.champion-trend-tier-TOP').show();
		$('.champion-trend-tier-JUNGLE').hide();
		$('.champion-trend-tier-MID').hide();
		$('.champion-trend-tier-ADC').hide();
		$('.champion-trend-tier-SUPPORT').hide();
	}
	function jungleShow(){
		$('.champion-trend-tier-TOP').hide();
		$('.champion-trend-tier-JUNGLE').show();
		$('.champion-trend-tier-MID').hide();
		$('.champion-trend-tier-ADC').hide();
		$('.champion-trend-tier-SUPPORT').hide();
	}
	function midShow(){
		$('.champion-trend-tier-TOP').hide();
		$('.champion-trend-tier-JUNGLE').hide();
		$('.champion-trend-tier-MID').show();
		$('.champion-trend-tier-ADC').hide();
		$('.champion-trend-tier-SUPPORT').hide();
	}
	
	function adcShow(){
		$('.champion-trend-tier-TOP').hide();
		$('.champion-trend-tier-JUNGLE').hide();
		$('.champion-trend-tier-MID').hide();
		$('.champion-trend-tier-ADC').show();
		$('.champion-trend-tier-SUPPORT').hide();
	}
	
	function supportShow(){
		$('.champion-trend-tier-TOP').hide();
		$('.champion-trend-tier-JUNGLE').hide();
		$('.champion-trend-tier-MID').hide();
		$('.champion-trend-tier-ADC').hide();
		$('.champion-trend-tier-SUPPORT').show();
	}
	
	/* 라인별 챔프 정리 */
	function AllShow(){
		$('.champion-index__champion-champAll').show();
		$('.champion-index__champion-supportAll').hide();	
		$('.champion-index__champion-adcAll').hide();
		$('.champion-index__champion-midAll').hide();
		$('.champion-index__champion-topAll').hide();
		$('.champion-index__champion-jungleAll').hide();
	}
	
	function supportAllShow(){
		$('.champion-index__champion-champAll').hide();
		$('.champion-index__champion-supportAll').show();		
		$('.champion-index__champion-adcAll').hide();
		$('.champion-index__champion-midAll').hide();
		$('.champion-index__champion-topAll').hide();
		$('.champion-index__champion-jungleAll').hide();
	}
	
	function adcAllShow(){
		$('.champion-index__champion-champAll').hide();
		$('.champion-index__champion-supportAll').hide();	
		$('.champion-index__champion-adcAll').show();
		$('.champion-index__champion-midAll').hide();
		$('.champion-index__champion-topAll').hide();
		$('.champion-index__champion-jungleAll').hide();
	}
	function midAllShow(){
		$('.champion-index__champion-champAll').hide();
		$('.champion-index__champion-supportAll').hide();	
		$('.champion-index__champion-adcAll').hide();
		$('.champion-index__champion-midAll').show();
		$('.champion-index__champion-topAll').hide();
		$('.champion-index__champion-jungleAll').hide();
	}
	function topAllShow(){
		$('.champion-index__champion-champAll').hide();
		$('.champion-index__champion-supportAll').hide();	
		$('.champion-index__champion-adcAll').hide();
		$('.champion-index__champion-midAll').hide();
		$('.champion-index__champion-topAll').show();
		$('.champion-index__champion-jungleAll').hide();
	}
	function jungleAllShow(){
		$('.champion-index__champion-champAll').hide();
		$('.champion-index__champion-supportAll').hide();	
		$('.champion-index__champion-adcAll').hide();
		$('.champion-index__champion-midAll').hide();
		$('.champion-index__champion-topAll').hide();
		$('.champion-index__champion-jungleAll').show();
	}
	
</script>


</body>
</html>