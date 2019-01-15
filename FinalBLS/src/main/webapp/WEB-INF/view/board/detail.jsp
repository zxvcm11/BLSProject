<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Board Content</title>
<style type="text/css">

div.w3-row{
	width: 1100px;
	margin-top: 25px;
	margin-bottom: 25px;
}

table {
	border-collapse: collapse;
	border-top: 1px solid #444444;
	margin-bottom: 25px;
}

th {
	border-top: 3px solid;
	border-bottom: 3px solid;
}

td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}

.w3-lobster {
	font-family: "Lobster", Sans-serif;
}
</style>
</head>
<body>
<hr style="border-top : 1px solid gray;">
	<div class="w3-main w3-padding-64" style="margin-left: 410px; margin-right: 410px;">
		<div class="w3-card-4 w3-margin w3-white">
			<h3>
				<b>${board.subject}</b>
			</h3>
			<img src="../file/${board.fileurl}" alt="Nature" style="width:100%">
			<div class="w3-container">
				<h5>
					Writer : ${board.name} <span class="w3-opacity"> <fmt:formatDate
							value="${board.regdate}" pattern="YYYY.MM.HH" />
					</span>
				</h5>
			</div>
			<div class="w3-container">
				<p></p>
				<div class="w3-row">
					<div class="w3-col m8 s3">
						<p>
							<button class="w3-button w3-padding-large w3-white w3-border">
								<b>READ MORE</b>
							</button>
						</p>
					</div>
					<div class="w3-col s6">
						<a href="reply.shop?num=${board.num}" class="w3-button">Ans</a> <a
							href="update.shop?num=${board.num}" class="w3-button">수정</a> <a
							href="delete.shop?num=${board.num}" class="w3-button">Del</a> <a
							href="list.shop" class="w3-button">List</a>
					</div>
					<div class="w3-col m4 w3-hide-small">
						<p>
							<span class="w3-padding-large w3-right"><b>Comments</b> <span
								class="w3-tag">0</span></span>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="w3-row-padding">
			<div class="w3-col m12">
				<div class="w3-card w3-round w3-white">
					<div class="w3-container w3-padding">
						<p contenteditable="true" class="w3-border w3-padding">Status:
							Feeling Blue</p>
						<button type="button" class="w3-button w3-theme">
							<i class="fa fa-pencil"></i> Post
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>