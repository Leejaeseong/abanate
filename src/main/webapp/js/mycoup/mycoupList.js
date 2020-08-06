// Constant variables in page scope
var pageStorNo			= firstPageNo;
var pageVisitNo			= firstPageNo;
var clickedCmStorSeq 	= "";
var searchType			= "";

// Relational variables of the store table.
var tblStorIdx 	= 0;
var tblStorBody	= document.querySelector( '#idStorTbl > tbody' );
var nStorRow, colStorNm, colStorLastVisitDt, colStorSav, colStorAddr;

// Relational variables of the goods table.
var tblGoosIdx 	= 0;
var tblGoosBody	= document.querySelector( '#idGoosTbl > tbody' );
var nGoosRow, colGoosSavAmt, colGoosGoosNm, colGoosRemk;

// Relational variables of the visit hisroty table.
var tblVisitIdx 	= 0;
var tblVisitBody	= document.querySelector( '#idVisitTbl > tbody' );
var nVisitRow, colVisitVisitDtm, colVisitUseTp, colVisitSavUseAmt, colVisitAccumAmt, colVisitGoosNm;

//***************************************************************************************************
//***************************************************************************************************
// Event > addEventListener
//***************************************************************************************************
//***************************************************************************************************

// Event load of document
window.addEventListener("load", function() {	// This function could be define a event parameter, i.g., evt
	
});

document.querySelector( '#idStorNm' ).addEventListener("keyup", function() {	// This function could be define a event parameter, i.g., evt
	clearStorInfo( true );	// Clear data.
});
document.querySelector( 'input[name="telNo"]' ).addEventListener("keyup", function() {	// This function could be define a event parameter, i.g., evt
	clearStorInfo( true );	// Clear data.
});
document.querySelector( '#isVisited' ).addEventListener("change", function() {	// This function could be define a event parameter, i.g., evt
	clearStorInfo( true );	// Clear data.
});

//***************************************************************************************************
//***************************************************************************************************
// Function
//***************************************************************************************************
//***************************************************************************************************

// Call after document loaded.
function init() {
	document.querySelector( "#idCoupSum"  ).value = coupSum 	+ " 장 적립";
	document.querySelector( "#idPointSum" ).value = pointSum	+ " 점 적립";
}

// Search store information.
// isMore : true 	= View more.
//			false 	= Search.
// sType : 	''		= Search in the search area.
// 			coupon	= My coupon click.
//			point	= My point click.
function searchStore( isMore, sType ) {
	searchType = sType;
	
	if( !isMore ) {
		clearStorInfo( true );	// Clear data.
	}
	
	// Validation of phone number.
	if( !chkPhoneNo( "telNo", false ) ) {
			showComModal( {msg:"매장 전화번호를 확인해 주세요.",closeCallbackFnc:function(){ document.querySelector( 'input[name="telNo"]' ).focus() }} );
			return;
	}
		
	// Send ajax data.
	ajaxSend( "./findStore.json" 
			, {   telNo		: document.querySelector( 'input[name="telNo"]' ).value
				, storNm	: document.querySelector( "#idStorNm" ).value
				, isVisited : document.querySelector( "#isVisited" ).checked
				, pageNo	: ( isMore ? ++pageStorNo : firstPageNo )
				, sType		: sType
			  }
			, searchStoreAft );
}

// Clear data.
function clearStorInfo( isAll ) {
	searchType = "";
	if( isAll ) {
		// Clear store list.
		pageStorNo			= firstPageNo;
		var trs 	= document.querySelectorAll( '#idStorTbl > tbody > tr' );
		for( var i = 0; i < trs.length; i++ ) {
			trs[i].remove();
		}
	}
	
	pageVisitNo			= firstPageNo;
	clickedCmStorSeq 	= "";	
	
	// Hide store visit history and goods gift information.
	document.querySelector( "#idStorInfo" )				.style.display = "none";
	document.querySelector( "#idStorInfoMoreBtnDiv" )	.style.display = "none";
	
	// Clear store's coupon gift list.
	trs 	= document.querySelectorAll( '#idGoosTbl > tbody > tr' );
	for( var i = 0; i < trs.length; i++ ) {
		trs[i].remove();
	}
	
	// Clear visit history list.
	trs 	= document.querySelectorAll( '#idVisitTbl > tbody > tr' );
	for( var i = 0; i < trs.length; i++ ) {
		trs[i].remove();
	}
	
}

// Call if the find store ajax communication is succeeded.
function searchStoreAft( responseText ) {
	
	if( responseText != NOT_EXIST_DATA ) {
		// Fill searched data.
		viewStor( JSON.parse(responseText) );
	} else {
		// There's no data. 
		showComModal( {msg:"조회 내역이 없습니다"} );
	  	return false;
	}
}

// Display store list.
function viewStor( rData ) {	
	if( rData.data ) {		
		
		for( var i = 0; i < rData.data.length; i++ ) {
			storAdd(  getDataByProjection( rData, "cmStorSeq"	, i )
					, getDataByProjection( rData, "storNm" 		, i )
					, getDataByProjection( rData, "savTp" 		, i )
					, getDataByProjection( rData, "visitDtm" 	, i )
					, getDataByProjection( rData, "accumAmt" 	, i )
					, getDataByProjection( rData, "addrPt1", i) + " " + getDataByProjection( rData, "addrPt2", i ) + " " + getDataByProjection( rData, "addrDtl", i )
			);
		}
	}
}

// Display more store list.
function viewStoreMore() {
	// Send ajax data.
	ajaxSend( "./findStore.json" 
			, {   telNo		: document.querySelector( 'input[name="telNo"]' ).value
				, storNm	: document.querySelector( "#idStorNm" ).value
				, isVisited : document.querySelector( "#isVisited" ).checked
			  }
			, searchStoreAft );
}

// The function of store list add.
function storAdd( cmStorSeq, storNm, savTp, visitDtm, accumAmt, addr ) {

	nStorRow = tblStorBody.insertRow(), colStorNm = nStorRow.insertCell(), colStorLastVisitDt = nStorRow.insertCell(), colStorSav = nStorRow.insertCell(), colStorAddr = nStorRow.insertCell();
	
	colStorNm			.className	= "text-center";
	colStorLastVisitDt	.className 	= "text-center";
	colStorSav			.className 	= "text-right";
	colStorAddr			.className 	= "text-left";
	
	colStorNm			.style.whiteSpace = "nowrap";	// make horizontal scroll in long text.
	colStorAddr			.style.whiteSpace = "nowrap";	// make horizontal scroll in long text.
	
	// click event : Get store detail information. 
	nStorRow.onclick = function() {
		clearStorInfo( false );
		
		document.querySelector( "#idClickedStorNm" ).textContent = storNm;		
		document.querySelector( "#idStorSavImg" ).src = ( savTp == "C" ? "../../img/mycoup/stamp.gif" : "../../img/mycoup/point.gif" );
		
		// Show store visit history and goods gift information.
		document.querySelector( "#idStorInfo" )				.style.display = "";
		document.querySelector( "#idStorInfoMoreBtnDiv" )	.style.display = "";
		
		clickedCmStorSeq = cmStorSeq;
		ajaxSend( "./findStoreInfo.json" 
				, {   cmStorSeq	: clickedCmStorSeq }
				, getStorInfoAft );
	}
	
	colStorNm 			.innerHTML = '<td>' + storNm 					+ '</td>';
	colStorLastVisitDt 	.innerHTML = '<td>' + toDateFormat( visitDtm )	+ '</td>';
	colStorSav			.innerHTML = '<td>' + toNumWithSep( accumAmt )	+ '</td>';
	colStorAddr 		.innerHTML = '<td>' + addr 						+ '</td>';
}


// Call if the find store detail information ajax communication is succeeded.
function getStorInfoAft( responseText ) {
	
	// Goods information.
	var rData = JSON.parse(responseText).cmGoos;
	var savTp = "C";
	
	for( var i = 0; i < rData.length; i++ ) {
		console.log( rData[0].cmStor.savTp );
		nGoosRow = tblGoosBody.insertRow(), colGoosSavAmt = nGoosRow.insertCell(), colGoosGoosNm = nGoosRow.insertCell(), colGoosRmks = nGoosRow.insertCell();
		
		colGoosSavAmt	.className	= "text-right";
		colGoosGoosNm	.className	= "text-left";
		colGoosRmks		.className	= "text-left";
		
		colGoosGoosNm	.style.whiteSpace = "nowrap";	// make horizontal scroll in long text.
		colGoosRmks		.style.whiteSpace = "nowrap";	// make horizontal scroll in long text.
		
		colGoosSavAmt	.innerHTML = '<td>' + toNumWithSep( rData[i].savAmt )	+ '</td>';
		colGoosGoosNm	.innerHTML = '<td>' + rData[i].goosNm					+ '</td>';
		colGoosRmks		.innerHTML = '<td>' + rData[i].rmks						+ '</td>';
	}
	
	// Visit history.
	rData = JSON.parse(responseText).chVisit;
	
	if( rData.length > 0 ) {
		if( rData[0].cmStor.savTp == "P" ) {
			savTp = "P";
		}
		document.querySelector( "#idStorSavImg" ).style.display = "";
		document.querySelector( "#idStorSavAmt" ).innerHTML = "&nbsp;" + toNumWithSep( rData[0].accumAmt ) + ( savTp == "C" ? "장" : "점" );
	} else {
		document.querySelector( "#idStorSavImg" ).style.display = "none";
		document.querySelector( "#idStorSavAmt" ).innerHTML = "&nbsp;";
	}
	
	for( var i = 0; i < rData.length; i++ ) {		
		addVisitHistory( rData[i].visitDtm, rData[i].useTp, rData[i].useAmt, rData[i].savAmt, rData[i].accumAmt, rData[i].goosNm );
	}
	
}

// Add visit history table.
function addVisitHistory( visitDtm, useTp, useAmt, savAmt, accumAmt, goosNm ){
	nVisitRow = tblVisitBody.insertRow(), colVisitVisitDtm = nVisitRow.insertCell(), colVisitUseTp = nVisitRow.insertCell(), colVisitSavUseAmt = nVisitRow.insertCell(), colVisitAccumAmt = nVisitRow.insertCell(), colVisitGoosNm = nVisitRow.insertCell();
	
	colVisitVisitDtm	.className	= "text-center";
	colVisitUseTp		.className	= "text-center";
	colVisitSavUseAmt	.className	= "text-right";
	colVisitAccumAmt	.className	= "text-right";
	colVisitGoosNm		.className	= "text-left";
			
	colVisitGoosNm		.style.whiteSpace = "nowrap";	// make horizontal scroll in long text.
	
	colVisitVisitDtm 	.innerHTML = '<td>' + toDateFormat( visitDtm )				+ '</td>';
	colVisitUseTp  		.innerHTML = '<td>' + ( useTp == "U" ? "사용" : "적립" )	+ '</td>';
	colVisitSavUseAmt	.innerHTML = '<td>' + ( useTp == "U" ? toNumWithSep( useAmt ) : toNumWithSep( savAmt ) ) + '</td>';
	colVisitAccumAmt	.innerHTML = '<td>' + toNumWithSep( accumAmt )				+ '</td>';
	colVisitGoosNm		.innerHTML = '<td>' + toBlank( goosNm )						+ '</td>';
	
	if( useTp == "U" ) {	// Change display color that used type.
		colVisitUseTp.style.color = "red";
	}
}

// Get more data of visit history.
function viewMoreVisitHistory() {
	ajaxSend( "./findMoreVisit.json" 
			, {   cmStorSeq		: clickedCmStorSeq
				, pageNo 		: ++pageVisitNo
			  }
			, viewMoreVisitHistoryAft );
}

//  Call if the view of more history ajax communication is succeeded.
function viewMoreVisitHistoryAft( responseText ) {
	
	if( responseText != NOT_EXIST_DATA ) {
		debugObj = JSON.parse(responseText);
		
		rData = JSON.parse(responseText).chVisit;
		for( var i = 0; i < rData.length; i++ ) {
			addVisitHistory( rData[i].visitDtm, rData[i].useTp, rData[i].useAmt, rData[i].savAmt, rData[i].accumAmt, rData[i].goosNm );
		}		
	} else {
		// There's no data. 
		showComModal( {msg:"조회 내역이 없습니다"} );
		return false;					
	}
	
}

/*
// Click my coupon, find store list that exist coupon to use.
function findCoupStor() {
	clearStorInfo( true );	// Clear data.
	ajaxSend( "./findCoupStor.json" 
			, {   cmStorSeq		: clickedCmStorSeq
				, pageNo 		: ++pageVisitNo
			  }
			, findCoupStorAft );	
}
*/