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
	<h2>!~업데이트 가능한 정보는 이름과 나이입니다~!</h2>
	
	<form action="/member/update" method="post">
		아이디: <input name="id" type="number" readonly="readonly" value="${dto.id}" ><br>
		변경이름: <input name="name" value="${dto.name}" autofocus="autofocus"><br>
		변경나이: <input name="age" value="${dto.age}"><br>
		<input type="submit" value="저장">
		<input type="reset" value="다시"><br>
	</form>
	
	<a href="/member/selectbyid?id=${dto.id}">내정보로</a><br>
</body>
</html>