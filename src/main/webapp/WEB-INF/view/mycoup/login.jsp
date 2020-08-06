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
          <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-sign-in-alt"></i> 로그인</span>
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
          <label>전화번호(ID)</label>
        </div>
        <div class="col form-inline text-center">
        	<%-- 
        	<c:set var = "usrId"         value = "${cookie.usrId.value}"/>
        	<c:set var = "usrIdLength"   value = "${fn:length(cookie.usrId.value)}"/>
        	<c:set var = "usrIdStarts01" value = "${fn:substring(usrId,0,2)}"/>
	        <input type="text" class="form-control form-control-sm" id="phone1" style="width:3em;" maxlength="3" value="<c:if test="${cookie.usrId != null}">${fn:substring(usrId,0,3) }</c:if>">
	        <label class="mt-2" style="width:0.8em;">-</label>
	        <input type="text" class="form-control form-control-sm" id="phone2" style="width:3.5em;" maxlength="4" 
	        	value="<c:if test="${cookie.usrId != null and usrIdLength == 9}">${fn:substring(usrId, usrIdLength-7, usrIdLength-4 ) }</c:if><c:if test="${cookie.usrId != null and usrIdLength == 11}">${fn:substring(usrId, usrIdLength-8, usrIdLength-4 ) }</c:if><c:if test="${cookie.usrId != null and usrIdLength == 10 and usrIdStarts01 == '01'}">${fn:substring(usrId, usrIdLength-7, usrIdLength-4 ) }</c:if><c:if test="${cookie.usrId != null and usrIdLength == 10 and usrIdStarts01 != '01'}">${fn:substring(usrId, usrIdLength-8, usrIdLength-4 ) }</c:if>"/>
	        <label class="mt-2" style="width:0.8em;">-</label>
	        <input type="text" class="form-control form-control-sm" id="phone3" style="width:3.5em;" maxlength="4" value="<c:if test="${cookie.usrId != null}">${fn:substring(usrId, usrIdLength-4, usrIdLength ) }</c:if>">
	        <input type="hidden" name="usrId"/>
        	--%>
        	<input type="text" class="form-control form-control-sm" name="usrId" value="<c:if test="${cookie.usrId != null}">${cookie.usrId.value}</c:if>" style="width:12em;" maxlength="20">
        </div>

		<div class="w-100"><hr/></div> <!-- horizontal line -->
        
        <div class="col-1 align-self-center text-right">
          <i class="fas fa-globe"></i>
        </div>
        <div class="col-4 text-left mt-2">
          <label>국가</label>
        </div>
        <div class="col form-inline text-center">
          <select class="form-control form-control-sm" name="natiCd" style="width:12em;"></select>
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

        <div class="w-100"><hr/></div>  <!-- horizontal line -->
        
        <div class="custom-control custom-checkbox w-100 ml-3">
		    <input type="checkbox" class="custom-control-input" name="rememberId" id="rememberId" value="Y" <c:if test="${cookie.usrId != null}">checked</c:if> />
		    <label class="custom-control-label" for="rememberId">ID 기억하기</label>
		</div>
                
        <div class="w-100">&nbsp;</div>  <!-- horizontal blank -->

        <div class="col text-center">
        	<button type="button" class="btn btn-primary" onclick="onLogin();">로그인 <i class="far fa-address-card"></i></button>
        	<button type="button" class="btn btn-dark" onclick="history.back();">돌아가기 <i class="fas fa-undo-alt"></i></button>
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
          <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-exchange-alt"></i> 비밀번호 변경</span>
        </h1>
      </div>

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
        	<!--  
        	<input type="text" class="form-control form-control-sm" id="pwdPhone1" style="width:3em;" maxlength="3" />
	        <label class="mt-2" style="width:0.8em;">-</label>
	        <input type="text" class="form-control form-control-sm" id="pwdPhone2" style="width:3.5em;" maxlength="4" />
	        <label class="mt-2" style="width:0.8em;">-</label>
	        <input type="text" class="form-control form-control-sm" id="pwdPhone3" style="width:3.5em;" maxlength="4" />
	        <input type="hidden" id="pwdUsrId"/>
        	-->
        	<input type="text" class="form-control form-control-sm" name="pwdUsrId" style="width:12em;" maxlength="20">
        </div>
        
        <div class="w-100"><hr/></div> <!-- horizontal line -->
        
        <div class="col-1 align-self-center text-right">
          <i class="fas fa-globe"></i>
        </div>
        <div class="col-4 text-left mt-2">
          <label>국가</label>
        </div>
        <div class="col form-inline text-center">
          <select class="form-control form-control-sm" name="natiCdPwChng" style="width:12em;"></select>
        </div>

        <div class="w-100"><hr/></div>  <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="far fa-envelope"></i>
        </div>                  
        <div class="col-4 text-left mt-2">
          <label>이메일 주소</label>
        </div>
        <div class="col form-inline text-center">
          <input type="email" class="form-control form-control-sm" id="pwdEmail" aria-describedby="email address" placeholder="Enter email" style="width:12em;" maxlength="64">
        </div>
                
        <div class="w-100">&nbsp;</div>  <!-- horizontal blank -->

        <div class="col text-center">
        	<button type="button" class="btn btn-primary" onclick="onSendPwdChng();">비밀번호 변경 메일 전송 <i class="far fa-paper-plane"></i></button>        	
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
				showComModal( {type:"error", msg:errMsg} );
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

		/*
		// Event of move phone focus
	  	document.querySelector( '#phone1' ).addEventListener("keyup", function(evt) {
			if( document.querySelector( '#phone1' ).value.length == 3 ) {
				document.querySelector( '#phone2' ).focus();
			}
		});
	  	document.querySelector( '#phone2' ).addEventListener("keyup", function(evt) {
			if( document.querySelector( '#phone2' ).value.length == 4 ) {
				document.querySelector( '#phone3' ).focus();
			}
		});
		
	  	document.querySelector( '#pwdPhone1' ).addEventListener("keyup", function(evt) {
			if( document.querySelector( '#pwdPhone1' ).value.length == 3 ) {
				document.querySelector( '#pwdPhone2' ).focus();
			}
		});
	  	document.querySelector( '#pwdPhone2' ).addEventListener("keyup", function(evt) {
			if( document.querySelector( '#pwdPhone2' ).value.length == 4 ) {
				document.querySelector( '#pwdPhone3' ).focus();
			}
		});
	  	*/

		// Event click login
		function onLogin() {
			var form = document.querySelector( '#idForm' );
			// 체크			
			/*
			if( 	   document.querySelector( '#phone1' ).value == "" ) {
				showComModal( {type:"warning",msg:"전화번호를 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#phone1' ).focus() }} );
				return false;
			} else if( document.querySelector( '#phone2' ).value == "" ) {
				showComModal( {type:"warning",msg:"전화번호를 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#phone2' ).focus() }} );
				return false;
			} else if( document.querySelector( '#phone3' ).value == "" ) {
				showComModal( {type:"warning",msg:"전화번호를 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#phone3' ).focus() }} );
				return false;
			} else if( isNaN( document.querySelector( "#phone1" ).value ) ) {
				showComModal( {type:"warning",msg:"전화번호는 숫자만 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#phone1' ).focus() }} );
				return false;
			} else if( isNaN( document.querySelector( "#phone2" ).value ) ) {
				showComModal( {type:"warning",msg:"전화번호는 숫자만 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#phone2' ).focus() }} );
				return false;
			} else if( isNaN( document.querySelector( "#phone3" ).value ) ) {
				showComModal( {type:"warning",msg:"전화번호는 숫자만 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#phone3' ).focus() }} );
				return false;
			} else if( document.querySelector( '#phone1' ).value.length < 2 || document.querySelector( '#phone2' ).value.length < 3 || document.querySelector( '#phone3' ).value.length < 4 ) {
				showComModal( {type:"warning",msg:"전화번호 형식이 아닙니다",closeCallbackFnc:function(){ document.querySelector( '#phone1' ).focus() }} );
				return false;
			*/
			if( document.querySelector( 'input[name="usrId"]' ).value == "" ) {
				showComModal( {type:"warning",msg:"전화번호를 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( 'input[name="usrId"]' ).focus() }} );
				return false;
			} else if( isNaN( document.querySelector( 'input[name="usrId"]' ).value ) ) {
				showComModal( {type:"warning",msg:"전화번호는 숫자만 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( 'input[name="usrId"]' ).focus() }} );
				return false;			
			} else if( form.querySelector( 'input[name="passwd"]' ).value.length < 6 ) {
				showComModal( {type:"warning",msg:"비밀번호는 6자리 이상을 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( 'input[name="passwd"]' ).focus() }} );
				return false;
			}
			
			// 전화번호(아이디) 설정
			//form.querySelector( 'input[name="usrId"]' ).value = document.querySelector( '#phone1' ).value + document.querySelector( '#phone2' ).value + document.querySelector( '#phone3' ).value;

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
			
			/*
			if( 	   document.querySelector( '#pwdPhone1' ).value == "" ) {
				showComModal( {type:"warning",msg:"전화번호를 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#pwdPhone1' ).focus() }} );
				return false;
			} else if( document.querySelector( '#pwdPhone2' ).value == "" ) {
				showComModal( {type:"warning",msg:"전화번호를 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#pwdPhone2' ).focus() }} );
				return false;
			} else if( document.querySelector( '#pwdPhone3' ).value == "" ) {
				showComModal( {type:"warning",msg:"전화번호를 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#pwdPhone3' ).focus() }} );
				return false;
			} else if( isNaN( document.querySelector( "#pwdPhone1" ).value ) ) {
				showComModal( {type:"warning",msg:"전화번호는 숫자만 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#pwdPhone1' ).focus() }} );
				return false;
			} else if( isNaN( document.querySelector( "#pwdPhone2" ).value ) ) {
				showComModal( {type:"warning",msg:"전화번호는 숫자만 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#pwdPhone2' ).focus() }} );
				return false;
			} else if( isNaN( document.querySelector( "#pwdPhone3" ).value ) ) {
				showComModal( {type:"warning",msg:"전화번호는 숫자만 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#pwdPhone3' ).focus() }} );
				return false;
			} else if( document.querySelector( '#pwdPhone1' ).value.length < 2 || document.querySelector( '#pwdPhone2' ).value.length < 3 || document.querySelector( '#pwdPhone3' ).value.length < 4 ) {
				showComModal( {type:"warning",msg:"전화번호 형식이 아닙니다",closeCallbackFnc:function(){ document.querySelector( '#pwdPhone1' ).focus() }} );
				return false;
			*/
			if( document.querySelector( 'input[name="pwdUsrId"]' ).value == "" ) {
				showComModal( {type:"warning",msg:"전화번호를 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( 'input[name="pwdUsrId"]' ).focus() }} );
				return false;
			} else if( isNaN( document.querySelector( 'input[name="pwdUsrId"]' ).value ) ) {
				showComModal( {type:"warning",msg:"전화번호는 숫자만 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( 'input[name="pwdUsrId"]' ).focus() }} );
				return false;
			} else if( document.querySelector( '#pwdEmail' ).value == "" ) {
				showComModal( {type:"warning",msg:"이메일 주소를 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#pwdEmail' ).focus() }} );
				return false;
			} else if( !regExpEmail.test( document.querySelector( '#pwdEmail' ).value ) ) {
				showComModal( {type:"warning",msg:"이메일 주소 형식을 확인해 주세요",closeCallbackFnc:function(){ document.querySelector( '#pwdEmail' ).focus() }} );
				return false;
			}
			
			// 전화번호(아이디) 설정
			//document.querySelector( '#pwdUsrId' ).value = document.querySelector( '#pwdPhone1' ).value + document.querySelector( '#pwdPhone2' ).value + document.querySelector( '#pwdPhone3' ).value;

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
				showComModal( {msg:"비밀번호 변경 이메일을 전송하였습니다."} );
			} else {
				showComModal( {type:"warning",msg:"계정 정보가 올바르지 않습니다."} );
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
			// Set nation code to select tag
			<c:forEach var="name" items="${cmNatiCd}" varStatus="status">
			addNatiCd( '${name.natiCd}', '${name.natiNmKor}', '${name.natiNmEng}' );
			</c:forEach>
			
			<c:forEach var="name" items="${cmNatiCd}" varStatus="status">
			addNatiCd( '${name.natiCd}', '${name.natiNmKor}', '${name.natiNmEng}', 'natiCdPwChng' );
			</c:forEach>

			// select default nation code
			if( usrLang ) {
				document.querySelector( 'select[name="natiCd"]' ).value = getNation( usrLang );
				document.querySelector( 'select[name="natiCdPwChng"]' ).value = getNation( usrLang );
			}
			
		});
	</script>
	
</body>

</html>