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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> 보안</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ 내 정보는 정말 안전할까? ○</span>
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	비밀번호는 그 누구도 알 수 없는 방식으로 저장됩니다.
        	<br/> 관리자도 절대로 알 수 없는, 암호를 반대로 
        	<br/> 복호화 하는 것이 불가능 하기 때문에
        	<br/> 안심하셔도 됩니다.
        	<br/> 해킹을 하더라도 절대로 여러분의
        	<br/> 비밀번호는 알 수 없습니다.
        	
        	<span class="text-success font-weight-bold">⊙</span>
        	그 외에도 이 사이트는
        	<br/> 해킹 및 침입 방지( reCaptcha)와
        	<br/> 국가에서 제공하는 도로명 주소 사용,
        	<br/> 그리고 네이버/구글 맵등을 활용하고 있습니다.
        	
        	<span class="text-success font-weight-bold">⊙</span>
        	불편하거나 보안에 의심되는 사항이 있으면
        	<br/> 언제든지 이메일로 알려주세요
        	<br/> 더욱 노력하는 사이트가 되겠습니다.
        	<br/> 감사합니다.
        	
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