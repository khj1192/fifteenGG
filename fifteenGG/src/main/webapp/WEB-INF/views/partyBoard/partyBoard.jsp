<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>

<head>


<!-- poper.js 추가 Poper없으면 select option이 안먹힘 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha256-98vAGjEDGN79TjHkYWVD4s87rvWkdWLHPs5MC3FvFX4="
	crossorigin="anonymous"></script>


<meta charset="UTF-8">
<style>
.noContent {
	color: white !important;
	background-color: #999999 !important;
	pointer-events: hover;
}
</style>
<title>팀서치</title>
<c:import url="../common/commonUtil.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/party.css">


<!-- 내용 입력 안할시 메세지 띄우는 함수. -->
<script>
		function check(){
			var content = $("[name=pbContent]").val();
			var user = $("[name=pbUser]").val();

			if(user.trim().length==0){
				alert("소환사명을 입력하세요");
				return false;
			} else if (content.trim().length==0) {
				alert("내용을 입력하세요");
				return false;
			}
			return true;
		}
	</script>


</head>

<body
	style="background: #f4f4f4; ! important; max-width: 1011px; text-align: center; font-weight: normal; margin: 0 auto;">

	<c:import url="../common/navbar.jsp" />

	<div class="container-fluid gg-text-normal">
		<!-- 두오 신청 등록 -->
		<form class="needs-validation col-12 px-0 mb-0" autocomplete="off"
			novalidate="" action="partyBoardInsert.do" onsubmit="return check();">
			<div class="row gg-division">
				<div class="col-lg-2 bg-white"></div>
				<div class="col-12 col-lg-8">
					<div class="row gg-box">
						<div class="col-12 px-0">
							<div
								class="gg-large-box-title col-12 px-0 d-flex align-items-center justify-content-start">
								<div>
									<i class="fas fa-users"></i>
								</div>
								<div class="px-2 gg-important-text">듀오 구하기</div>
							</div>
						</div>

						<div class="col-12 col-lg-6 px-0">
							<div class="btn-group bootstrap-select form-control my-0">
								<select name="pbRanktype" class="form-control selectpicker my-0"
									data-style="btn btn-link gg-select" id="pbRanktype"
									tabindex="-98">

									<option value="솔로랭크">솔로랭크</option>
									<option value="자유랭크">자유랭크</option>
									<option value="일반">일반</option>
									<option value="칼바람">칼바람</option>

								</select>
							</div>
						</div>

						<div class="col-12 col-lg-6 px-0">
							<div class="btn-group bootstrap-select form-control my-0">
								<select name="pbTier" class="form-control selectpicker my-0"
									data-style="btn btn-link gg-select" id="pbTier" tabindex="-98">

									<option value="ALL">모든 티어</option>
									<option value="Unranked">언랭크</option>
									<option value="IRON">아이언</option>
									<option value="BRONZE">브론즈</option>
									<option value="SILVER">실버</option>
									<option value="GOLD">골드</option>
									<option value="PLATINUM">플레티넘</option>
									<option value="DIAMOND">다이아몬드</option>
									<option value="MASTER">마스터</option>
									<option value="GRANDMASTER">그랜드마스터</option>
									<option value="CHALLENGER">챌린저</option>

								</select>
							</div>
						</div>


						<div class="col-12 col-lg-5 px-0">
							<div class="btn-group bootstrap-select form-control my-0">
								<select name="pbPosition" class="form-control selectpicker my-0"
									data-style="btn btn-link gg-select" id="pbPosition"
									tabindex="-98">

									<option value="포지션 상관 없이 구함">포지션 상관 없이 구함</option>
									<option value="탑 구함">탑 구함</option>
									<option value="정글 구함">정글 구함</option>
									<option value="미드 구함">미드 구함</option>
									<option value="원딜 구함">원딜 구함</option>
									<option value="서폿 구함">서폿 구함</option>

								</select>
							</div>
						</div>

						<div class="col-12 col-lg-5 px-0">
							<div class="btn-group bootstrap-select form-control my-0">
								<select name="pbTimer" class="form-control selectpicker my-0"
									data-style="btn btn-link gg-select" id="pbTimer" tabindex="-98">

									<option value="15">15분 내 친구 신청 가능</option>
									<option value="30">30분 내 친구 신청 가능</option>
									<option value="60">1시간 내 친구 신청 가능</option>
									<option value="120">2시간 내 친구 신청 가능</option>
									<option value="180">3시간 내 친구 신청 가능</option>
									<option value="360">6시간 내 친구 신청 가능</option>

								</select>
							</div>
						</div>

						<!-- 보이스 버튼 -->
						<div
							class="col-12 col-lg-2 px-0 d-flex align-items-center justify-content-end">
							<div class="togglebutton mt-2">
								<label class="mb-0"> <span class="d-inline gg-text-form"><i
										class="fas fa-microphone-slash" style="color: #007bff;"></i></span> <input
									name="pbVoice" id="pbVoice" type="checkbox" value="Y">
									<span class="toggle mr-0"></span> &nbsp;&nbsp; <span
									class="d-inline gg-text-form"><i
										class="fas fa-microphone" style="color: #007bff;"></i></span>
								</label>
							</div>
						</div>

						<div class="col-12 px-0 mt-3">
							<span class="bmd-form-group"><div class="input-group">
									<input name="pbUser" id="pbUser" type="text" value=""
										class="form-control border-0" placeholder="소환사명">
								</div></span>
						</div>
						<div class="col-12 px-0">
							<span class="bmd-form-group"><div class="input-group">
									<input name="pbContent" class="form-control" id="pbContent"
										maxlength="200" rows="2" placeholder="200자 이내 내용">
								</div></span>
						</div>

						<div class="col-12 px-0 bg-white">
							<button id="duoRequestBtn" type="submit"
								class="btn btn-info rounded-0">등록</button>
						</div>
					</div>
				</div>
				<div class="col-lg-2 bg-white"></div>
			</div>
		</form>

		<!-- 두오 신청 게시글  리스트-->
		<div class="row gg-division">
			<div class="col-lg-2 bg-white"></div>
			<div class="col-12 col-lg-8">
				<div class="row gg-box">
					<div class="col-12 px-0">
						<div
							class="gg-large-box-title col-12 px-0 d-flex align-items-center justify-content-start">
							<div>
								<i class="fas fa-list-ul"></i>
							</div>
							<div class="px-2">듀오 신청 리스트</div>
						</div>
					</div>


					<!-- 검색 동작 폼 -->
					<form
						class="col-12 px-0 d-flex flex-wrap flex-lg-nowrap align-items-center"
						action="${pageContext.request.contextPath}/partyBoard/searchList.do">
						<div
							class="col-12 px-0 d-flex flex-wrap flex-lg-nowrap align-items-center">

							<div class="btn-group bootstrap-select form-control my-0">
								<select name="pbRanktype" class="form-control selectpicker my-0"
									data-style="btn btn-link gg-select"
									id="duoRequestListMatchCategorySelect" tabindex="-98">

									<option value="모든 큐">모든 큐</option>
									<option value="솔로랭크">솔로랭크</option>
									<option value="자유랭크">자유랭크</option>
									<option value="일반">일반</option>
									<option value="칼바람">칼바람</option>

								</select>
							</div>


							<div class="btn-group bootstrap-select form-control my-0">
								<select name="pbTier" class="form-control selectpicker my-0"
									data-style="btn btn-link gg-select"
									id="duoRequestListTierSelect" tabindex="-98">

									<option value="ALL">모든 티어</option>
									<option value="Unranked">언랭크</option>
									<option value="IRON">아이언</option>
									<option value="BRONZE">브론즈</option>
									<option value="SILVER">실버</option>
									<option value="GOLD">골드</option>
									<option value="PLATINUM">플레티넘</option>
									<option value="DIAMOND">다이아몬드</option>
									<option value="MASTER">마스터</option>
									<option value="GRANDMASTER">그랜드마스터</option>
									<option value="CHALLENGER">챌린저</option>

								</select>
							</div>

							<div class="btn-group bootstrap-select form-control my-0">
								<select name="pbPosition" class="form-control selectpicker my-0"
									data-style="btn btn-link gg-select"
									id="duoRequestListLaneSelect" tabindex="-98">

									<option value="포지션 상관 없이 구함">포지션 상관 없이 구함</option>
									<option value="탑 구함">탑 구함</option>
									<option value="정글 구함">정글 구함</option>
									<option value="미드 구함">미드 구함</option>
									<option value="원딜 구함">원딜 구함</option>
									<option value="서폿 구함">서폿 구함</option>

								</select>
							</div>
							<button id="search" type="submit"
								class="btn btn-info btn-sm rounded-0">검색</button>
						</div>
					</form>

					<div id="content" class="col-12 collapse" style="display: block;">
						<div class="col-12 px-0 mb-4 bg-white d-flex justify-content-end">
						</div>


						<!------------------------------------- 게시글 View ------------------------------------->

						<div id="duoRequestArea" class="col-12 px-0 gg-request-areas">
							<c:forEach items="${list}" var="list" varStatus="status">

								<span id="list10${status.index}"> <span
									id="cancelline${status.index }">

										<div class="d-flex flex-column w-100 gg-action p-2 listView"
											id="listView" data-event="DuoRequestProfile"
											data-href="/kr/profile/2417"
											onclick="partySearch('${list.pbUser}');">
											<div
												class="d-flex align-items-center gg-duo-request-list-title">
												<div class="aa">${list.pbRanktype}</div>
												<div class="px-1">${list.pbTier}</div>
												<div class="d-flex align-items-center">${list.pbPosition}<div></div>
												</div>

												<!-- 마이크 on/off 표시 -->
												<div class="px-1">
													<c:choose>
														<c:when test="${list.pbVoice eq ''}">
															<i class="fas fa-microphone-slash"
																style="color: #007bff;"></i>
														</c:when>
														<c:otherwise>
															<i class="fas fa-microphone" style="color: #007bff;"></i>
														</c:otherwise>
													</c:choose>
												</div>
												<div class="px-1"></div>
											</div>
											<!-- 내용 입력 -->
											<div
												class="d-flex gg-duo-request-text text-secondary text-left py-2">${list.pbContent}</div>
											<div class="d-flex gg-text-large justify-content-end pt-2">
												<!-- 유저 아이콘 -->
												<div>
													<i class="fas fa-users"></i><span
														class="gg-text-normal-color">${list.pbUser} </span>
												</div>
												<div class="px-2"></div>
												<!-- 스톱워치 아이콘 -->
												<!-- 남은시간 알려줌 -->
												<div>
													<i class="fas fa-stopwatch"></i><span
														id="stopwatch${status.index }"></span>
												</div>
											</div>
											<!-- 경과시간 보여줌 -->
											<div class="d-flex justify-content-end gg-sub-description">
												<i class="fas fa-history"></i><span
													id="aftertime${status.index}"></span>
											</div>
											<div class="gg-thin-line my-2"></div>
										</div>
								</span>
								</span>

					
								<!-- 만료시간 구하기 -->
								<script>

								var x${status.index} = setInterval(function() {
									var countDownDate${status.index} = ('${list.epoch}' * 1000) + ('${list.pbTimer}' * (1000 * 60));
									var now${status.index} = new Date().getTime();
									var distance${status.index} = countDownDate${status.index} - now${status.index};
									var days${status.index} = Math.floor(distance${status.index} / (1000 * 60 * 60 * 24));
									var hours${status.index} = Math.floor((distance${status.index} % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
									var minutes${status.index} = Math.floor((distance${status.index} % (1000 * 60 * 60)) / (1000 * 60));
									var seconds${status.index} = Math.floor((distance${status.index} % (1000 * 60)) / 1000);

									/* 만료시 취소선 긋는 구간 */
									if (distance${status.index} < 0) {
										clearInterval(x${status.index});
										document.getElementById("stopwatch${status.index}").innerHTML = "만료";
										document.getElementById("cancelline${status.index}").style = 'text-decoration:line-through';

									} else if (hours${status.index} == 0) {
										clearInterval(x${status.index});
										document.getElementById("stopwatch${status.index}").innerHTML = minutes${status.index} + "분 뒤 만료";

									} else if (hours${status.index} > 0) {
										clearInterval(x${status.index});
										document.getElementById("stopwatch${status.index}").innerHTML = hours${status.index} + "시간 " + minutes${status.index} + "분 뒤 만료";
									}
								}, 1000);

							</script>

								<!-- 지난시간 구하기 -->
								<script>

								var after${status.index} = setInterval(function() {
									var countDownDate1${status.index} = ('${list.epoch}' * 1000);
									var now${status.index} = new Date().getTime();
									var distance1${status.index} = now${status.index} - countDownDate1${status.index};
									var days1${status.index} = Math.floor(distance1${status.index} / (1000 * 60 * 60 * 24));
									var hours1${status.index} = Math.floor((distance1${status.index} % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
									var minutes1${status.index} = Math.floor((distance1${status.index} % (1000 * 60 * 60)) / (1000 * 60));
									var seconds1${status.index} = Math.floor((distance1${status.index} % (1000 * 60)) / 1000);

									/* $("#aftertime${status.index}").text(hours1${status.index} + "시간 " + minutes1${status.index} + "분 전"); */

									if (days1${status.index} > 0) {
										clearInterval(after${status.index});
										document.getElementById("aftertime${status.index}").innerHTML = "${list.pbDate}";

									} else if (hours1${status.index} > 0) {
										clearInterval(after${status.index});
										document.getElementById("aftertime${status.index}").innerHTML = hours1${status.index} + "시간 " + minutes1${status.index} + "분 전";
									}else if (hours1${status.index} == 0) {
										clearInterval(after${status.index});
										document.getElementById("aftertime${status.index}").innerHTML = minutes1${status.index} + "분 전";
									}
								}, 1000);


							</script>

							</c:forEach>

						</div>
						<!------------------------------------------------------------------------------------------------------------------------------>

						<div id="duoRequestMoreArea" class="col-12 px-0 mb-4">
							<button id="duoRequestMoreBtn" data-next-page="2"
								class="btn btn-info rounded-0">더 보기</button>
						</div>

					</div>
				</div>
			</div>

			<div class="col-lg-2 bg-white"></div>
		</div>
	</div>

	<div class="modal" tabindex="-1" role="dialog" data-keyboard="false">
		<div
			class="mt-0 modal-dialog modal-dialog-centered justify-content-center"
			role="document">
			<span class="fa fa-spinner fa-spin fa-3x"></span>
		</div>
	</div>
	



	<script>

	$(document).ready(function(){
		console.log($(".listView").length);
		$("span[id*=list]").each(function(){
			$(this).css('display', 'none');
			$("span[id*=list]").slice(0, 6).show();
		});
		/* $(".listView").slice(0, 4).each(function(){
           $(".listView").show();
        });
         // $(".listView").slice(0, 4).show();
         */
		$("#duoRequestMoreBtn").on("click", function(e){
			e.preventDefault();
			$("span[id*=list]:hidden").slice(0, 6).slideDown();
			if($("span[id*=list]:hidden").length == 0) {
				$("#duoRequestMoreBtn").text("더 보기").addClass("noContent");
			}
		});
	});


</script>

	<script>
function partySearch(pbUser){
location.href = "${pageContext.request.contextPath}/search/SummonerSearch.do?summonerName="+pbUser
}
</script>


	<script
		src="https://s3-ap-northeast-1.amazonaws.com/ggtics-static/material-pro/assets/js/plugins/bootstrap-selectpicker.js"
		type="text/javascript"></script>


</body>
</html>