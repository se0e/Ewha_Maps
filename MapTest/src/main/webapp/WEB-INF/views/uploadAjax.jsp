<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
	.fileDrop{
		width: 100 %;
		height: 200px;
		border: 1px dotted red;
	}
</style>
<title>Insert title here</title>
</head>
<body>

	<div class="container">
	  <div class="row">
	  
	  		<!-- 파일을 드래그해서 놓는 자리 -->
	  		<div class="fileDrop"></div>
	  		
	  		<!-- 업로드한 파일의 목록을 출력 -->
	  		<div class="uploadedList"></div>
	  
	  </div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
								// 이벤트 종류
			$(".fileDrop").on("dragenter dragover", function(event) {
				event.preventDefault();
			});
								
			$(".fileDrop").on("drop", function(event) {
				event.preventDefault();
													// 데이터를 파일객체로 변환하라.
				var files= event.originalEvent.dataTransfer.files;
				var file= files[0]; // 0번째부터 갖고오기
				
				var formData= new FormData();
				formData.append("file", file); // file추가
				
				$.ajax({
					url: "/uploadAjax",
					type: "post",
					data: formData,
					dataType: "text",
					processData: false,
					contentType: false,
					success: function(data){
						alert(data);
					}
					
				});
			});
								
		});
	</script>
</body>
</html>