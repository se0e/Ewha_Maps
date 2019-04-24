<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저정보확인</title>
</head>
<body>

	<h2>!~유저정보보기~!</h2>
	<table border="1">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>나이</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody align="center">
			<tr>
				<td>${dto.id}</td>
				<td>${dto.name}</td>
				<td>${dto.age}</td>
				<td>${dto.regdate}</td>
			</tr>
		</tbody>
	</table>
	
	<br>
	<a href="/member/select">목록으로</a><br>
	<a href="/member/updateui?id=${dto.id}">업데이트하기</a>
	<a href="/member/deleteui?id=${dto.id}">정보삭제하기</a>

</body>
</html>