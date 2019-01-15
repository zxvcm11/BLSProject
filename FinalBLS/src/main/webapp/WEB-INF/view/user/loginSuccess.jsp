<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>mypage</title>
</head>
<body>
<h2>환영합니다</h2>
<table border="1">
	<tr><th>아이디</th><td>${loginUser.userId}</td></tr>
	<tr><th>이름</th><td>${loginUser.userName}</td></tr>
	<tr><th>전화번호</th><td>${loginUser.tel}</td></tr>
	<tr><th>이메일</th><td>${loginUser.email}</td></tr>
	<tr><th>우편번호</th><td>${loginUser.postcode}</td></tr>
	<tr><th>주소</th><td>${loginUser.addr}</td></tr>
	<tr><th>상세주소</th><td>${loginUser.addr1}</td></tr>
	<tr><th>좋아하는 팀</th><td>${loginUser.ft}</td></tr>
	<tr><th>좋아하는 선수</th><td>${loginUser.fp}</td></tr>
</table>
<a href="mypage.shop?id=${loginUser.userId}">[마이페이지]</a>&nbsp;
 <a href="logout.shop?">[로그아웃]</a>&nbsp;
 <a href="../item/list.shop">상품목록</a>
</body>
</html>