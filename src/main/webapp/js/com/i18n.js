/**********************************************************************************************************
 **********************************************************************************************************
 * Define constant variables in page scope
 **********************************************************************************************************
 **********************************************************************************************************/
let usrLang = "";

// After document load.
window.addEventListener("load", function(evt) {
	
	if( !getCookie( "usrLang" ) ) {
		usrLang = getLanguage();
		setCookie( "usrLang", usrLang, COOKIE_VALID_DAYS );
	} else {
		usrLang = getCookie( "usrLang" );
	}
	
	callTrans();
});

// Translate
function callTrans() {
	// Korean language
	if( isKorea( usrLang ) ) {
		transKorean();
	} else { // English
		transEnglish();
	}
}

// Change language select box.
function changeLanguage( obj ) {
	usrLang = obj.value;
	setCookie( "usrLang", usrLang, COOKIE_VALID_DAYS );
	callTrans();
}

// Korean language
function transKorean() {
	document.querySelector( "#idLanguageSelect" ).value = "ko-KR";
	
	transText( "idTextLogin", "로그인" );
}

// English
function transEnglish() {
	document.querySelector( "#idLanguageSelect" ).value = "English";
	
	transText( "idTextLogin", "Login" );
}

function transText( id, text ) {
	if( document.querySelector( "#" + id ) ) {
		document.querySelector( "#" + id ).textContent = text;
	}
}