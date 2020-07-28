// Constant variables in page scope
var pageVisitNo			= firstPageNo;
var clickedCmStorSeq 	= "";

var markerMe;
var zoomLvl = 15;
var HOME_PATH = window.HOME_PATH || '.';

//Relational variables of the goods table.
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
window.addEventListener("load", function(evt) {
	if (navigator.geolocation) {
        /**
         * navigator.geolocation 은 Chrome 50 버젼 이후로 HTTP 환경에서 사용이 Deprecate 되어 HTTPS 환경에서만 사용 가능 합니다.
         * http://localhost 에서는 사용이 가능하며, 테스트 목적으로, Chrome 의 바로가기를 만들어서 아래와 같이 설정하면 접속은 가능합니다.
         * chrome.exe --unsafely-treat-insecure-origin-as-secure="http://example.com"
         */
        navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
    } else {
        var center = map.getCenter();
        infowindow.setContent('<div style="padding:5px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
        infowindow.open(map, center);
    }
	
});

//***************************************************************************************************
//***************************************************************************************************
// Function
//***************************************************************************************************
//***************************************************************************************************
var map = new naver.maps.Map('map', {
    //center: new naver.maps.LatLng(37.5666805, 126.9784147),
    zoom: zoomLvl,
    mapTypeId: naver.maps.MapTypeId.NORMAL
});

var infowindow = new naver.maps.InfoWindow();
var markers 	= [];
var storInfos 	= [];

// Set marker at my location.
function onSuccessGeolocation(position) {
    var location = new naver.maps.LatLng(position.coords.latitude,
                                         position.coords.longitude);

    map.setCenter(location); 	// 얻은 좌표를 지도의 중심으로 설정합니다.
    map.setZoom(zoomLvl); 		// 지도의 줌 레벨을 변경합니다.

    markerMe = new naver.maps.Marker({
        position: new naver.maps.LatLng( position.coords.latitude, position.coords.longitude ),
        map: map,
        icon: {
    		content:[
    					'<img src="' + HOME_PATH +'/../../img/mycoup/map-marker-me_1.png" width="35em" height="35em" style="filter: opacity(60%);"/>'
    		].join(''),
    		anchor: new naver.maps.Point(15, 26)
	    }
    });
    
    // call store location list
    ajaxSend( "./findStoreLocation.json" 
			, {}
			, findStoreLocationAft );
    
}
// Failed to get my location.
function onErrorGeolocation() {
    var center = map.getCenter();

    infowindow.setContent('<div style="padding:5px;">' + '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5></div>');	
    infowindow.open(map, center);
}

// Response of finding store location list by ajax.
function findStoreLocationAft( responseText ) {
	
	var rData = JSON.parse(responseText);
	rData.forEach( function( item, idx, arr ){
		if( chkNull( item.mapLat ) && chkNull( item.mapLng ) ) {
			// marker
			var marker = new naver.maps.Marker({
			    position: new naver.maps.LatLng( item.mapLat, item.mapLng ),
			    map: map
			});
			
			markers.push( marker );
			storInfos.push( {cmStorSeq:item.cmStorSeq, storNm:item.storNm, savTp:item.savTp} );
			//naver.maps.Event.addListener( markers[idx], 'click', getClickHandler(idx) );
			//naver.maps.Event.addListener(markers[idx], 'click', function(idx) {});
		}
		
	});
	
	// Event handler regist.
	// Certainly fullfill below format. or not work properly. naver sample : navermap3.html
	for (var i=0, ii=markers.length; i<ii; i++) {
	    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));	    
	}

}

// Marker click event.
function getClickHandler(seq) {
    return function(e) {
    	
    	clearStorInfo();	// Clear data.
		
		document.querySelector( "#idClickedStorNm" ).textContent = storInfos[ seq ].storNm;		
		document.querySelector( "#idStorSavImg" ).src = ( storInfos[ seq ].savTp == "C" ? "../../img/mycoup/stamp.gif" : "../../img/mycoup/point.gif" );
		
		// Show store visit history and goods gift information.
		document.querySelector( "#idStorInfo" )				.style.display = "";
		document.querySelector( "#idStorInfoMoreBtnDiv" )	.style.display = "";
		
    	clickedCmStorSeq = storInfos[ seq ].cmStorSeq;
		ajaxSend( "./findStoreInfo.json" 
				, {   cmStorSeq	: clickedCmStorSeq }
				, getStorInfoAft );
    }
}

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
		document.querySelector( "#idStorSavAmt" ).innerHTML 	= "&nbsp;" + toNumWithSep( rData[0].accumAmt ) + ( savTp == "C" ? "장" : "점" );
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