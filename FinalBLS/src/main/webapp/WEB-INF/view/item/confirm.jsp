<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> ����</title>
</head>
<body>
	<h2>��ǰ ���� �� Ȯ���ϱ�</h2>
	<table>
		<tr>
			<td><img src="../picture/${item.pictureUrl}" width="200"
				height="250"></td>
			<td align="center">
				<table>
					<tr>
						<td width="80">��ǰ��</td>
						<td>${item.name}</td>
					</tr>
					<tr>
						<td width="80">����</td>
						<td>${item.price}</td>
					</tr>
					<tr>
						<td width="80">��ǰ����</td>
						<td>${item.description}</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="button" value="����" onclick="location.href='delete.shop?id=${item.id }'">&nbsp;
						<input type="button" value="��ǰ���" onclick="locationl.href='list.shop'">&nbsp;
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>