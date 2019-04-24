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
	  	<form action="create" method="post">
		  <div class="form-group">
	  		<label for="mid">MID</label>
	  		<input type="number" id="mid" name="mid" class="form-control"><br>
	  		
	  		<label for="targetId">targetId</label> 
	  		<input id="targetId" name="targetId" class="form-control"><br>
	  		
	  		<label for="sender">sender</label>
	  		<input id="sender" name="sender" class="form-control"><br>
	  		
	  		<label for="message">message</label>
	  		<input id="message" name="message" class="form-control"><br>
		  </div>
	  	</form>
	  	
	  	<div class="form-group">
	  		<button class="btn btn-info" type="submit">전송</button>
	  	</div>
	  	
	  </div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("button[type='submit']").click(function() {
				$("form").submit();
			});				
		});
	</script>
</body>
</html>