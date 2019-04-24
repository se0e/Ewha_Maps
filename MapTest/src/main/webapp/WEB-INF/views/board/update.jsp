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
<title>Insert title here</title>
</head>
<body>

	<div class="container">
	  <div class="row">
	  
		<form action="/board/update" method="post">
			<div class="form-group">
			  	<label for="bno"> 글번호 </label>
			  	<input id="bno" name="bno" class="form-control" value="${vo.bno}" readonly="readonly">
			</div>
	
		  	<div class="form-group">
			  	<label for="writer"> 작성자 </label>
			  	<input id="writer" name="writer" class="form-control" value="${vo.writer}">
		  	</div>
	
		  	<div class="form-group">
			  	<label for="title"> 제목 </label>
			  	<input id="title" name="title" class="form-control" value="${vo.title}" >
		  	</div>
		  	  
		  	<div class="form-group">
		  		<label for="updateDate"> 작성일자 </label>
		  		<input id="updateDate" name="updateDate" class="form-control" value="${vo.updateDate}" readonly="readonly" >
		  	</div>
		  
		  	<div class="form-group">
		  		<label for="content"> 내용 </label>
		  		<textarea class="form-control" id="content" name="content" rows="10" cols="30" >${vo.content}</textarea>
			</div>
			
			<input name="page" value="${cri.page}" id="page" type="hidden">
			<input name="perPage" value="${cri.perPage}" id="perPage" type="hidden">
		</form>
	  
		<div class="form-group" align="center">
			<button class="btn btn-success" id="update" type="submit">완료</button>
			<button class="btn btn-info" id="read">이전</button>
		</div>
	  
	  </div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("button[type='submit']").click(function() {
				$("form").submit();
			});
			
			$("#read").click(function() {
				$("form").attr("action", "read");
				$("form").attr("method", "post");
				$("form").submit();
			});
		});
	</script>
</body>
</html>