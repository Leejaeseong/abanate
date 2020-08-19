// Constant variables in page scope
var form 		= document.querySelector( '#idForm' );

//***************************************************************************************************
//***************************************************************************************************
// Event > addEventListener
//***************************************************************************************************
//***************************************************************************************************

// Event load of document
window.addEventListener("load", function() {	// It can declare parameter in function( i.g. "evt" ) 
	
  	if( isError ) {									// Case of error.
		showComModal( {type:"error", msg:errMsg} );
	} else if ( isComplete ) {						// Case of save success .
		// showComModal( {msg:"적용 되었습니다."} );
		goLogout();	// Automatically log out.
	}
  	
});

/*
document.querySelector( '#phone1' ).addEventListener("keyup", function() {	// It can declare parameter in function( i.g. "evt" )
	if( document.querySelector( '#phone1' ).value.length == 3 ) {
		document.querySelector( '#phone2' ).focus();
	}
});
document.querySelector( '#phone2' ).addEventListener("keyup", function() {	// It can declare parameter in function( i.g. "evt" )
	if( document.querySelector( '#phone2' ).value.length == 4 ) {
		document.querySelector( '#phone3' ).focus();
	}
});
*/

// Event blur at the first form of a user phone number
form.querySelector( 'input[name="usrId"]' ).addEventListener( "blur", function() {	// It can declare parameter in function( i.g. "evt" )
  	findUsr();
});
/*
form.querySelector( "#phone1" ).addEventListener( "blur", function() {	// It can declare parameter in function( i.g. "evt" )
  	findUsr();
});
// Event blur at the second form of a user phone number
form.querySelector( "#phone2" ).addEventListener( "blur", function() {	// It can declare parameter in function( i.g. "evt" )
  	findUsr();
});
// Event blur at the third form of a user phone number
form.querySelector( "#phone3" ).addEventListener( "blur", function() {	// It can declare parameter in function( i.g. "evt" )
  	findUsr();
});
*/

//***************************************************************************************************
//***************************************************************************************************
// Function
//***************************************************************************************************
//***************************************************************************************************

// The function of find user
function findUsr() {
	
	// If all of the forms are filled, then execute this.
  	if( chkPhoneNo( "usrId", true ) ) {
  	  	// Send ajax data.
		ajaxSend( "./findUserByUsrId.json" 
				, { 	usrId 		: form.querySelector( 'input[name="usrId"]' ).value
					, 	searchType 	: "new" }
				, findUsrAft );	   	
  	} else {
  		form.querySelector( 'input[name="usrId"]' 	).value = "";
  		form.querySelector( '#usrNm' 				).value = "";
  	}
}

// Call if the find user ajax communication is succeeded.
function findUsrAft( responseText ) {
	if( responseText != NOT_EXIST_DATA ) {
		// Fill user information in this page's forms
    	var resJson  = JSON.parse(responseText);
    	// Set user name
      	form.querySelector( '#usrNm' ).value = resJson.usrNm;
	} else {
		//form.querySelector( 'input[name="usrId"]' 	).value = "";
		form.querySelector( '#usrNm' 				).value = "미가입";
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

// The function of check data before save
function chkBeforeSave() {

	if( !chkNull( form.querySelector( 'input[name="usrId"]' ).value ) ) {
		showComModal( {msg:"이동하실 전화번호를 입력해 주세요.",closeCallbackFnc:function(){ document.querySelector( 'input[name="usrId"]' ).focus() }} );
		return false;
	} else if( myId == form.querySelector( 'input[name="usrId"]' ).value ) {
		showComModal( {msg:"동일한 전화번호로는 이동이 불가능합니다.",closeCallbackFnc:function(){ document.querySelector( 'input[name="usrId"]' ).focus() }} );
		return false;
	}
  	
  	return true;
}