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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> 적립 확인</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ 내 쿠폰/포인트 확인 ○</span>
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	나의 쿠폰과 포인트가 얼마나 있을까?
        	<br/> →[내쿠폰] 나의 전체 쿠폰을 알 수 있어요
        	<br/>
        	<br/> →[내포인트] 나의 전체 포인트를 알 수 있어요
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	가게를 검색해 볼까?
        	<br/> 상호로 검색할 수 있구요,
        	<br/> 매장 전화번호로도 검색 할 수 있어요
        	<br/> 내가 방문했던 장소만 골라서 검색 할 수도 있어요
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	검색 결과를 확인 해 보아요
        	<br/> 상호와 최근 나의 방문일,
        	<br/> 그리고 적립되어 있는 총 수를 볼 수 있어요
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	검색 결과를 터치(선택) 해 보아요
        	<br/> 그 점포의 상품 상세 내역과
        	<br/> 나의 방문 내역을 알 수 있어요
        	<br/> 사용 할 수 있는 상품의 적립 수를 확인 할 수 있구요,
        	<br/> 방문일자와 적립/사용 내역을 볼 수 있어요
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