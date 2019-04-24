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
	<h2>!~글등록하기~!</h2>

	<form action="/test/insert" method="post">
		아이디: <input name="num" type="number" required="required"><br>
		이름: <input name="tname"  required="required"><br>
		<input type="submit" value="제출">
		<input type="reset" value="다시">
	</form>
	<br>
	<a href="/test/list">목록으로</a>
</body>
</html>