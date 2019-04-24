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

	  	<form action="/board/write" method="post">
	  		<div class="form=group">
		  		<label for="title"> 제목 </label>
		  		<input class="form-control" id="title" name="title" required="required" autofocus="autofocus">
	  		</div>

	  		<div class="form-group">
		  		<label for="writer"> 작성자 </label>
		  		<input class="form-control" id="writer" name="writer" required="required">
	  		</div>

	  		<div class="form-group">
		  		<label for="content"> 글내용 </label>
		  		<textarea class="form-control" id="content" name="content" rows="10" cols="30" required="required"></textarea>
	  		</div>
	  	</form>

	  	<div class="form-group" align="center">
	  		<button class="btn btn-success" type="submit">등록</button>
	  		<button class="btn btn-info" id="list">목록</button>
	  	</div>  	
	  	
	  </div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("button[type='submit']").click(function() { // 타입이 submit인 버튼을 클릭하면
				$("form").submit(); // form태그가 submit된다.
			});
			
			$("#list").click(function() {
				$("form").attr("action", "list");
				$("form").attr("method", "post");
				$("form").submit();
			});
		});
	</script>
</body>
</html>