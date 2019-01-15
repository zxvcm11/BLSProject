<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사용자 수정</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script type="text/javascript">

	    function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("addr").value = roadAddr;
	                var guideTextBox = document.getElementById("guide");
	            }
	        }).open();
	    }
	</script>
</head>
<body>

<h2>사용자 수정</h2>
<form:form modelAttribute="user" method="post" action="update.shop">
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach items="${errors.globalErrors}" var="error">
				<spring:message code="${error.code}"/>
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<table>
		<tr height="40px">
			<td>아이디</td>
			<td><form:input path="userId" readonly="true"/>
			<font color="red"><form:errors path="userId" /></font></td>
		</tr>
		<tr height="40px">
			<td>이름</td>
			<td><form:input path="userName" />
			<font color="red"><form:errors path="userName" /></font></td>
		</tr>
		<tr height="40px">
			<td>비밀번호</td>
			<td><form:password path="password"/>
			<font color="red"><form:errors path="password"/></font></td>
		</tr>
		<tr height="40px">
			<td>전화번호</td>
			<td><form:input path="tel"/>
			<font color="red"><form:errors path="tel"/></font></td>
		</tr>
		<tr height="40px">
			<td>이메일</td>
			<td><form:input path="email"/>
			<font color="red"><form:errors path="email"/></font></td>
		</tr>
		<tr height="40px">
			<td>주소</td>
			<td><form:input path="postcode" placeholder="우편번호"/>
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<form:input path="addr" placeholder="도로명주소"/><br>
			<span id="guide" style="color:#999;display:none"></span>
			<form:input path="addr1" placeholder="상세주소"/><br>
			</td>
		</tr>
		<tr height="40px">
			<td>좋아하는 팀<td>
			<td><form:select path="ft">
				<form:option value="현대모비스">울산 현대모비스</form:option>
				<form:option value="전자랜드">인천 전자랜드</form:option>
				<form:option value="부산 KT">부산 KT</form:option>
				<form:option value="안양 KGC">안양 KGC</form:option>
				<form:option value="전주 KCC">전주 KCC</form:option>
				<form:option value="원주 DB">원주 DB</form:option>
				<form:option value="창원 LG">창원 LG</form:option>
				<form:option value="고양 오리온">고양 오리온</form:option>
				<form:option value="서울 SK">서울 SK</form:option>
				<form:option value="서울 삼성">서울 삼성</form:option>
				</form:select>
				<form:errors path="ft"/></td>
		</tr>
		<tr height="40px">
			<td>좋아하는 선수</td>
			<td><form:input path="fp"/>
			<font color="red"><form:errors path="fp"/></font></td>
		</tr>
		<tr height="40px">
		<td colspan="2" align="center">
		<input type="submit" value="수정">
		<input type="reset" value="초기화">
		</td></tr></table>
</form:form>
</body>
</html>