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
				<th>PB</th>
			</tr>
		</thead>
		<tbody align="center">
			<tr>
				<td>${dto.id}</td>
				<td>${dto.pname}</td>
				<td>${dto.pb}</td>
			</tr>
		</tbody>
	</table>
	
	<br>
	<a href="/tvp/list">목록으로</a><br>
	<a href="/tvp/updateui?id=${dto.id}">업데이트하기</a>
	<a href="/tvp/delete?id=${dto.id}">정보삭제하기</a>
</body>
</html>