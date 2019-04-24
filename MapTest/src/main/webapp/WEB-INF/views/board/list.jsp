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
<script src="../../resources/js/test.js" type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<div class="container">
	
		<div class="row">
			<a class="btn btn-info" href="/board/writeui">글쓰기</a>
		</div>
		
		<div class="row">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td>${vo.bno}</td>
							<td><a href="/board/read${pm.makeQuery(pm.cri.page)}&bno=${vo.bno}">${vo.title}</a></td>
							<td>${vo.writer}</td>
							<td>${vo.updateDate}</td>
							<td>${vo.viewCnt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div> <!-- class row -->

		<div class="row text-center">
			<ul class="pagination"> <!-- 반드시 pagenation이로 해야함. -->
				<c:if test="${pm.cri.page>1}">
				<li><a href="/board/list${pm.makeQuery(pm.cri.page-1)}">&laquo;</a></li>
				</c:if>
				
				<c:forEach var="idx" begin="${pm.beginPageNum}" end="${pm.stopPageNum}">
			<!-- 받아온페이지가 idx와 같으면 active. 안같으면 처리x -->
				<li class="${pm.cri.page==idx ? 'active' : ' '}"><a href="/board/list${pm.makeQuery(idx)}">${idx}</a></li>
				</c:forEach>
				
				<c:if test="${pm.cri.page!=pm.totalPage}">
				<li><a href="/board/list${pm.makeQuery(pm.cri.page+1)}">&raquo;</a></li>
				</c:if>		
			</ul>
		</div>
		
		<div class="row" align="center">
			<form action="/board/search" method="get" target="_blank">			
				<div class="col-xs-3 col-sm-2">
					<select class="form-control" id="ssel" name="searchType">
						<option disabled="disabled">검색기준</option> <!--disabled: 선택ㄴ -->
						<option value="title">제목</option>
						<option value="writer">작성자</option>
						<option value="content">내용</option>
					</select>
				</div>
				<div class="input-group col-xs-9 col-sm-10">
					<input class="form-control" name="keyword" id="keyword" >
					<span class="input-group-btn">
						<button class="btn btn-success" id="searchBtn">검색</button>
					</span>
				</div>
			</form>
		</div>
		
	</div><!-- class container -->
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#searchBtn").click(function() {
				$("form").submit();
			});
		});
	</script>
</body>
</html>