<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="header.jsp"/>
<jsp:include page="comHeader.jsp"/>
<body>

  <jsp:include page="navigator.jsp"/>

  <form id="idForm" action="./joinMember.do" method="post">
  <!--Main layout-->
  <main>

    <!-- 상단 구분 줄 -->
    <hr class="mt-5"/>

    <div class="container bg-primary">
      <h1>        
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-user-friends"></i> 회원가입</span>
      </h1>
    </div>
	
    <div class="container">
      <div class="row wow fadeIn border border-dark justify-content-center">

        <div class="w-100">&nbsp;</div> <!-- top space of regist border -->
        
        <div class="col-1 align-self-center text-right">
          <i class="fas fa-users-cog"></i>
        </div>                  
        <div class="col-4 text-left mt-2">
            <label>회원 구분</label>
        </div>
        <div class="col form-inline text-center">
          <select class="form-control form-control-sm" name="usrTp" style="width:12em;" onchange="switchUsr();">
            <option value="U" selected>사용자</option>
            <option value="S" >경영주</option>
          </select>
        </div>
        
        <div class="w-100"><hr/></div> <!-- horizontal line -->
        
        <div class="col-1 align-self-center text-right">
          <i class="fas fa-mobile-alt"></i>
        </div>
        <div class="col-4 text-left mt-2">
          <label>전화번호(ID)</label>
        </div>
        <div class="col form-inline text-center">
          <input type="text" class="form-control form-control-sm" name="usrId" style="width:12em;" maxlength="20">
          <!--  
          <input type="text" class="form-control form-control-sm" id="phone1" style="width:3em;" maxlength="3">
          <label class="mt-2" style="width:0.8em;">-</label>
          <input type="text" class="form-control form-control-sm" id="phone2" style="width:3.5em;" maxlength="4">
          <label class="mt-2" style="width:0.8em;">-</label>
          <input type="text" class="form-control form-control-sm" id="phone3" style="width:3.5em;" maxlength="4">
          <input type="hidden" name="usrId"/>
          -->
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
        
        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center mb-2 text-right">
            <i class="fas fa-lock"></i>
        </div>                  
        <div class="col-4 text-left my-auto">
          <label>비밀번호</label>
        </div>
        <div class="col form-inline text-center">
          <input type="password" class="form-control form-control-sm" name="passwd" placeholder="Password" style="width:12em;" maxlength="20">
          <label for="password" class="font-italic small">※ 관리자도 해독 불가</label>
        </div>

        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center mb-2 text-right">
          <i class="fas fa-key"></i>
        </div>                  
        <div class="col-4 text-left my-auto">
          <label>비밀번호<br/>확인</label>
        </div>
        <div class="col form-inline text-center">
          <input type="password" class="form-control form-control-sm" id="passwdConfirm" placeholder="Password" style="width:12em;" maxlength="20">
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
          <input type="text" class="form-control form-control-sm" name="usrNm" aria-describedby="input name" placeholder="No named" style="width:12em;" maxlength="30">
        </div>

        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="far fa-envelope"></i>
        </div>                  
        <div class="col-4 text-left mt-2">
          <label>이메일 주소</label>
        </div>
        <div class="col form-inline text-center">
          <input type="email" class="form-control form-control-sm" name="email" aria-describedby="email address" placeholder="Enter email" style="width:12em;" maxlength="64">
        </div>

        <div id="divStorNmHr" class="w-100"><hr/></div> <!-- horizontal line -->

        <div id="divStorNmIcon" class="col-1 align-self-center text-right">
          <i class="fas fa-sign"></i>
        </div>                  
        <div id="divStorNmLb" class="col-4 text-left mt-2">
            <label>상호</label>
        </div>
        <div id="divStorNmForm" class="col form-inline text-center">
          <input type="text" class="form-control form-control-sm" name="storNm" aria-describedby="stor name" placeholder="상호" style="width:12em;" maxlength="32">
        </div>
        
        <div id="divStorSavTpHr" class="w-100"><hr/></div> <!-- horizontal line -->
        
        <div id="divStorSavTpIcon" class="col-1 align-self-center text-right">
          <i class="fas fa-filter"></i>
        </div>                  
        <div id="divStorSavTpLb" class="col-4 text-left mt-2">
          <label>적립 구분</label>
        </div>
        <div id="divStorSavTpForm" class="col form-inline text-center">
          <select class="form-control form-control-sm" name="savTp" style="width:12em;">
            <option value="C" selected>쿠폰</option>
            <option value="P" >포인트</option>
          </select>
        </div>
        
        <div id="divStorTelNoHr" class="w-100"><hr/></div> <!-- horizontal line -->

        <div id="divStorTelNoIcon" class="col-1 align-self-center text-right">
          <i class="fas fa-phone-square"></i>
        </div>                  
        <div id="divStorTelNoLb" class="col-4 text-left mt-2">
          <label>연락처</label>
        </div>
        <div id="divStorTelNoForm" class="col form-inline text-center">
        	<input type="text" class="form-control form-control-sm" name="telNo" style="width:12em;" maxlength="20">
        	<!--  
          	<input type="text" class="form-control form-control-sm" id="telNo1" style="width:3em;" maxlength="3">
          	<label class="mt-2" style="width:0.8em;">-</label>
          	<input type="text" class="form-control form-control-sm" id="telNo2" style="width:3.5em;" maxlength="4">
          	<label class="mt-2" style="width:0.8em;">-</label>
          	<input type="text" class="form-control form-control-sm" id="telNo3" style="width:3.5em;" maxlength="4">
          	<input type="hidden" name="telNo"/>
        	-->
        </div>

        <div id="divStorAddrHr" class="w-100"><hr/></div> <!-- horizontal line -->

        <div id="divStorAddrIcon" class="col-1 align-self-center text-right">
          <i class="fas fa-map-marked-alt"></i>
        </div>
        <div id="divStorAddrLb" class="col-4 text-left mt-2">
            <label>주소</label>
        </div>
        <div id="divStorAddrForm" class="col form-inline text-center">
          	<input type="text" class="form-control form-control-sm" id="addrPt1" name="addrPt1" aria-describedby="address" placeholder="주소" style="width:12em;" maxlength="85">
          	<div class="w-100" style="height:1px;">&nbsp;</div> <!-- space br -->
          	<div onclick="popAddress();">위도</div><input type="text" class="form-control form-control-sm" id="mapLat" name="mapLat" style="width: 3.5em;"/>          	       
          	<div onclick="popAddress();">경도</div><input type="text" class="form-control form-control-sm" id="mapLng" name="mapLng" style="width: 3.5em;"/>
        	<!-- 
          	<input type="text" class="form-control form-control-sm" id="address" name="address" aria-describedby="address" placeholder="주소" style="width:12em;" onclick="popAddress();" readonly>
          	<input type="hidden" id="roadAddrPart1" 	name="addrPt1"	/>
          	<input type="hidden" id="roadAddrPart2" 	name="addrPt2"	/>
          	<input type="hidden" id="addrDetail" 		name="addrDtl"	/>
          	<input type="hidden" id="zipNo" 			name="zipNo"	/>          
          	<input type="hidden" id="mapLat" 			name="mapLat"	/>          
          	<input type="hidden" id="mapLng" 			name="mapLng"	/>          
        	 -->
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
            <input class="form-check-input" type="radio" name="marketAgreeYn" id="marketAgreeYnRadio1" value="Y" checked>
            <label class="form-check-label" for="marketAgreeYnRadio1">동의</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="marketAgreeYn" id="marketAgreeYnRadio2" value="N">
            <label class="form-check-label" for="marketAgreeYnRadio2">받지 않음</label>
          </div>
        </div>
        
        <div class="w-100"><hr/></div>  <!-- horizontal line -->

        <div class="col text-center">
          <button type="button" class="btn btn-primary" onclick="onJoin();">가입 <i class="far fa-address-card"></i></button>
          <button type="button" class="btn btn-dark" onclick="history.back();">돌아가기 <i class="fas fa-undo-alt"></i></button>
        </div>

        <div class="w-100">&nbsp;</div> <!-- bottom space of regist border -->
          
      </div> <!-- end of border -->
    </div> <!-- end of container -->

  </main>
  
  <input type="hidden" name="recaptchaToken"/>
  </form>
  <!--Main layout-->

  <!-- 주소API 연동 -->
  <script language="javascript">
  	// Event load of document
  	window.addEventListener("load", function(evt) {
		switchUsr();	// 사용자 구분에 따른 항목 보임/숨김 처리
		
		var isComplete	= '${isComplete}';	// 처리 완료
		var isError 	= '${isError}'; 	// 오류 발생
		var errMsg  	= '${errMsg}';		// 오류 메시지
		
		if( isError ) {
			showComModal( {type:"error", msg:errMsg} );
		} else if ( isComplete ) {
			showComModal( {msg:"가입을 축하드립니다",closeCallbackFnc:function(){ location.href = "./login.do" } } );
			
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
	
	// Event of move telNo focus
  	document.querySelector( '#telNo1' ).addEventListener("keyup", function(evt) {
		if( document.querySelector( '#telNo1' ).value.length == 3 ) {
			document.querySelector( '#telNo2' ).focus();
		}
	});
  	document.querySelector( '#telNo2' ).addEventListener("keyup", function(evt) {
		if( document.querySelector( '#telNo2' ).value.length == 4 ) {
			document.querySelector( '#telNo3' ).focus();
		}
	});
	*/
	
  	
	function onJoin() {
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
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
		} else if( document.querySelector( '#passwdConfirm' ).value != form.querySelector( 'input[name="passwd"]' ).value ) {
			showComModal( {type:"warning",msg:"비밀번호와 비밀번호 확인의<br/>내용이 다릅니다",closeCallbackFnc:function(){ document.querySelector( '#passwdConfirm' ).focus() }} );
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
		
		// 경영주 Validation 및 설정
		if( form.querySelector( 'select[name="usrTp"]' ).value == "S" ) {
			if( form.querySelector( 'input[name="storNm"]' ).value == "" ) {
				showComModal( {msg:"상호를 입력 해 주세요",closeCallbackFnc:function(){ document.querySelector( 'input[name="storNm"]' ).focus() }} );
				return false;
			/*
			} else if( ( document.querySelector( "#telNo1" ).value != "" || document.querySelector( "#telNo2" ).value != "" || document.querySelector( "#telNo3" ).value != "" )
					   && document.querySelector( "#telNo1" ).value == "") {
				showComModal( {msg:"연락처를 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#telNo1' ).focus() }} );
				return false;
			} else if( ( document.querySelector( "#telNo1" ).value != "" || document.querySelector( "#telNo2" ).value != "" || document.querySelector( "#telNo3" ).value != "" )
					   && document.querySelector( "#telNo2" ).value == "") {
				showComModal( {msg:"연락처를 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#telNo2' ).focus() }} );
				return false;
			} else if( ( document.querySelector( "#telNo1" ).value != "" || document.querySelector( "#telNo2" ).value != "" || document.querySelector( "#telNo3" ).value != "" )
					   && document.querySelector( "#telNo3" ).value == "") {
				showComModal( {msg:"연락처를 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#telNo3' ).focus() }} );
				return false;
			} else if( document.querySelector( "#telNo1" ).value != null && isNaN( document.querySelector( "#telNo1" ).value ) ) {
				showComModal( {msg:"연락처는 숫자만 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#telNo1' ).focus() }} );
				return false;
			} else if( document.querySelector( "#telNo1" ).value != null && isNaN( document.querySelector( "#telNo1" ).value ) ) {
				showComModal( {msg:"연락처는 숫자만 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#telNo1' ).focus() }} );
				return false;
			} else if( document.querySelector( "#telNo1" ).value != null && isNaN( document.querySelector( "#telNo1" ).value ) ) {
				showComModal( {msg:"연락처는 숫자만 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#telNo1' ).focus() }} );
				return false;
			*/
			} else if( document.querySelector( 'input[name="telNo"]' ).value != "" && isNaN( document.querySelector( 'input[name="telNo"]' ).value ) ) {
				showComModal( {msg:"연락처는 숫자만 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( 'input[name="telNo"]' ).focus() }} );
				return false;
			//} else if( !chkNull( document.querySelector( "#address" ) ) ) {
			} else if( !chkNull( document.querySelector( "#addrPt1" ) ) ) {
				showComModal( {msg:"주소를 입력해 주세요"} );
				return false;
			} else if( isNaN( document.querySelector( "#mapLat" ).value ) ) {
				showComModal( {msg:"위도는 숫자만 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#mapLat' ).focus(); }} );
				return false;
			} else if( isNaN( document.querySelector( "#mapLng" ).value ) ) {
				showComModal( {msg:"경도는 숫자만 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#mapLng' ).focus(); }} );
				return false;
			} 
			
			//form.querySelector( 'input[name="telNo"]' ).value = document.querySelector( '#telNo1' ).value + document.querySelector( '#telNo2' ).value + document.querySelector( '#telNo3' ).value;
			//form.querySelector( 'input[name="telNo"]' ).value = form.querySelector( 'select[name="natiCd"]' ).value + form.querySelector( 'input[name="telNo"]' ).value;
			
		} else if( form.querySelector( 'select[name="usrTp"]' ).value == "U" ) {	// 사용자인 경우 
		
			// 사용자인 경우 경영주 Server validation을 위해 dummy 값 입력
			form.querySelector( 'input[name="storNm"]' ).value 	= "-";
			form.querySelector( 'input[name="telNo"]' ).value 	= "021111111";
		}
		
		// Set phone number
		//form.querySelector( 'input[name="usrId"]' ).value = document.querySelector( '#phone1' ).value + document.querySelector( '#phone2' ).value + document.querySelector( '#phone3' ).value;		
		//form.querySelector( 'input[name="usrId"]' ).value = form.querySelector( 'select[name="natiCd"]' ).value + form.querySelector( 'input[name="usrId"]' ).value;

		// Send ajax data.
		ajaxSend( "./chkUsrId.json" 
				, {   usrId  : form.querySelector( 'input[name="usrId"]' ).value
					, natiCd : form.querySelector( 'select[name="natiCd"]' ).value
					, email  : form.querySelector( 'input[name="email"]' ).value
				  }
				, aftChkId );
		
	}
	
	// 사용자 전환시 Form 양식 보임/숨김 처리
	function switchUsr() {
		var form = document.querySelector( '#idForm' );		
		var selUsrTp = form.querySelector( 'select[name="usrTp"]' ).value;
		
		if( selUsrTp == "U" ) {			// 사용자
			document.getElementById( "divStorNmHr" 		).style.display = "none";
			document.getElementById( "divStorNmIcon" 	).style.display = "none";
			document.getElementById( "divStorNmLb" 		).style.display = "none";
			document.getElementById( "divStorNmForm" 	).style.display = "none";
			
			document.getElementById( "divStorSavTpHr" 	).style.display = "none";
			document.getElementById( "divStorSavTpIcon" ).style.display = "none";
			document.getElementById( "divStorSavTpLb" 	).style.display = "none";
			document.getElementById( "divStorSavTpForm" ).style.display = "none";
			
			document.getElementById( "divStorTelNoHr" 	).style.display = "none";
			document.getElementById( "divStorTelNoIcon" ).style.display = "none";
			document.getElementById( "divStorTelNoLb" 	).style.display = "none";
			document.getElementById( "divStorTelNoForm" ).style.display = "none";
			
			document.getElementById( "divStorAddrHr" 	).style.display = "none";
			document.getElementById( "divStorAddrIcon" 	).style.display = "none";
			document.getElementById( "divStorAddrLb" 	).style.display = "none";
			document.getElementById( "divStorAddrForm" 	).style.display = "none";
		} else if( selUsrTp == "S" ) {	// 경영주
			document.getElementById( "divStorNmHr" 		).style.display = "";
			document.getElementById( "divStorNmIcon" 	).style.display = "";
			document.getElementById( "divStorNmLb" 		).style.display = "";
			document.getElementById( "divStorNmForm" 	).style.display = "";
			
			document.getElementById( "divStorSavTpHr" 	).style.display = "";
			document.getElementById( "divStorSavTpIcon" ).style.display = "";
			document.getElementById( "divStorSavTpLb" 	).style.display = "";
			document.getElementById( "divStorSavTpForm" ).style.display = "";
			
			document.getElementById( "divStorTelNoHr" 	).style.display = "";
			document.getElementById( "divStorTelNoIcon" ).style.display = "";
			document.getElementById( "divStorTelNoLb" 	).style.display = "";
			document.getElementById( "divStorTelNoForm" ).style.display = "";
			
			document.getElementById( "divStorAddrHr" 	).style.display = "";
			document.getElementById( "divStorAddrIcon" 	).style.display = "";
			document.getElementById( "divStorAddrLb" 	).style.display = "";
			document.getElementById( "divStorAddrForm" 	).style.display = "";
		}
	}
	
	function popAddress(){
		showComModal( {type:"info",msg:"주소 검색 후 지도를 꾸욱 클릭하여<br/>위도와 경도를 메모해 주세요<br/>예) 위도 = 37.12345 / 경도 = 126.12345"
			,closeCallbackFnc:function(){ window.open("https://www.google.co.kr/maps","pop","scrollbars=yes, resizable=yes"); }
		} );

		/* Disuse find address service
		// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)	
		// document.domain = "abc.go.kr";
		if (chkMobile()) {
			// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		   	var pop = window.open("./apiAddress.do","pop","scrollbars=yes, resizable=yes");
		} else {
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	   		var pop = window.open("./apiAddress.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		}
		*/
		
	}
	
	/** Disuse find address service.
		 API 서비스 제공항목 확대 (2017.02) 
	function addressCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
							, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
		
		document.getElementById( "roadAddrPart1").value = roadAddrPart1;
		document.getElementById( "roadAddrPart2").value = roadAddrPart2;
		document.getElementById( "addrDetail" 	).value = addrDetail;
		document.getElementById( "zipNo" 		).value = zipNo;
		document.getElementById( "address" 		).value = roadAddrPart1 + " " + roadAddrPart2 + " " + addrDetail + " (우편번호 " + zipNo + ")";
	}
	**/

	// Call if the check id of ajax communication is succeeded.
	function aftChkId( responseText ) {
		if( responseText == "ok" ) {
			var form = document.querySelector( '#idForm' );

			var selUsrTp = form.querySelector( 'select[name="usrTp"]' ).value;
		
			/* Disuse naver geocode.
			//if( selUsrTp == "U" ) {	// Confirm if it's user.
    		//	form.submit();
			//} else if( selUsrTp == "S" ) {	// Get latitude and longitude if it's store master.
				naver.maps.Service.geocode({
					query: (         document.querySelector( "#roadAddrPart1" ).value
							+ " "  + document.querySelector( "#roadAddrPart2" ).value
							+ " "  + document.querySelector( "#addrDetail" ).value
						   )
				}, function(status, response) {
					if (status === naver.maps.Service.Status.ERROR) {
				    	alert( "주소에 대한 지도 정보를 가져오지 못하였습니다.\r\n\r\n지도 정보 없이 저장합니다." );
				    } else if (response.v2.meta.totalCount === 0) {
				    	alert( "주소에 대한 지도 정보를 가져오지 못하였습니다.\r\n\r\n지도 정보 없이 저장합니다." );
				    } else {
						var	item = response.v2.addresses[0];
						document.querySelector( '#mapLat' ).value = item.y;
						document.querySelector( '#mapLng' ).value = item.x;
					}
	
				    form.submit();
				});
				*/

				grecaptcha.ready(function() {
			        grecaptcha.execute('${setting_api_recaptcha_site_key}', {action: 'submit'}).then(function(token) {
		    	        // Add your logic to submit to your backend server here.		    	        
		    	        document.querySelector( 'input[name="recaptchaToken"]' ).value = token;
						form.submit();
		          	});
		        });
			//}
				
    	} else if( responseText == "id duplicated" ){
    		showComModal( {type:"warning",msg:"중복된 아이디가 있습니다<br/>다른 아이디를 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#phone1' ).focus() }} );
    	} else if( responseText == "email duplicated" ){
    		showComModal( {type:"warning",msg:"중복된 이메일 주소가 있습니다<br/>다른 이메일 주소를 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( 'input[name="email"]' ).focus() }} );
    	}
	}
	
	</script>
	
	<!-- disuse naver map  
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=${naverKey}&submodules=geocoder"></script>
	-->
	
	<script src="https://www.google.com/recaptcha/api.js?render=${setting_api_recaptcha_site_key}"></script>
	
<jsp:include page="comFooter.jsp"/>
<jsp:include page="footer.jsp"/>

	<script language="javascript">
		// Event load of document
	  	window.addEventListener("load", function(evt) {
			// Set nation code to select tag
			<c:forEach var="name" items="${cmNatiCd}" varStatus="status">
			addNatiCd( '${name.natiCd}', '${name.natiNmKor}', '${name.natiNmEng}' );
			</c:forEach>

			// select default nation code
			if( usrLang ) {
				document.querySelector( 'select[name="natiCd"]' ).value = getNation( usrLang );
			}
		});
	</script>
</body>

</html>