// Constant variables in page scope

var form 		= document.querySelector( '#idForm' );
var useTp		= "save";
var accumAmt 	= 0;
var pageNo		= firstPageNo;

// Relational variables of the history table.
var tblIdx 	= 0;
var tblBody = document.querySelector( '#idHistoryTbl > tbody' );
var nRow, colVisitDtm, colUseTp, colApplyAmt, cAccumAmt, colGoosNm;

//***************************************************************************************************
//***************************************************************************************************
// Event > addEventListener
//***************************************************************************************************
//***************************************************************************************************

// Event load of document
window.addEventListener("load", function() { // There can be a parameter of event.  	
	
	changeTitle(); 	// Change this page's title  	
  	changeLabels(); // Change this page's labels
  	
  	if( isError ) {									// Case of error.
		showComModal( {type:"error", msg:errMsg} );
	} else if ( isComplete ) {						// Case of save success .
		showComModal( {msg:(useTp=="save"?"적립":"사용") + " 되었습니다."} );
	}
  	
  	// If this device is not a mobile, then add a fixed style at this table.
  	//if( chkMobile ) {
  	//	document.querySelector( '#idHistoryTbl' ).style.tableLayout = "fixed";
  	//}
});

form.querySelector( "select[name='useTp']" ).addEventListener( "change", function() { // There can be a parameter of event.
	useTp = form.querySelector( "select[name='useTp']" ).value;
	changeLabels();	// Change this page's labels
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
*/


// Event blur at the form of user phone number.
form.querySelector( 'input[name="usrId"]' ).addEventListener( "blur", function() {	// There can be a parameter of event.
  	findUsr();
});
/*
// Event blur at the first form of a user phone number
form.querySelector( "#phone1" ).addEventListener( "blur", function() {	// There can be a parameter of event.
  	findUsr();
});
// Event blur at the second form of a user phone number
form.querySelector( "#phone2" ).addEventListener( "blur", function() {	// There can be a parameter of event.
  	findUsr();
});
// Event blur at the third form of a user phone number
form.querySelector( "#phone3" ).addEventListener( "blur", function() {	// There can be a parameter of event.
  	findUsr();
});
*/

//Event key up at the form of save or use amount
form.querySelector( "#savUseAmt" ).addEventListener( "keyup", function() {	// There can be a parameter of event.
	if( useTp == "save" ) {
		var savAmt = Number( accumAmt ) + Number( form.querySelector( "#savUseAmt" ).value );
		
		form.querySelector( "#idAfterAdd" ).value 			= toNumWithSep( savAmt );
		form.querySelector( "input[name='savAmt']" ).value 	= form.querySelector( "#savUseAmt" ).value;
		form.querySelector( "input[name='useAmt']" ).value 	= "0";
	} else if( useTp == "use" ) {
		var calcAmt = Number( accumAmt ) - Number( form.querySelector( "#savUseAmt" ).value );
		if( calcAmt < 0 ) {
			showComModal( {msg:"적립 이상으로 사용할 수 없습니다.",closeCallbackFnc:function(){ form.querySelector( "#savUseAmt" ).focus() }} );
			form.querySelector( "#savUseAmt" ).value = "0";
  	  		return false;
		}
		form.querySelector( "#idAfterAdd" 			).value = toNumWithSep( calcAmt );
		form.querySelector( "input[name='savAmt']" 	).value = "0";
		form.querySelector( "input[name='useAmt']" 	).value = form.querySelector( "#savUseAmt" ).value;
	}
});

//***************************************************************************************************
//***************************************************************************************************
// Function
//***************************************************************************************************
//***************************************************************************************************

// The function of find user
function findUsr() {
	
	historyClear();	// Clear of the visit history table.
	
  	// If all of the forms are filled, then execute this.
  	//if( chkPhoneNo( "phone1", "phone2", "phone3", true ) ) {
	if( chkPhoneNo( "usrId", true ) ) {
  	  	// Set phone number
		//form.querySelector( 'input[name="usrId"]' ).value = document.querySelector( '#phone1' ).value + document.querySelector( '#phone2' ).value + document.querySelector( '#phone3' ).value;

		// Send ajax data.
		ajaxSend( "./findSaveUseInfo.json" 
				, { usrId : form.querySelector( 'input[name="usrId"]' ).value }
				, findUsrAft );
	   	
  	} else {
  		form.querySelector( 'input[name="usrId"]' 	).value = "";
  		form.querySelector( 'input[name="usrNm"]' 	).value = "";
  		form.querySelector( "#curAmt" 				).value = "";
  		form.querySelector( "#idAfterAdd" 			).value = "";  		
  	  	form.querySelector( "textarea[name='rmks']" ).value = "";
  	  	accumAmt = 0;
  	}
}

// Call if the find user ajax communication is succeeded.
function findUsrAft( responseText ) {
	
	if( responseText != NOT_EXIST_DATA ) {
		// Fill user information in this page's forms
    	viewUsrInfo		( JSON.parse(responseText) );
    	viewVisitHistory( JSON.parse(responseText) )
	} else {
		// Set user name to "Not joined user" 
		form.querySelector( "input[name=usrNm]" 	).value = "미가입";
		form.querySelector( "#curAmt" 				).value = "";
  		form.querySelector( "#idAfterAdd" 			).value = "";  		
  	  	form.querySelector( "textarea[name='rmks']" ).value = "";
  	  	accumAmt = 0;			
	}
}

// Fill user information in this page's forms
function viewUsrInfo( resJson ) {
	// Set user name
  	form.querySelector( 'input[name="usrNm"]' ).value = resJson.cmUsr.usrNm;	
	
	// Set user point and memo
  	if( chkNull( resJson.crUsrStor ) ) {
		accumAmt = resJson.crUsrStor.accumAmt;
		form.querySelector( "#curAmt" ).value = toNumWithSep( accumAmt ) + " " + ( savTp == "C" ? "장" : "점" ) + " 적립 중";
  	  	form.querySelector( "textarea[name='rmks']" ).value = toBlank( resJson.crUsrStor.rmks );
  	} else {
  	  	form.querySelector( "#curAmt" ).value = "0 " + ( savTp == "C" ? "장" : "점" ) + " 적립 중";
  	  	form.querySelector( "textarea[name='rmks']" ).value = "";
  	  	accumAmt = 0;
  	}
  	
  	form.querySelector( "input[name='savAmt']" ).value = 0;
  	form.querySelector( "input[name='useAmt']" ).value = 0;
}

// Display visit histories.
function viewVisitHistory( resJson ) {
	var chVisitArr = resJson.chVisit;
	if( chVisitArr ) {
		for( var i = 0; i < chVisitArr.length; i++ ) {
			historyAdd( chVisitArr[i].visitDtm, chVisitArr[i].useTp, chVisitArr[i].savAmt, chVisitArr[i].useAmt, chVisitArr[i].accumAmt, chVisitArr[i].goosNm, chVisitArr[i].rmks );
		}
	}
}

//Display more history of visits.
function viewMore() {
	
	if( !chkNull( form.querySelector( 'input[name="usrId"]' ).value ) ) {
		showComModal( {msg:"고객 전화번호를 입력해 주세요.",closeCallbackFnc:function(){ document.querySelector( 'input[name="usrId"]' ).focus() }} );
		return false;
	}
	
	// Send ajax data.
	ajaxSend( "./findVisitHistoryMore.json" 
			, { usrId:form.querySelector( 'input[name="usrId"]' ).value,pageNo:++pageNo }
			, viewMoreAft );
	
}

// Call if the view more ajax communication is succeeded.
function viewMoreAft( responseText ) {	
	if( responseText != NOT_EXIST_DATA ) {
    	viewVisitHistory( JSON.parse(responseText) )
	} else {
		showComModal( {msg:"마지막 페이지 입니다."} );
		return false;
	}
}

//The function of add button
function historyAdd( visitDtm, useTp, savAmt, useAmt, accumAmt, goosNm, rmks ) {

	nRow = tblBody.insertRow(), colVisitDtm = nRow.insertCell(), colUseTp = nRow.insertCell(), colApplyAmt = nRow.insertCell(), cAccumAmt = nRow.insertCell(), colGoosNm = nRow.insertCell(), colRmks = nRow.insertCell();
	
	colVisitDtm	.className	= "text-center";
	colUseTp	.className 	= "text-center";
	colApplyAmt	.className 	= "text-right";
	cAccumAmt	.className 	= "text-right";
	colGoosNm	.className 	= "text-left";
	colRmks		.className 	= "text-left";
	
	colGoosNm	.style.whiteSpace	= "nowrap";
	colRmks		.style.whiteSpace	= "nowrap";
		
	colVisitDtm .innerHTML = '<td>' + toDateFormat( visitDtm ) 							+ '</td>';
	colUseTp  	.innerHTML = '<td>' + ( useTp == "U" ? "사용" : "적립" ) 				+ '</td>';
	if( useTp == "U" ) {	// Change display color that used type.
		colUseTp.style.color = "red";
	}
	colApplyAmt	.innerHTML = '<td>' + toNumWithSep( useTp == "U" ? useAmt : savAmt )	+ '</td>';
	cAccumAmt  	.innerHTML = '<td>' + toNumWithSep( accumAmt ) 							+ '</td>';
	colGoosNm  	.innerHTML = '<td>' + toBlank( goosNm ) 								+ '</td>';
	colRmks  	.innerHTML = '<td>' + toBlank( rmks ) 									+ '</td>';
	
	/*
	var nRow = document.createElement( "tr" );
	
	var colVisitDtm	= document.createElement( "td" );
	var colUseTp 	= document.createElement( "td" );
	var colApplyAmt = document.createElement( "td" );
	var cAccumAmt 	= document.createElement( "td" );
	var colGoosNm 	= document.createElement( "td" );
	
	colVisitDtm	.appendChild( document.createTextNode( toDateFormat( visitDtm ) 	      ) );
	colUseTp	.appendChild( document.createTextNode( ( useTp == "U" ? "사용" : "적립" ) ) );
	colApplyAmt	.appendChild( document.createTextNode( ( useTp == "U" ? useAmt : savAmt ) ) );
	cAccumAmt	.appendChild( document.createTextNode( accumAmt 						  ) );
	colGoosNm	.appendChild( document.createTextNode( toBlank( goosNm ) 				  ) );
	
	colVisitDtm	.className	= "text-center";
	colUseTp	.className 		= "text-center";
	colApplyAmt	.className 	= "text-right";
	cAccumAmt	.className 	= "text-right";
	colGoosNm	.className 	= "text-left";
	
	nRow.appendChild( colVisitDtm	);
	nRow.appendChild( colUseTp 		);
	nRow.appendChild( colApplyAmt 	);
	nRow.appendChild( cAccumAmt 	);
	nRow.appendChild( colGoosNm 	);
	
	tblObj.appendChild( nRow );
	*/
	
}
//The function of clearing history table.
function historyClear() {
	var trs 	= document.querySelectorAll( '#idHistoryTbl > tbody > tr' );
	for( var i = 0; i < trs.length; i++ ) {
		trs[i].remove();
	}
}

// Change this page's title that the store save type is either coupon or point
function changeTitle() {
	if( savTp == "C" ) {
		form.querySelector( "#idPageTitle" ).innerHTML = '<i class="fas fa-piggy-bank"></i> 쿠폰 적립/사용';		
	} else if( savTp == "P" ) {
		form.querySelector( "#idPageTitle" ).innerHTML = '<i class="fas fa-piggy-bank"></i> 포인트 적립/사용';
	}
	
}

// Change this page's labels that the action type is either save or use
function changeLabels() {
	if( useTp == "save" ) {
		form.querySelector( "#idLabelSavUse" )		.textContent = "적립 " 		+ ( savTp == "C" ? "수량" : "포인트" );
		form.querySelector( "#idLabelAfterSavUse" )	.textContent = "적립 후 " 	+ ( savTp == "C" ? "수량" : "포인트" );
		form.querySelector( "#idLabelSavUseMemo" )	.textContent = "적립 메모";
	} else if( useTp == "use" ) {
		form.querySelector( "#idLabelSavUse" )		.textContent = "사용 " 		+ ( savTp == "C" ? "수량" : "포인트" );
		form.querySelector( "#idLabelAfterSavUse" )	.textContent = "사용 후 " 	+ ( savTp == "C" ? "수량" : "포인트" );
		form.querySelector( "#idLabelSavUseMemo" )	.textContent = "사용 메모";
	}
	
	form.querySelector( "#savUseAmt" ).dispatchEvent(new KeyboardEvent('keyup'));
	
}
//The function of save button
function onSave() {
  	if( chkBeforeSave() ) {
		showComModal( {	  type:"save"
	  					, msg:"저장하시겠습니까?"
	  					, btn1CallbackFnc:function(){
	  	  					form.submit(); 
	  	  				 }
				   } );
  	}
}

//The function of check data before save
function chkBeforeSave() {

	var savUseAmt = form.querySelector( "#savUseAmt" ).value;
	
	if( Number( savUseAmt ) < 1) {
		showComModal( {msg:"0 이상을 입력해 주세요",closeCallbackFnc:function(){ form.querySelector( "#savUseAmt" ).focus() }} );
		return false;
	} else if( !Number.isInteger( Number( savUseAmt ) ) ) {
		showComModal( {msg:"정수를 입력해 주세요",closeCallbackFnc:function(){ form.querySelector( "#savUseAmt" ).focus() }} );
		return false;
	} else if( !chkNull( savUseAmt ) ) {
		showComModal( {msg:"저장할 내용이 없습니다.",closeCallbackFnc:function(){ document.querySelector( '#savUseAmt' ).focus() }} );
		return false;		
	} else if( isNaN( savUseAmt ) ) {
		showComModal( {type:"warning",msg:"숫자만 입력해 주세요",closeCallbackFnc:function(){ document.querySelector( '#savUseAmt' ).focus() }} );
		return false;
	} else if ( !chkNull( form.querySelector( 'input[name="usrId"]' ).value ) ) {
		showComModal( {msg:"고객 전화번호를 입력해 주세요.",closeCallbackFnc:function(){ document.querySelector( 'input[name="usrId"]' ).focus() }} );
		return false;
	}
  	
  	return true;
}