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
	iframe{
		width: 0px;
		height: 0px;
		border: 0px;
	}
</style>
<title>Insert title here</title>
</head>
<body>

	<div class="container">
	  <div class="row">
	  일반업로드
	  														  <!-- enctype 꼭 외워놓기 -->
		<form action="uploadForm" method="post" enctype="multipart/form-data">
         <input name="file" type="file">
         <input name="id">
         <input type="submit">
      </form>
      
      <hr>
      iframe으로 업로드
			<!-- target: iframe의 네임값 -->
	  <form target="zeroFrame" action="iuploadForm" method="post" enctype="multipart/form-data" id="form2">
         <input name="file" type="file">
         <input name="id">
         <input type="submit">
      </form>
      
      <iframe name="zeroFrame"></iframe>       
	 
	  
	 </div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
						
		});
		
		function addFilePath(result) {
			alert(result);
			document.getElementById("form2").reset();
		}
	</script>
</body>
</html>