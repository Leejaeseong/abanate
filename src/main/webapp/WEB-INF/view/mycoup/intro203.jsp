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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> 내 주변 확인</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ 내 주변 쿠폰/포인트 확인 ○</span>
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	나의 위치와 쿠폰/포인트를 적립,사용 할 수 있는 매장을
        	<br/> 지도에서 확인 할 수 있어요
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	매장을 터치(선택) 해 보아요
        	<br/> 그 점포의 상품 상세 내역과
        	<br/> 나의 방문 내역을 알 수 있어요
        	<br/> 사용 할 수 있는 상품의 적립 수를 확인 할 수 있구요,
        	<br/> 방문일자와 적립/사용 내역을 볼 수 있어요
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	내 주변의 좋은 매장을
        	<br/> 많이 많이 이용 해 주세요~^o^~
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