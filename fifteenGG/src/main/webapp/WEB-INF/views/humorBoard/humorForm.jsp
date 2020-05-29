<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유머 게시글 작성</title>
<c:import url="../common/commonUtil.jsp"/>

<script src="//cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/humor.css" />
<style>

</style>

</head>

<body style="background: #f4f4f4; ! important; max-width: 1011px; text-align: center; font-weight: normal; margin: 0 auto;"
	onload="onload();">
<c:import url="../common/navbar.jsp"/>

<div id="content">
<form class="form-horizontal" role="form" id="editorForm" method="post" action="${pageContext.request.contextPath}/humorBoard/humorFormEnd.do">
    <div class="form-group">
    <br>
    <br>
    <h2 class="sub-header__title">
					<a>글쓰기</a>
				</h2>
   <input type="text" class="form-control" placeholder="제목" name="humorTitle" id="humorTitle" required>
   <input type="hidden" name="userNo" value="${userNo }" />
	<input type="text" class="form-control" name="humorWriter" value="${member.nickName}" readonly required>
	<input type="hidden" name="huborBFile" value="${humorBFile}" />
        <div class="form-group">
            <div class="col-lg-12">
                <textarea name="humorContent" id="ckeditor" required></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12" align="right">
          
                <button class="btn btn-outline-secondary" type="button" onclick="javascript:history.back();">작성 취소</button>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp; &nbsp;
                <button class="btn btn-outline-info" type="submit">작성 완료</button>
            </div>
        </div>
    </div>
    
</form>
 </div>
<script>
    $(function(){
         
        CKEDITOR.replace( 'ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
            width:'100%',
            height:'400px',
            filebrowserImageUploadUrl: '${pageContext.request.contextPath }/humorBoard/ckImageUpload.do' //여기 경로로 파일을 전달하여 업로드 시킨다.
        });
         
        CKEDITOR.on('dialogDefinition', function( ev ){
            var dialogName = ev.data.name;
            var dialogDefinition = ev.data.definition;
          
            switch (dialogName) {
                case 'image': //Image Properties dialog
                    //dialogDefinition.removeContents('info');
                    dialogDefinition.removeContents('Link');
                    dialogDefinition.removeContents('advanced');
                    break;
            }
        });
         
    });
</script>

 

</body>
</html>