<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보등록하기</title>
</head>
<body>

	<h2>!~회원등록하기~!</h2>

	<form action="/member/insert" method="post">
		아이디: <input name="id" type="number" required="required"><br>
		이름: <input name="name"  required="required"><br>
		나이: <input name="age" type="number"><br>
		<input type="submit" value="제출">
		<input type="reset" value="다시">
	</form>
	<br>
	<a href="/member/select">목록으로</a>

</body>
</html>