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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> 편리하다</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<img src="../../img/mycoup/how_4_kr.png" alt="쿠폰을 가지고 다닐 필요가 없어요" class="z-depth-0 img-fluid">
        <h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ 쿠폰을 가지고 다닐 필요가 없어요 ○</span>
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	이용하는 가게 마다 받은 - 종이에 도장 찍어 받은 쿠폰,
        	<br/> 이제 가지고 다닐 필요가 없습니다.
        	<br/> MyCoup 사이트에서 온라인으로 언제,
        	<br/> 어디서든 조회와 사용이 가능하도록 제공하겠습니다.
        	        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	적립을 위해서는 회원 가입도 필요 없습니다.
        	<br/> 적립은 그냥 본인의 전화번호만 불러주시면 됩니다.
        	<br/> 고객님의 전화번호로 해당 가게에서 알아서 적립을 해 주실 겁니다.
        	<br/> 나중에 내 쿠폰이나 포인트를 확인하고 싶으시면
        	<br/> 비밀번호와 이메일 주소만 적으시고 간단하게 가입이 가능하며
        	<br/> 한번만 가입 후 이제 나의 포인트와 쿠폰을 언제,
        	<br/> 어디서든 확인이 가능합니다.
        	
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