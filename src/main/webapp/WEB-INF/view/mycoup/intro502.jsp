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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> 방문 확인</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<img src="../../img/mycoup/how_5.png" alt="그 동안 얼마나 다녀갔는지 볼까?" class="z-depth-0 img-fluid">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">      	
        	<span class="text-primary font-weight-bold">○ 고객의 방문 내역 확인 ○</span>
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	매장의 전체 적립/사용 내용을 볼 수 있어요
        	<br/> 누적고객을 통해 쿠폰/포인트를 적립한        	
        	<br/> 고객의 수를 알 수 있어요
        	<br/> 
        	<br/> 전체 적립과 사용의 수를 알 수 있어요
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	일자, 전화번호, 성함으로
        	<br/> 내 매장의 방문 내역을 검색을 할 수 있어요
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	검색 후 검색 결과를 볼 수 있어요
        	<br/> 검색 된 총 수와
        	<br/> 고객의 수( 중복 제외 )
        	<br/> 적립과 사용액 및
        	<br/> 적립 - 사용한 누적액을 볼 수 있어요
        	<br/>
        	<br/> 방문일시와 적립/사용 구분
        	<br/> 성함과 전화번호 및
        	<br/> 적립/사용이 적용 된 수량과
        	<br/> 고객별 최종 적립/사용이 계산된
        	<br/> 누적액을 확인 할 수 있어요
        	<br/> 
        	<br/> 최근 방문일로 한번에 20개 씩만 조회가 가능하니
        	<br/> [더보기] 버튼을 통해 추가 정보를 더
        	<br/> 확인 하실 수 있습니다.
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