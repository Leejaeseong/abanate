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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> 넘쳐나는 서비스</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ 쿠폰, 포인트 앱은 엄청 많이 들어본 것 같아요 ○</span>
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	쿠폰 적립, 포인트 적립
        	<br/> 자세히는 모르지만 엄청나게
        	<br/> 관련된 서비스나 앱이
        	<br/> 많다고 생각하실 겁니다. 
        	<br/> 
        	<br/> 저희도 이 서비스를 위해
        	<br/> 고민해 보았는데요.
        	<br/> 하지만, 아래와 같은 서비스는
        	<br/> 아직도 없기에, 이렇게
        	<br/> 직접 만들게 되었습니다.
        	<br/> 
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	사이트 처음에도 나와 있는 말인데요.
        	
        	<br/><br/><br/>
        	<i class="far fa-star"></i> 번거로운 App 설치 <label class="text-danger font-weight-bold">NO!</label><br/>
        	앱이 아니라 웹으로만 서비스 하는 곳은
        	<br/> 거의 없습니다.
        	<br/> 이는 앱을 설치하도록 하여
        	<br/> 수시로 사용자를 귀찮게 하는
        	<br/> 알람을 보낸다던지,
        	<br/> 사용자 동선을 감시하는
        	<br/> 앱을 업체들이 선호하기 때문입니다.
        	
        	<br/><br/><br/>        	
          	<i class="far fa-star"></i> 어떠한 기계 <label class="text-danger font-weight-bold">장비</label>도 필요하지 않아요.<br/>
          	<br/> 보통 점주들에게 사용자 인식을 위한          	
          	<br/> 태그 기계나, 소규모 POS와 연동된 제품을 통해
          	<br/> 기계등을 구입하게 하여 수익을 창출하는데요.
          	<br/> 
          	<br/> 저희는 그렇게 점주들을 전혀
          	<br/> 괴롭히지 않습니다.
          	<br/> 순수!!! 웹 사이트를 통해서만
          	<br/> 서비스가 되기 때문입니다.
          	
          	<br/><br/><br/>
          	<i class="far fa-star"></i> 모든 서비스는 <label class="text-danger font-weight-bold">무료</label> 입니다
          	<br/> 점주들에게서 돈을 착취하여
          	<br/> 수익을 만들려고 만든 서비스가
          	<br/> 아니기 때문이에요
          	<br/> 
          	<br/> 서로 윈윈하기 위한
          	<br/> 최소한의 꼭 필요한 서비로도
          	<br/> 서로 투자를 하지 않고
          	<br/> 좋은 관리 서비스를 할 수
          	<br/> 있다는 확신이 있었기 때문입니다.
          	<br/> 
          	<br/> 일종의 재능기부로 시작한 셈이지요.
          	
          	<br/><br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
          	프렌차이즈에서 제공하는
          	<br/> 가맹점들끼리만의 서비스가 아닌
          	<br/> 
          	<br/> 단독으로 운영 되고,
          	<br/> 무료로 안심하고 사용 할 수 있는
          	<br/> 그런 소상공인님들을 위한
          	<br/> 좋은 서비스를 만들고 싶습니다.
        	
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