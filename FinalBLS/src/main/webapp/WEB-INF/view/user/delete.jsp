<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 탈퇴 확인</title>
</head>
<body>
<table border="1" style="border-collapse: collapse;">
	<tr><td>아이디</td><td>${user.userId}</td></tr>
	<tr><td>이름</td><td>${user.userName}</td></tr>
	<tr><td>전화번호</td><td>${user.tel}</td></tr>
	<tr><td>이메일</td><td>${user.email}</td></tr>
	<tr><td>우편번호</td><td>${user.postcode}</td></tr>
	<tr><td>주소</td><td>${user.addr}</td></tr>
	<tr><td>상세주소</td><td>${user.addr1}</td></tr>
	<tr><td>좋아하는 팀</td><td>${user.ft}</td></tr>
	<tr><td>좋아하는 선수</td><td>${user.fp}</td></tr>
</table>
	<form action="delete.shop" method="post" name="deleteform">
	<input type="hidden" name="id" value="${param.id}">
	비밀번호<input type="password" name="password" size="12">
	<a href="javascript:document.deleteform.submit()">[회원탈퇴]</a>
	</form>
</body>
</html>