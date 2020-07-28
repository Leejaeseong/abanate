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
        	<span class="text-primary font-weight-bold">○ 간편한 사용자 회원 가입 ○</span>
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	정말 쉬워요
        	<br/> →[회원구분] 사용자로 그대로 놔두면 됩니다.
        	<br/> 
        	<br/> →[전화번호] 본인의 전화번호를 입력하여 주세요
        	<br/> 
        	<br/> →[비밀번호] 6글자 이상의 본인만의 비밀번호를 입력하여 주세요
        	<br/> 
        	<br/> →[비밀번호확인] 비밀번호와 동일한 내용을 입력하여 주세요
        	<br/> 
        	<br/> →[성함이나 예명] 이름이나, 아니면 이름 대신
        	<br/> 가게에서 사용 할 애칭을 입력하여 주세요.
        	<br/> 
        	<br/> →[이메일주소] 비밀번호를 잃어버렸을 때 찾기 위해서 에요
        	<br/> 
        	<br/> →[마케팅동의] 행사 정보를 이메일이나 전화로 받을 수 있어요
        	
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