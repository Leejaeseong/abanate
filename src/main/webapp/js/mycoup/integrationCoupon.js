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
window.addEventListener("load", function(evt) {  	
	
  	if( isError ) {									// Case of error.
		showComModal( {type:"error", msg:errMsg} );
	} else if ( isComplete ) {						// Case of save success .
		showComModal( {msg:"적용 되었습니다."} );
	}
  	
});

// Event of move phone focus
document.querySelector( '#oldPhone1' ).addEventListener("keyup", function(evt) {
	if( document.querySelector( '#oldPhone1' ).value.length == 3 ) {
		document.querySelector( '#oldPhone2' ).focus();
	}
});
document.querySelector( '#oldPhone2' ).addEventListener("keyup", function(evt) {
	if( document.querySelector( '#oldPhone2' ).value.length == 4 ) {
		document.querySelector( '#oldPhone3' ).focus();
	}
});

document.querySelector( '#newPhone1' ).addEventListener("keyup", function(evt) {
	if( document.querySelector( '#newPhone1' ).value.length == 3 ) {
		document.querySelector( '#newPhone2' ).focus();
	}
});
document.querySelector( '#newPhone2' ).addEventListener("keyup", function(evt) {
	if( document.querySelector( '#newPhone2' ).value.length == 4 ) {
		document.querySelector( '#newPhone3' ).focus();
	}
});

// Event blur at the first form of a user phone number
form.querySelector( "#oldPhone1" ).addEventListener( "blur", function(evt) {
	oldOrNew = "old";
  	findUsr();
});
// Event blur at the second form of a user phone number
form.querySelector( "#oldPhone2" ).addEventListener( "blur", function(evt) {
	oldOrNew = "old";
  	findUsr();
});
// Event blur at the third form of a user phone number
form.querySelector( "#oldPhone3" ).addEventListener( "blur", function(evt) {
	oldOrNew = "old";
  	findUsr();
});

// Event blur at the first form of a user phone number
form.querySelector( "#newPhone1" ).addEventListener( "blur", function(evt) {
	oldOrNew = "new";
  	findUsr();
});
// Event blur at the second form of a user phone number
form.querySelector( "#newPhone2" ).addEventListener( "blur", function(evt) {
	oldOrNew = "new";
  	findUsr();
});
// Event blur at the third form of a user phone number
form.querySelector( "#newPhone3" ).addEventListener( "blur", function(evt) {
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
  	if( chkPhoneNo( oldOrNew + "Phone1", oldOrNew + "Phone2", oldOrNew + "Phone3", true ) ) {
  	  	// Set phone number
		form.querySelector( 'input[name="' + oldOrNew + 'UsrId"]' ).value = document.querySelector( '#' + oldOrNew + 'Phone1' ).value + document.querySelector( '#' + oldOrNew + 'Phone2' ).value + document.querySelector( '#' + oldOrNew + 'Phone3' ).value;

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
    		form.querySelector( "#" + oldOrNew + "AccumAmt" ).value = accumAmt + " " + ( savTp == "C" ? "장" : "점" ) + " 적립 중";
    		if( oldOrNew == "old" ) {
    			oldAccumAmt = accumAmt;
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
		} else if( oldOrNew == "new" ) {	// New user create.
			form.querySelector( '#' + oldOrNew + 'UsrNm' 				).value = "미가입";
			form.querySelector( "#" + oldOrNew + "AccumAmt" 			).value = "0";
		}
		form.querySelector( 'input[name=addAccumAmt]' ).value = "";
	}
	
	// Add amount
	if( chkNull( form.querySelector( 'input[name=oldUsrId]' ).value ) && chkNull( form.querySelector( 'input[name=newUsrId]' ).value ) ) {
		form.querySelector( 'input[name=addAccumAmt]' ).value = Number( oldAccumAmt ) + Number( newAccumAmt );
	}
}

//The function of save button
function onSave() {
  	if( chkBeforeSave() ) {
		showComModal( {	  type:"save"
	  					, msg:"적용 하시겠습니까?"
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
		showComModal( {type:"warning",msg:"숫자만 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( 'input[name=addAccumAmt]' ).focus() }} );
		return false;
	} else if( addAccumAmt > oldAccumAmt ) {
		showComModal( {type:"warning",msg:"양도할 적립금을 확인해 주세요",closeCallbackFnc:function(){ document.querySelector( 'input[name=addAccumAmt]' ).focus() }} );
		return false;		
	} else if( !chkNull( form.querySelector( 'input[name="oldUsrId"]' ).value ) ) {
		showComModal( {msg:"통합하실 전화번호를 입력해 주세요<br/>또는 이전하실 적립금이 없습니다.",closeCallbackFnc:function(){ document.querySelector( '#oldPhone1' ).focus() }} );
		return false;
	} else if( !chkNull( form.querySelector( 'input[name="newUsrId"]' ).value ) ) {
		showComModal( {msg:"통합하실 전화번호를 입력해 주세요.",closeCallbackFnc:function(){ document.querySelector( '#newPhone1' ).focus() }} );
		return false;
	} else if( form.querySelector( 'input[name="oldUsrId"]' ).value == form.querySelector( 'input[name="newUsrId"]' ).value ) {
		showComModal( {msg:"동일한 전화번호 입니다.",closeCallbackFnc:function(){ document.querySelector( '#newPhone1' ).focus() }} );
		return false;
	}
  	
  	return true;
}