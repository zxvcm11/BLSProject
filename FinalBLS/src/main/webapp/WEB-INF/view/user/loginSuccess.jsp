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
<h2>ȯ���մϴ�</h2>
<table border="1">
	<tr><th>���̵�</th><td>${loginUser.userId}</td></tr>
	<tr><th>�̸�</th><td>${loginUser.userName}</td></tr>
	<tr><th>��ȭ��ȣ</th><td>${loginUser.tel}</td></tr>
	<tr><th>�̸���</th><td>${loginUser.email}</td></tr>
	<tr><th>�����ȣ</th><td>${loginUser.postcode}</td></tr>
	<tr><th>�ּ�</th><td>${loginUser.addr}</td></tr>
	<tr><th>���ּ�</th><td>${loginUser.addr1}</td></tr>
	<tr><th>�����ϴ� ��</th><td>${loginUser.ft}</td></tr>
	<tr><th>�����ϴ� ����</th><td>${loginUser.fp}</td></tr>
</table>
<a href="mypage.shop?id=${loginUser.userId}">[����������]</a>&nbsp;
 <a href="logout.shop?">[�α׾ƿ�]</a>&nbsp;
 <a href="../item/list.shop">��ǰ���</a>
</body>
</html>