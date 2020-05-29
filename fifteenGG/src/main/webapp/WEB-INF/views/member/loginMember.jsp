<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
@import url(//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css);

div.main{
/*    background-image: url("${pageContext.request.contextPath}/resources/Images/member/jin.jpg");
 */   background-size: cover;
    background-color : black;
   height:calc(100vh);
   width:100%;
}

[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}

/* ---------- GENERAL ---------- */

* {
  box-sizing: border-box;
    margin:0px auto;

  &:before,
  &:after {
    box-sizing: border-box;
  }

}

body {
   
    color: #606468;
  font: 87.5%/1.5em 'Open Sans', sans-serif;
  margin: 0;
}

a {
   color: #eee;
   text-decoration: none;
}

a:hover {
   text-decoration: underline;
}

input {
   border: none;
   font-family: 'Open Sans', Arial, sans-serif;
   font-size: 14px;
   line-height: 1.5em;
   padding: 0;
   -webkit-appearance: none;
}

p {
   line-height: 1.5em;
}

.clearfix {
  *zoom: 1;

  &:before,
  &:after {
    content: ' ';
    display: table;
  }

  &:after {
    clear: both;
  }

}

.container {
  left: 50%;
  position: fixed;
  top: 50%;
  transform: translate(-50%, -50%);
}

/* ---------- LOGIN ---------- */

#login form{
   width: 250px;
}
#login, .logo{
    display:inline-block;
    width:40%;
}
#login{
  padding-right : 900px;
  padding: 0px 22px;
  width: 59%;
}
#logo{
   line-height: 125px;
   font-size: 72px;
   background-image: linear-gradient(black, black, #167ac6, white, ghostwhite);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  position:relative;  
}

#login form span.fa {
    background : gray;
   border-radius: 3px 0px 0px 3px;
   color: #000;
   display: block;
   float: left;
   height: 40px;
    font-size:24px;
   line-height: 40px;
   text-align: center;
   width: 50px;
}

#login form input {
   height: 40px;
   
}
fieldset{
    padding:0;
    border:0;
    margin: 0;

}
#login form input[type="text"], input[type="password"] {
   background-color: white;
   border-radius: 0px 3px 3px 0px;
   color: #000;
   margin-bottom: 1em;
   padding: 0 16px;
   width: 200px;
   opacity: 0.8;
}
#login form input[type="submit"] {
  border-radius: 3px;
  -moz-border-radius: 3px;
  -webkit-border-radius: 3px;
  background-image: -webkit-linear-gradient(black,#428bca,#167ac6);
  color: #eee;
  font-weight: bold;
  /* margin-bottom: 2em; */
  text-transform: uppercase;
  padding: 5px 10px;
  height: 30px;
}

#login form input[type="submit"]:hover {
   
   background-image: -webkit-linear-gradient(#167ac6,#428bca, black);
}

#login > p {
   text-align: center;
}

#login > p span {
   padding-left: 5px;
}
.middle {
padding-right: 600px;
  display: flex;
  width: 900px;
}
   .video-film{
       box-shadow : rgba(0,7,15,0.7) 0 0 0 9999px;
      z-index : 100;
   }
    .video-background {
        background: #000;
        position: fixed;
        top: 0; right: 0; bottom: 0; left: 0;
        z-index: -99;
        background-size : cover;
    }
       .video-foreground,
       .video-background iframe {
           position: absolute;
           top: 0;
           left: 0;
           width: 100%;
           height: 100%;
           pointer-events: none;
    }
    @media (min-aspect-ratio: 16/9) {
    .video-foreground { height: 300%; top: -100%; }
    }
    @media (max-aspect-ratio: 16/9) {
    .video-foreground { width: 300%; left: -100%; }
    }
</style>
</head>
<body>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- Include the above in your HEAD tag -->

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<div class="video-background">
    <div class="video-foreground">
    <div id="muteYouTubeVideoPlayer"></div>
    </div>
  </div>
    
    <div class="container">
    
<center>


<div class="middle">
      <div id="login">

        <form name="memberLogin" action="memberLogin.do" method="post">

          <fieldset class="clearfix">
         <div id="logo" ><b>15.GG</b></div>

            <p ><span class="fa fa-user"></span><input name ="email" type="text"  Placeholder="이메일" required></p> <!-- JS because of IE support; better: placeholder="Username" -->
            <p><span class="fa fa-lock"></span><input name ="password" type="password"  Placeholder="비밀번호" required></p> <!-- JS because of IE support; better: placeholder="Password" -->
            
             <div>
                                <span style="width:48%; text-align:left; text-decoration:underline; display: inline-block;"><a class="small-text" href="${pageContext.request.contextPath}/member/email.do">아이디 생성 하기
                                </a></span>
                                <span style="width:50%; text-align:right;  display: inline-block;"><input type="submit" value=" 로그인  "></span>
                            </div>

          </fieldset>
<div class="clearfix"></div>
        </form>

        <div class="clearfix"></div>

      </div> <!-- end login -->
          
          <div class="clearfix"></div>
      </div>
      
      </div>
</center>
    </div>
    <!-- video -->
 <div class="video-film"></div>
 
  <script async src="https://www.youtube.com/iframe_api"></script>
<script type="text/javascript">
  var player;
  function onYouTubePlayerAPIReady() {
    player = new YT.Player('muteYouTubeVideoPlayer', {
       videoId: 'IOo2jdmEAHQ',
       playerVars: {
             autoplay: 1,        // Auto-play the video on load
             controls: 0,        // Show pause/play buttons in player
             rel : 0,
             start: 105,
             end: 301,
             showinfo : 0,
             showinfo: 0,        // Hide the video title
             modestbranding: 1,  // Hide the Youtube Logo
             loop: 1,            // Run the video in a loop
             playlist : 'IOo2jdmEAHQ',
             fs: 0,              // Hide the full screen button
             cc_load_policy: 0, // Hide closed captions
             iv_load_policy: 3,  // Hide the Video Annotations
             autohide: 1         // Hide video controls when playing
           },
       events: {
             onReady: function(e) {
               e.target.mute();
             }
          }
    });
  }
  </script>
    

</body>
</html>