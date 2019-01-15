<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품 등록 화면</title>
</head>
<body>
<form:form modelAttribute="item" action="register.shop" enctype="multipart/form-data">
<h2>상품 등록 화면</h2>

   <table>
      <tr>
         <th>상품명</th>
         <td><form:input path="name" maxlength="20"/></td>
         <td><font color='red'><form:errors path="name"/></font></td>
      </tr>
      <tr>
         <th>가격</th>
         <td><form:input path="price" maxlength="6"/></td>
         <td><font color='red'><form:errors path="price"/></font></td>
      </tr>
      <tr>
         <th>상품 이미지</th>
         <td colspan="2"><input type="file" name="picture"></td>
      </tr>
      <tr>
         <th>상품 설명</th>
         <td><form:textarea path="description" cols="20" rows="5"/></td>
         <td><font color="red"><form:errors path="description"/> </font></td>
      </tr>
      <tr>
         <th>재고량</th>
         <td><form:input path="stock" maxlength="20"/></td>
         <td><font color='red'><form:errors path="stock"/></font></td>
      </tr>    
      <tr>
         <th>구단</th>
         <td><form:input path="type" maxlength="20"/></td>
         <td><font color='red'><form:errors path="type"/></font></td>
      </tr>  
      <tr>
         <td colspan="3">
            <input type="submit" value="등록">&nbsp;
            <input type="button" value="상품등록" onclick="location.href='list.shop'">
         </td>
      </tr>
   </table>
</form:form>

</body>
</html>