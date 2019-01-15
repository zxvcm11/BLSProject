<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<link
	href="https://stackpath.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" type="text/css" />
<head>
<meta charset="EUC-KR">
<title>CRAWING을 이용한 SCREEN</title>
<style type="text/css">
.pls, table.team, div#dashboard {
	margin: auto;
	margin-bottom: 25px;
}

div.w3-row {
	width: 1060px;
	margin: auto;
}

.w3-button {
	padding-top: 5px;
}
</style>
</head>

<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<body>
	<div class="w3-row">

		<c:forEach items="${pCode}" var="pcode" varStatus="p">

			<div class="w3-display-container w3-col s2 w3-padding">

				<img src="${path}/picture/team_players/${pcode.key}.jpg"
					style="width: 120px; height: 120px; margin-left: 12px">
				<div class="w3-display-middle w3-display-hover">

 					<c:forEach items="${pName}" var="pname">
					<c:if test="${pname.key==pcode.key}">
						<button
							onclick="location.href='${path}/team/pl.shop?pCode=${pname.key}'"
							class="w3-button w3-black">${pname.value}</button>
							</c:if>
					</c:forEach> 

				</div>

			</div>

		</c:forEach>

	</div>
</body>
</html>