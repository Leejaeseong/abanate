// Constant variables in page scope
var form 		= document.querySelector( '#idForm' );
var oldAccumAmt = 0;
var newAccumAmt = 0;
var oldOrNew	= "";

//***************************************************************************************************
//***************************************************************************************************
// Event > addEventListener
//***************************************************************************************************
//***************************************************************************************************

// Event load of document
window.addEventListener("load", function() {	// This function could be define a event parameter, i.g., evt  	
	
  	if( isError ) {									// Case of error.
		showComModal( {type:"error", msg:errMsg,closeCallbackFnc:function(){ goMain(); }} );
	} else if ( isComplete ) {						// Case of save success .
		showComModal( {msg:mLang.get("applycompleted")} );	// 적용 되었습니다
	}
  	
});

// Event blur at the first form of a user phone number
form.querySelector( 'input[name="oldUsrId"]' ).addEventListener( "blur", function() {	// This function could be define a event parameter, i.g., evt
	oldOrNew = "old";
  	findUsr();
});
form.querySelector( 'input[name="newUsrId"]' ).addEventListener( "blur", function() {	// This function could be define a event parameter, i.g., evt
	oldOrNew = "new";
  	findUsr();
});

//***************************************************************************************************
//***************************************************************************************************
// Function
//***************************************************************************************************
//***************************************************************************************************

// The function of find user
function findUsr() {
	
	if( oldOrNew == "old" ) {
		oldAccumAmt = 0;
	} else if ( oldOrNew == "new" ) {
		newAccumAmt = 0;
	}
	
  	// If all of the forms are filled, then execute this.
  	//if( chkPhoneNo( oldOrNew + "Phone1", oldOrNew + "Phone2", oldOrNew + "Phone3", true ) ) {
	if( chkPhoneNo( oldOrNew + "UsrId", true ) ) {
  	  	// Send ajax data.
		ajaxSend( "./findUserAndAccumInfo.json" 
				, { 	usrId 		: form.querySelector( 'input[name="' + oldOrNew + 'UsrId"]' ).value
					, 	searchType 	: oldOrNew }
				, findUsrAft );	   	
  	} else {
  		form.querySelector( 'input[name="' + oldOrNew + 'UsrId"]' 	).value = "";
  		form.querySelector( '#' + oldOrNew + 'UsrNm' 				).value = "";
  		form.querySelector( '#' + oldOrNew + 'AccumAmt'				).value = "";  		
  		form.querySelector( 'input[name=addAccumAmt]'				).value = "";
  	}
}

// Call if the find user ajax communication is succeeded.
function findUsrAft( responseText ) {
	if( responseText != NOT_EXIST_DATA ) {
		// Fill user information in this page's forms
    	var resJson  = JSON.parse(responseText);
    	// Set user name
      	form.querySelector( '#' + oldOrNew + 'UsrNm' ).value = resJson.usrNm;
    	
    	// Set user point and memo
      	if( chkNull( resJson.usrNm ) ) {
    		accumAmt = resJson.accumAmt;
    		
    		form.querySelector( "#" + oldOrNew + "AccumAmt" ).value = accumAmt + " " + ( savTp == "C" ? mLang.get("savingqty") : mLang.get("savingpoint") );	// "장 적립 중" : "점 적립 중"
    		if( oldOrNew == "old" ) {
    			oldAccumAmt = accumAmt;
    			// Move amount
				//if( chkNull( form.querySelector( 'input[name=oldUsrId]' ).value ) && chkNull( form.querySelector( 'input[name=newUsrId]' ).value ) ) {
					//form.querySelector( 'input[name=addAccumAmt]' ).value = Number( oldAccumAmt ) + Number( newAccumAmt );
					form.querySelector( 'input[name=addAccumAmt]' ).value = Number( oldAccumAmt );
				//}
    		} else if ( oldOrNew == "new" ) {
    			newAccumAmt = accumAmt;
    		}
      	}
	} else {
		// None of data.
		if( oldOrNew == "old" ) {			// Initiate values.
			form.querySelector( 'input[name="' + oldOrNew + 'UsrId"]' 	).value = "";
			form.querySelector( '#' + oldOrNew + 'UsrNm' 				).value = "";
			form.querySelector( "#" + oldOrNew + "AccumAmt" 			).value = "";
			form.querySelector( 'input[name=addAccumAmt]' 				).value = "";
		} else if( oldOrNew == "new" ) {	// New user create.
			form.querySelector( '#' + oldOrNew + 'UsrNm' 				).value = mLang.get("serv_notjoined");	// 미가입
			form.querySelector( "#" + oldOrNew + "AccumAmt" 			).value = "0";
		}
		
	}
	
}

//The function of save button
function onSave() {
  	if( chkBeforeSave() ) {
		showComModal( {	  type:"save"
	  					, msg:mLang.get("willyouapply")	// 적용 하시겠습니까?
	  					, btn1CallbackFnc:function(){
	  	  					form.submit(); 
	  	  				 }
				   } );
  	}
}

//The function of check data before save
function chkBeforeSave() {

	var addAccumAmt = form.querySelector( 'input[name=addAccumAmt]' ).value;
	
	if( isNaN( addAccumAmt ) ) {
		// 숫자만 입력해 주세요
		showComModal( {type:"warning",msg:mLang.get("inputonlynumber"),closeCallbackFnc:function(){ document.querySelector( 'input[name=addAccumAmt]' ).focus() }} ); 
		return false;
	} else if( addAccumAmt > oldAccumAmt ) {
		// 양도할 적립금을 확인해 주세요
		showComModal( {type:"warning",msg:mLang.get("checksendquantities"),closeCallbackFnc:function(){ document.querySelector( 'input[name=addAccumAmt]' ).focus() }} );
		return false;		
	} else if( !chkNull( form.querySelector( 'input[name="oldUsrId"]' ).value ) ) {
		// 통합하실 전화번호를 입력해 주세요<br/>또는 이전하실 적립금이 없습니다
		showComModal( {msg:mLang.get("inputintegratenumberornoquantitiestomove_br"),closeCallbackFnc:function(){ document.querySelector( 'input[name="oldUsrId"]' ).focus() }} );
		return false;
	} else if( !chkNull( form.querySelector( 'input[name="newUsrId"]' ).value ) ) {
		// 통합하실 전화번호를 입력해 주세요
		showComModal( {msg:mLang.get("inputintegratenumber"),closeCallbackFnc:function(){ document.querySelector( 'input[name="newUsrId"]' ).focus() }} );
		return false;
	} else if( form.querySelector( 'input[name="oldUsrId"]' ).value == form.querySelector( 'input[name="newUsrId"]' ).value ) {
		// 양도/양수자가 동일한 전화번호 입니다
		showComModal( {msg:mLang.get("serv_sendrecvsamenumber"),closeCallbackFnc:function(){ document.querySelector( 'input[name="newUsrId"]' ).focus() }} );
		return false;
	} else if( form.querySelector( 'input[name="passwd"]' ).value.length < 6 ) {
		// 비밀번호는 6자리 이상을 입력해 주세요
		showComModal( {type:"warning",msg:mLang.get("chkpasswdlength"),closeCallbackFnc:function(){ document.querySelector( 'input[name="passwd"]' ).focus() }} );
		return false;
	}
  	
  	return true;
}