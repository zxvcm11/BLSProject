<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CRAWING�� �̿��� SCREEN</title>
<style type="text/css">
table, td, tr, th {
	border: 2px solid #777777;
	border-collapse: collapse;
}

th {
	background-color: orange;
}
</style>
</head>
<body>
 <div>
 	���� ȭ�� �Դϴ�.
 </div>
 <div style="width: 100%">
 	${schedule}
 </div>
<%--  <table>
  <c:forEach items="${teamSchdule}" var="c">
   <tr>
    <td>
     <a href="https://www.kbl.or.kr/teams/team_info.asp?tcode=${c.key}">
	${c.value}</a></td>
   </tr>
  </c:forEach>
 </table> --%>
</body>
</html>