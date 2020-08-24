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
          <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-exchange-alt"></i> <!--정보 변경-->${mLang["nav_modinfo"]}</span>
        </h1>
      </div>
	
	<form id="idForm" action="./modStorInfo.do" method="post">
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
        	<input type="text" class="form-control form-control-sm text-center" style="width:12em;" disabled="disabled" value="${sessionScope.cmUsr.usrId}">
        	<input type="hidden" name="usrId" value="${sessionScope.cmUsr.usrId}"/>
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
          <input type="hidden" name="natiCd" value="${sessionScope.cmUsr.natiCd}"/>
        </div>
        
        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center mb-2 text-right">
          <i class="fas fa-user-tag"></i>
        </div>                  
        <div class="col-4 text-left my-auto">
          <label><!--가입자 성함-->${mLang["username"]}<font class="small"><br/>( <!--또는 예명-->${mLang["oraliasname"]} )</font>
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
          <label><!--이메일 주소-->${mLang["email"]}</label>
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
            <label><!--마케팅 동의-->${mLang["marketingagree"]}</label>
        </div>
        <div class="col align-self-center pl-3">
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="marketAgreeYn" id="marketAgreeYnRadio1" value="Y"<c:if test="${sessionScope.cmUsr.marketAgreeYn == 'Y'}"> checked</c:if>>
            <label class="form-check-label" for="marketAgreeYnRadio1"><!--동의-->${mLang["agree"]}</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="marketAgreeYn" id="marketAgreeYnRadio2" value="N"<c:if test="${sessionScope.cmUsr.marketAgreeYn != 'Y'}"> checked</c:if>>
            <label class="form-check-label" for="marketAgreeYnRadio2"><!--받지 않음-->${mLang["denyreceive"]}</label>
          </div>
        </div>
        
        <div class="w-100"><hr/></div>  <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-lock"></i>
        </div>                  
        <div class="col-4 text-left mt-2">
          <label><!--변경 비밀번호-->${mLang["passwdtochange"]}<br/>(<!--변경시에만 입력-->${mLang["inputonlytochange"]})</label>
        </div>
        <div class="col form-inline text-center">
          <input type="password" class="form-control form-control-sm" name="chngPasswd" placeholder="Password" style="width:12em;">
        </div>

        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center mb-2 text-right">
          <i class="fas fa-key"></i>
        </div>                  
        <div class="col-4 text-left my-auto">
          <label><!--변경 비밀번호<br/>확인-->${mLang["passwdtochangeconfirm_br"]}</label>
        </div>
        <div class="col form-inline text-center">
          <input type="password" class="form-control form-control-sm" id="chngPasswdConfirm" placeholder="Password" style="width:12em;" maxlength="20">
        </div>
                
        <div id="divStorNmHr" class="w-100"><hr/></div> <!-- horizontal line -->

        <div id="divStorNmIcon" class="col-1 align-self-center text-right">
          <i class="fas fa-sign"></i>
        </div>                  
        <div id="divStorNmLb" class="col-4 text-left mt-2">
            <label><!--상호-->${mLang["storename"]}</label>
        </div>
        <div id="divStorNmForm" class="col form-inline text-center">
          <input type="text" class="form-control form-control-sm" name="storNm" aria-describedby="stor name" style="width:12em;" maxlength="32" value="${sessionScope.cmStor.storNm}">
        </div>
        
        <div id="divStorTelNoHr" class="w-100"><hr/></div> <!-- horizontal line -->

        <div id="divStorTelNoIcon" class="col-1 align-self-center text-right">
          <i class="fas fa-phone-square"></i>
        </div>                  
        <div id="divStorTelNoLb" class="col-4 text-left mt-2">
          <label><!--연락처-->${mLang["contactnumber"]}</label>
        </div>
        <div id="divStorTelNoForm" class="col form-inline text-center">
        	<input type="text" class="form-control form-control-sm" name="telNo" style="width:12em;" maxlength="20" value="${sessionScope.cmStor.telNo}">
        </div>

        <div id="divStorAddrHr" class="w-100"><hr/></div> <!-- horizontal line -->

        <div id="divStorAddrIcon" class="col-1 align-self-center text-right">
          <i class="fas fa-map-marked-alt"></i>
        </div>
        <div id="divStorAddrLb" class="col-4 text-left mt-2">
            <label><!--주소-->${mLang["address"]}</label>
        </div>
        <div id="divStorAddrForm" class="col form-inline text-center">
          	<input type="text" class="form-control form-control-sm" id="addrPt1" name="addrPt1" aria-describedby="address" style="width:12em;" maxlength="85" value="${sessionScope.cmStor.addrPt1}">
          	<div class="w-100" style="height:1px;">&nbsp;</div> <!-- space br -->
          	<div onclick="popAddress();"><!--위도-->${mLang["latitude"]}</div><input type="text" class="form-control form-control-sm" id="mapLat" name="mapLat" style="width: 3.5em;" value="${sessionScope.cmStor.mapLat}"/>          	       
          	<div onclick="popAddress();"><!--경도-->${mLang["longitude"]}</div><input type="text" class="form-control form-control-sm" id="mapLng" name="mapLng" style="width: 3.5em;" value="${sessionScope.cmStor.mapLng}"/>
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
        
        <div class="w-100">&nbsp;</div>  <!-- horizontal blank -->

        <div class="col text-center">
        	<button type="button" class="btn btn-primary" onclick="onSubmit();"><!--적용하기-->${mLang["apply"]} <i class="fas fa-clipboard-check"></i></button>
        	<button type="button" class="btn btn-dark" onclick="history.back();"><!--돌아가기-->${mLang["back"]} <i class="fas fa-undo-alt"></i></button>
        </div>
        
        <div class="w-100">&nbsp;</div> <!-- bottom space of border -->

      </div> <!-- end of border -->      
      
    </div>
    <input type="hidden" name="recaptchaToken"/>
    <input type="hidden" name="usrTp" value="U"/>
    <input type="hidden" name="savTp" value="${sessionScope.cmStor.savTp}"/>
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
				showComModal( {msg:'${mLang["infochangecompleted"]}',closeCallbackFnc:function(){ goMain(); } } );	// 정보가 변경되었습니다
				
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
				// 비밀번호는 6자리 이상을 입력해 주세요
				showComModal( {type:"warning",msg:'${mLang["chkpasswdlength"]}',closeCallbackFnc:function(){ document.querySelector( 'input[name="passwd"]' ).focus() }} );
				return false;
			} else if( chkNull( form.querySelector( 'input[name="chngPasswd"]' ).value ) && form.querySelector( 'input[name="chngPasswd"]' ).value.length < 6 ) {
				// 변경할 비밀번호는 6자리 이상을 입력해 주세요
				showComModal( {type:"warning",msg:'${mLang["inputchangepasswdlengthatleast6letter"]}',closeCallbackFnc:function(){ document.querySelector( '#chngPasswd' ).focus() }} );
				return false;
			} else if( chkNull( form.querySelector( 'input[name="chngPasswd"]' ).value ) && ( form.querySelector( 'input[name="chngPasswd"]' ).value != form.querySelector( '#chngPasswdConfirm' ).value ) ) {
				// 비밀번호가 동일하지 않습니다
				showComModal( {type:"warning",msg:'${mLang["passwordnotsame"]}',closeCallbackFnc:function(){ document.querySelector( '#chngPasswdConfirm' ).focus() }} );
				return false;
			} else if( form.querySelector( 'input[name="usrNm"]' ).value == "" ) {
				// 성함을 입력해 주세요
				showComModal( {type:"warning",msg:'${mLang["inputusername"]}',closeCallbackFnc:function(){ document.querySelector( 'input[name="usrNm"]' ).focus() }} );
				return false;
			} else if( form.querySelector( 'input[name="email"]' ).value == "" ) {
				// 이메일 주소를 입력해 주세요
				showComModal( {type:"warning",msg:'${mLang["inputemail"]}',closeCallbackFnc:function(){ document.querySelector( 'input[name="email"]' ).focus() }} );
				return false;
			} else if( !regExpEmail.test( form.querySelector( 'input[name="email"]' ).value ) ) {
				// 이메일 주소 형식을 확인해 주세요
				showComModal( {type:"warning",msg:'${mLang["chkemailformat"]}',closeCallbackFnc:function(){ document.querySelector( 'input[name="email"]' ).focus() }} );
				return false;
			} else if( document.querySelector( 'input[name="telNo"]' ).value != "" && isNaN( document.querySelector( 'input[name="telNo"]' ).value ) ) {
				// 연락처는 숫자만 입력해 주세요
				showComModal( {msg:'${mLang["inputonlynumbercontact"]}',closeCallbackFnc:function(){ document.querySelector( 'input[name="telNo"]' ).focus() }} );
				return false;
			} else if( !chkNull( document.querySelector( "#addrPt1" ) ) ) {
				// 주소를 입력해 주세요
				showComModal( {msg:'${mLang["inputaddress"]}'} );
				return false;
			} else if( isNaN( document.querySelector( "#mapLat" ).value ) ) {
				// 위도는 숫자만 입력해 주세요
				showComModal( {msg:'${mLang["inputonlynumberlatitude"]}',closeCallbackFnc:function(){ document.querySelector( '#mapLat' ).focus(); }} );
				return false;
			} else if( isNaN( document.querySelector( "#mapLng" ).value ) ) {
				// 경도는 숫자만 입력해 주세요
				showComModal( {msg:'${mLang["inputonlynumberlongitude"]}',closeCallbackFnc:function(){ document.querySelector( '#mapLng' ).focus(); }} );
				return false;
			} 
			
			grecaptcha.execute('${setting_api_recaptcha_site_key}', {action: 'submit'}).then(function(token) {
    	        // Add your logic to submit to your backend server here.
    	        document.querySelector( 'input[name="recaptchaToken"]' ).value = token;
				form.submit();
          	});
		}

		function popAddress(){
			// 주소 검색 후 지도를 꾸욱 클릭하여<br/>위도와 경도를 메모해 주세요<br/>예) 위도 = 37.12345 / 경도 = 126.12345
			showComModal( {type:"info",msg:'${mLang["chklatandlongonmap_br"]}'
				,closeCallbackFnc:function(){ window.open("https://www.google.co.kr/maps","pop","scrollbars=yes, resizable=yes"); }
			} );
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