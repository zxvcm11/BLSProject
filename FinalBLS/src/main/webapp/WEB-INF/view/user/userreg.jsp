<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script type="text/javascript">

var chkId = function() {
	if(passchek == false) {
		alert("���̵� �ùٸ��� �Է��ϼ���");
		passchekId = false;
	}
	else {
		$.post(ctx + "/member/IdCheck", {id:$("#jId").val() }, function(data, status) {
		if(status == "success") {
			if(data == true) {
				alert("����� �� �ִ� ���̵� �Դϴ�.")
				passchekId = true;
			}
			else {
				alert("����� �� ���� ���̵� �Դϴ�.");
			}
		}
		else if(status == "error") {
			alert("��� �Ŀ� �ٽ� �õ��� �ּ���");
		}
		else {
			alert("��� �Ŀ� �ٽ� �õ��� �ּ���");
			}
		});
	}
}

function pwchk(){ //��й�ȣ Ȯ��
	   var f1 = document.forms[0];
	   var pw1 = f1.password.value;
	   var pw2 = f1.passwordcheck.value;
	   if(pw1!=pw2){
	      document.getElementById('pwchk').style.color = "red";
	       document.getElementById('pwchk').innerHTML = "������ ��ȣ�� �Է��ϼ���."; 
	   }else{
	       document.getElementById('pwchk').style.color = "black";
	       document.getElementById('pwchk').innerHTML = "��ȣ�� Ȯ�� �Ǿ����ϴ�."; 
	   }
	}

	    
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
<h2>ȸ������</h2>
<form:form modelAttribute="user" method="post" action="userEntry.shop">
	<table>
		<tr height="40px">
			<td>���̵�<td>
			<td><form:input path="userId"/>
				<form:errors path="userId"/></td>
		</tr>
		<tr height="40px">
			<td>�̸�<td>
			<td><form:input path="userName"/>
				<form:errors path="userName"/></td>
		</tr>
		<tr height="40px">
			<td>��й�ȣ<td>
			<td><form:password path="password"/>
				<form:errors path="password"/></td>
		</tr>
		<tr height="40px">
			<td>��й�ȣ Ȯ��</td>
			<td><input type="password" name="passwordcheck" onkeyup="pwchk()"/>
        	<div id="pwchk">������ ��ȣ�� �Է��ϼ���.</div></td>
        </tr>
		<tr height="40px">
			<td>��ȭ��ȣ<td>
			<td><form:input path="tel"/>
				<form:errors path="tel"/></td>
		</tr>
		<tr height="40px">
			<td>�̸���<td>
			<td><form:input path="email"/>
				<form:errors path="email"/></td>
		</tr>
		<tr height="40px">
			<td>�ּ�</td>
			<td>
<form:input path="postcode" placeholder="�����ȣ"/>
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
			<td>�����ϴ� ����<td>
			<td><form:input path="fp"/>
				<form:errors path="fp"/></td>
		</tr>
		<tr height="40px">
			<td>Ÿ��<td>
			<td><form:select path="type">
				<form:option value="1">������</form:option>
				<form:option value="2">���</form:option>
				<form:option value="3">�Ϲ� ȸ��</form:option>
				</form:select>
				<form:errors path="type"/></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="���">
				<input type="reset" value="�ʱ�ȭ">
			</td>
		</tr>
	</table>
</form:form>
</body>
</html>