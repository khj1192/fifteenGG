<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha256-98vAGjEDGN79TjHkYWVD4s87rvWkdWLHPs5MC3FvFX4="
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>


<meta charset="UTF-8">

<title>Insert title here</title>

<c:import url="../common/commonUtil.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/party.css">


<style>

</style>

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
	<div class="container-fluid" style="background : white; height:1500px;">
	<div class="row no-gutters justify-content-center py-2">
		<div class="col-12 d-flex align-items-center justify-content-center">
			<div class="d-flex bg-dark p-2 rounded">
				<span class="d-flex align-items-center"><i
					class="material-icons text-white">처음 </i></span> <span
					class="d-flex align-items-center gg-important-text-sm ml-1">

					<a class="text-white" data-event="LinkA-Feedback" href="#"> 느낌
						그대로 승률 그래프 </a>


				</span>
			</div>
		</div>
	</div>


	<div class="gg-matchlist-box gg-division"
		style="width: 400px; height: 350px; float: right;">
		<span><h3><strong>첫 퍼블 먹은 팀 승률</strong></h3></span>
		
		<canvas id="myChart"></canvas>
		<br /><br />
		<div style="float: right; padding-right: 40px;">
			<span class="gg-important-number" style="color: #F06464;">${objectWinPercentage.rFBWPercent}%</span>
			<span class="gg-sub-description">Red팀 승률</span>
			</div> 
			<div style="padding-right: 220px;">
			<span class="gg-important-number gg-text-positive">${objectWinPercentage.bFBWPercent}%</span>
			<span class="gg-sub-description">Blue 팀 승률</span>
			</div>

	</div>
	

	<div class="gg-matchlist-box gg-division"
		style="width: 400px; height: 350px;">
		<span><h3><strong> 전체 팀 승률</strong></h3></span>
		<canvas id="mymChart"></canvas>
		
		<br /><br />
		<div style="float: right; padding-right: 40px;">
			<span class="gg-important-number" style="color: #F06464;">${objectWinPercentage.rWinPercent}%</span>
			<span class="gg-sub-description">Red팀 승률</span>
			</div> 
			<div style="padding-right: 220px;">
			<span class="gg-important-number gg-text-positive">${objectWinPercentage.bWinPercent}%</span>
			<span class="gg-sub-description">Blue 팀 승률</span>
			</div>

	</div>
	<hr />
	<div style="width: 324px; height: 350px; float: right;">
					<span><h3><strong>첫 바론 먹은 팀 승률</strong></h3></span>
		<canvas id="mymymyChart"></canvas>
		<br /><br />
		<div style="float: right; padding-right: 40px;">
			<span class="gg-important-number" style="color: #F06464;">${objectWinPercentage.firstBloodBaronWinPercent}%</span>
			<span class="gg-sub-description">바론 먹은 팀</span>
			</div> 
			<div style="padding-right: 170px;">
			<span class="gg-important-number " style="color : #A6A6A6;"><fmt:formatNumber value="${100-objectWinPercentage.firstBloodBaronWinPercent}" type="number" pattern="0.00"/>%</span>
			<span class="gg-sub-description">그 외</span>
			</div>
		</div>
						
	
			<div style="width: 326px; height: 350px; float: right;">
		<span><h3><strong>첫 용 먹은 팀 승률</strong></h3></span>
		<canvas id="mymyChart"></canvas>
		<br /><br />
		<div style="float: right; padding-right: 40px;">
			<span class="gg-important-number" style="color: #F06464;">${objectWinPercentage.firstBloodDragonWinPercent}%</span>
			<span class="gg-sub-description">용 먹은 팀</span>
			</div> 
			<div style="padding-right: 155px;">
			<span class="gg-important-number " style="color:#A6A6A6 "><fmt:formatNumber value="${100-objectWinPercentage.firstBloodDragonWinPercent}" type="number" pattern="0.00"/>%</span>
			<span class="gg-sub-description">그 외</span>
			</div>
	</div> 
	<div style="width: 326px; height: 350px; float:right;">
	<span><h3><strong>첫 전령 먹은 팀 승률</strong></h3></span>
		
		<canvas id="mymeChart"></canvas>
		<br /><br />
		<div style="float: right; padding-right: 50px;">
			<span class="gg-important-number" style="color: #F06464;">${objectWinPercentage.firstRiftherald}%</span>
			<span class="gg-sub-description"> 전령 먹은 팀</span>
			</div> 
			<div style="padding-right: 170px;">
			<span class="gg-important-number" style="color:#A6A6A6;"><fmt:formatNumber value="${100-objectWinPercentage.firstRiftherald}" type="number" pattern="0.00"/>%</span>
			<span class="gg-sub-description">그 외</span>
			</div>

	</div>
	
	
	<div>

		<div class="col-4 px-2 d-flex flex-column" style="float: right;">
			<span class="gg-important-number gg-text-positive">${objectWinPercentage.zeroDragonWinPercent}%
			</span> <span class="gg-sub-description">0용 </span> <span
				class="gg-important-number gg-text-positive">${objectWinPercentage.oneDragonWinPercent}%</span>
			<span class="gg-sub-description">1용</span> <span
				class="gg-important-number gg-text-positive">${objectWinPercentage.twoDragonWinPercent}%</span>
			<span class="gg-sub-description">2용 </span> <span
				class="gg-important-number gg-text-positive">${objectWinPercentage.threeDragonWinPercent}%</span>
			<span class="gg-sub-description">3용</span> <span
				class="gg-important-number" style="color: #F06464;">${objectWinPercentage.fourDragonWinPercent}%</span>
			<span class="gg-sub-description">4용 </span>
		</div>
			<div style="width: 600px; height: 280px;">
		<canvas id="meChart" style="display: block; width: 600px; height: 270px; float: left;"></canvas>
		
	</div>
	
	</div>
	<br><br>
	<hr />

		<div class="col-4 px-2 d-flex flex-column" style="width: 450px; float: right; margin-top: 100px;">
			<span class="gg-important-number gg-text-positive">${objectWinPercentage.zeroBaronWinPercent}%
			</span> <span class="gg-sub-description">0바론 </span> <span
				class="gg-important-number gg-text-positive">${objectWinPercentage.oneBaronWinPercent}%</span>
			<span class="gg-sub-description">1바론</span> <span
				class="gg-important-number gg-text-positive">${objectWinPercentage.twoBaronWinPercent}%</span>
			<span class="gg-sub-description">2바론 </span> <span
				class="gg-important-number "style="color: #F06464;">${objectWinPercentage.threeBaronWinPercent}%</span>
			<span class="gg-sub-description">3바론</span>
			
		</div>
	<div class="gg-matchlist-box gg-division" style="width: 600px; height: 300px;">
		<canvas id="memeChart" style="display: block; width: 600px; height: 340px; padding-top:20px;"></canvas> 
	 
<hr />
	</div>
	</div>


	<script>
		new Chart(document.getElementById("meChart"), {
		
		type: 'horizontalBar',
    data: {
        labels: ['.','0용', '1용', '2용','3용','4용' ],
        datasets: [{
            label: '승률 %',
            data: [0,parseFloat('${objectWinPercentage.zeroDragonWinPercent}'), parseFloat('${objectWinPercentage.oneDragonWinPercent}'), parseFloat('${objectWinPercentage.twoDragonWinPercent}'), parseFloat('${objectWinPercentage.threeDragonWinPercent}'),
            	parseFloat('${objectWinPercentage.fourDragonWinPercent}')],
            borderColor: "rgba(255, 201, 14, 1)",
            backgroundColor: "rgba(255, 201, 14, 0.5)",
            fill: false,
        }]
    },
    options: {
        responsive: true,
        title: {
            display: true,
            text: '용 먹은 숫자 비례 승률'
        },
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: '%'
                },
            }],
            yAxes: [{
                display: true,
                ticks: {
                    autoSkip: false,
                },
                scaleLabel: {
                    display: true,
                    labelString: 'dragon'
                }
            }]
        }
    }
});
		

		</script> 
	<script>
	var donutOptions = { cutoutPercentage: 80, //도넛두께 : 값이 클수록 얇아짐 
			legend: {position:'top', padding:5, 
				labels: {pointStyle:'circle', 
					usePointStyle:true}}
					};
	
	var ctx = document.getElementById('myChart');
	 
	var chart = new Chart(ctx, {
	    type: 'pie',
	
	    // The data for our dataset
	    data: {
	        labels: ['레드팀', '블루팀'],
	        datasets: [{
	            label: ['블루팀','레드팀'],
	            backgroundColor: ['#F06464','#6699FF'],cutoutPercentage:50,
	            borderColor: 'black',
	            data: [parseFloat('${objectWinPercentage.rFBWPercent}'), parseFloat('${objectWinPercentage.bFBWPercent}')] // 면적
	        }]
	    },
	
	    // Configuration options go here
	    options: donutOptions
	});


</script>


	<script>
	
	var donutOptions = { cutoutPercentage: 80, //도넛두께 : 값이 클수록 얇아짐 
			legend: {position:'top', padding:5, 
				labels: {pointStyle:'circle', 
					usePointStyle:true}}
					};
	
	/* var $bluedata = ${ObjectPercentage.bFBWPercent};
	var $reddata = ${objectWinPercentage.rFBWPercent}; */
	new Chart(document.getElementById("mymyChart"), {
	    type: 'pie',
	
	    data: {
	        labels: ['첫용 먹었을시 승률','그외'],
	        
	        datasets: [{
	            label: ['첫 드래곤', '그외'],
	            backgroundColor: ['#F06464','#D5D5D5'],
	            borderColor: 'black',
	            data: [parseFloat('${objectWinPercentage.firstBloodDragonWinPercent}'),100-parseFloat('${objectWinPercentage.firstBloodDragonWinPercent}') ] 
	        }]
	    },
		
	    options: donutOptions
	      
	      
	});
	

</script>



	<script>
	var donutOptions = { cutoutPercentage: 80, //도넛두께 : 값이 클수록 얇아짐 
			legend: {position:'top', padding:5, 
				labels: {pointStyle:'circle', 
					usePointStyle:true}}
					};
	new Chart(document.getElementById("mymymyChart"), {
	    type: 'pie',
	
	    // The data for our dataset
	    data: {
	        labels: ['첫 바론 먹었을시 승률','그외'],
	        datasets: [{
	            label: ['Baron','그외'],
	            backgroundColor: ['#F06464','#D5D5D5'],
	            borderColor: 'black',
	            data: [parseFloat('${objectWinPercentage.firstBloodBaronWinPercent}'),100-parseFloat('${objectWinPercentage.firstBloodBaronWinPercent}') ] // 면적
	        }]
	    },
	
	    // Configuration options go here
	    options: donutOptions
	});
	

</script>

	<script>
		new Chart(document.getElementById("memeChart"), {
		
		type: 'horizontalBar',
    data: {
        labels: ['.','0 Baron', '1 Baron', '2 Baron','3 Baron'],
        datasets: [{
            label: '승률 %',
            data: [0,parseFloat('${objectWinPercentage.zeroBaronWinPercent}'), parseFloat('${objectWinPercentage.oneBaronWinPercent}'), parseFloat('${objectWinPercentage.twoBaronWinPercent}'),
            	parseFloat('${objectWinPercentage.threeBaronWinPercent}')],
            borderColor: "rgba(255, 201, 14, 1)",
            backgroundColor: "rgba(255, 201, 14, 0.5)",
            fill: false,
        }]
    },
    options: {
        responsive: true,
        title: {
            display: true,
            text: '바론 먹은 숫자 비례 승률'
        },
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: '%'
                },
            }],
            yAxes: [{
                display: true,
                ticks: {
                    autoSkip: false,
                },
                scaleLabel: {
                    display: true,
                    labelString: 'baron'
                }
            }]
        }
    }
});
		

		</script>
		

<script>
var donutOptions = { cutoutPercentage: 80, //도넛두께 : 값이 클수록 얇아짐 
		legend: {position:'top', padding:5, 
			labels: {pointStyle:'circle', 
				usePointStyle:true}}
				};
	new Chart(document.getElementById("mymChart"), {
	    type: 'pie',
	
	    // The data for our dataset
	    data: {
	        labels: ['레드팀','블루팀'],
	        datasets: [{
	            label: ['레드팀 ', '블루팀'],
	            backgroundColor: ['#F06464','#6699FF'],
	            borderColor: 'black',
	            data: [parseFloat('${objectWinPercentage.rWinPercent}'),parseFloat('${objectWinPercentage.bWinPercent}') ] // 면적
	        }]
	    },
	
	    // Configuration options go here
	    options: donutOptions
	});


</script>

	<script>
	var donutOptions = { cutoutPercentage: 80, //도넛두께 : 값이 클수록 얇아짐 
			legend: {position:'top', padding:5, 
				labels: {pointStyle:'circle', 
					usePointStyle:true}}
					};
	new Chart(document.getElementById("mymeChart"), {
	    type: 'pie',
	
	    // The data for our dataset
	    data: {
	        labels: ['첫 전령 먹었을시 승률','그외'],
	        datasets: [{
	            label: ['전령 드래곤', '그외'],
	            backgroundColor: ['#F06464','#D5D5D5'],
	            borderColor: 'black',
	            data: [parseFloat('${objectWinPercentage.firstRiftherald}'),100-parseFloat('${objectWinPercentage.firstRiftherald}') ] // 면적
	        }]
	    },
	
	    // Configuration options go here
	    options: donutOptions
	});
	

</script> 


	<script
		src="https://s3-ap-northeast-1.amazonaws.com/ggtics-static/material-pro/assets/js/plugins/bootstrap-selectpicker.js"
		type="text/javascript"></script>
</body>
</html>