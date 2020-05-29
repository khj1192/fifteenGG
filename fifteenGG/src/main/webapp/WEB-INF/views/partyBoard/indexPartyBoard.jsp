<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<style>
#duoRequestMoreBtn{
	border: 1px solid #007bff; background-color: white; color: #007bff; padding: 10px;

}
#duoRequestMoreBtn:hover{
	border: 1px solid #007bff; background-color: #007bff; color: white; padding: 10px;
}
</style>
<html>



			<div class="col-9" style="float: none; margin: 0 auto;">
				<div class="row gg-box" style="border: 1px solid grey !important;">
	
					<div id="content" class="col-12 collapse" style="display: block;">
						


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

<br />
<br />
						<div id="duoRequestMoreArea" class="col-12 px-0 mb-4">
							<button id="duoRequestMoreBtn" data-next-page="2"
								class="btn btn-info rounded-0"  onclick="location.href='${pageContext.request.contextPath}/partyBoard/partyBoardList.do'">파티 찾기</button>
						</div>
<br />
<br />
<br />

					</div>
				</div>
			</div>

	


	<script>
function partySearch(pbUser){
location.href = "${pageContext.request.contextPath}/search/SummonerSearch.do?summonerName="+pbUser
}
</script>






</html>