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
          <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-exchange-alt"></i> <!--비밀번호 변경-->${mLang["chngpasswd"]}</span>
        </h1>
      </div>
	
	<form id="idForm" action="./changePwd.do" method="post">
    <div class="container">

      <div class="row wow fadeIn border border-dark justify-content-center">

        <div class="w-100">&nbsp;</div> <!-- top space of border -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-mobile-alt"></i>
        </div>
        <div class="col-4 text-left mt-2">
          <label><!--전화번호(ID)-->${mLang["phone_id"]}</label>
        </div>
        <div class="col form-inline text-center">
        	<input type="text" class="form-control form-control-sm text-center" id="usrId" style="width:12em;" disabled="disabled">
	        <input type="hidden" name="usrId" value="${usrId}"/>
	        <input type="hidden" name="passwdChngToken" value="${passwdChngToken}"/>
        </div>

		<div class="w-100"><hr/></div> <!-- horizontal line -->
        
        <div class="col-1 align-self-center text-right">
          <i class="fas fa-globe"></i>
        </div>
        <div class="col-4 text-left mt-2">
          <label><!--국가-->${mLang["nation"]}</label>
        </div>
        <div class="col form-inline text-center">
          <select class="form-control form-control-sm" name="natiCdDisplay" style="width:12em;" disabled="disabled"></select>
          <input type="hidden" name="natiCd" value="${natiCd}"/>
        </div>
        
        <div class="w-100"><hr/></div>  <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-lock"></i>
        </div>                  
        <div class="col-4 text-left mt-2">
          <label><!--비밀번호 변경-->${mLang["chngpasswd"]}</label>
        </div>
        <div class="col form-inline text-center">
          <input type="password" class="form-control form-control-sm" name="passwd" placeholder="Password" style="width:12em;">
        </div>

        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center mb-2 text-right">
          <i class="fas fa-key"></i>
        </div>                  
        <div class="col-4 text-left my-auto">
          <label><!--비밀번호<br/>확인-->${mLang["confirmpasswd_br"]}</label>
        </div>
        <div class="col form-inline text-center">
          <input type="password" class="form-control form-control-sm" id="passwdConfirm" placeholder="Password" style="width:12em;" maxlength="20">
        </div>
                
        <div class="w-100">&nbsp;</div>  <!-- horizontal blank -->

        <div class="col text-center">
        	<button type="button" class="btn btn-primary" onclick="onSubmit();"><!--적용하기-->${mLang["apply"]} <i class="fas fa-clipboard-check"></i></button>
        	<button type="button" class="btn btn-dark" onclick="history.back();"><!--돌아가기-->${mLang["back"]} <i class="fas fa-undo-alt"></i></button>
        </div>
        
        <div class="w-100">&nbsp;</div> <!-- bottom space of border -->

      </div> <!-- end of border -->      
      
    </div>
    <input type="hidden" name="recaptchaToken"/>
    </form>
    
  </main>
  <!--Main layout-->

	<script>
		// Event load of document.
		window.addEventListener("load", function(evt) {
			var usrId		= '${usrId}';		// 아이디
			var natiCd		= '${natiCd}';		// Nation code
			var searchResult= '${result}';		// 접근 토큰
			var isComplete	= '${isComplete}';	// 처리 완료
			var isError 	= '${isError}'; 	// 오류 발생
			var errMsg  	= '${errMsg}';		// 오류 메시지

			//document.querySelector( '#usrId' ).value = toPhoneFormat( usrId );
			document.querySelector( '#usrId' ).value = usrId;
			
			if( !isComplete && ( !searchResult || searchResult == NOT_EXIST_DATA ) ) {
				// 접근 경로가 올바르지 않습니다
				showComModal( { type:"error", msg:'${mLang["contr_wrongaccesspath"]}',closeCallbackFnc:function(){ goMain() } } );
			} else if( isError ) {
				showComModal( { type:"error", msg:errMsg } );
			} else if( isComplete ) {
				// 비밀번호가 변경 되었습니다
				showComModal( { msg:'${mLang["pwdchangecompleted"]}',closeCallbackFnc:function(){ goLogin() } } );
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
			var form = document.querySelector( '#idForm' );
			if( form.querySelector( 'input[name="passwd"]' ).value.length < 6 ) {
				// 비밀번호는 6자리 이상을 입력해 주세요
				showComModal( {type:"warning",msg:'${mLang["chkpasswdlength"]}',closeCallbackFnc:function(){ document.querySelector( 'input[name="passwd"]' ).focus() }} );
				return false;
			} else if( form.querySelector( 'input[name="passwd"]' ).value != form.querySelector( '#passwdConfirm' ).value ) {
				// 비밀번호와 비밀번호 확인의<br/>내용이 다릅니다
				showComModal( {type:"warning",msg:'${mLang["differentfrompasswordwithconfirm_br"]}',closeCallbackFnc:function(){ document.querySelector( '#passwdConfirm' ).focus() }} );
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
			usrLang = '${usrLang}';
			
			// Set nation code to select tag
			<c:forEach var="name" items="${cmNatiCd}" varStatus="status">
			addNatiCd( '${name.natiCd}', '${name.natiNmKor}', '${name.natiNmEng}', 'natiCdDisplay' );
			</c:forEach>

			// select default nation code
			document.querySelector( 'select[name="natiCdDisplay"]' ).value = getNation( usrLang );
			
		});
	</script>
	
</body>

</html>