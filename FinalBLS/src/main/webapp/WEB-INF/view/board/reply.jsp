<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��� ����</title>
</head>
<style type="text/css">
body {
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
<hr style="border-top : 1px solid gray;">
<div style="margin-left: 410px; margin-right: 410px; margin-bottom: 25px;">
		<form:form action="reply.shop" method="post" name="f"
		modelAttribute="board">
				<input type="hidden" name="num" value="${board.num}"> <input
					type="hidden" name="ref" value="${board.ref}"> <input
					type="hidden" name="reflevel" value="${board.reflevel}"> <input
					type="hidden" name="refstep" value="${board.refstep}">
				<table>
					<tr>
						<td colspan="2" align="center">Spring �Խ��� ��� ����</td>
					</tr>
					<tr>
						<td>�۾���</td>
						<td><input type="text" name="name"> <font color="red"><form:errors
									path="name" /></font></td>
					</tr>
					<tr>
						<td>��й�ȣ</td>
						<td><input type="password" name="pass"> <font
							color="red"><form:errors path="pass" /></font></td>
					</tr>
					<tr>
						<td>����</td>
						<td><input type="text" name="subject"
							value="RE:${board.subject}"> <font color="red"><form:errors
									path="subject" /></font></td>
					</tr>
					<tr>
						<td>����</td>
						<td><textarea rows="15" cols="80" name="content"></textarea>
							<font color="red"><form:errors path="content" /></font></td>
					</tr>
					<tr>
						<td align="center" colspan="2"><a
							href="javascript:document.f.submit()">[�亯���]</a> <a
							href="javascript:document.f.reset()">[�ʱ�ȭ]</a> <a
							href="javascript:history.go(-1)">[�ڷΰ���]</a></td>
					</tr>
				</table>
		</form:form>
	</div>
</body>
</html>