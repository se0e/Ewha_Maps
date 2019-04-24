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

	<h2>!~목록입니다~!</h2>
	<a href="/test/insertui">글쓰러가깅</a>
	<br>
	<br>
 	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.num}</td>
									<!-- /경로/ : 절대좌표 -->
					<td><a href="/test/selectbynum?num=${dto.num}">${dto.tname}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>