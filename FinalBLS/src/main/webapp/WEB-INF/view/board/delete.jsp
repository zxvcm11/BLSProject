<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Spring 게시판 삭제</title>
</head>
<style type="text/css">
.f,table {
	width: 1060px;
	margin: auto;
	margin-top: 25px;
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
</style>
<body>
	<form action="delete.shop" name="f" method="post">
		<input type="hidden" name="num" value="${param.num}">
		<table>
			<tr>
				<td>게시글 비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:document.f.submit();">[삭제]</a></td>
			</tr>
		</table>
	</form>
</body>
</html>