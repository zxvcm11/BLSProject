<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isErrorPage="true" %>
<%-- isErrorPage="true" : ���� �������� error ��������.
						  exception ��ü�� ����.
						  exception ��ü : exception.CartEmptyException ��ü��.
						  ���尴ü�� ����
${exception.message} : exception.CartEmptyException.getMessage() : �޼��� ȣ��
${exception.url} : exception.CartEmptyException.getUrl() : �޼��� ȣ��
 --%>
<script>
	alert("${exception.message}");
	location.href="${exception.url}";
</script>