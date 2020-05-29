<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">

<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/party.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css" />
<c:import url="../common/commonUtil.jsp" />


<script
	src="${pageContext.request.contextPath}/resources/js/dataTable.min.js"></script>
<script>
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>

<title></title>

</head>
<body
	style="background: #f4f4f4; ! important; max-width: 1011px; text-align: center; font-weight: normal; margin: 0 auto;">
	<c:import url="../common/navbar.jsp" />


	<div class="gg-matchlist-box gg-division">
	<img src="${pageContext.request.contextPath}/resources/Images/ad/khad3.jpg" style="width:1000px; height:200px; overflow: hidden-y; cursor:pointer;" onclick="window.open('https://www.iei.or.kr/main/main.kh')"> <!-- random image -->
  </div>
		<table id="example" class="row-border hover" style="width: 100%">
			<thead>
				<tr>
					<th>번호</th>
					<th>#</th>
					<th>챔피언</th>
					<th>승률</th>
					<th>벤률</th>
					<th>픽률</th>
					<th>KDA</th>
					<th>CS</th>
					<th>골드흭득량</th>
					<th>플레이 수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${dataTablePackage}" var="dataTablePackage">
					<tr>
						<td>${dataTablePackage.rnum}</td>
						<td><img
							src="https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/${dataTablePackage.champIMG}"
							style="cursor: pointer; width: 35px; height: 35px;"
							onclick="championDetail('${dataTablePackage.champName}');" /></td>
						<td>${dataTablePackage.champName}</td>
						<td><div style="width:${(dataTablePackage.champWinPercent/75)*100}%; height:10px; background-color:#1f8ecd; border-color:#1f8ecd; max-width:100%"></div>${dataTablePackage.champWinPercent}%</td>
						<td><div class="red"
								style="width:${(dataTablePackage.banPercent/90)*100}%; height:10px; background-color: #ee5a52; border-color: #c6443e; max-width:100%"></div>${dataTablePackage.banPercent}%</td>
						<td><div style="width:${(dataTablePackage.pickPercent/50)*100}%; height:10px; background-color:#5FB4FC; border-color:#5FB4FC; max-width:100%"></div>${dataTablePackage.pickPercent}%</td>
						<td><b>${dataTablePackage.champKDA}:1</b></td>
						<td><div style="width:${dataTablePackage.highMinionKill/2}%; height:10px; background-color:#D0D2A1; border-color:#D0D2A1; max-width:100%"></div>${dataTablePackage.highMinionKill}</td>
						<td><div style="width:${(dataTablePackage.highGold/13000)*100}%; height:10px; background-color:#DEE261; border-color:#DEE261; max-width:100%"></div>${dataTablePackage.highGold}</td>
						<td><div style="width:${(dataTablePackage.pickPercent/50)*100}%; height:10px; background-color:#2daf7f; border-color:#249069; max-width:100%"></div>${dataTablePackage.play}</td>
					</tr>

				</c:forEach>

			</tbody>

		</table>


	</div>

	<script>
		$(document).ready(function() {
			$('.slider').slider();
		});
	</script>


	<script>
		var ctx = document.getElementById('barChart').getContext('2d');
		var chart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ '1', '2', '3', '4', '5', '6', '7' ],
				datasets : [ {
					label : 'My First dataset',
					backgroundColor : [ 'rgb(255, 99, 132)',
							'rgb(225, 189, 82)', 'rgb(235, 99, 132)',
							'rgb(255, 99, 12)', 'rgb(255, 199, 132)',
							'rgb(154, 199, 232)', 'rgb(65, 22, 21)' ],
					borderColor : 'rgb(25, 99, 132)',
					data : [ 15, 10, 5, 2, 20, 30, 45 ]
				// 면적
				} ]
			},

			// Configuration options go here
			options : {}
		});
	</script>



	<script>
		function championDetail(name) {
			location.href = "${pageContext.request.contextPath}/champion/championDetail.do?name="
					+ name;
		}
	</script>

	<script>
		function partyBoard() {
			location.href = "${pageContext.request.contextPath}/partyBoard/partyBoardList.do";
		}
	</script>



	<script
		src="https://s3-ap-northeast-1.amazonaws.com/ggtics-static/material-pro/assets/js/plugins/bootstrap-selectpicker.js"
		type="text/javascript"></script>
</body>
</html>