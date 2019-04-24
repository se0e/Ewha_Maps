<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보업데이트하기</title>
</head>
<body>
	<h2>!~업데이트 가능한 정보는 이름입니다~!</h2>
	
	<form action="/test/update" method="post">
		아이디: <input name="num" type="number" readonly="readonly" value="${dto.num}" ><br>
		변경이름: <input name="tname" value="${dto.tname}" autofocus="autofocus"><br>
		<input type="submit" value="저장">
		<input type="reset" value="다시"><br>
	</form>
	
	<a href="/test/selectbynum?num=${dto.num}">내정보로</a><br>

</body>
</html>