<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>인증 받을 이메일 작성 화면</title>
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
            border-bottom: hidden;
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
            background-color: #f8f9fa !important;
            border-color: #f8f9fa !important;
            font-size: unset
        }

        #alert-danger {
            background-color: #f8f9fa !important;
            border-color: #f8f9fa !important;
            color: red;
        }
        .btn-primary{
        	backgorund-color : black;
        	
		}
   		.bg-light{
   			background : none !important;
   			
   		}
   		#font{
   		    font-family: fantasy;
   			font-size : 50px;
   			color: maroon;
   		}
   		.divider-text{
   			border-bottom: unset;;
   		}
   		body{
		   	 background-image: url("${pageContext.request.contextPath}/resources/Images/member/da.jpg"); 
  			 background-size: cover; 
  			
   		}
   		.card bg-light{
   		  	border-bottom-color: transparent;
   		    height: -webkit-fill-available;
   		}
   		.card{
   		   	border-color: transparent;
   		
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
    #od{
        padding-top: 300px;
   		padding-right: 700px;
    
    }
    .button {
  display: inline-block;
  border-radius: 4px;
  background-color: #413e47;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 28px;
  padding: 0px;
  width: 100px;
  height : 50px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
  
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
  
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
.form-control{
	color : #dee2e6;
	border: 1px solid #6c757d;
}
.input-group-text{
    border-color: gray;
    background: gray;
    color: black;
}
.form-control{
    background: darkgray;
}
.text-center{
	color: papayawhip;
}
    </style>
</head>
<body> 
<div class="video-background">
    <div class="video-foreground">
    <div id="muteYouTubeVideoPlayer"></div>
    </div>
  </div>


<div id="card" class="card bg-light">

    <article id="od" class="card-body mx-auto" >


        <p class="divider-text">
            <span id="font" class="bg-light" >15.GG</span>
        </p>
        <form action="auth.do" method="post"  >
       
            <!-- 이메일 -->
            <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                </div>
                <input name="e_mail" class="form-control" placeholder="인증 받을 이메일" type="email" required>
            </div> <!-- form-group// -->
	
			<!-- 버튼 -->
            <div class="form-group">
           		 <button class="button" name="submit" type="submit"style="vertical-align:middle"><span>send</span></button>
                
            </div> <!-- form-group// -->


            <p class="text-center">로그인 바로가기/ <a href="${pageContext.request.contextPath}/member/loginMemberView.do">로그인</a></p>
        </form>
    </article>
</div> <!-- card.// -->

<!-- video -->
 <div class="video-film"></div>
 
  <script async src="https://www.youtube.com/iframe_api"></script>
<script type="text/javascript">
  var player;
  function onYouTubePlayerAPIReady() {
    player = new YT.Player('muteYouTubeVideoPlayer', {
    	videoId: '73PRV4dn81M',
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
    	      playlist : '73PRV4dn81M',
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