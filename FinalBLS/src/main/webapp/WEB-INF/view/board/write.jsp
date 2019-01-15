<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Board Write</title>
<style type="text/css">
table {
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
</head>
<body>
<hr style="border-top : 1px solid gray;">
	<form:form modelAttribute="board" action="write.shop"
		enctype="multipart/form-data" name="f">
		<table>
			<tr>
				<td align="center">�۾���</td>
				<td><form:input path="name" /><font color="red"><form:errors
							path="name" /></font></td>
			</tr>
			<tr>
				<td align="center">��й�ȣ</td>
				<td><form:password path="pass" /><font color="red"><form:errors
							path="pass" /></font></td>
			</tr>
			<tr>
				<td align="center">����</td>
				<td><form:input path="subject" /><font color="red"><form:errors
							path="subject" /></font></td>
			</tr>
			<tr>
				<td align="center">����</td>
				<td><form:textarea path="content" rows="15" cols="80" /> <font
					color="red"><form:errors path="content" /></font></td>
			</tr>
			<tr>
				<td align="center">÷������</td>
				<td><input type="file" name="file1"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><a
					href="javascript:document.f.submit()">[�Խù����]</a> <a
					href="list.shop">[�Խù����]</a></td>
			</tr>
		</table>
	</form:form>
</body>
</html>