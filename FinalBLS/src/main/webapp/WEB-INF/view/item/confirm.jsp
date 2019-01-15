<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 삭제</title>
</head>
<body>
	<h2>상품 삭제 전 확인하기</h2>
	<table>
		<tr>
			<td><img src="../picture/${item.pictureUrl}" width="200"
				height="250"></td>
			<td align="center">
				<table>
					<tr>
						<td width="80">상품명</td>
						<td>${item.name}</td>
					</tr>
					<tr>
						<td width="80">가격</td>
						<td>${item.price}</td>
					</tr>
					<tr>
						<td width="80">상품개요</td>
						<td>${item.description}</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="button" value="삭제" onclick="location.href='delete.shop?id=${item.id }'">&nbsp;
						<input type="button" value="상품목록" onclick="locationl.href='list.shop'">&nbsp;
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>