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
	<h2>!~업데이트 가능한 정보는 이름과 PB입니다~!</h2>
	
	<form action="/tvp/update" method="post">
		아이디: <input name="id" readonly="readonly" value="${dto.id}" ><br>
		변경이름: <input name="pname" value="${dto.pname}" autofocus="autofocus"><br>
		변경나이: <input name="pb" value="${dto.pb}" autofocus="autofocus"><br>
		<input type="submit" value="저장">h
		<input type="reset" value="다시"><br>
	</form>
	
	<a href="/tvp/selectbyid?id=${dto.id}">내정보로</a><br>
</body>
</html>