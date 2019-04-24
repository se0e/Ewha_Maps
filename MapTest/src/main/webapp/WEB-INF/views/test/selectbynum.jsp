<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>!~유저정보보기~!</h2>
	<table border="1">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody align="center">
			<tr>
				<td>${dto.num}</td>
				<td>${dto.tname}</td>
				<td>${dto.tday}</td>
			</tr>
		</tbody>
	</table>
	
	<br>
	<a href="/test/list">목록으로</a><br>
	<a href="/test/updateui?num=${dto.num}">업데이트하기</a>
	<a href="/test/delete?num=${dto.num}">정보삭제하기</a>

</body>
</html>