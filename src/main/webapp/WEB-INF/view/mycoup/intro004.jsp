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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> 사용하기</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<img src="../../img/mycoup/how_6_kr.png" alt="쿠폰(포인트) 사용 할게요" class="z-depth-0 img-fluid">
        <h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ 간편하게 사용해요 ○</span>
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	쿠폰이나 포인트를 사용하기 위해서는
        	<br/> 간편하게 전화번호만 불러주시면
        	<br/> 알아서 사용을 해 주세요.
        	
        	<br/><br/>        	
        	<span class="text-success font-weight-bold">⊙</span>
        	사용을 할 때, 고객이 불러주는
        	<br/> 전화번호를 믿을 수 있나요?
        	<br/> → 단골이거나 믿을 수 있는 사람에게는
        	<br/> 굳이 번거롭게 확인을 할 필요는 없겠지만
        	<br/> ( 하지만 가능 한 확인을 통해
        	<br/> 무고한 고객이 피해를 보지 않도록 하기를 권장드립니다. )
        	<br/> 사용하기 전에 전화번호를 확인할 수 있어요
        	<br/>
        	<br/> 안드로이드 폰의 경우, 버전 마다 조금씩은 다르지만
        	<br/> 기본적으로 설정으로 들어가서
        	<br/> 휴대전화 정보 > 상태
        	<br/> 또는
        	<br/> 더보기 > 디바이스 정보 > 상태
        	<br/> 에서 내 전화 번호 찾기를 할 수 있어요
        	<br/>
        	<br/> 아이폰의 경우
        	<br/> 설정에서 전화 > 나의 전화번호
        	<br/> 또는
        	<br/> 전화 앱에서 연락처 아이콘을 눌러
        	<br/> 사용자 정보와 함께 전화번호를 확인 가능해요.
        	<br/>
        	<br/> 이렇게 확인하고 사용한다면, 더욱 더 안심이 겠지요.
        	<br/>
        	<br/> 그리고 누가 내 전화번호로 혹시나
        	<br/> 쿠폰이나 포인트를 사용했다면
        	<br/> 방문 내역에서도 확인이 가능합니다.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	누가 내 전화번호로 쿠폰이랑 포인트를 사용했어요
        	<br/> → 전화번호를 확인하지 않고
        	<br/> 매장 점주님이 쿠폰/포인트를 사용 하셨나 봐요
        	<br/> 이럴 땐 빨리 매장에 연락 주셔서
        	<br/> 점주님의 잘못을 알려주시고
        	<br/> 다른 전화번호를 도용한
        	<br/> 나쁜 사람을 빨리 잡을 수 있도록 해 주세요.
        	
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