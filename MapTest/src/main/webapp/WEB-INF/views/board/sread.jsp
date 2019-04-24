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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">

			<div class="form-group">
				<label for="writer"> 작성자 </label> <input id="writer" name="writer"
					class="form-control" value="${vo.writer}" readonly="readonly">
			</div>

			<div class="form-group">
				<label for="title"> 제목 </label> <input id="title" name="title"
					class="form-control" value="${vo.title}" readonly="readonly">
			</div>

			<div class="form-group">
				<label for="updateDate"> 작성일자 </label> <input id="updateDate"
					name="updateDate" class="form-control" value="${vo.updateDate}"
					readonly="readonly">
			</div>

			<div class="form-group">
				<label for="content"> 내용 </label>
				<textarea class="form-control" id="content" name="content" rows="10"
					cols="30" readonly="readonly">${vo.content}</textarea>
			</div>

			<div class="form-group" align="center">
				<button class="btn btn-warning" id="update">수정</button>
				<button class="btn btn-info" id="search">목록</button>
				<button class="btn btn-danger" id="delete">삭제</button>
			</div>
		</div>
	</div> <!-- class container div end tag-->

	<form> <!-- 나중에 정보 여러개 넘길때는 form이 편해서 form사용 -->
			<input name="bno" value="${vo.bno}" id="bno" type="hidden">
			<!-- 아래 두줄은 글자세히읽기에서 목록으로갈때 해당 페이지로 이동시켜주는 내용 -->
			<input name="page" value="${cri.page}" id="page" type="hidden">
			<input name="perPage" value="${cri.perPage}" id="perPage" type="hidden">
			<input name="searchType" value="${cri.searchType}" id="searchType" type="hidden">
			<input name="keyword" value="${cri.keyword}" id="keyword" type="hidden">
		 </form>
	
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#update").click(function() {
				$("form").attr("action", "supdateui"); // attr : 어트리뷰트
				$("form").attr("method", "get");
				$("form").submit();
			});

			$("#search").click(function() {
				$("form").attr("action", "search");
				$("form").attr("method", "get");
				$("form").submit();
			});

			$(".btn-danger").click(function() { 
				var result = confirm("삭제하려면 확인을 눌러주세요~~!!"); 
				if(result) {
						$("form")
						.attr("action", "sdelete")
						.attr("method", "post")
						.submit(); 						
					} 
				});
		});
	</script>
</body>
</html>