<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ֹ� Ȯ�� ��ǰ</title>

<style type="text/css">
table {width:90%; border-collpase: collapse;}
th, td {border : 3px solid #bcbcbc; text-align : center; padding : 8px;}
th {background-color: #4CAF50; color:white; text-align: center;}
td {background-color: #f2f2f2;}
td.title {background-color : # e2e2e2; color:blue};
</style></head>
<body>

<h2>${loginUser.userName }���� �ֹ��Ͻ� �����Դϴ�.</h2>
<h2>����� ����</h2>
<table>
	<tr><td width="30%" class="title">������ ID</td>
	<td width="70%">${sessionScope.loginUser.userId }</td></tr>
	<tr><td width="30%" class="title">�̸�</td>
	<td width="70%">${sessionScope.loginUser.userName }</td></tr>
	<tr><td width="30%" class="title">�����ȣ</td>
	<td width="70%">${sessionScope.loginUser.postcode }</td></tr>
	<tr><td width="30%" class="title">�ּ�</td>
	<td width="70%">${sessionScope.loginUser.addr }${sessionScope.loginUser.addr }</td></tr>
	<tr><td width="30%" class="title">��ȭ��ȣ</td>
	<td width="70%">${sessionScope.loginUser.tel }</td></tr>
	<tr><td width="30%" class="title">�̸���</td>
	<td width="70%">${sessionScope.loginUser.email }</td></tr>
</table><br><br>
<h2>�ֹ� �Ϸ� ��ǰ ���</h2>
<table>
	<tr><td>��ǰ��</td><td>��ǰ����</td><td>����</td><td>�ѱݾ�</td>
	<c:forEach items="${sale.itemList }" var="saleItem">
	<tr><td>${saleItem.item.name}</td>
	    <td>${saleItem.item.price}��</td>
	    <td>${saleItem.quantity}</td>
	    <td>${saleItem.item.price * saleItem.quantity}</td></tr>
	</c:forEach>
	<tr><td colspan="4" style="text-align: right;">�ѱݾ�:
		<fmt:formatNumber value="${totalAmount }"	pattern="#,###"/>��
	</td></tr>
	<tr><td colspan="4">
	<a href="../item/list.shop">��ǰ���</a>
	</td></tr>
</table>
</body>
</html>