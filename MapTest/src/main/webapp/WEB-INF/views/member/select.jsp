<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록보기</title>
</head>
<body>
	
	<h2>!~목록입니다~!</h2>
	<a href="/member/insertui">회원등록</a>
	<br>
	<br>
	<table border="1">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.id}</td>
									<!-- /경로/ : 절대좌표 -->
					<td><a href="/member/selectbyid?id=${dto.id}">${dto.name}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>