// Constant variables in page scope
var pageNo		= firstPageNo;

// Relational variables of the history table.
var tblIdx 	= 0;
var tblBody = document.querySelector( '#idHistoryTbl > tbody' );
var nRow, colVisitDtm, colUseTp, colUsrNm, colUsrId, colApplyAmt, colAccumAmt;

//***************************************************************************************************
//***************************************************************************************************
// Event > addEventListener
//***************************************************************************************************
//***************************************************************************************************

// Event load of document
window.addEventListener("load", function() {	// This function could be define a event parameter, i.g., evt
	
});
document.querySelector( '#sFromDate' ).addEventListener("click", function() {	// This function could be define a event parameter, i.g., evt
	historyClear();	// Clear of the visit history table.
});
document.querySelector( '#sToDate' ).addEventListener("click", function() {	// This function could be define a event parameter, i.g., evt
	historyClear();	// Clear of the visit history table.
});
/*
document.querySelector( '#phone1' ).addEventListener("keyup", function() {	// This function could be define a event parameter, i.g., evt
	if( document.querySelector( '#phone1' ).value.length == 3 ) {
		document.querySelector( '#phone2' ).focus();
	}
	historyClear();	// Clear of the visit history table.
});
document.querySelector( '#phone2' ).addEventListener("keyup", function() {	// This function could be define a event parameter, i.g., evt
	if( document.querySelector( '#phone2' ).value.length == 4 ) {
		document.querySelector( '#phone3' ).focus();
	}
	historyClear();	// Clear of the visit history table.
});
document.querySelector( '#phone3' ).addEventListener("keyup", function() {	// This function could be define a event parameter, i.g., evt
	historyClear();	// Clear of the visit history table.
});
*/
document.querySelector( '#usrNm' ).addEventListener("keyup", function() {	// This function could be define a event parameter, i.g., evt
	historyClear();	// Clear of the visit history table.
});
//***************************************************************************************************
//***************************************************************************************************
// Function
//***************************************************************************************************
//***************************************************************************************************

// Call after document loaded.
function init() {
	// Apply date picker.
	flatpickr( document.querySelector( "#sFromDate"), flatpickrDefault("sFromDate", -30) );
	flatpickr( document.querySelector( "#sToDate")  , flatpickrDefault("sToDate"       ) );
	
	// display store information
	document.querySelector( "#idAccumCustomerCnt" 	).value = accumCustomerCnt 	+ " " + "명";
	document.querySelector( "#idAccumSavAmt" 		).value = accumSavAmt		+ " " + ( savTp == "C" ? "장":"점" );
	document.querySelector( "#idAccumUseAmt" 		).value	= accumUseAmt		+ " " + ( savTp == "C" ? "장":"점" );
}

// Search visit histories of the store.
function searchVisitHistory() {
	
	historyClear();	// Clear of the visit history table.
	
	// Set phone number
	//document.querySelector( '#usrId' ).value = document.querySelector( '#phone1' ).value + document.querySelector( '#phone2' ).value + document.querySelector( '#phone3' ).value;
	
	pageNo = firstPageNo;	// Initiate variable of page number.
	
	// Check search conditions.
	//console.log( "from = " + document.querySelector( "#sFromDate" ).value );
	//console.log( "to   = " + document.querySelector( "#sToDate"   ).value );
	if( document.querySelector( "#sFromDate" ).value > document.querySelector( "#sToDate" ).value ) {
		showComModal( {msg:"조회 시작일과 종료일을 확인해 주세요",closeCallbackFnc:function(){ document.querySelector( "#sFromDate" ).nextElementSibling.focus() }} );
	  	return false;
	}
	
	// Send ajax data.
	ajaxSend( "./findVisitHistory.json" 
			, {   usrId	: document.querySelector( 'input[name="usrId"]'	).value
				, fDt	: document.querySelector( "#sFromDate" 			).value
				, tDt	: document.querySelector( "#sToDate"   			).value
				, usrNm	: document.querySelector( "#usrNm"   			).value
			  }
			, searchVisitHistoryAft );
	
	/*
	var sndData = { usrId:form.querySelector( 'input[name="usrId"]' ).value,pageNo:++pageNo };
   	xhr.open("POST", "./findSaveUseInfoMore.do", true);
   	xhr.setRequestHeader('Content-Type', 'application/json'); 	// Content type to json
   	xhr.send(JSON.stringify( sndData )); 						// Send data by use stringify function
	xhr.onreadystatechange = function() {
    	if (this.readyState == 4 && this.status == 200) {
    		// The common line about the authentification check.
    		if( this.responseText == "authentification is failed" ) { goMainAfterMessage(); return false; } // Move to main page if authentification is failed
        	if( this.responseText != NOT_EXIST_DATA ) {
	        	viewVisitHistory( JSON.parse(this.responseText) )
        	} else {
        		showComModal( {msg:"마지막 페이지 입니다."} );
        		return false;
        	}
       	} else if (this.readyState == 4 && this.status != 200) {
       		showComModal( {type:"error",msg:"오류가 발생하였습니다<br/>관리자에게 문의 부탁드립니다",closeCallbackFnc:function(){ goMain(); } } );
       	}
   	};
   	*/
	
}

//Call if the find visit history ajax communication is succeeded.
function searchVisitHistoryAft( responseText ) {
	//console.log( responseText );
	if( responseText != NOT_EXIST_DATA ) {
		// Fill searched data.
		viewMetaInfo	( JSON.parse(responseText).chVisitMeta 	);
		viewVisitHistory( JSON.parse(responseText).chVisit 		)
	} else {
		// There's no data. 
		showComModal( {msg:"조회 내역이 없습니다"} );
	  	return false;					
	}
}

// Fill meta data of searched visit history.
function viewMetaInfo( rData ) {

	document.querySelector( "#idSearchCnt" 	).textContent = toNumWithSep( getDataByProjection( rData, "searchCnt" 	) );
	document.querySelector( "#idUsrCnt" 	).textContent = toNumWithSep( getDataByProjection( rData, "usrCnt" 		) );
	document.querySelector( "#idSavAmt" 	).textContent = toNumWithSep( getDataByProjection( rData, "savAmt" 		) );
	document.querySelector( "#idUseAmt" 	).textContent = toNumWithSep( getDataByProjection( rData, "useAmt" 		) );
	document.querySelector( "#idAccumAmt" 	).textContent = toNumWithSep( getDataByProjection( rData, "accumAmt" 	) );
	/*
	document.querySelector( "#idSearchCnt" 	).textContent = toNumWithSep( rData.searchCnt )	;
	document.querySelector( "#idUsrCnt" 	).textContent = toNumWithSep( rData.usrCnt )	;
	document.querySelector( "#idSavAmt" 	).textContent = toNumWithSep( rData.savAmt )	;
	document.querySelector( "#idUseAmt" 	).textContent = toNumWithSep( rData.useAmt )	;
	document.querySelector( "#idAccumAmt" 	).textContent = toNumWithSep( rData.accumAmt )	;
	*/
}

// Display visit histories.
function viewVisitHistory( rData ) {
	if( rData ) {
		for( var i = 0; i < rData.length; i++ ) {
			historyAdd( rData[i].visitDtm, rData[i].useTp, rData[i].cmUsr.usrNm, rData[i].cmUsr.usrId, rData[i].savAmt, rData[i].useAmt, rData[i].accumAmt, rData[i].goosNm );
		}
	}
}

//Display more history of visits.
function viewMore() {
	
	// Send ajax data.
	ajaxSend( "./findVisitHistory.json"
			, {   usrId	: document.querySelector( 'input[name="usrId"]'	).value
				, fDt	: document.querySelector( "#sFromDate" 			).value
				, tDt	: document.querySelector( "#sToDate"   			).value
				, usrNm	: document.querySelector( "#usrNm"   			).value
				,pageNo:++pageNo}
			, searchVisitHistoryAft );
	
}

//The function of add button
function historyAdd( visitDtm, useTp, usrNm, usrId, savAmt, useAmt, accumAmt, goosNm ) {

	nRow = tblBody.insertRow(), colVisitDtm = nRow.insertCell(), colUseTp = nRow.insertCell(), colUsrNm = nRow.insertCell(), colUsrId = nRow.insertCell(), colApplyAmt = nRow.insertCell(), colAccumAmt = nRow.insertCell(), colGoosNm = nRow.insertCell();
	
	colVisitDtm	.className	= "text-center";
	colUseTp	.className 	= "text-center";
	colUsrNm	.className 	= "text-left";
	colUsrId	.className 	= "text-center";
	colApplyAmt	.className 	= "text-right";
	colAccumAmt	.className 	= "text-right";
	colGoosNm	.className 	= "text-left";
	
	colUsrNm.style.fontSize = "0.8em";
	colUsrId.style.fontSize = "0.8em";

	colGoosNm.style.whiteSpace	= "nowrap";
	
	colVisitDtm .innerHTML = '<td>' + toDateFormat( visitDtm ) 							+ '</td>';
	colUseTp  	.innerHTML = '<td>' + ( useTp == "U" ? "사용" : "적립" ) 				+ '</td>';
	if( useTp == "U" ) {	// Change display color that used type.
		colUseTp.style.color = "red";
	}
	colUsrNm	.innerHTML = '<td>' + usrNm 											+ '</td>';
	colUsrId	.innerHTML = '<td>' + toPhoneFormat( usrId )							+ '</td>';
	colApplyAmt	.innerHTML = '<td>' + toNumWithSep( useTp == "U" ? useAmt : savAmt )	+ '</td>';
	colAccumAmt	.innerHTML = '<td>' + toNumWithSep( accumAmt )							+ '</td>';
	colGoosNm	.innerHTML = '<td>' + toBlank( goosNm )									+ '</td>';
}

//The function of clearing history table.
function historyClear() {
	document.querySelector( "#idSearchCnt" 	).textContent = "0";
	document.querySelector( "#idUsrCnt" 	).textContent = "0";
	document.querySelector( "#idSavAmt" 	).textContent = "0";
	document.querySelector( "#idUseAmt" 	).textContent = "0";
	document.querySelector( "#idAccumAmt" 	).textContent = "0";
	
	var trs 	= document.querySelectorAll( '#idHistoryTbl > tbody > tr' );
	for( var i = 0; i < trs.length; i++ ) {
		trs[i].remove();
	}
}