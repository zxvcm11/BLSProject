<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="alternate" media="only screen and (max-width: 640px)" href="http://mitem.auction.co.kr/vip?itemno=B517025211" />
<link rel="stylesheet" type="text/css" href="//script.auction.co.kr/pc/style/css/common.css?t=20171221080000" />
<link rel="stylesheet" type="text/css" href="//script.auction.co.kr/pc/style/css/vip_group.css?t=20171221080000" />
<link rel="stylesheet" type="text/css" href="http://script.auction.co.kr/style/css/ad/iframe_ad.css">
<link rel="stylesheet" type="text/css" href="http://script.auction.co.kr/style/css/common/etc.css">
<link rel="stylesheet" type="text/css" href="http://script.auction.co.kr/style/css/frame/vip_all2013.css">
<link rel="stylesheet" type="text/css" href="http://script.auction.co.kr/pc/style/css/hp.css" />



</head>
<body>
<div class="item-topinfowrap">
            <div class="item-topgallerywrap">
               
               <!-- 좌측 상품상세정보 -->
               
<div class="thumb-gallery uxecarousel">
  <div class="viewerwrap">
   <ul class="viewer">
      
            <li class="on">
               <a href="javascript:;">
                  <img src="../picture/${item.pictureUrl}">
               </a>
            </li>
         
   </ul>
 
<script type="text/javascript">
function submitform()
{
  document.frmMain.submit();
}
</script>
 
   <script type="text/javascript">
      (function ($, window, document, undefined) {
         $('.thumb-gallery .viewer img').each(function () {
            var img = this,
               srcset = img.getAttribute('data-fallback-urls');
            if (!srcset) return;
            
            srcset = img.getAttribute('data-fallback-urls').split(' ');
            srcset.push('http://pics.auction.co.kr/vip/noimg_600x600.png');

            img.onerror = function () {
               var nextsrc = null;
               while (srcset.length > 0 && !nextsrc) {
                  nextsrc = srcset.shift();
               }
               if (!nextsrc) {
                  img.onerror = null;
                  return;
               }
               img.src = nextsrc;
            };
         });
      })(jQuery, window, document);
   </script>
   
  </div>
</div>

            </div><!-- //.item-topgallery -->
               <!-- 우측 상품관련정보 -->
            <div class="item-topinfo">
               <form id="frmMain" name="frmMain" style="display: inline" onsubmit="javascript:return false" action="../cart/cartAdd.shop">
                 
                  <div id="hdivItemInfo"></div>
                  <input type="hidden" name="id" value="${item.id}">


<script type="text/javascript">
  function CatalogAndItemName() { };
   CatalogAndItemName.PDPIframeOpen = function () {
       pvprofiler.sendEvt('click', '0ACD', 'catalog', { 'itemno': '' });
       var popUpUrl = "http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0ACD&next=http://search.auction.co.kr/product/productDetailLayer.aspx?catalog=0&category=&cc=0ACD";
      document.getElementById('PDPIframe').src = popUpUrl;
      fullscreenOpen('PDPLayer');
   }

   CatalogAndItemName.PDPIframeClose = function () {
      document.getElementById('PDPIframe').src = '';
      fullscreenClose('PDPLayer');
   }
</script>
                  <h1 id="item_name">${item.name}</h1>
                  
                     <div class="prod_info">
                        
<p class="buy_num">구매 15,816<span class="remainder">(남은수량 : ${item.stock })</span></p> 
                           
                     </div> 
                  
               <!-- 금액영역 -->
                  <div class="price_wrap">      
                     
<div class="price">
   <div class="price_innerwrap">
    <span class="price_innerwrap" id="solprice1">
      <strong class="price_real" id="solprice">${item.price }<span class="unit">원</span></strong>
         
    </span>
   </div>
</div>
                     
                     <div class="action-btns">
                           <!-- 관심상품 -->
                           
<div class="interest_area">
    <button name="btnFavoriteItem" class="add-interest" onclick="Favorite.AddFavoriteItem(this, 'B517025211'); pvprofiler.sendEvt('click', '100000438', 'Utility');" type="button"><span class="blind">관심상품 추가</span></button><!--D: 활성화시, button에 'on'클래스 추가-->
    <!-- layerpop -->
    <div id="ly_interest" class="lypop ly_interest">
        <p class="txt">관심상품으로 등록되었습니다.<span class="sp box_arr">box</span></p>
    </div>
    <!-- //layerpop -->
</div>
<script type="text/javascript">
function valuechange(){
	var obj = document.getElementById("quantity");
	total_num1.value = obj.value * ${item.price} ;
	}
</script>
<script type="text/javascript">
function purchaseform() {
	var name = "${item.name}";
	 var price = ${item.price};
	 var obj = document.getElementById("quantity");
	 if(obj.value == "" || obj.value==null)
	 alert("수량을 선택하세요");

	 location.href = "../item/purchase.shop?quantity="+obj.value+"&name="+name+"&price="+price;
}
</script>
<script type="text/javascript" language="javascript">

   this.GetCookie = function (name) {
      var prefix = name + "=";
      var cookieStartIndex = document.cookie.indexOf(prefix);
      if (cookieStartIndex == -1) { return (null); };
      var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex + prefix.length);
      if (cookieEndIndex == -1) { cookieEndIndex = document.cookie.length; };
      return (unescape(document.cookie.substring(cookieStartIndex + prefix.length, cookieEndIndex)));
   };
   var loginCheck = (GetCookie("auction") != null) ? true : false;


   var Favorite={};
   
   Favorite.AddFavoriteItem = function (e, itemNo) {
      if (!loginCheck) {
         FavoriteItem.Login('http://www.auction.co.kr/login/?SELLER=AUCTION_HELP&url=http%3a%2f%2ffavorite.auction.co.kr%2fBuyerTools%2fFavorites%2fPopups%2fAfterLogin.html%3fWeblogYN%3dN');
         return;
      }
      else {
         if ($(e).hasClass("on")) {
            $.ajax({
               type: "GET",
               dataType: "json",
               cache: false,
               url: "Itempage3Service.svc/RemoveFavoriteItem",
               data: "itemNo=" + itemNo,
               success: function (data) { 
                     alert("관심상품이 삭제되었습니다.");
                     $(e).removeClass("on");
               }
            });
         }
         else {
            $.ajax({
               type: "GET",
               dataType: "json",
               cache: false,
               url: "Itempage3Service.svc/AddFavoriteItem",
               data: "itemNo=" + itemNo,
               success: function (data) {
                     alert("관심상품으로 등록되었습니다.");
                     $(e).addClass("on");
               }
            });
         }
      }      
   }

   Favorite.IsFavoriteItem = function (itemNo) {

      if (loginCheck) {
         $.ajax({
            type: "GET",
            dataType: "json",
            cache: false,
            url: "Itempage3Service.svc/IsFavoriteItem",
            data: "itemNo=" + itemNo,
            success: function (data) {
               Favorite.SelectedFavoriteItem(data);
            },
            error: function (xhr, textStatus) {

            }
         });
      }
   }

   Favorite.SelectedFavoriteItem = function (data) {
      if (data)
         $('[name="btnFavoriteItem"]').addClass("on")
      else
         $('[name="btnFavoriteItem"]').removeClass("on")
   }

   $(document).ready(function () {
      Favorite.IsFavoriteItem("B517025211");

   });

</script>
                           <!-- //관심상품 -->
                           <!-- 공유 -->
                           
<div class="sns_area">
   <button class="sare-sns btn_more" onclick="pvprofiler.sendEvt('click', '100000439', 'Utility');" type="button"><span class="blind">SNS 공유</span></button>
   <!-- layerpop -->
   <div id="ly_sns" class="lypop ly_sns">
      <ul class="sns_lst">
         <li><a href="http://www.facebook.com/sharer/sharer.php?t=%5B%EC%9D%B4%EA%B1%B0%EC%96%B4%EB%95%8C%3F%5D&amp;u=http%3A%2F%2Fitempage3.auction.co.kr%2Fdetailview.aspx%3FItemNo%3DB517025211%26listqs%3Dcatetab%253d1%2526selecteditemno%253dB539709160%2526class%253dCorner.CategoryBest%2526listorder%253d0%26listtitle%3D%25ba%25a3%25bd%25ba%25c6%25ae100%26frm2%3Dthrough" target="_blank" class="sp btn_sns faceboo" data-sharer-profile="facebook">페이스북</a><span class="sns_txt">페이스북</span></li>
         <li><a href="https://twitter.com/intent/tweet?text=%5B%EC%9D%B4%EA%B1%B0%EC%96%B4%EB%95%8C%3F%5D&amp;url=http%3A%2F%2Fitempage3.auction.co.kr%2Fdetailview.aspx%3FItemNo%3DB517025211%26listqs%3Dcatetab%253d1%2526selecteditemno%253dB539709160%2526class%253dCorner.CategoryBest%2526listorder%253d0%26listtitle%3D%25ba%25a3%25bd%25ba%25c6%25ae100%26frm2%3Dthrough" target="_blank" data-sharer-profile="twitter" class="sp btn_sns twitter">트위터</a><span class="sns_txt">트위터</span></li>
         <li><a href="https://story.kakao.com/share?text=%5B%EC%9D%B4%EA%B1%B0%EC%96%B4%EB%95%8C%3F%5D&amp;url=http%3A%2F%2Fitempage3.auction.co.kr%2Fdetailview.aspx%3FItemNo%3DB517025211%26listqs%3Dcatetab%253d1%2526selecteditemno%253dB539709160%2526class%253dCorner.CategoryBest%2526listorder%253d0%26listtitle%3D%25ba%25a3%25bd%25ba%25c6%25ae100%26frm2%3Dthrough" target="_blank" data-sharer-profile="kakaostory" class="sp btn_sns kakaostory">카카오스토리</a><span class="sns_txt">카카오스토리</span></li>
      </ul>
      <div class="sns_url_copy" id="divUrlShorten">
         <span class="sns_url_box"></span>
         <button class="btn_url" type="button">URL 복사</button>
      </div>
      <span class="sp box_arr">box</span>
   </div>
   <!-- //layerpop -->
</div>
<script type="text/javascript">
   (function ($, window, document, undefined) {
      var width = 700;
      var height = 447;
      var itemno = 'B517025211';
      var profileArgs = {
         'facebook': { code: '100000440', type: 'facebook' },
         'twitter': { code: '100000440', type: 'twitter' },
         'kakaostory': { code: '100000440', type: 'kakaostory' }
      };
      var $snsUrlBox = $('.sns_url_box');

      $('.sare-sns').data('isRequesting', false).click(function (evt) {
         var $this = $(this);

         if ($this.data('isRequesting')) return;

         var original_url = 'http://itempage3.auction.co.kr/detailview.aspx?itemno=' + itemno;
         var options = { Type: "", Source: original_url };
         getShorteners(this, options, function (sender, url) {
            $this.data('isRequesting', false);
            console.log("SNSUrl: " + url);
            $snsUrlBox.text(url);
            $this.data('isRequesting', true);
         }, function (err) {
            $this.data('isRequesting', false);
            alert(err);
         });

      });

      $('.btn_url').click(function () {
         
         var $modal = $(this).parents('.ly_sns');
         var $textArea = $("<textarea>")
            .css({
               'position': 'fixed',
               'opacity': 0,
               'z-index': -1,
               'filter': 'alpha(opacity=0)'
            })
            .val($snsUrlBox.text())
            .attr('id', 'url_text')
            .appendTo($modal);

         $textArea[0].select();
         try {
            document.execCommand('copy');
         } catch (err) { }

         $textArea.remove();
         $modal.hide();
         pvprofiler.sendEvt('click', '100000440', 'Utility');
      });

      //Use a namespaced event and unbind first to prevent multiple binding
      $('.sns_area a').unbind('click.sns.sharer').bind('click.sns.sharer', function (e) {

         //Profiles user's sharing action
         var profileName = $(this).data('sharer-profile');
         if (undefined !== pvprofiler && pvprofiler && pvprofiler.sendEvt && profileName && profileArgs[profileName]) {
            var profile = profileArgs[profileName];
            pvprofiler.sendEvt('click', profile.code, profile.type, { 'itemno': itemno });
         } else {
            //console.log('pvprofiler has errors, profiling is avoided');
         }

         //Opens a popup-style window near a mouse cursor
         var left = (screen.width / e.screenX <= 2) ? (e.screenX - width) : e.screenX;
         var top = (screen.height / e.screenY <= 2) ? (e.screenY - height) : e.screenY;
         var href = $(this).attr('href');
         window.open(
            href,
            $(this).attr('target'),
            'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left + ',status=no,resizable=no,scrollbars=no'
         ).focus();

         return false;
      });
   })(jQuery, window, document);
</script>

                           <!-- //공유 -->
                     </div>
                     
                  </div>
   
               <ul class="item-topinfo_sub uxeslide">
       

                  
<li class="benefit_item uxeslide_item">
    <button class="nav" onclick="pvprofiler.sendEvt('click', '100000444', 'Utility');" type="button">
                 <span class="item intfree"><em class="ic">정보</em>카드무이자</span>          
                 <span class="item discount"><em class="ic">정보</em>카드추가혜택</span>           
                        <span class="arr blind">열기</span>
    </button>
    <div class="con uxeslide_item_content">
      
        <div class="con_view">
            <ul class="info_lst">
                
                
                
                
                
                
                <li>
                    <p class="stit">카드무이자</p>
                    <p class="cont">5만원이상 무이자</p>
                    <a href="javascript:;" id="aNoInterestCard" class="btn_more" onclick="pvprofiler.sendEvt('click', '100000446', 'Utility');">더보기 <em>+</em></a>
                    <!-- layerpop -->
                    <div id="ly_interestfree" class="lypop ly_interestfree">
                        <div class="lypop_top">
                            <p class="h_laypop">무이자 할부행사</p>
                            <a href="javascript:closeLayer('ly_interestfree');" class="sp ly_close">레이어 닫기</a>
                        </div>
                           </div>
                    <!-- //layerpop -->
                </li>
                <li id="ucBenefitSet_hdivRequestDiscount">
                    <p class="stit">카드추가혜택</p>
                    <p class="cont">제휴카드 결제시 최대 15% 할인</p>
                    <a href="javascript:;" id="aRequestDiscount" class="btn_more" onclick="pvprofiler.sendEvt('click', '100000447', 'Utility');">더보기 <em>+</em></a>
                    <!-- layerpop -->
                    <div id="ly_discount" class="lypop ly_discount">
                        <div class="lypop_top">
                            <p class="h_laypop">제휴카드 안내</p>
                            <a href="javascript:closeLayer('ly_discount');" class="sp ly_close">레이어 닫기</a>
                        </div>
                        <div class="ifr_wrap"><iframe id="hfrmRequestDiscount" src="about:blank" scrolling="no"></iframe></div>
                    </div>
                    <!-- //layerpop -->
                </li>
            </ul>
            
        </div>
    </div>
</li>
                  <!-- //인증정보 -->
               </ul>

               <div id="hdivOrderInfo" class="option-delivery">
               <div id="upOrderInfo">
                  <!-- 주문옵션 -->
                  
<script type="text/javascript">
   System.loadFile("http://script.auction.co.kr/itempage3/1.0/ItemRequest.js?t=20180115110000");
   System.loadFile("http://script.auction.co.kr/itempage3/1.0/ItemOrderInfo.js?_cb=201802051000000");
</script><script type="text/javascript" src="http://script.auction.co.kr/itempage3/1.0/itemrequest.js?t=20180115110000"></script><script type="text/javascript" src="http://script.auction.co.kr/itempage3/1.0/itemorderinfo.js?_cb=201802051000000"></script>
<fieldset>
   <legend>옵션선택 폼</legend>
   <!-- 선택옵션전체 -->
  <div class="select-item">
     
     <!-- 선택옵션 -->
     <div class="select_option_form">
        

<!-- 주문옵션 상품-->
<div class="select_option_wrap">

<ul class="item_result" style="display:none;">
   <li class="type__add-item">
      <p class="prod_area">
         <span class="prod_name">수량</span>
      </p>
      <span class="num-ctrl uxequnatity-ctrl num-ctrl-option">
         <button class="bt_increase" onclick="pvprofiler.sendEvt('click', '100000451', 'Utility');" type="button"><span class="blind">수량감소</span></button>
         <button class="bt_decrease" onclick="pvprofiler.sendEvt('click', '100000451', 'Utility');" type="button"><span class="blind">수량증가</span></button>
      </span>
      
      <div class="box__choose-result">
         <button class="close sp_vipgroup" onclick="javascript:Request.removeRequest(this); pvprofiler.sendEvt('click', '100000454', 'Utility');" type="button"><span class="blind">닫기</span></button>
         <strong class="result_price">0<span>원</span></strong>
      </div>
      
   </li>                        
</ul>

<table>
	<tr>
		<td>
			<select name="quantity" id="quantity" onchange="valuechange()">
				<c:forEach begin="1" end="10" var="i">
					<option value="${i}">${i}</option>
				</c:forEach>
			</select>
		</td>
	</tr>
</table>
<div class="select_option_wrap">
</div>

</div>

    <!-- 조합형 /독립-->
   
            <div class="optiontype type_selection noline">
            <h2 id="ucItemOrderInfo_ucOptionTemplate_ucItemRequest_ucCombinationRequest_rpDisplays_hdivOptionTile_0" class="tit_options">옵션선택</h2>
        
      <div class="item_options uxeselectbox combination disable"><!-- D:선택값 옵션1 선택후  옵션2 선택중일때 linked 클래스추가 --><!-- 필수옵션인 경우 essential_opt 추가 -->
         <input type="hidden" value="-1" title="상품 옵션값" name="selectedRequest">
            <button class="select-item_option uxeselect_btn" onclick="pvprofiler.sendEvt('click', '100000452', 'Utility');" type="button">
            <span class="txt" data-textinit="사이즈">사이즈</span>
            <span class="arr blind">열기</span>
            </button>
         <ul class="select-itemoption-list uxeselect_dropdown" style="display: none;">
      
         </ul>
      </div>
        
        
         </div>

</div>

<div class="optiontype type_result" id="divOrderList">
   <ul class="item_result">
      
      </ul>

      </div>
    <!-- //선택옵션 -->
      <!-- 총상품금액 -->

      <div class="total_price">
         <span class="total_num" id="total_num" ><strong class="num">
         <input type="text" id="total_num1" value="${item.price }" readonly="readonly"style="border:none; text-align:right;">원</strong></span>
         <span class="total_txt" id="total_txt">총 상품금액</span>
      <!-- //총금액 -->
   </div>
  <!-- //선택옵션전체 -->

   <div id="ucItemOrderInfo_ucItemOrderButtons_hdivBuy" class="item-bottombtns"> 
   <button class="btn_cart" name="btn_cart" onclick="javascript: submitform()" type="button" >장바구니</button>
   <button class="btn_buy" name="btn_buy" onclick="javascript: purchaseform()" type="button" >구매하기</button>
   </div>
</fieldset>


                  <!-- 주문옵션 -->
               </div>
                        
               </div>
               <!-- 혜택 정보 -->
               <input name="hhlblText" type="hidden" id="hhlblText">
               <!-- //혜택 정보 -->

               
            </form>
            </div><!-- //.item-topinfo -->
         </div>
         <script type="text/javascript" src="http://script.auction.co.kr/itempage3/1.0/ItemOrderButtons.js?_cb=20171221080000"></script>
    <div>
    <form:form modelAttribute="comm" action="../comm/register.shop">
 	   <table>
 	   	<tr><td>작성자<input type="text" name="writer"></td></tr>
 	   	<tr><td>비밀번호<input type="password" name="password"></td></tr>
 	   	<tr><td>내용<textarea  name="contents" cols="50" rows="10"></textarea></td></tr>
 	   	<tr><td><input type="submit" value="등록"></td></tr>
   	   </table>
   	</form:form>
    </div>


</body>
</html>