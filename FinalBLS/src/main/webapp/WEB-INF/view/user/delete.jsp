<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� Ż�� Ȯ��</title>
</head>
<body>
<table border="1" style="border-collapse: collapse;">
	<tr><td>���̵�</td><td>${user.userId}</td></tr>
	<tr><td>�̸�</td><td>${user.userName}</td></tr>
	<tr><td>��ȭ��ȣ</td><td>${user.tel}</td></tr>
	<tr><td>�̸���</td><td>${user.email}</td></tr>
	<tr><td>�����ȣ</td><td>${user.postcode}</td></tr>
	<tr><td>�ּ�</td><td>${user.addr}</td></tr>
	<tr><td>���ּ�</td><td>${user.addr1}</td></tr>
	<tr><td>�����ϴ� ��</td><td>${user.ft}</td></tr>
	<tr><td>�����ϴ� ����</td><td>${user.fp}</td></tr>
</table>
	<form action="delete.shop" method="post" name="deleteform">
	<input type="hidden" name="id" value="${param.id}">
	��й�ȣ<input type="password" name="password" size="12">
	<a href="javascript:document.deleteform.submit()">[ȸ��Ż��]</a>
	</form>
</body>
</html>