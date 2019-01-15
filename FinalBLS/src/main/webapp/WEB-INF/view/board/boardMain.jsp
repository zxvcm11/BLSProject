<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lobster&effect=brick-sign">
<title>Team Board Image</title>
<style type="text/css">
</style>
</head>
<body>
	<div class="w3-row">
		<c:forEach items="${sessionScope.tcode}" var="c">
			<div class="w3-col">
				<a href="${path}/team/mainPage.shop"><img
					src="${path}/picture/logo_${c.key}.jpg"
					style="width: 200px; height: 100px;"></a>
			</div>
		</c:forEach>
	</div>
</body>
</html>