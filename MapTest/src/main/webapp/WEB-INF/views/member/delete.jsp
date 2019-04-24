<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보삭제하기</title>
</head>
<body>
	<h2>!~삭제하려면 예를 눌러주세요~!</h2>
	
	<form action="/member/delete" method="post">
		아이디: <input name="id" value="${dto.id}" readonly="readonly"><br>
		이름: <input name="name" value="${dto.name}" readonly="readonly"><br>
		나이: <input name="age" value="${dto.age}" readonly="readonly"><br>
		<input type="submit" value="네">
		<input type="button" value="아니오" onClick="location.href='/member/selectbyid?id=${dto.id}'">
	</form>
	<br>
	<a href="/member/select">목록으로</a><br>

</body>
</html>