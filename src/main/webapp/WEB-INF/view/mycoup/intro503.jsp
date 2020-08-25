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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> 회원가입</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ 간편한 경영주 회원 가입 ○</span>
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	정말 쉬워요
        	<br/> →[회원구분] 경영주로 변경해 주세요.
        	<br/> 
        	<br/> →[전화번호] 본인의 전화번호를 입력하여 주세요
        	<br/> 
        	<br/> →[비밀번호] 6글자 이상의 점포만의 비밀번호를 입력하여 주세요
        	<br/> 
        	<br/> →[비밀번호확인] 비밀번호와 동일한 내용을 입력하여 주세요
        	<br/> 
        	<br/> →[성함이나 예명] 경영주 님의 성함을 입력하여 주세요.
        	<br/> 
        	<br/> →[이메일주소] 비밀번호를 잃어버렸을 때 찾기 위해서 에요
        	<br/> 
        	<br/> →[상호] 점포의 상호를 입력해 주세요
        	<br/>
        	<br/> →[적립구분] 점포의 적립 방식을 정해 주세요
        	<br/> 쿠폰은 쿠폰 장수로 적립합니다.
        	<br/> 포인트는 포인트 점수로 적립합니다.
        	<br/> 한번 설정 후 변경이 불가능 합니다.
        	<br/> 
        	<br/> →[연락처] 매장의 전화번호를 입력하여 주세요
        	<br/> 
        	<br/> →[주소] 매장의 주소를 입력하여 주세요
        	<br/> 
        	<br/> →[위도/경도] 매장의 위치를 입력하여 주세요        	
        	<br/> 고객들에게 지도에서 표시할 매장 위치 입니다.
        	<br/> 회원 가입 시 곧바로 매장 위치를 고객들의 지도에 표시합니다.
        	<br/> 위도, 경도 글자를 클릭하면 구글지도가 나타납니다.
        	<br/> 위치를 꾸욱 누르시거나, 아니면 위치를 공유하시면
        	<br/> 링크 주소에 위도 및 경도가 나타납니다.
        	<br/> 아래 그림을 참조 해 주세요
        	<br/> 
        	<br/> →[마케팅동의] 행사 정보를 이메일이나 전화로 받을 수 있어요
        	<br/>
        	<img src="../../img/mycoup/find_store_location_kr.png" alt="내 매장의 위도 및 경도 찾기" class="z-depth-0 img-fluid">
        	
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