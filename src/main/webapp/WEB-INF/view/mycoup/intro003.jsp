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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> 적립하기</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<img src="../../img/mycoup/how_3.png" alt="쿠폰(포인트) 모을게요" class="z-depth-0 img-fluid">
        <h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ 간편하게 적립해요 ○</span>
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	물건을 구매하고, 쿠폰이나 포인트를 적립하기 위해서는
        	<br/> 간편하게 전화번호만 불러주시면
        	<br/> 알아서 적립을 해 주세요.
        	
        	<br/><br/>        	
        	<span class="text-success font-weight-bold">⊙</span>
        	나는 회원 가입도 한 적이 없는데 어떻게요?
        	<br/> → 전화번호로를 기준으로 적립을 해 드리고
        	<br/> 고객님이 간편 회원가입을 하시면
        	<br/> 그 동안에 적립된 쿠폰이나 포인트를 볼 수 있어요        	
        	
        	<br/><br/>        	
        	<span class="text-success font-weight-bold">⊙</span>
        	적립했다고 한 말을 믿을 수 있나요?
        	<br/> → 간편 회원 가입 후 나의 실시간 적립 상황을
        	<br/> 볼 수 있기 때문에 안심할 수 있습니다.
        	
        	<br/><br/>        	
        	<span class="text-success font-weight-bold">⊙</span>
        	실수로 고객님께 너무 많이 적립을 해 드렸어요
        	<br/> 하나를 적립해 드려야 하는데,
        	<br/> 실수로 100개를 적립해 드렸어요.
        	<br/> → 당황하지 마시고 고객에게 말씀드리고
        	<br/> 99개를 사용 처리 하시면 됩니다.
        	
        	<br/><br/>        	
        	<span class="text-success font-weight-bold">⊙</span>
        	고객이 벌써 가 버렸는데요?
        	<br/> → 마찬가지로 99개를 사용 처리 하시고
        	<br/> 사용 메모란에 내용을 적어 두시면
        	<br/> 다음에 그 고객이 오셨을 때 메모를 보고
        	<br/> 안내가 가능할 거에요.
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