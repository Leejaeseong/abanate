/**********************************************************************************************************
 **********************************************************************************************************
 * Define constant variables in page scope
 **********************************************************************************************************
 **********************************************************************************************************/
var debugObj 			= new Object();			// For debug.
var xhr 				= new XMLHttpRequest();	// For ajax communication.
var DATESEPERATOR 		= ".";					// Date seperator mark. 
var NOT_EXIST_DATA		= "Not exist data";		// If would change this value then ConstUtil.java is changed too.
var RECAPTCHA_SUCCESS	= "Recaptcha success";	// If would change this value then ConstUtil.java is changed too.
var IS_LOADING			= false;				// For loading spinner switch.
var COOKIE_VALID_DAYS 	= 30;					// Days of cookie saving.

/**********************************************************************************************************
 **********************************************************************************************************
 * Group about setting common values.
 **********************************************************************************************************
 **********************************************************************************************************/
/**
 * Default options of flatpickr.
 * @params 	idNm		: ID name to find flatpickr's applied object.
 * 			dateCalc	: The days to do calculate.
 * @returns
 */
function flatpickrDefault( idNm, calcDays ) {
	return {
			locale: {
			    firstDayOfWeek: 0,	// Set start week to sunday.
			    weekdays: {
			      shorthand: ["일", "월", "화", "수", "목", "금", "토"],
			      longhand:  ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"]         
			    }, 
			    months: {
			      shorthand: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			      longhand:  ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
			    }
			}
			, dateFormat:"Y-m-d"
			, defaultDate:new Date().setDate( new Date().getDate() + ( calcDays?calcDays:0 ) )
			, onReady: function(){ // It can be parameters that "selectedDates, dateStr, instance"
				document.querySelector( "#" + idNm ).style.width="6.5em"
			}
	};
}

// Get browser default language
// If language is Korea, then return "ko-KR"
function getLanguage() {
	return navigator.language || navigator.userLanguage;
}

// Get browser default national code
function getNation( lang ) {
	if( getCookie( "natiCd" ) ) {
		return getCookie( "natiCd" );
	} else if( lang == "ko-KR" ) {
		return "KR";
	} else {
		return getLanguage().substr( 3, 2 );
	}	
}

// Check whether korea.
function isKorea( lang ) {
	if( lang && lang == "ko-KR" ) return true; 
	if( !lang && getLanguage == "ko-KR" ) return true;
	else return false;
}

// Set cookie
var setCookie = function(name, value, day, path) {
	if( !path ) path = "/";
    var date = new Date();
	date.setTime(date.getTime() + day * 60 * 60 * 24 * 1000);
	document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=' + path;
	//document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/;SameSite=none;Secure';
};

// Get cookie
var getCookie = function(name) {
    var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    return value? value[2] : null;
};

// Remove cookie
var deleteCookie = function(name, path) {
	if( !path ) path = "/";
    var date = new Date();
    document.cookie = name + "= " + "; expires=" + date.toUTCString() + "; path=" + path;
}


/**********************************************************************************************************
 **********************************************************************************************************
 * Group about web control
 **********************************************************************************************************
 **********************************************************************************************************/
/**
 * Move to main page.
 * @returns
 */
function goMain() {
	location.href = window.location.protocol + "//" + window.location.hostname + "/";
}
/**
 * Move to login.
 * @returns
 */
function goLogin() {
	location.href = window.location.protocol + "//" + window.location.hostname + "/mycoup/login.do";
}
/**
 * Move to logout.
 * @returns
 */
function goLogout() {
	location.href = window.location.protocol + "//" + window.location.hostname + "/mycoup/logout.do";
}


/**
 * Display message before move to main page.
 * @returns
 */
function goMainAfterMessage() {
	showComModal( {type:"error",msg:"오류가 발생하였습니다<br/>메인화면으로 이동합니다",closeCallbackFnc:function(){ goMain(); } } );
}

function ajaxSend( url, data, succeedFnc ) {
	loading( true );	// Show loading layer.

   	xhr.open("POST", url, true);
   	xhr.setRequestHeader('Content-Type', 'application/json'); 	// Content type to json
   	xhr.send(JSON.stringify( data )); 							// Send data by use stringify function
	xhr.onreadystatechange = function() {
		
    	if (this.readyState == 4 && this.status == 200) {
    		//setTimeout(function() { loading( false ); },500)
    		
			loading( false );	// Hide loading layer.
			
    		// The common line about the authentification check.
    		if( this.responseText == "authentification is failed" ) { goMainAfterMessage(); return false; } // Move to main page if authentification is failed
    		
    		succeedFnc( this.responseText );
       	} else if (this.readyState == 4 && this.status != 200) {
       		loading( false );	// Hide loading layer.
       		showComModal( {type:"error",msg:"오류가 발생하였습니다<br/>관리자에게 문의 부탁드립니다",closeCallbackFnc:function(){ goMain(); } } );
       	} else {
       		loading( false );	// Hide loading layer.
       	}
   	};
}

/** attach nation code list to option tag in select tag. */
function addNatiCd( natiCd, natiNmKor, natiNmEng, tagName ) {

	var opt 	= new Option();
	opt.value 	= natiCd;
	opt.text 	= ( isKorea( usrLang ) ? natiNmKor : natiNmEng );
	if( tagName ) {
		document.querySelector( 'select[name="' + tagName + '"]' ).add( opt );
	} else {
		document.querySelector( 'select[name="natiCd"]' ).add( opt );
	}

}

/**********************************************************************************************************
 **********************************************************************************************************
 * Group about check utilities
 **********************************************************************************************************
 **********************************************************************************************************/
/**
 * Check whether device is mobile
 * @returns true 	: a mobile
 * 			false 	: not a mobile
 */
function chkMobile() {
	return /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
}

/**
 * Check null,blank,undefined by trimmed string
 * @returns true : is not null or not blank
 * 			false : is null or blank
 */
function chkNull( str ) {
	if( str == undefined || str == null ) {
		return false;
	} else if( typeof str == "string" && str.trim() == "" ) {
		return false;
	} else {		
		return true;
	}
}

/**
 * Validation phone numbers
 //* @param id1		Input form id of phone number#1 → phone number fields is integrated to one field.
 //* @param id2		Input form id of phone number#2
 //* @param id3		Input form id of phone number#3
 * @param pNumber	Input form name of number to check.
 * @param isRequire	Check necessariness
 * @returns			true 	: Validation successed.
 * 					false	: Validation failed.
 */
//function chkPhoneNo( id1, id2, id3, isRequire ) {
function chkPhoneNo( pNumber, isRequire ) {
	// If required option is true or filled at least in one form.
	/*
	if( isRequire || ( chkNull( document.querySelector( '#phone1' ).value ) || chkNull( document.querySelector( '#phone2' ).value ) || chkNull( document.querySelector( '#phone3' ).value ) ) ) {
		if( !chkNull( document.querySelector( '#'+id1 ).value ) || !chkNull( document.querySelector( '#'+id2 ).value ) || !chkNull( document.querySelector( '#'+id3 ).value ) ) {
			return false;			
		}
		if( isNaN( document.querySelector( '#'+id1 ).value ) || isNaN( document.querySelector( '#'+id2 ).value ) || isNaN( document.querySelector( '#'+id3 ).value ) ) {
			return false;
		}
		if( ( document.querySelector( '#'+id1).value.length < 2 || document.querySelector( '#'+id2 ).value.length < 3 || document.querySelector( '#'+id3 ).value.length < 4 ) ) {
			return false;
		}
	}
	*/
	if( isRequire ) {
		if( !chkNull( document.querySelector( 'input[name="' + pNumber + '"]').value ) ) {
			return false;
		} else if( isNaN( document.querySelector( 'input[name="' + pNumber + '"]').value ) ) {
			return false;
		} else {
			return true;
		}		
	} else {
		// If there is a value and not a number, then check fail.
		if( chkNull( document.querySelector( 'input[name="' + pNumber + '"]').value ) && isNaN( document.querySelector( 'input[name="' + pNumber + '"]').value ) ) {
			return false;
		} else {
			return true;
		}
	}
	
}

/**********************************************************************************************************
 **********************************************************************************************************
 * Group about convert utilities
 **********************************************************************************************************
 **********************************************************************************************************/
/**
 * Convert to blank if parameter string is null or undefined
 * @param str
 * @returns
 */
function toBlank( str ) {
	if( str == undefined || str == null ) {
		return "";
	} else {		
		return str;
	}
}

/**
 * Insert date seperator mark into parametered string. 
 * @returns	If length is less than eight then return "-" text. or return concatenated text with separate format character.
 */
function toDateFormat( str ) {
	if( !chkNull( str ) || str.length < 8 ) return "-";
	return str.substring( 0, 4 ) + DATESEPERATOR + str.substring( 4, 6 ) + DATESEPERATOR + str.substring( 6, 8 ); 
}

/**
 * Convert to number with thousands seperator
 * @param number
 * @returns
 */
function toNumWithSep( number ) {
	if( !chkNull( number ) ) return 0;
	return new Intl.NumberFormat().format( number );
}

/**
 * Convert Id to cell phone format.
 */
function toPhoneFormat( str ) {
	return str;	// Disable format convert of phone number. Because this site will use in international regions.
	/*
	if( chkNull( str ) ) {
		if( str.length == 11 ) {
			return str.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
		} else if( str.length == 10 ) {
			if( str.substring( 0, 2 ) == "01" ) {
				return str.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');				
			} else {
				return str.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
			} 
		} else if( str.length == 9 ) {
			return str.replace(/(\d{2})(\d{3})(\d{4})/, '$1-$2-$3');
		} else {
			return str;
		}
	} else {
		return "";
	}
	*/
}

/**
 * Get data by projection
 * @param rData	Map key data 		: list
 * 					key projection 	: projection information, Map<Key, projection position>
 * @param pKey projection name.
 * @param idx data row position. If undefined then handle "list" as object instead of not a list 
 * @returns
 */
function getDataByProjection( rData, pKey, idx ) {
	let list 		= rData.data;
	let projection 	= rData.projection;
	if( !chkNull( idx ) ) {
		idx = 0;
	}
	
	//console.log( "list[ idx ][ projection[pKey] ]", list[ idx ][ projection[pKey] ] );
	return list[ idx ]["a"][ projection[pKey] ];
	/*
	if( idx ) {	// Handle as a list.
		return list[ idx ][ projection[pKey] ];		
	} else {	// Handle as a object.
		console.log( "list", list );
		console.log( "projection[pKey]", projection[pKey] );
		console.log( "list[ projection[pKey]", list[ projection[pKey] ] );
		return list[ projection[pKey] ];
	}
	*/
}