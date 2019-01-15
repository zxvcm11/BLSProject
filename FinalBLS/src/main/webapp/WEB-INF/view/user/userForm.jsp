<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WEB-INF/view/user/userForm.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사용자 등록</title>
</head>
<script type="text/javascript">
function open_win()
{
 window.open('popup.html','popup', 'width=300, height=200, left=0, top=0, toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=no, scrollbars=no, copyhistory=no');
}
</script>
<h2>사용자 등록</h2>
<%-- modelAttribute="user" : 현재 페이지가 호출 될 때 user객체가 존재해야함 --%>
<form:form modelAttribute="user" method="post" action="userEntry.shop" >
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach items="${errors.globalErrors }"  var="error" >
				<spring:message code="${error.code}" />
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<table>
		<tr height="40px" ><td>아이디</td><td><form:input path="userId"/>
		<font color="red"><form:errors path="userId"/></font></td></tr>
		<tr height="40px" ><td>비밀번호</td><td><form:password path="password"/>
		<font color="red"><form:errors path="password"/></font></td></tr>
		<tr height="40px" ><td>이름</td><td><form:input path="userName"/>
		<font color="red"><form:errors path="userName"/></font></td></tr>
		<tr height="40px" ><td>전화번호</td><td><form:input path="phoneNo"/>
		<font color="red"><form:errors path="phoneNo"/></font></td></tr>
		<tr height="40px" ><td>우편번호</td><td><form:input path="postcode"/>
		<font color="red"><form:errors path="postcode"/></font></td></tr>
		<tr height="40px" ><td>주소</td><td><form:input path="address"/>
		<font color="red"><form:errors path="address"/></font></td></tr>
		<tr height="40px" ><td>이메일</td><td><form:input path="email"/>
		<font color="red"><form:errors path="email"/></font></td></tr>
		<tr height="40px" ><td>생년월일</td><td><form:input path="birthDay"/>
		<font color="red"><form:errors path="birthDay"/></font></td></tr>
		<tr height="40px"><td colspan="2" align="center">
		  <input type="submit" value="등록"><input type="reset" value="초기화">
		  </td></tr></table></form:form></body></html>