// Constant variables in page scope
var pageVisitNo			= firstPageNo;
var clickedCmStorSeq 	= "";

// Varaiables about google map
var zoomLvl 	= 15;
var map;


var HOME_PATH = window.HOME_PATH || '.';

//Relational variables of the goods table.
var tblGoosIdx 	= 0;
var tblGoosBody	= document.querySelector( '#idGoosTbl > tbody' );
var nGoosRow, colGoosSavAmt, colGoosGoosNm, colGoosRemk;

// Relational variables of the visit hisroty table.
var tblVisitIdx 	= 0;
var tblVisitBody	= document.querySelector( '#idVisitTbl > tbody' );
var nVisitRow, colVisitVisitDtm, colVisitUseTp, colVisitSavUseAmt, colVisitAccumAmt, colVisitGoosNm;

//***************************************************************************************************/
//***************************************************************************************************/
// Event > addEventListener
//***************************************************************************************************/
//***************************************************************************************************/
// Event load of document
window.addEventListener("load", function() { // This function can define a event parameter. i.g., evt
	if( canLoadGooglemap ) {
		grecaptcha.ready(function() {
			grecaptcha.execute(recaptchaSiteKey, {action: 'submit'}).then(function(token) {
				// Add your logic to submit to your backend server here.
				ajaxSend( "./saveAroundGoogleMapLoadCntInc.json"
						, { recaptchaToken : token }
						, initMap );	// Call google map api.
			});
		});
	} else {
		// 오늘의 구글 지도 서비스가 종료되었습니다.<br/>쿠폰(포인트)함 메뉴로 검색 해 주세요.<br/>후원금은 대부분 구글 지도 서비스에 사용되고 있습니다
		showComModal( {type:"info",msg:mLang.get("todaygooglemapserviceexpired_br")
										,closeCallbackFnc:function(){ location.href = window.location.protocol + "//" + window.location.hostname + "/mycoup/mycoupList.do"; } } );		
	}
	
});

//***************************************************************************************************/
//***************************************************************************************************/
// Event > Google map
//***************************************************************************************************/
//***************************************************************************************************/

// Markers search range - Latitude : ± 0.015000, Longitude : ± 0.035000
// Search length is about 5 km diameter.

// Initialize and add the map
function initMap( responseText ) {
	if( responseText == RECAPTCHA_SUCCESS ) {
		if (navigator.geolocation) {
			/**
			 * navigator.geolocation 은 Chrome 50 버젼 이후로 HTTP 환경에서 사용이 Deprecate 되어 HTTPS 환경에서만 사용 가능 합니다.
			 * http://localhost 에서는 사용이 가능하며, 테스트 목적으로, Chrome 의 바로가기를 만들어서 아래와 같이 설정하면 접속은 가능합니다.
			 * chrome.exe --unsafely-treat-insecure-origin-as-secure="http://example.com"
			 */
			navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
		} else {		        
			onErrorGeolocation();
		}
	} else {
		// 자동화된 접근으로 판단됩니다.<br/>해당 메뉴는 이용하실 수 없습니다.<br/>쿠폰(포인트)함 메뉴로 검색 해 주세요.<br/>후원금은 대부분 구글 지도 서비스에 사용되고 있습니다
		showComModal( {type:"warning",msg:mLang.get("autoaccessdeniedyoucantusethismenu_br")
									,closeCallbackFnc:function(){ goMain(); } } );
	}
	
}

// Set marker my location
function onSuccessGeolocation( position ) {
	var curPos = { lat: position.coords.latitude, lng: position.coords.longitude };
	
	map = new google.maps.Map(
		document.getElementById( 'map' ), {zoom: zoomLvl, center: curPos }
	);
	
	var imgMe = {
		url: '/img/mycoup/map-marker-me_1.png',
		// This marker is 20 pixels wide by 32 pixels high.
		//size: new google.maps.Size(20, 32),
		scaledSize: new google.maps.Size(35, 35),
		// The origin for this image is (0, 0).
		origin: new google.maps.Point(0, 0),
		// The anchor for this image is the base of the flagpole at (0, 32).
		anchor: new google.maps.Point(0, 32)
	};
	
	// set marker of me
	new google.maps.Marker({position: curPos, map: map, icon: imgMe, opacity: 0.6 });
	
	// call store location list
	ajaxSend( "./findStoreLocation.json" 
		, {lat: curPos.lat, lng: curPos.lng}
		, findStoreLocationAft );

}		

// Response of finding store location list by ajax.
function findStoreLocationAft( responseText ) {
	
	var rData = JSON.parse(responseText);

	// set multimarkers
	rData.forEach( function( item, idx ){ // This function can define 3rd parameter. i.g., arr

		if( chkNull( item.mapLat ) && chkNull( item.mapLng ) ) {
		
			let marker = new google.maps.Marker({
				position: {lat: Number( item.mapLat ), lng: Number( item.mapLng ) },
				map: map,
				title: item.storNm,
				zIndex: idx
			});
			
			// add event
			attachClickEvent( marker, item.cmStorSeq, item.storNm, item.savTp );

		}

	});

}

function attachClickEvent( marker, cmStorSeq, storNm, savTp ) {
	marker.addListener("click", function() {
		
		clearStorInfo();	// Clear data.
		
		document.querySelector( "#idClickedStorNm" ).textContent = storNm;		
		document.querySelector( "#idStorSavImg" ).src = ( savTp == "C" ? "../../img/mycoup/stamp.gif" : "../../img/mycoup/point.gif" );
		
		// Show store visit history and goods gift information.
		document.querySelector( "#idStorInfo" )				.style.display = "";
		document.querySelector( "#idStorInfoMoreBtnDiv" )	.style.display = "";
		
		clickedCmStorSeq = cmStorSeq;
		
		ajaxSend( "./findStoreInfo.json" 
				, {   cmStorSeq	: clickedCmStorSeq }
				, getStorInfoAft );

	});
}

// Failed to get my location.
function onErrorGeolocation() {
	// TODO Print message of error to Not supported location service in this device.
	// 현재 위치를 인식할 수 없습니다.<br/>쿠폰(포인트)함 메뉴로 검색 해 주세요.<br/>후원금은 대부분 구글 지도 서비스에 사용되고 있습니다
	showComModal( {type:"info",msg:mLang.get("cantrecognizecurrentlocation_br")
							  ,closeCallbackFnc:function(){ location.href = window.location.protocol + "//" + window.location.hostname + "/mycoup/mycoupList.do"; } } );			
}

//***************************************************************************************************/
//***************************************************************************************************/
// Function
//***************************************************************************************************/
//***************************************************************************************************/

//Clear data.
function clearStorInfo() {
	
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

//Call if the find store detail information ajax communication is succeeded.
function getStorInfoAft( responseText ) {
	
	// Goods information.
	var rData = JSON.parse(responseText).cmGoos;
	var savTp = "C";
	
	for( var i = 0; i < rData.length; i++ ) {
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
		document.querySelector( "#idStorSavAmt" ).innerHTML 	= "&nbsp;" + toNumWithSep( rData[0].accumAmt ) 
																	+ ( savTp == "C" ? mLang.get("numberqty") : mLang.get("pointquantitiesunit") );	// "장" : "점"
	} else {
		document.querySelector( "#idStorSavImg" ).style.display = "none";
		document.querySelector( "#idStorSavAmt" ).innerHTML 	= "&nbsp;";
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
	
	colVisitVisitDtm 	.innerHTML = '<td>' + toDateFormat( visitDtm )												+ '</td>';
	colVisitUseTp  		.innerHTML = '<td>' + ( useTp == "U" ? mLang.get("use") : mLang.get("save") )				+ '</td>';	// "사용" : "적립"
	colVisitSavUseAmt	.innerHTML = '<td>' + ( useTp == "U" ? toNumWithSep( useAmt ) : toNumWithSep( savAmt ) ) 	+ '</td>';
	colVisitAccumAmt	.innerHTML = '<td>' + toNumWithSep( accumAmt )												+ '</td>';
	colVisitGoosNm		.innerHTML = '<td>' + toBlank( goosNm )														+ '</td>';
	
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

function viewMoreVisitHistoryAft( responseText ) {
	
	if( responseText != NOT_EXIST_DATA ) {
		debugObj = JSON.parse(responseText);
		
		rData = JSON.parse(responseText).chVisit;
		for( var i = 0; i < rData.length; i++ ) {
			addVisitHistory( rData[i].visitDtm, rData[i].useTp, rData[i].useAmt, rData[i].savAmt, rData[i].accumAmt, rData[i].goosNm );
		}		
	} else {
		// There's no data. 
		showComModal( {msg:mLang.get("nosearchdata")} );	// 조회 내역이 없습니다
		return false;					
	}
	
}