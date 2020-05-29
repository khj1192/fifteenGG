<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>회원 정보 관리</title>
    <c:import url="../common/commonUtil.jsp"/>
    <style>
        .divider-text {
            position: relative;
            text-align: center;
            margin-top: 15px;
            margin-bottom: 15px;
        }

        .divider-text span {
            padding: 7px;
            font-size: 12px;
            position: relative;
            z-index: 2;
        }

        .divider-text:after {
            content: "";
            position: absolute;
            width: 100%;
            border-bottom: 1px solid #ddd;
            top: 55%;
            left: 0;
            z-index: 1;
        }

        .btn-facebook {
            background-color: #405D9D;
            color: #fff;
        }

        .btn-twitter {
            background-color: #42AEEC;
            color: #fff;
        }

        #alert-success {
            background-color: darkgray !important;
            border-color: #f8f9fa !important;
            font-size: unset
        }

        #alert-danger {
            background-color: darkgray !important;
            border-color: #f8f9fa !important;
            color: red;
        }
        .btn-primary{
            backgorund-color : black;

        }
        .alert-danger {
            padding : 0;
        }
        .alert{
            padding : 0;
        }
        #card{
            background: currentColor !important;

        }
        html{
            background: #29467D;
        }
        body{
            background: #29467D;

        }
        #mini{
            width:300px ;
            height:300px;
            position: relative;
            left: -300px;
            top: 60px;



        }
        #lolo{
            font-size: 100px;
            font-weight: 800;
            color: cornflowerblue;
        }
        #mit{
            margin-left: 700px;
            font-weight: 500;
            color: white;
        }
        #dele{
            background: brown;
            border : brown;
        }
        #card{
            height: 450px;
        }

        #fr{
            position: relative;
            left: 40px;
            top: -250px;
        }
        .card-body mx-auto{
            max-width: 400px;
            position: relative;
            top: -160px;
            margin: auto;
        }
    </style>
</head>
<body>
<div>
    <br /><br /><br /><br /><b></b>
    <span id="lolo">15.GG</span>
</div>


<div id="card" class="card bg-light">
    <article class="card-body mx-auto">




        <img id="mini" src="${pageContext.request.contextPath}/resources/Images/member/mini.png">
        <form action="memberUpdate.do" method="post" id="fr">
            <!-- 이름 -->
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                </div>
                <input name="nickName" class="form-control" placeholder="닉네임" type="text">

            </div> <!-- form-group// -->



            <!-- 이메일 -->
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                </div>
                <input name="email" class="form-control" placeholder="이메일" type="email" value=${member.email} readonly="readonly">
            </div> <!-- form-group// -->


            <!-- 패스워드1 -->
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                </div>
                <input id="password3" class="form-control" placeholder="새 비밀번호" type="password" name="password" required>
            </div> <!-- form-group// -->

            <!-- 패스워드2 -->
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                </div>
                <input id="password4" class="form-control" placeholder="비밀번호 확인" type="password" name="passwordChk" required>
            </div> <!-- form-group// -->
            <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
            <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>



            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block"> 수정 완료  </button>
            </div> <!-- form-group// -->

            <button type="reset" class="btn btn-primary btn-block"> 취 소  </button>
            <button id="dele" class="btn btn-primary btn-block" onclick="deleteGo()" > 회원 탈퇴  </button>
        </form>
    </article>
</div> <!-- card.// -->


<!--container end.//-->

<br><br>
<p id="mit"> 문의 사항 : hotzpr16@gmail.com <br />
    전화 번호 : 010-4739-7943</p>





<script>
    $(function () {
        $("#alert-success").hide();
        $("#alert-danger").hide();
        $("input").keyup(function () {
            var pwd3 = $("#password3").val();
            var pwd4 = $("#password4").val();
            if (pwd3 != "" || pwd4 != "") {
                if (pwd3 == pwd4) {
                    $("#alert-success").show();
                    $("#alert-danger").hide();
                    $("#submit").removeAttr("disabled");
                } else {
                    $("#alert-success").hide();
                    $("#alert-danger").show();
                    $("#submit").attr("disabled", "disabled");
                }
            }
        });
    });
    function deleteGo() {

        location.href="${pageContext.request.contextPath}/member/memberDelete.do";

    }

</script>
</body>
</html>