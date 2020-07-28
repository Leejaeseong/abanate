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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> 홈페이지 서비스</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ 왜 앱으로 서비스를 하지 않나요? ○</span>
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	앱의 가장 치명적인 단점은
        	<br/> 설치를 해야 한다는 것입니다.
        	<br/> 앱 설치 자체도
        	<br/> 번거롭지만, 앱 자체가
        	<br/> 휴대폰이나 PC 저장 공간도 차지하고
        	<br/> 앱 설치에 대한 불안함도
        	<br/> 항상 존재하고 있습니다.
        	<br/> ( 내 정보를 가져가는 앱 등 )
        	<br/> 
        	<br/> 그리고 좋은 서비스를 위해
        	<br/> 기능을 추가/변경 하게 되면
        	<br/> 잦은 업데이트라는
        	<br/> 지옥을 접하시게 되는데
        	<br/> 이런 경험은 하게 해 드리고
        	<br/> 싶지가 않습니다.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	홈페이지로만 서비스를 하고
        	<br/> 모바일 브라우저로도 접속이
        	<br/> 원활하게 만들어
        	<br/> 설치도 필요없고,
        	<br/> 원할땐 언제든지 즐겨찾기를 통해
        	<br/> 안심하고, 편리하게
        	<br/> 사용이 가능합니다.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	이제 언제 어디에서나
        	<br/> 안심하고 웹으로 접속하시면 됩니다.
        	
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