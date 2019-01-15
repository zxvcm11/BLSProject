<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����� ����</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script type="text/javascript">

	    function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

	                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
	                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
	                var roadAddr = data.roadAddress; // ���θ� �ּ� ����
	                var extraRoadAddr = ''; // ���� �׸� ����

	                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
	                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
	                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("addr").value = roadAddr;
	                var guideTextBox = document.getElementById("guide");
	            }
	        }).open();
	    }
	</script>
</head>
<body>

<h2>����� ����</h2>
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
			<td>���̵�</td>
			<td><form:input path="userId" readonly="true"/>
			<font color="red"><form:errors path="userId" /></font></td>
		</tr>
		<tr height="40px">
			<td>�̸�</td>
			<td><form:input path="userName" />
			<font color="red"><form:errors path="userName" /></font></td>
		</tr>
		<tr height="40px">
			<td>��й�ȣ</td>
			<td><form:password path="password"/>
			<font color="red"><form:errors path="password"/></font></td>
		</tr>
		<tr height="40px">
			<td>��ȭ��ȣ</td>
			<td><form:input path="tel"/>
			<font color="red"><form:errors path="tel"/></font></td>
		</tr>
		<tr height="40px">
			<td>�̸���</td>
			<td><form:input path="email"/>
			<font color="red"><form:errors path="email"/></font></td>
		</tr>
		<tr height="40px">
			<td>�ּ�</td>
			<td><form:input path="postcode" placeholder="�����ȣ"/>
			<input type="button" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��"><br>
			<form:input path="addr" placeholder="���θ��ּ�"/><br>
			<span id="guide" style="color:#999;display:none"></span>
			<form:input path="addr1" placeholder="���ּ�"/><br>
			</td>
		</tr>
		<tr height="40px">
			<td>�����ϴ� ��<td>
			<td><form:select path="ft">
				<form:option value="������">��� ������</form:option>
				<form:option value="���ڷ���">��õ ���ڷ���</form:option>
				<form:option value="�λ� KT">�λ� KT</form:option>
				<form:option value="�Ⱦ� KGC">�Ⱦ� KGC</form:option>
				<form:option value="���� KCC">���� KCC</form:option>
				<form:option value="���� DB">���� DB</form:option>
				<form:option value="â�� LG">â�� LG</form:option>
				<form:option value="��� ������">��� ������</form:option>
				<form:option value="���� SK">���� SK</form:option>
				<form:option value="���� �Ｚ">���� �Ｚ</form:option>
				</form:select>
				<form:errors path="ft"/></td>
		</tr>
		<tr height="40px">
			<td>�����ϴ� ����</td>
			<td><form:input path="fp"/>
			<font color="red"><form:errors path="fp"/></font></td>
		</tr>
		<tr height="40px">
		<td colspan="2" align="center">
		<input type="submit" value="����">
		<input type="reset" value="�ʱ�ȭ">
		</td></tr></table>
</form:form>
</body>
</html>