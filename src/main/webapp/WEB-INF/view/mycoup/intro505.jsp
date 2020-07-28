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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> 적립 양도</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ 적립 정보를 친구에게 나눠주려는 고객이 있어요 ○</span>
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	<br/> →[적립금양도전화번호] 주려고 하는 회원의 전화번호에요
        	<br/> 아래에 비밀번호를 입력하겠지만, 그래도 전화번호는
        	<br/> 꼭 확인 해 주세요.
        	<br/> 실수로 다른사람 전화번호에 있는 적립액이
        	<br/> 이동 되는 시도를 막기 위함 입니다.
        	<br/> 
        	<br/> 안드로이드 폰의 경우, 버전 마다 조금씩은 다르지만
        	<br/> 기본적으로 설정으로 들어가서
        	<br/> 휴대전화 정보 > 상태
        	<br/> 또는
        	<br/> 더보기 > 디바이스 정보 > 상태
        	<br/> 에서 내 전화 번호 찾기를 할 수 있어요
        	<br/>
        	<br/> 아이폰의 경우
        	<br/> 설정에서 전화 > 나의 전화번호
        	<br/> 또는
        	<br/> 전화 앱에서 연락처 아이콘을 눌러
        	<br/> 사용자 정보와 함께 전화번호를 확인 가능해요.
        	<br/> 
        	<br/> →[적립제한] 최대 적립 수를 설정할 수 있습니다.
        	<br/> 없음이면 제한이 없구요,
        	<br/> 숫자를 입력하면, 고객 적립 시 해당 수에 도달하면
        	<br/> 메시지가 보여지게 됩니다.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	양도 전화번호가 입력되면
        	<br/> 양도자 성함과 적립금이 표시됩니다.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	양수자(적립액을 받는 사람) 전화번호를 입력해 주세요.
        	입력 후 양수자 성함과 적립액이 표시됩니다.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	이동수량을 입력해 주세요
        	<br/> 양도자에서 양수자로의 이동 수 입니다.
        	<br/> 양도자가 가진 수 이상으로는 이동할 수 없어요
        	
        	<br/><br/> 
        	<span class="text-success font-weight-bold">⊙</span>
        	양도자의 비밀번호를 직접 입력하게 해 주세요.
        	<br/> 이는 직접 양도자가 비밀번호를 입력하여
        	<br/> 혹시 발생할 수 있는 책임으로 부터
        	<br/> 경영주님을 보호하기 위한 장치입니다.
        	
        	<br/><br/> 
        	<span class="text-success font-weight-bold">⊙</span>
        	최종 [적용하기] 버튼을 통해 적립금을 이동할 수 있어요
        	
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