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
          <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-sign-in-alt"></i> ${mLang["login"]}</span>
        </h1>
      </div>
	
	<form id="idForm" action="./login.do" method="post">
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
        	<input type="text" class="form-control form-control-sm" name="usrId" value="<c:if test="${cookie.usrId != null}">${cookie.usrId.value}</c:if>" style="width:12em;" maxlength="20">
        </div>

		<div class="w-100"><hr/></div> <!-- horizontal line -->
        
        <div class="col-1 align-self-center text-right">
          <i class="fas fa-globe"></i>
        </div>
        <div class="col-4 text-left mt-2">
          <label><!--국가-->${mLang["nation"]}</label>
        </div>
        <div class="col form-inline text-center">
          <select class="form-control form-control-sm" name="natiCd" style="width:12em;"></select>
        </div>
        
        <div class="w-100"><hr/></div>  <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-lock"></i>
        </div>
        <div class="col-4 text-left mt-2">
          <label><!--비밀번호-->${mLang["passwd"]}</label>
        </div>
        <div class="col form-inline text-center">
          <input type="password" class="form-control form-control-sm" name="passwd" placeholder="Password" style="width:12em;">
        </div>

        <div class="w-100"><hr/></div>  <!-- horizontal line -->
        
        <div class="custom-control custom-checkbox w-100 ml-3">
		    <input type="checkbox" class="custom-control-input" name="rememberId" id="rememberId" value="Y" <c:if test="${cookie.usrId != null}">checked</c:if> />
		    <label class="custom-control-label" for="rememberId"><!--ID 기억하기-->${mLang["rememberid"]}</label>
		</div>
                
        <div class="w-100">&nbsp;</div>  <!-- horizontal blank -->

        <div class="col text-center">
        	<button type="button" class="btn btn-primary" onclick="onLogin();"><!--로그인-->${mLang["login"]} <i class="far fa-address-card"></i></button>
        	<button type="button" class="btn btn-dark" onclick="history.back();"><!--돌아가기-->${mLang["back"]} <i class="fas fa-undo-alt"></i></button>
        	<input type="hidden" name="usrTp"/>
        	<input type="hidden" name="usrNm"/>
        	<input type="hidden" name="marketAgreeYn"/>
        </div>
        
        <div class="w-100">&nbsp;</div> <!-- bottom space of border -->

      </div> <!-- end of border -->      
      
    </div>
    <input type="hidden" name="recaptchaToken"/>
    
    </form>
    



    <div class="w-100">&nbsp;</div> <!-- space -->
    
    <div class="container bg-primary">
        <h1>        
          <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-exchange-alt"></i> <!--비밀번호 변경-->${mLang["chngpasswd"]}</span>
        </h1>
      </div>

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
        	<input type="text" class="form-control form-control-sm" name="pwdUsrId" style="width:12em;" maxlength="20">
        </div>
        
        <div class="w-100"><hr/></div> <!-- horizontal line -->
        
        <div class="col-1 align-self-center text-right">
          <i class="fas fa-globe"></i>
        </div>
        <div class="col-4 text-left mt-2">
          <label><!--국가-->${mLang["nation"]}</label>
        </div>
        <div class="col form-inline text-center">
          <select class="form-control form-control-sm" name="natiCdPwChng" style="width:12em;"></select>
        </div>

        <div class="w-100"><hr/></div>  <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="far fa-envelope"></i>
        </div>                  
        <div class="col-4 text-left mt-2">
          <label><!--이메일 주소-->${mLang["email"]}</label>
        </div>
        <div class="col form-inline text-center">
          <input type="email" class="form-control form-control-sm" id="pwdEmail" aria-describedby="email address" placeholder="Enter email" style="width:12em;" maxlength="64">
        </div>
                
        <div class="w-100">&nbsp;</div>  <!-- horizontal blank -->

        <div class="col text-center">
        	<button type="button" class="btn btn-primary" onclick="onSendPwdChng();"><!--비밀번호 변경 메일 전송-->${mLang["sendchangepasswdemail"]} <i class="far fa-paper-plane"></i></button>        	
        </div>
        
        <div class="w-100">&nbsp;</div> <!-- bottom space of border -->

      </div> <!-- end of border -->      
      
      <hr class="mb-5"/>
    </div>
	
  </main>
  <!--Main layout-->

	<script>
		// Event load of document.
		window.addEventListener("load", function(evt) {
			var isComplete	= '${isComplete}';			// 처리 완료 여부
			var isError 	= '${isError}'; 			// 오류 발생
			var errMsg  	= '${errMsg}';				// 오류 메시지
			var cookieUsrId = '${cookie.usrId.value}';	// 쿠키에 저장된 사용자 아이디
			
			if( isError ) {
				showComModal( {type:"error", msg:errMsg,closeCallbackFnc:function(){ goMain(); }} );				
			} else {
				if( cookieUsrId.length > 0 ) {
					document.querySelector( 'input[name="passwd"]' ).focus();
				}
			}
		});
		
		// Event enter key to login.
		window.addEventListener("keyup", function(evt) {
			if( evt.keyCode == 13 ) {
				onLogin();
			}
		});

		// Event click login
		function onLogin() {
			var form = document.querySelector( '#idForm' );
			// 체크
			if( document.querySelector( 'input[name="usrId"]' ).value == "" ) {
				// 전화번호를 입력해 주세요
				showComModal( {type:"warning",msg:'${mLang["inputphonenumber"]}',closeCallbackFnc:function(){ document.querySelector( 'input[name="usrId"]' ).focus() }} );
				return false;
			} else if( isNaN( document.querySelector( 'input[name="usrId"]' ).value ) ) {
				// 전화번호는 숫자만 입력해 주세요
				showComModal( {type:"warning",msg:'${mLang["inputonlynumberinphone"]}',closeCallbackFnc:function(){ document.querySelector( 'input[name="usrId"]' ).focus() }} );
				return false;			
			} else if( form.querySelector( 'input[name="passwd"]' ).value.length < 6 ) {
				// 비밀번호는 6자리 이상을 입력해 주세요
				showComModal( {type:"warning",msg:'${mLang["chkpasswdlength"]}',closeCallbackFnc:function(){ document.querySelector( 'input[name="passwd"]' ).focus() }} );
				return false;
			}
			
			// Server validation을 위해 dummy 값 입력
			form.querySelector( 'input[name="usrTp"]' )			.value 	= "U";
			form.querySelector( 'input[name="usrNm"]' )			.value 	= "-";
			form.querySelector( 'input[name="marketAgreeYn"]' )	.value 	= "Y";

			grecaptcha.ready(function() {
		        grecaptcha.execute('${setting_api_recaptcha_site_key}', {action: 'submit'}).then(function(token) {
	    	        // Add your logic to submit to your backend server here.	    	        
	    	        document.querySelector( 'input[name="recaptchaToken"]' ).value = token;

					form.submit();
	          	});
	        });
		}

		// Send mail for change password.
		function onSendPwdChng() {
			// 체크
			var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			if( document.querySelector( 'input[name="pwdUsrId"]' ).value == "" ) {
				// 전화번호를 입력해 주세요
				showComModal( {type:"warning",msg:'${mLang["inputphonenumber"]}',closeCallbackFnc:function(){ document.querySelector( 'input[name="pwdUsrId"]' ).focus() }} );
				return false;
			} else if( isNaN( document.querySelector( 'input[name="pwdUsrId"]' ).value ) ) {
				// 전화번호는 숫자만 입력해 주세요
				showComModal( {type:"warning",msg:'${mLang["inputonlynumberinphone"]}',closeCallbackFnc:function(){ document.querySelector( 'input[name="pwdUsrId"]' ).focus() }} );
				return false;
			} else if( document.querySelector( '#pwdEmail' ).value == "" ) {
				// 이메일 주소를 입력해 주세요
				showComModal( {type:"warning",msg:'${mLang["inputemail"]}',closeCallbackFnc:function(){ document.querySelector( '#pwdEmail' ).focus() }} );
				return false;
			} else if( !regExpEmail.test( document.querySelector( '#pwdEmail' ).value ) ) {
				// 이메일 주소 형식을 확인해 주세요
				showComModal( {type:"warning",msg:'${mLang["chkemailformat"]}',closeCallbackFnc:function(){ document.querySelector( '#pwdEmail' ).focus() }} );
				return false;
			}
			
			grecaptcha.ready(function() {
		        grecaptcha.execute('${setting_api_recaptcha_site_key}', {action: 'submit'}).then(function(token) {
	    	        // Add your logic to submit to your backend server here.
					ajaxSend( "./sendMailForChngPwd.json"
							, {   //usrId  : document.querySelector( '#pwdUsrId' ).value
								  usrId  : document.querySelector( 'input[name="pwdUsrId"]' ).value
								, natiCd : document.querySelector( 'select[name="natiCdPwChng"]' ).value
								, email  : document.querySelector( '#pwdEmail' ).value
								, recaptchaToken : token
							  }
							, sendMailForChngPwd );
	          	});
	        });
		}

		// Call after call of sendMailForChngPwd ajax communication.
		function sendMailForChngPwd( responseText ) {
			if( responseText == "SEND OK" ) {
				// 비밀번호 변경 이메일을 전송하였습니다
				showComModal( {msg:'${mLang["sendemailtochangepasswd"]}'} );
			} else {
				// 계정 정보가 올바르지 않습니다
				showComModal( {type:"warning",msg:'${mLang["contr_wrongaccount"]}'} );
			}
		}
	</script>

	<!-- // API				: https://developers.google.com/recaptcha/docs/v3
		 // Admin console	: https://www.google.com/recaptcha/admin/site/350750346
	-->
	<script defer src="https://www.google.com/recaptcha/api.js?render=${setting_api_recaptcha_site_key}"></script>
	
<jsp:include page="comFooter.jsp"/>
<jsp:include page="footer.jsp"/>

	<script language="javascript">
		// Event load of document
	  	window.addEventListener("load", function(evt) {
			usrLang = '${usrLang}';

			// Set nation code to select tag
			<c:forEach var="name" items="${cmNatiCd}" varStatus="status">
			addNatiCd( '${name.natiCd}', '${name.natiNmKor}', '${name.natiNmEng}' );
			</c:forEach>
			
			<c:forEach var="name" items="${cmNatiCd}" varStatus="status">
			addNatiCd( '${name.natiCd}', '${name.natiNmKor}', '${name.natiNmEng}', 'natiCdPwChng' );
			</c:forEach>

			// select default nation code
			document.querySelector( 'select[name="natiCd"]' ).value = getNation( usrLang );
			document.querySelector( 'select[name="natiCdPwChng"]' ).value = getNation( usrLang );
		});
	</script>
	
</body>

</html>