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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> 적립 설정</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ 상품 정보를 등록해요 ○</span>
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	<br/> →[적립구분] 회원가입 시 설정한 정보에요
        	<br/> 한번 설정 후 변경이 불가능 합니다.
        	<br/> 
        	<br/> →[적립제한] 최대 적립 수를 설정할 수 있습니다.
        	<br/> 없음이면 제한이 없구요,
        	<br/> 숫자를 입력하면, 고객 적립 시 해당 수에 도달하면
        	<br/> 메시지가 보여지게 됩니다. 

        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	상품 설정을 해 보아요
        	<br/> 추가, 삭제 버튼을 통해 상품을 설정할 수 있어요
        	<br/> 적립 수와 상품을 등록하면
        	<br/> 고객이 이 매장정보 검색 시 볼 수 있어요
        	<br/> 기존 적립을 사용하기 위해서, 또는
        	<br/> 상품을 얻고 싶어서 우리 매장을 많이 방문할 수
        	<br/> 있도록 설정을 잘 해 보아요
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	최종 적용하기 버튼을 통해 저장이 됩니다. 
        	
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