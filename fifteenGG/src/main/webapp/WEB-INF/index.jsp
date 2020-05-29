<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css" />
    <c:import url="views/common/commonUtil.jsp"/>
    <title>15.GG</title>
    <%--  로고 font --%>
    <link href="https://fonts.googleapis.com/css?family=Baloo+Bhai&display=swap" rel="stylesheet">

    <!-- chat css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat.css">

<script>
	$(document).ready(function(){
	    $("#content").load("${pageContext.request.contextPath}/partyBoard/indexPartyBoardList.do");
	});
</script>

</head>
<body>

    <%-- 내용 부분 --%>
    <div style="min-height: 100%; margin: 0 auto -132px;" class="bg-white">
        <%-- nav 영역 --%>
        <c:import url="views/common/navbar.jsp"/>


        <%-- nav 와 div 사이의 영역 --%>
        <div class="row">
        </div>


        <%-- 메인 영역 --%>
        <div class="container-fluid">
            <!-- 로고 부분 -->
            <div><p style="font-family: 'Baloo Bhai', cursive; font-size: 60px"><a href="${pageContext.request.contextPath}">15.GG</a></p></div>

            <!-- 검색창 -->
            <div class="row mt-4 form-group">
                <div class="col-10 col-lg-8 px-2 mx-auto pb-1 bg-white">
                    <form action="${pageContext.request.contextPath}/search/SummonerSearch.do" class="form-group" style="
                    position: relative;
                    width: 570px;
                    margin: 0 auto;
                    border-radius: 2px;
                    background-color: #f4f4f4;">
                        <input type="text" id="summonerName" name="summonerName" placeholder="소환사 명" style="
                        display: block;
                        width: 100%;
                        padding: 15px 150px 18px 17px;
                        background: none;
                        border: none;
                        line-height: 17px;
                        font-size: 14px;
                        color: #9b9b9b;
                        box-sizing: border-box;
                        outline: none;
                        box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.19);">

                        <button type="submit" style="
                        background: #f4f4f4;
                        display: flex;
                        position: absolute;
                        top: 0;
                        right: 0;
                        padding: 0;
                        border: none;
                        margin: 10px 10px 0 0;">
                            <!-- 검색 아이콘 -->
                            <i class="fas fa-search fa-2x"></i>
                        </button>
                    </form>

                </div>
            </div>

            <!-- 무료 챔피언 -->
            <div class="mt-4">
                <div class="col-10 col-lg-8 px-2 mx-auto pb-1 bg-white">
                    <label class="control-label" style="font-size: 25px;">무료 챔피언</label>
                    <div id="championLote">
                    </div>
                </div>
            </div>
            <br />
            <br />


            <div id="content"></div>



        </div>
    </div>
   



    <c:if test="${ !empty member }">
        <i type="radio" id="ok2" onclick="chattingBtn();" class="far fa-comments" data-toggle="modal" style="margin-left:870px; font-size:48px; color:navy; "></i>
    </c:if>
    <script>
        function chattingBtn(){
            var title = 'chatting';
            var url = '${pageContext.request.contextPath}/chatting.do';
            var status = 'width = 500px, heigh= 700px';

            var popup = window.open(url, title, status);
        }
    </script>

    <script>
        $(()=>{
            $.ajax({
                url : "${pageContext.request.contextPath}/champion/freeChampion.do",
                type : 'json',
                success : function( data ){
                    console.log( data );
                    console.log(data['freeChampName'][0]);

                    for(var i = 0; i < data['freeChampName'].length; i++){
                        var html = "<a href='${pageContext.request.contextPath}/champion/championDetail.do?name="+data['freeChampName'][i]+"'><img id='freeChampImg' src='https://ddragon.leagueoflegends.com/cdn/10.1.1/img/champion/"+data['freeChampImage'][i]+"'>'"+"</a>";

                        if( i%8 == 7 ){
                            html += "<br/>";
                        }
                        $("#championLote").append( html );
                    }
                },
                error : function( xhr, txtStatus, err ){
                    console.log( xhr, txtStatus, err );
                }
            })
        });
    </script>

    <script>
        $('#ok2').hover(function(){
            $(this).css("color","red");
        }, function(){
            $(this).css("color","blue");
        });
    </script>

</body>
</html>