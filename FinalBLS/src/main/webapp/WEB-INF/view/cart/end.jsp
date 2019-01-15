<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주문 확정 상품</title>

<style type="text/css">
table {width:90%; border-collpase: collapse;}
th, td {border : 3px solid #bcbcbc; text-align : center; padding : 8px;}
th {background-color: #4CAF50; color:white; text-align: center;}
td {background-color: #f2f2f2;}
td.title {background-color : # e2e2e2; color:blue};
</style></head>
<body>

<h2>${loginUser.userName }님이 주문하신 정보입니다.</h2>
<h2>배송지 정보</h2>
<table>
	<tr><td width="30%" class="title">구매자 ID</td>
	<td width="70%">${sessionScope.loginUser.userId }</td></tr>
	<tr><td width="30%" class="title">이름</td>
	<td width="70%">${sessionScope.loginUser.userName }</td></tr>
	<tr><td width="30%" class="title">우편번호</td>
	<td width="70%">${sessionScope.loginUser.postcode }</td></tr>
	<tr><td width="30%" class="title">주소</td>
	<td width="70%">${sessionScope.loginUser.addr }${sessionScope.loginUser.addr }</td></tr>
	<tr><td width="30%" class="title">전화번호</td>
	<td width="70%">${sessionScope.loginUser.tel }</td></tr>
	<tr><td width="30%" class="title">이메일</td>
	<td width="70%">${sessionScope.loginUser.email }</td></tr>
</table><br><br>
<h2>주문 완료 상품 목록</h2>
<table>
	<tr><td>상품명</td><td>상품가격</td><td>수량</td><td>총금액</td>
	<c:forEach items="${sale.itemList }" var="saleItem">
	<tr><td>${saleItem.item.name}</td>
	    <td>${saleItem.item.price}원</td>
	    <td>${saleItem.quantity}</td>
	    <td>${saleItem.item.price * saleItem.quantity}</td></tr>
	</c:forEach>
	<tr><td colspan="4" style="text-align: right;">총금액:
		<fmt:formatNumber value="${totalAmount }"	pattern="#,###"/>원
	</td></tr>
	<tr><td colspan="4">
	<a href="../item/list.shop">상품목록</a>
	</td></tr>
</table>
</body>
</html>