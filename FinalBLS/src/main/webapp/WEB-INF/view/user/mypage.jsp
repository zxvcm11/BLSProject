<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<%-- /WEB-INF/view/user/mypage.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>My page</title>
<style type="text/css">
   table {width:90%; border-collapse:collapse;}
   th, td{border:3px solid #bcbcbc; text-align:center; padding:8px;}
   th {background-color: #4CAF50; color:white; text-align:center;}
   td {background-color: #f2f2f2;}
   td.title {background-color: #e2e2e2; color:blue;}
</style>
<script>
   window.onload= function(){
      document.getElementById("minfo").style.display = "none";
      document.getElementById("oinfo").style.display = "block";
   }
   function disp_div(id){
      document.getElementById("minfo").style.display = "none";
      document.getElementById("oinfo").style.display = "none";
      document.getElementById(id).style.display = "block";
   }
   function list_disp(id){
      var disp = document.getElementById(id);
      if(disp.style.display == 'block'){
         disp.style.display = "none";
      } else {
         disp.style.display = "block";
      }
   }
</script>
</head>
<body>
<table>
	<tr>
		<td><a href="javascript:disp_div('minfo')">회원정보보기</a></td>
		<td><a href="javascript:disp_div('oinfo')">주문정보보기</a></td>
	</tr>
	</table>
<div id="oinfo" style="display: none; width: 100%;">
   <table border="1" style="width:100%">
      <tr>
         <td colspan="3" align="center"><b>주문 목록</b>
      </tr>
      <tr><th>주문 번호</th><th>주문 일자</th><th>총주문금액</th></tr>
      <c:forEach items="${salelist}" var="sale" varStatus="stat">
         <tr>
            <td align="center">
            <a href="javascript:list_disp('saleLine${stat.index}')">${sale.saleId}</a>
            </td>
            <td align="center"><fmt:formatDate value="${sale.updateTime }" pattern="yyyy-MM-dd"/>
            </td>
            <td align="right">${sale.totAmount}원</td>
         </tr>
         <tr>
            <td colspan="3" align="center">
               <div id="saleLine${stat.index }" style="display: none;"> 
                  <table border="1" style="width:90%">
                     <tr>
                        <th width="25%">상품명</th>
                        <th width="25%">상품가격</th>
                        <th width="25%">구매수량</th>
                        <th width="25%">상품총액</th>
                     </tr>
                     <c:forEach items="${sale.itemList}" var="saleItem">
                        <tr>
                           <td align="center" class="title"> ${saleItem.item.name}</td>
                           <td align="right">${saleItem.item.price}원</td>
                           <td align="right">${saleItem.quantity}개</td>
                           <td align="right">${saleItem.item.price * saleItem.quantity}원</td>
                        </tr>
                     </c:forEach>
                  </table>
               </div></td></tr></c:forEach></table></div>
            <div id="minfo" style="display: none; width: 100%;">
               <table border="1" style="width:100%">
                  <tr><td colspan="2">회원 정보 </td> </tr>
                  <tr><td>아이디</td><td>${user.userId }</td></tr>
                  <tr><td>이름</td><td>${user.userName }</td></tr>
                  <tr><td>전화번호</td><td>${user.tel }</td></tr>
                  <tr><td>이메일</td><td>${user.email }</td></tr>
                  <tr><td>우편번호</td><td>${user.postcode }</td></tr>
                  <tr><td>주소</td><td>${user.addr }</td></tr>
                  <tr><td>상세주소</td><td>${user.addr1 }</td></tr>
                  <tr><td>좋아하는 팀</td><td>${user.ft }</td></tr>
                  <tr><td>좋아하는 선수</td><td>${user.fp }</td></tr>
               </table>
            </div><br>
            <a href="updateForm.shop?id=${user.userId}">[회원정보수정]</a>&nbsp;
            <c:if test="${loginUser.userId != 'admin'}">
               <a href="delete.shop?id=${user.userId }">[회원탈퇴]</a>&nbsp;
            </c:if>
            <c:if test="${loginUser.userId == 'admin'}">
               <a href="../admin/list.shop">[회원목록]</a>&nbsp;
            </c:if>      
             <a href="logout.shop?">[로그아웃]</a>&nbsp;
</body>
</html>