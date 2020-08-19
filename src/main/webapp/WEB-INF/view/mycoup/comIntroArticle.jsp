<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!--Grid row-->
        <div class="row wow fadeIn">
          <br/>
          
<c:if test="${cookie.usrLang.value == 'ko-KR'}">
          <img src="../../img/mycoup/how_1.png" alt="이게 뭐에요?" class="z-depth-0 img-fluid">
          <img src="../../img/mycoup/how_2.png" alt="쿠폰을 가지고 다닐 필요가 없어요" class="z-depth-0 img-fluid">
          <img src="../../img/mycoup/how_3.png" alt="쿠폰(포인트) 모을게요" class="z-depth-0 img-fluid">
          <img src="../../img/mycoup/how_4.png" alt="쿠폰(포인트) 사용 할게요" class="z-depth-0 img-fluid">
          <img src="../../img/mycoup/how_5.png" alt="그 동안 얼마나 다녀갔는지 볼까?" class="z-depth-0 img-fluid">
          <img src="../../img/mycoup/how_6.png" alt="내 주변에서 사용할 수 있는 쿠폰이 뭐가 있을까?" class="z-depth-0 img-fluid">
          <img src="../../img/mycoup/how_7.png" alt="내 고객에게 좋은 행사 소식을 알려주고 싶어" class="z-depth-0 img-fluid"> 
          <br/>
          
          <a href="./intro001.do" style="width:100%;">&nbsp;&nbsp;(모두) 이 사이트는 뭐 하는 곳인가요?</a>
          <br/>
          <br/>
          <a href="./intro002.do" style="width:100%;">&nbsp;&nbsp;(모두) 쿠폰을 가지고 다닐 필요가 없어요</a>
          <br/>
          <br/>
          <a href="./intro003.do" style="width:100%;">&nbsp;&nbsp;(모두) 쿠폰(포인트) 모을게요</a>
          <br/>
          <br/>
          <a href="./intro004.do" style="width:100%;">&nbsp;&nbsp;(모두) 쿠폰(포인트) 사용 할게요</a>
          <br/>
          <br/>
          <a href="./intro005.do" style="width:100%;">&nbsp;&nbsp;(모두) 로그인을 해 보아요</a>
          <br/>
          <br/>
          <a href="./intro201.do" style="width:100%;">&nbsp;&nbsp;(사용자) 간편하게 가입 해 봅시다</a>
          <br/>
          <br/>
          <a href="./intro202.do" style="width:100%;">&nbsp;&nbsp;(사용자) 내 쿠폰(포인트)이 얼마나 있나 궁금해</a>
          <br/>
          <br/>
          <a href="./intro203.do" style="width:100%;">&nbsp;&nbsp;(사용자) 지금 내 주변에는 어떤 매장이 있을까?</a>
          <br/>
          <br/>
          <a href="./intro204.do" style="width:100%;">&nbsp;&nbsp;(사용자) 내 전화번호가 변경되었어요</a>
          <br/>
          <br/>
          <a href="./intro205.do" style="width:100%;">&nbsp;&nbsp;(사용자) 내 쿠폰/포인트를 나눠주고 싶어요</a>
          <br/>
          <br/>
          <a href="./intro207.do" style="width:100%;">&nbsp;&nbsp;(사용자) 내 정보를 변경하고 싶어요</a>
          <br/>
          <br/>
          <a href="./intro206.do" style="width:100%;">&nbsp;&nbsp;(사용자) 이제 로그아웃 할래요</a>
          <br/>
          <br/>
          <a href="./intro503.do" style="width:100%;">&nbsp;&nbsp;(점주) 간편하게 가입 해 봅시다</a>
          <br/>
          <br/>
          <a href="./intro501.do" style="width:100%;">&nbsp;&nbsp;(점주) 적립과 사용을 하려고 합니다</a>
          <br/>
          <br/>
          <a href="./intro502.do" style="width:100%;">&nbsp;&nbsp;(점주) 그 동안 얼마나 다녀갔는지 볼까요?</a>
          <br/>
          <br/>
          <a href="./intro504.do" style="width:100%;">&nbsp;&nbsp;(점주) 이제 적립 설정을 해 봅시다.</a>
          <br/>
          <br/>
          <a href="./intro505.do" style="width:100%;">&nbsp;&nbsp;(점주) 고객이 친구에게 나눠주고 싶어하네요</a>
          <br/>
          <br/>
          <a href="./intro506.do" style="width:100%;">&nbsp;&nbsp;(점주) 우리 가게 정보를 변경하고 싶어요</a>
          <br/>
          <br/>
          <a href="./intro507.do" style="width:100%;">&nbsp;&nbsp;(점주) 이제 로그아웃 할래요</a>
          <br/>
          <br/>
          <a href="./intro006.do" style="width:100%;">&nbsp;&nbsp;(정보) 내 정보는 정말 안전할까?</a>
          <br/>
          <br/>
          <a href="./intro007.do" style="width:100%;">&nbsp;&nbsp;(정보) 쿠폰 제작 비용은 얼마 정도 할까?</a>
          <br/>
          <br/>
          <a href="./intro008.do" style="width:100%;">&nbsp;&nbsp;(정보) 왜 앱으로 만들지 않나요?</a>
          <br/>
          <br/>
          <a href="./intro009.do" style="width:100%;">&nbsp;&nbsp;(정보) 쿠폰등의 적립 앱은 넘쳐나지 않나요?</a>
          <br/>
</c:if>         
          
<c:if test="${cookie.usrLang.value == 'English'}">
          <img src="../../img/mycoup/how_1.png" alt="이게 뭐에요?" class="z-depth-0 img-fluid">
          <img src="../../img/mycoup/how_2.png" alt="쿠폰을 가지고 다닐 필요가 없어요" class="z-depth-0 img-fluid">
          <img src="../../img/mycoup/how_3.png" alt="쿠폰(포인트) 모을게요" class="z-depth-0 img-fluid">
          <img src="../../img/mycoup/how_4.png" alt="쿠폰(포인트) 사용 할게요" class="z-depth-0 img-fluid">
          <img src="../../img/mycoup/how_5.png" alt="그 동안 얼마나 다녀갔는지 볼까?" class="z-depth-0 img-fluid">
          <img src="../../img/mycoup/how_6.png" alt="내 주변에서 사용할 수 있는 쿠폰이 뭐가 있을까?" class="z-depth-0 img-fluid">
          <img src="../../img/mycoup/how_7.png" alt="내 고객에게 좋은 행사 소식을 알려주고 싶어" class="z-depth-0 img-fluid"> 
          <br/>
          
          <a href="./intro001_.do" style="width:100%;">&nbsp;&nbsp;(All) What is this site doing?</a>
          <br/>
          <br/>
          <a href="./intro002_.do" style="width:100%;">&nbsp;&nbsp;(All) No need to carry a coupon</a>
          <br/>
          <br/>
          <a href="./intro003_.do" style="width:100%;">&nbsp;&nbsp;(All) I'll collect coupons (points)</a>
          <br/>
          <br/>
          <a href="./intro004_.do" style="width:100%;">&nbsp;&nbsp;(All) I will use coupons (points)</a>
          <br/>
          <br/>
          <a href="./intro005_.do" style="width:100%;">&nbsp;&nbsp;(All) Try logging in</a>
          <br/>
          <br/>
          <a href="./intro201_.do" style="width:100%;">&nbsp;&nbsp;(User) Let's sign up easily</a>
          <br/>
          <br/>
          <a href="./intro202_.do" style="width:100%;">&nbsp;&nbsp;(User) I wonder how many coupons (points) I have</a>
          <br/>
          <br/>
          <a href="./intro203_.do" style="width:100%;">&nbsp;&nbsp;(User) What stores are around me now?</a>
          <br/>
          <br/>
          <a href="./intro204_.do" style="width:100%;">&nbsp;&nbsp;(User) My phone number has changed</a>
          <br/>
          <br/>
          <a href="./intro205_.do" style="width:100%;">&nbsp;&nbsp;(User) I want to share my coupon/point</a>
          <br/>
          <br/>
          <a href="./intro207_.do" style="width:100%;">&nbsp;&nbsp;(User) I want to change my information</a>
          <br/>
          <br/>
          <a href="./intro206_.do" style="width:100%;">&nbsp;&nbsp;(User) I want to log out now</a>
          <br/>
          <br/>
          <a href="./intro503_.do" style="width:100%;">&nbsp;&nbsp;(Store owner) Let's sign up easily</a>
          <br/>
          <br/>
          <a href="./intro501_.do" style="width:100%;">&nbsp;&nbsp;(Store owner) I want to earn and use</a>
          <br/>
          <br/>
          <a href="./intro502_.do" style="width:100%;">&nbsp;&nbsp;(Job owner) Shall we see how far you've been?</a>
          <br/>
          <br/>
          <a href="./intro504_.do" style="width:100%;">&nbsp;&nbsp;(Storekeeper) Now let's set up earning.</a>
          <br/>
          <br/>
          <a href="./intro505_.do" style="width:100%;">&nbsp;&nbsp;(Store owner) The customer wants to share with a friend</a>
          <br/>
          <br/>
          <a href="./intro506_.do" style="width:100%;">&nbsp;&nbsp;(Store owner) I want to change our store information</a>
          <br/>
          <br/>
          <a href="./intro507_.do" style="width:100%;">&nbsp;&nbsp;(Store owner) I want to log out now.</a>
          <br/>
          <br/>
          <a href="./intro006_.do" style="width:100%;">&nbsp;&nbsp;(Information) Is my information really safe?</a>
          <br/>
          <br/>
          <a href="./intro007_.do" style="width:100%;">&nbsp;&nbsp;(Information) How much will it cost to make a coupon?</a>
          <br/>
          <br/>
          <a href="./intro008_.do" style="width:100%;">&nbsp;&nbsp;(Information) Why not make it into an app?</a>
          <br/>
          <br/>
          <a href="./intro009_.do" style="width:100%;">&nbsp;&nbsp;(Information) Isn't the overflowing app like coupons overflowing?</a>
          <br/>
</c:if>

        </div>
        <!--/Grid row-->