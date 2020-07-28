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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> 적립 / 사용</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ 적립 및 사용하기 ○</span>
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	간편하게 적립과 사용을
        	<br/> 할 수 있어요
        	<br/> 
        	<br/> →[구분] 적립인지 사용인지를
        	<br/> 먼저 선택 해 주세요
        	<br/> 
        	<br/> →[고객전화번호] 고객의 전화번호를
        	<br/> 입력 해 주세요.
        	<br/> 단골이거나 믿을 수 있는 사람의 경우에는
        	<br/> 이미 전화번호를 알고 있으시기에
        	<br/> 고객이 말씀하시기 전에 이미 적립하고 계시겠지만
        	<br/> 사용의 경우 다른 사람의 적립액을
        	<br/> 도용하는 것을 방지하기 위해
        	<br/> 꼭! 전화번호를 확인해 주세요
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
        	<br/> 이렇게 확인하고 사용한다면, 더욱 더 안심이 겠지요.
        	<br/>
        	<br/> 전화번호를 입력 한 후에는
        	<br/> 고객명과 현재 적립 상태를 확인 하실 수 있어요
        	<br/> 
        	<br/> →[적립/사용수량] 적립이나, 사용하려는
        	<br/> 수량을 입력 해 주세요
        	<br/> 수량 입력 후에는 적립이나 사용 후 수량도 확인 할 수 있어요
        	<br/>
        	<br/> →[고객메모] 고객의 특이사항이나
        	<br/> 기억하고 싶은 내용을 입력하시면
        	<br/> 다음에도 확인 하실 수 있어요
        	<br/> 
        	<br/> →[적립/사용메모] 적립이나 사용 시
        	<br/> 기억하고 싶은 메모가 있다면 입력 해 주세요
        	<br/> 
        	<br/> 마지막으로 [적용하기]를 통해 저장하실 수 있어요
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	적립/사용 내역을 확인 할 수 있어요
        	<br/> 방문일과 적립인지 사용인지의 구분이 있습니다.
        	<br/> 
        	<br/> 적립/사용의 수(적용수)와
        	<br/> 최종 적립/사용이 계산된 적립상태가 있습니다.
        	<br/> 관련된 상품과 적립/사용메모에서 입력 한
        	<br/> 메모를 확인 할 수 있습니다.
        	<br/> 
        	<br/> 최근 사용 수로 한번에 20개 씩만 조회가 가능하니
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