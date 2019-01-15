<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품목록</title>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
 <link rel="stylesheet" type="text/css" href="http://script.auction.co.kr/pc/style/css/hp.css" />
<script type="text/javascript" src="http://script.auction.co.kr/common/header_stop.js"></script>
<script type="text/javascript" src="http://script.auction.co.kr/common/library/ua-parser.min.js"></script>
<script type="text/javascript" src="http://script.auction.co.kr/common/useragent_control.js"></script>
<script async="" src="https://montelena.auction.co.kr/montelena.js?path=http://www.auction.co.kr/"></script>

	<style>
		ul.high {
			background-color: #FFDAB9;
			list-style-type: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
			align:center;
		}
		li.inhigh { float: left; 
		}
		li.inhigh a {
			display: block;
			background-color: #FFDAB9;
			color: #000000;
			padding: 8px;
			text-decoration: none;
			text-align: center;
			font-weight: bold;
		}
		li.inhigh a:hover {
			background-color: #CD853F;
			color: white;
		}
	</style>

   <script type="text/javascript">
      rpmAjaxCall = function (eventId) {
         var pdsUrl = "http://pds.auction.co.kr/scriptBrokerMsgJsonp";
         var params = { id: eventId };
         if (eventId == "l" && !!window.performance) {

            var t = window.performance.timing;

            if (!!t) {

               var paramO = {
                  id: eventId,
                  NaviStTick: t.navigationStart,
                  LookupStTick: t.domainLookupStart,
                  RequestStTick: t.requestStart,
                  ResponseEdTick: t.responseEnd,
                  DomLoadedStTick: t.domContentLoadedEventStart,
                  LoadStTick: t.loadEventStart
               }

               if (paramO != null)
                  params = paramO;
            }

         }

         $.ajax({
            url: pdsUrl,
            data: params,
            type: "GET",
            contentType: "application/javascript; charset=utf-8",
            scriptCharset: "utf-8",
            dataType: "jsonp",
            crossdomain: true,
            error: function (request, error) {
               //alert("Error: " + error);
            }
         });
      }

      var requestParams = (function () {
         var requestParams = [];
         var url = unescape(location.href);
         var hash = unescape(location.hash);

         if (hash) {
            url = url.toString().replace(hash, '');
         }

         if (url.indexOf('?') > 0) {
            var params = (url.substring(url.indexOf('?') + 1, url.length)).split('&');
            for (var i = 0; i < params.length; i++) {
               var tempArr = params[i].split('=');
               requestParams.push({ param: tempArr[0].toUpperCase(), value: tempArr[1] });
            }
         }
         return requestParams;
      })();

      var getParam = function (params, param) {
         for (var i = 0; i < params.length; i++) {
            if (params[i]['param'] === param.toString().toUpperCase()) {
               return params[i]['value'].toString();
            }
         }
         return null;
      }

      var isPCVersionView = getParam(requestParams, 'ispcversion');
      if (isPCVersionView == "1" || location.search.toLowerCase().indexOf("mobile") > 0) {
         // 기존 쿠키를 사용하는 곳이 있을수도 있어서 남김
         document.cookie = "mpcview=1; domain=.auction.co.kr; path=/";
         document.cookie = "mpvview=1; domain=.auction.co.kr; path=/";
      }

      var uaControl = new UAControl();
      uaControl.setMobileVersionUrl(uaControl.consts.mobileHomeMainUrl);
   </script>
   <script>
    function prev(pagecount) {
    	alert(pagecount);

    	location.href="../item/list.shop?pagecount="+pagecount;
    }
    
	function next(pagecount) {

    	alert(${teamtype});
    	location.href="../item/list.shop?pagecount="+pagecount;
    }
   </script>
</head>
<body>
<a href="create.shop">상품등록</a>
<ul class="high">
		<li class="inhigh"><a href="../item/list.shop?type=1">| 울산 현대 모비스 |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=2">인천 전자랜드 |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=3">부산 KT |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=4">안양 KGC |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=5">전주 KCC |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=6">원주 DB |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=7">창원 LG |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=8">고양 오리온 |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=9">서울 SK |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=10">서울 삼성 |</a></li>
	</ul>
   <div class="hp_allkill" align="center">
      <div class="allkill_title">
         <h6><a href="../item/list.shop">BLS</a></h6>
            <a href="../item/list.shop"
            class="bt_more">더보기</a>
      </div>
      <div class="item_list_type1">
         <span class="pnum"> </span>
         <div id="touchSlider_allkill" class="touchSlider-box">
            <div id="allKillItemList" class="touchSlider">
               <div class="item_list_wrap">
               <c:forEach items="${itemList }" var="item">
   <c:if test="${item.id % 3 == 1}">
                  <ul class="item_list">  
   </c:if>

   <li>
                     <div class="inner">
                        <a href="detail.shop?id=${item.id}">
                        <img class="thumb lazy" src="../picture/${item.pictureUrl}"
                           data-original=".jpg" style="display: inline;">
                           <span class="title">${item.name }</span>
                        </a>
                        <div class="info">
                           <em class="prices">가격</em> <span class="pirce"> <strong>${item.price}<span>원</span>
                           </strong>
                           </span>
                           <span class="jjim">
                           	<span class="jjim2">
                           	<img src="../picture/heart.jpg" alt="찜하기"> 찜하기 <strong></strong>
                           </span>
                           </span>
                        </div>
                     </div>
   </li>
<c:if test="${item.id % 3 == 0}">
                 </ul>
   </c:if>
                  </c:forEach>    
               </div>
            </div>
         </div>
         <a onclick="prev(1)" class="prev" >이전</a>
         <button onclick="next(2)" class="next" name="pagenext">다음</button>
      </div>
   </div>
</body>
</html>