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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> 쿠폰 제작 비용</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ 쿠폰 제작 비용은 얼마나 할까요? ○</span>
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	업체마다 천차만별이지만
        	<br/> 가장 저렴한 버전의 종이 쿠폰의 경우
        	<br/> 대략 100장에 8천 ~ 1만원 정도
        	<br/> 1천장에 4~5만원 정도 하니
        	<br/> 1천장 구매를 한다고 해도
        	<br/> 장당 40~50원의 비용이 발생합니다.        	
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	가격도 가격이지만
        	<br/> 업체에서 제공하는 디자인 양식이
        	<br/> 있다고 하더라도 조금씩은
        	<br/> 변경 작업을 해 주어야 하고
        	<br/> 마음에 디자인이 없다면
        	<br/> 완전 새롭게 디자인을 해야 하는
        	<br/> 번거로움이 있습니다.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	종이 쿠폰은 유통과 관리에
        	<br/> 점주와 고객이 모두
        	<br/> 너무 불편하다는 치명적인
        	<br/> 단점이 있지요
        	<br/> 쿠폰을 한장 한장
        	<br/> 매장별로 모아서 관리하는
        	<br/> 쿠폰을 좋아하시는
        	<br/> 몇 고객을 제외하고는
        	<br/> 대부분은 쿠폰 조각이
        	<br/> 버리자니 아깝고
        	<br/> 계속 가지고 다니기에는
        	<br/> 너무 귀찮은 존재입니다.
        	
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