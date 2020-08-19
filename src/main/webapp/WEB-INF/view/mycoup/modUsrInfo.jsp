<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="header.jsp"/>
<jsp:include page="comHeader.jsp"/>
<body>

  <jsp:include page="navigator.jsp"/>

  <!--Main layout-->
  <main>

    <!-- 상단 구분 줄 -->
    <hr class="mt-5"/>

    <div class="container bg-primary">
        <h1>        
          <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-exchange-alt"></i> 정보 변경</span>
        </h1>
      </div>
	
	<form id="idForm" action="./modUsrInfo.do" method="post">
    <div class="container">

      <div class="row wow fadeIn border border-dark justify-content-center">

        <div class="w-100">&nbsp;</div> <!-- top space of border -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-mobile-alt"></i>
        </div>
        <div class="col-4 text-left mt-2">
          <label>전화번호(ID)</label>
        </div>
        <div class="col form-inline text-center">
        	<input type="text" class="form-control form-control-sm text-center" style="width:12em;" disabled="disabled" value="${sessionScope.cmUsr.usrId}">
        	<input type="hidden" name="usrId" value="${sessionScope.cmUsr.usrId}"/>
        </div>

		<div class="w-100"><hr/></div> <!-- horizontal line -->
        
        <div class="col-1 align-self-center text-right">
          <i class="fas fa-globe"></i>
        </div>
        <div class="col-4 text-left mt-2">
          <label>국가</label>
        </div>
        <div class="col form-inline text-center">
          <select class="form-control form-control-sm" name="natiCdDisplay" style="width:12em;" disabled="disabled"></select>
          <input type="hidden" name="natiCd" value="${sessionScope.cmUsr.natiCd}"/>
        </div>
        
        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center mb-2 text-right">
          <i class="fas fa-user-tag"></i>
        </div>                  
        <div class="col-4 text-left my-auto">
          <label>가입자 성함<font class="small"><br/>( 또는 예명 )</font>
          </label>
        </div>
        <div class="col form-inline text-center">
          <input type="text" class="form-control form-control-sm" name="usrNm" aria-describedby="input name" placeholder="No named" style="width:12em;" maxlength="30"
                 value="${sessionScope.cmUsr.usrNm}">
        </div>
        
        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="far fa-envelope"></i>
        </div>                  
        <div class="col-4 text-left mt-2">
          <label>이메일 주소</label>
        </div>
        <div class="col form-inline text-center">
          <input type="email" class="form-control form-control-sm" name="email" aria-describedby="email address" placeholder="Enter email" style="width:12em;" maxlength="64"
          		  value="${sessionScope.cmUsr.email}">
        </div>
        
        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="far fa-handshake"></i>
        </div>                  
        <div class="col-4 text-left mt-2">
            <label>마케팅 동의</label>
        </div>
        <div class="col align-self-center pl-3">
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="marketAgreeYn" id="marketAgreeYnRadio1" value="Y"<c:if test="${sessionScope.cmUsr.marketAgreeYn == 'Y'}"> checked</c:if>>
            <label class="form-check-label" for="marketAgreeYnRadio1">동의</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="marketAgreeYn" id="marketAgreeYnRadio2" value="N"<c:if test="${sessionScope.cmUsr.marketAgreeYn != 'Y'}"> checked</c:if>>
            <label class="form-check-label" for="marketAgreeYnRadio2">받지 않음</label>
          </div>
        </div>
        
        <div class="w-100"><hr/></div>  <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-lock"></i>
        </div>                  
        <div class="col-4 text-left mt-2">
          <label>변경 비밀번호<br/>(변경시에만 입력)</label>
        </div>
        <div class="col form-inline text-center">
          <input type="password" class="form-control form-control-sm" name="chngPasswd" placeholder="Password" style="width:12em;">
        </div>

        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center mb-2 text-right">
          <i class="fas fa-key"></i>
        </div>                  
        <div class="col-4 text-left my-auto">
          <label>변경 비밀번호<br/>확인</label>
        </div>
        <div class="col form-inline text-center">
          <input type="password" class="form-control form-control-sm" id="chngPasswdConfirm" placeholder="Password" style="width:12em;" maxlength="20">
        </div>
                
        <div class="w-100"><hr/></div>  <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-lock"></i>
        </div>                  
        <div class="col-4 text-left mt-2">
          <label>비밀번호</label>
        </div>
        <div class="col form-inline text-center">
          <input type="password" class="form-control form-control-sm" name="passwd" placeholder="Password" style="width:12em;">
        </div>
        
        <div class="w-100">&nbsp;</div>  <!-- horizontal blank -->

        <div class="col text-center">
        	<button type="button" class="btn btn-primary" onclick="onSubmit();">적용하기 <i class="fas fa-clipboard-check"></i></button>
        	<button type="button" class="btn btn-dark" onclick="history.back();">돌아가기 <i class="fas fa-undo-alt"></i></button>
        </div>
        
        <div class="w-100">&nbsp;</div> <!-- bottom space of border -->

      </div> <!-- end of border -->      
      
    </div>
    <input type="hidden" name="recaptchaToken"/>
    <input type="hidden" name="usrTp" value="U"/>
    </form>
    
  </main>
  <!--Main layout-->

	<script>
		// Event load of document.
		window.addEventListener("load", function(evt) {
			var isComplete	= '${isComplete}';	// 처리 완료
			var isError 	= '${isError}'; 	// 오류 발생
			var errMsg  	= '${errMsg}';		// 오류 메시지

			if( isError ) {
				showComModal( {type:"error", msg:errMsg,closeCallbackFnc:function(){ goMain(); } } );
			} else if ( isComplete ) {
				showComModal( {msg:"정보가 변경되었습니다",closeCallbackFnc:function(){ goMain(); } } );
				
			}
	
		});
		
		// Event enter key to login.
		window.addEventListener("keyup", function(evt) {
			if( evt.keyCode == 13 ) {
				onSubmit();
			}
		});

		// Event click submit.
		function onSubmit() {
			var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			var form = document.querySelector( '#idForm' );
			if( form.querySelector( 'input[name="passwd"]' ).value.length < 6 ) {
				showComModal( {type:"warning",msg:"비밀번호는 6자리 이상을 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( 'input[name="passwd"]' ).focus() }} );
				return false;
			} else if( chkNull( form.querySelector( 'input[name="chngPasswd"]' ).value ) && form.querySelector( 'input[name="chngPasswd"]' ).value.length < 6 ) {
				showComModal( {type:"warning",msg:"변경할 비밀번호는 6자리 이상을 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#chngPasswd' ).focus() }} );
				return false;
			} else if( chkNull( form.querySelector( 'input[name="chngPasswd"]' ).value ) && ( form.querySelector( 'input[name="chngPasswd"]' ).value != form.querySelector( '#chngPasswdConfirm' ).value ) ) {
				showComModal( {type:"warning",msg:"비밀번호가 동일하지 않습니다.",closeCallbackFnc:function(){ document.querySelector( '#chngPasswdConfirm' ).focus() }} );
				return false;
			} else if( form.querySelector( 'input[name="usrNm"]' ).value == "" ) {
				showComModal( {type:"warning",msg:"성함을 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( 'input[name="usrNm"]' ).focus() }} );
				return false;
			} else if( form.querySelector( 'input[name="email"]' ).value == "" ) {
				showComModal( {type:"warning",msg:"이메일 주소를 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( 'input[name="email"]' ).focus() }} );
				return false;
			} else if( !regExpEmail.test( form.querySelector( 'input[name="email"]' ).value ) ) {
				showComModal( {type:"warning",msg:"이메일 주소 형식을 확인해 주세요",closeCallbackFnc:function(){ document.querySelector( 'input[name="email"]' ).focus() }} );
				return false;
			}

			
			
			grecaptcha.execute('${setting_api_recaptcha_site_key}', {action: 'submit'}).then(function(token) {
    	        // Add your logic to submit to your backend server here.
    	        document.querySelector( 'input[name="recaptchaToken"]' ).value = token;
				form.submit();
          	});
			
		}
	</script>

	
	<script src="https://www.google.com/recaptcha/api.js?render=${setting_api_recaptcha_site_key}"></script>
	
<jsp:include page="comFooter.jsp"/>
<jsp:include page="footer.jsp"/>

	<script language="javascript">
		// Event load of document
	  	window.addEventListener("load", function(evt) {
			// Set nation code to select tag
			<c:forEach var="name" items="${cmNatiCd}" varStatus="status">
			addNatiCd( '${name.natiCd}', '${name.natiNmKor}', '${name.natiNmEng}', 'natiCdDisplay' );
			</c:forEach>
			
			document.querySelector( 'select[name="natiCdDisplay"]' ).value = '${sessionScope.cmUsr.natiCd}';
			
		});
	</script>
	
</body>

</html>