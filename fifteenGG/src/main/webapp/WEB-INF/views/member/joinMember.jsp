<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>회원 가입 페이지</title>
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
            top: 40px;



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
            height: 400px;
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


        /*중복아이디체크관련*/
        div#userId-container{position:relative; padding:0px;}
        div#userId-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
        div#userId-container span.ok{color:green;}
        div#userId-container span.error, span.invalid{color:red;}

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

        <form action="${pageContext.request.contextPath}/member/memberJoin.do" method="post" id="fr" >
            <!-- 닉네임 -->
            <div class="form-group input-group">
                <div class="input-group-prepend" id="userId-container">
                    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    <input id="nickName" name="nickName" class="form-control" placeholder="닉네임" type="text" required>
                    <span class="guide ok">사용 가능</span>
                    <span class="guide error">사용 불가</span>
                    <span class="guide invalid">8글자 이상</span>
                    <input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/>
                </div>
            </div> <!-- form-group// -->

            <!-- 이메일 -->
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                </div>
                <input id="email" name="email" class="form-control" type="email" value="${ e_mail }" readonly>
            </div> <!-- form-group// -->


            <!-- 패스워드1 -->
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                </div>
                <input id="password" name="password" class="form-control" placeholder="비밀번호" type="password"
                       onchange="isSame()" required>
            </div> <!-- form-group// -->

            <!-- 패스워드2 -->
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                </div>
                <input id="password2" name="password2" class="form-control" placeholder="비밀번호 확인"
                       type="password" onchange="isSame()" required>
                <span id="pass"></span>
            </div> <!-- form-group// -->
            <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
            <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>


            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block"> 회원 가입</button>
            </div> <!-- form-group// -->
        </form>

    </article>
</div> <!-- card.// -->
<p id="mit"> 문의 사항 : hotzpr16@gmail.com <br />
    전화 번호 : 010-4739-7943</p>

<script>
    $(function () {
        $("#alert-success").hide();
        $("#alert-danger").hide();
        $("input").keyup(function () {
            var pwd1 = $("#password").val();
            var pwd2 = $("#password2").val();
            if (pwd1 != "" || pwd2 != "") {
                if (pwd1 == pwd2) {
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
    //----------------------------------------//

    $("#nickName").on("keyup", function () {
        var nickName = $(this).val().trim();

        if (nickName.length > 8) {
            $(".guide.error").hide();
            $(".guide.ok").hide();
            $(".guide.invalid").show();

            return;

        } else {

            $.ajax({
                url: "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
                data: {nickName: nickName},
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    // if(data=="true") //stream 방식
                    if (data.isUsable == true) { //viewNzame 방식
                        $(".guide.error").hide();
                        $(".guide.invalid").hide();
                        $(".guide.ok").show();
                        $("#idDuplicateCheck").val(1);
                    } else {
                        $(".guide.error").show();
                        $(".guide.invalid").hide();
                        $(".guide.ok").hide();
                        $("#idDuplicateCheck").val(0);
                    }
                }, error: function (jqxhr, textStatus, errorThrown) {
                    console.log("ajax 처리 실패");
                    //에러로그
                    console.log(jqxhr);
                    console.log(textStatus);
                    console.log(errorThrown);
                }
            });
        }
        //console.log(userId);
    });


    function validate() {
        var nickName = $("#nickName");
        if (nickName.val().trim().length < 2) {
            alert("닉네임 최소 2자리이상이어야 합니다.");
            nickName.focus();
            return false;
        }

        //아이디중복체크여부
        if ($("#idDuplicateCheck").val() == 0) {
            alert("사용가능한 아이디를 입력해주세요.");
            return false;
        }

        return true;
    }
</script>
<!--container end.//-->

<br><br>

</body>
</html>