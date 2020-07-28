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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> 정보 변경</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ 내 정보 변경하기 ○</span>
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	내 정보를 변경해 보아요
        	<br/> 이름이나 예명을 변경할 수 있어요
        	<br/> 
        	<br/> 이메일 주소를 변경할 수 있어요
        	<br/> 비밀번호를 관리할 유이한 정보이니
        	<br/> 수정하실 때 주의 부탁드립니다.
        	<br/> 
        	<br/> 마케팅 동의를 변경할 수 있어요
        	<br/> 그동안 너무 광고에 시달리셨다면
        	<br/> 잠시 꺼 두셔도 좋지만
        	<br/> 하지만 점주들께서 알려드리고 싶은
        	<br/> 소중한 행사 정보를 놓칠 수도 있으니
        	<br/> 가능하면 사용 부탁드립니다.
        	<br/> 
        	<br/> 비밀번호를 변경할 수 있어요
        	<br/> 비밀번호를 분실하면
        	<br/> 이메일을 통해 다시 변경하실수는 있지만
        	<br/> 귀찮으니 가능하면 꼭 기억해 두어요.
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