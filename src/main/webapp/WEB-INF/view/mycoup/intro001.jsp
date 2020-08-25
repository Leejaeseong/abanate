<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="header.jsp"/>
<jsp:include page="comHeader.jsp"/>
<body>

  <jsp:include page="navigator.jsp"/>

  <!--Main layout-->
  <main>

    <!-- 상단 공백 -->
    <p class="my-4">&nbsp;</p>

    <div class="container bg-primary">
      <h1>        
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> 뭐 하는 곳인가?</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<img src="../../img/mycoup/how_1_kr.png" alt="이게 뭐에요?-일반 매장에서 쿠폰 관리" class="z-depth-0 img-fluid">
      	<br/>
        <img src="../../img/mycoup/how_2_kr.png" alt="이게 뭐에요?-고객들에게 포인트를 주고 싶어요" class="z-depth-0 img-fluid">
        <h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ 이곳은 포인트나 쿠폰을 손쉽게 무료로 관리해 주는 곳 입니다 ○</span>
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	가게에서 물건을 살 때 구매한 물건 수 만큼 적립된 쿠폰을 나누어 주어,
        	<br/> 고객이 다음에 또 방문을 하기 쉽게 해 주는 종이 쿠폰은
        	<br/> 손님 입장에서는 가지고 다니기 매우 불편합니다.
        	<br/> 관리하기도 힘들고, 방문 매장이 많아지면,
        	<br/> 쿠폰을 일일이 찾아야 하는 번거로움도 있기 때문이지요.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	학원에서 수강생들이 매달 결제를 할 때 마다 일정 비율 적립을 해 주어,
        	<br/> 포인트 소모를 위해 다음 달도 등록할 수 있도록 유도를 하기 위해서는
        	<br/> 일반적으로 불편한 장부 관리를 해야 하기에, 여러가지 불편함이 발생합니다.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	쿠폰이나, 포인트를 제공하는 이유는 단순합니다.
        	<br/> 모두 고객에게 지급하는 무료 마케팅 자료를 통해 충성도를 높이기 위함입니다.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	하지만 종이 쿠폰과 장부는 업주들도, 그리고 고객들도 모두 불편하고,
        	<br/> 그렇다고 프랜차이즈 가맹점등이 아닌 소상공인들이, 시스템을 사용하려면
        	<br/> 금액적인 부담을 무시할 수는 없을 것 입니다.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	MyCoup 사이트는 사용료를 비롯하여 관리에 드는 비용이 전혀 없습니다.
        	<br/> 시작은 무료 이지만 나중에 유료화 할 생각도 전혀 없습니다.
        	<br/> 만약 비용이 발생한다면 고객에게 문자를 발송 하는 등의
        	<br/> 신규 서비스 일 것이며, 이 또한 사용 여부는 선택이고,
        	<br/> 수수료도 거의 없도록 노력하겠습니다.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	못 믿겠다!!! 이 사이트 운영 수익이 없다면 언제든지 사이트가 닫힐수도 있는 것 아니야? 
        	<br/> → 수익이 전혀 없는 것은 아닙니다. 사이트에 있는 광고를 통해 운영비를 충당하고 있으며,
        	<br/> 간단한 고객 관리와 쿠폰/포인트 관리만 제공하더라도
        	<br/> 소상공인들에게 큰 도움이 될 것으로 믿고 있기 때문입니다.
        	<br/> 그리고 주기적으로 더 좋은 서비스를 제공하기 위해 항상 고민하겠습니다.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	이제 간단하게 전화번호만으로 적립하고 관리하세요!
        	<br/> 모든 쿠폰/포인트는 고객의 전화번호 기반으로 운영되고 있으니
        	<br/> 따로 아이디를 기억하고 있지 않아도 되고,
        	<br/> 적립/사용 시 쉽게 입력할 수 있습니다.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	내 가게에 얼마나 손님들이 쿠폰과 포인트를 가지고 있으며
        	<br/> 내가 가진 쿠폰과 포인트는 어느 가게에서 사용할 수 있는지
        	<br/> 손쉽게 확인이 가능합니다.
        	<br/> 그리고 내 고객들에게 우리 가게 행사 정보를 보내거나
        	<br/> 내가 쿠폰을 가지고 있는 가게의 행사를 알 수 있어요.
        	<br/> ( 이 서비스는 아직은 조금만 더 기다려 주세요.
        	<br/> 무료로 서비스 할 방법이 없는지 검토하고 있습니다 )
		</h5>

      </div>
      
      <div class="w-100">&nbsp;</div>  <!-- horizontal blank -->
      

      <div class="col text-center">
      	<button type="button" class="btn btn-dark" onclick="goMain();">돌아가기 <i class="fas fa-undo-alt"></i></button>
      	<input type="hidden" name="usrTp"/>
      	<input type="hidden" name="usrNm"/>
      	<input type="hidden" name="marketAgreeYn"/>
      </div>
      
      
    </div> <!-- end of border -->

    </div>  <!-- end of container -->
    
  </main>
  <!--Main layout-->

  	<script language="javascript">
  		window.addEventListener("load", function(evt) {
  	  		
		});
	</script>
	
<jsp:include page="comFooter.jsp"/>
<jsp:include page="footer.jsp"/>
</body>

</html>