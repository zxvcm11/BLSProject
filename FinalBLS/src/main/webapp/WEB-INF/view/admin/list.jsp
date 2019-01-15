<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 목록</title>
<script type="text/javascript">
	function allchkbox(chk){
		var chks = document.getElementsByName("idchks");
		for(var i=0;i < chks.length;i++){
			chks[i].checked = chk.checked;
		}
	}
</script>
</head>
<body>
<table border="1" style="border-collapse: collapse; width=100%;">
<tr><th>아이디</th>
	<th>이름</th>
	<th>전화번호</th>
	<th>이메일</th>
	<th>우편번호</th>
	<th>주소</th>
	<th>상세주소</th>
	<th>좋아하는 팀</th>
	<th>좋아하는 선수</th>
	<th>비고</th></tr>
<c:forEach items="${userlist}" var="user">
<tr><td>${user.userId}</td>
<td>${user.userName}</td>
<td>${user.tel}</td>
<td>${user.email}</td>
<td>${user.postcode}</td><td>${user.addr}</td><td>${user.addr1}</td><td>${user.ft}</td><td>${user.fp}</td>
	<td><a href="../user/updateForm.shop?id=${user.userId}">수정</a>
		<a href="../user/delete.shop?id=${user.userId}">삭제</a>
		<a href="../user/mypage.shop?id=${user.userId}">회원정보</a></td>
</c:forEach>
</table>
</body>
</html>