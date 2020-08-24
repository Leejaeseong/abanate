<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="header.jsp"/>
<jsp:include page="comHeader.jsp"/>
<body>

  <jsp:include page="navigator.jsp"/>

  <form id="idForm" action="./setup.do" method="post">
  <!--Main layout-->
  <main>

    <!-- 상단 공백 -->
    <p class="my-4">&nbsp;</p>

    <div class="container bg-primary">
      <h1>        
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-clipboard-check"></i> <!--쿠폰(포인트) 설정-->${mLang["nav_setup"]}</span>        
      </h1>
    </div>

    <div class="container">

      <div class="row wow fadeIn border border-dark justify-content-center">

        <div class="w-100">&nbsp;</div> <!-- top space of regist border -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-filter"></i>
        </div>                  
        <div class="col-4 text-left mt-2">
          <label><!--적립 구분-->${mLang["savetype"]}</label>
        </div>
        <div class="col form-inline text-center">
          <select class="form-control form-control-sm disabled" name="savTp" style="width:12em;">
            <option value="C" selected><!--쿠폰-->${mLang["coupon"]}</option>
            <option value="P" ><!--포인트-->${mLang["point"]}</option>
          </select>
        </div>
        
        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-hourglass-end"></i>
        </div>                  
        <div class="col-4 text-left mt-2">
          <label><!--적립 제한-->${mLang["savelimit"]}</label>
        </div>
        
        <div class="col align-self-center pl-3">
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="savLimitAmtRdo" id="savLimitAmtRdo1" value="N">
            <label class="form-check-label" for="savLimitAmtRdo1"><!--없음-->${mLang["noexist"]}</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="savLimitAmtRdo" id="savLimitAmtRdo2" value="Y">
            <input type="number" min="0" class="form-control" name="savLimitAmt" style="width:5.1em;">
          </div>
        </div>

        <div class="w-100">&nbsp;</div> <!-- bottom space of regist border -->

      </div> <!-- end of border -->

      <div class="w-100">&nbsp;</div> <!-- space between border -->

      <div class="row wow fadeIn border border-dark justify-content-center">

        <div class="row w-100">
          <h4 class="w-100 bg-primary"><span class="badge badge-success w-100"><!--상품 설정-->${mLang["setupgoods"]}</span></h4>
        </div>

        <div class="text-right w-100">
          <button type="button" class="btn btn-primary btn-sm" onclick="add();"><!--추가-->${mLang["add"]} <i class="fas fa-sign-in-alt"></i></button>
          <button type="button" class="btn btn-danger btn-sm"  onclick="del();"><!--삭제-->${mLang["del"]} <i class="far fa-trash-alt"></i></button>
        </div>

        <div class="table-responsive-sm">
          <table id="idGoosTbl" class="table table-striped table-bordered table-sm table-nowrap" style="table-layout: fixed;">
            <thead class="thead-light">
              <tr>
                <th scope="col" class="text-center" style="white-space:nowrap; width:10%;"><!--선택-->${mLang["choice"]}</th>
                <th scope="col" class="text-center" style="white-space:nowrap; width:25%;"><!--수-->${mLang["qty"]}(<!--포인트-->${mLang["point"]})</th>
                <th scope="col" class="text-center" style="white-space:nowrap; width:40%;"><!--상품-->${mLang["goods"]}</th>
                <th scope="col" class="text-center" style="white-space:nowrap; width:25%;"><!--비고-->${mLang["rmks"]}</th>
              </tr>
            </th>
            <tbody>
            	<!-- Area for tags of tr -->              
            </tbody>
          </table>
        </div>

      </div> <!-- end of border -->

      <div class="w-100">&nbsp;</div> <!-- space between border -->
      
      <div class="col text-center">
        <button type="button" class="btn btn-primary" onclick="onSave();"><!--적용하기-->${mLang["apply"]} <i class="fas fa-clipboard-check"></i></button>
        <input type="hidden" name="delArr"/>
      </div>

    </div> <!-- end of container -->
    
  </main>
  </form>
  <!--Main layout-->

  <script language="javascript">
  	// Constant variables in page scope
 	var form 	= document.querySelector( '#idForm' );
 	var tblIdx 	= 0;
 	var delSeqs = new Array();
 	var tblBody = document.querySelector( '#idGoosTbl > tbody' );
 	var nRow, cCheck, cAmt, cNm, cRmk, savTp, savLimitAmt;
 	
  	// Event load of document
  	window.addEventListener("load", function(evt) {
  		
  	  	savTp 		= "${sessionScope.cmStor.savTp}";		// Type of save
  	  	savLimitAmt	= "${sessionScope.cmStor.savLimitAmt}";	// Amount of savings limit

  	  	// View values
  	  	form.querySelector( 'input[name="savLimitAmt"]' ).value = savLimitAmt;

  		// Type of saving
  	  	if( savTp == "C" ) {
  	  		form.querySelector( 'select[name="savTp"]' ).value = "C";
  	  	} else if( savTp == "P" ) {
  	  		form.querySelector( 'select[name="savTp"]' ).value = "P";
  	  	}

  		// Limt of saving amount
  	  	if( savLimitAmt == 0 ) {  	  	  	
  	  		form.querySelectorAll( 'input[name="savLimitAmtRdo"]' )[0].checked = true;
  	  	} else if( savLimitAmt > 0 ) {
  	  		form.querySelectorAll( 'input[name="savLimitAmtRdo"]' )[1].checked = true;
  	  	}

  	  	// Call load function of table data
  	  	loadTblDatas();
	});

  	// The function of table data
  	function loadTblDatas() {
	  	<c:forEach var="name" items="${cmGoos}" varStatus="status">
	  	add( ${name.cmGoosSeq}, ${name.savAmt}, "${name.goosNm}", "${name.rmks}" );
		</c:forEach>
  	}

  	// Event click of saving limit amount is zero
  	form.querySelector( '#savLimitAmtRdo1' ).addEventListener( "focus", function( evt ) {
  		form.querySelector( 'input[name="savLimitAmt"]' ).value = 0;
  	} );
  	
  	// Event click of saving limit amount is over zero
  	form.querySelector( 'input[name="savLimitAmt"]' ).addEventListener( "focus", function( evt ) {
  		form.querySelectorAll( 'input[name="savLimitAmtRdo"]' )[1].checked = true;
  	} );

	// The function of add button
	function add( cmGoosSeq, savAmt, goosNm, rmks ) {

		nRow = tblBody.insertRow(), cCheck = nRow.insertCell(), cAmt = nRow.insertCell(), cNm = nRow.insertCell(), cRmk = nRow.insertCell();
		
		cCheck.innerHTML = '    <td class="text-center">'
							+'		<div class="custom-control custom-checkbox">'
							+'			<input type="checkbox" class="custom-control-input" id="idChk' + (tblIdx) + '" value="0"/>'
							+'			<label class="custom-control-label" for="idChk' + (tblIdx++) + '"></label>'
							+'		</div>'
							+'		<input type="number" name="cmGoosSeq" value="' + (cmGoosSeq?cmGoosSeq:"0") + '" hidden/>'
							+'</td>';
		cAmt  .innerHTML = '<td class="text-right">  <input type="number" name="savAmt" class="col-sm-12" min="0" max="9999999999999" value="' + (savAmt?savAmt:"") + '" />	</td>';
		cNm   .innerHTML = '<td class="text-left">   <input type="text"   name="goosNm" class="col-sm-12" maxlength="100"             value="' + (goosNm?goosNm:"") + '"/>	</td>';
		cRmk  .innerHTML = '<td class="text-left">   <input type="text"   name="rmks"   class="col-sm-12" maxlength="100"             value="' + (rmks?rmks:"") + '"/>		</td>';
		
	}

	// The function of delete button
	function del() {
		var delList = document.querySelectorAll( "[id^='idChk']:checked" );
		if( delList.length == 0 ) {
			showComModal( {msg:'${mLang["checkatdelrow"]}'} );	// 삭제할 항목에 체크를 해 주세요
			return false;
		} else {
			for( var i = 0; i < delList.length; i++ ) {
				var delSeq = delList[ i ].parentElement.parentElement.children[1].value;
				if( delSeq == "0" ) {	// If this item was just added, delete with no action					
				} else {				// Else add in array of delete variable
					delSeqs.push( delSeq );
				}
				delList[ i ].parentElement.parentElement.parentElement.remove();					
			}
		}
		console.log( delSeqs );
		form.querySelector( "input[name='delArr']" ).value = delSeqs;
	}
  	
  	// The function of save button
  	function onSave() {
  	  	if( chkBeforeSave() ) {
	  		showComModal( {	  type:"save"
	  	  					, msg:'${mLang["willyousave"]}'	// 저장하시겠습니까?
	  	  					, btn1CallbackFnc:function(){
	  	  	  					form.submit(); 
	  	  	  				 }
						   } );			   
  	  	}
  	}

  	// The function of check data before save
  	function chkBeforeSave() {
  	  	var dataList = form.querySelectorAll( "[id^='idChk']" );

  	  	if( dataList.length == 0 && delSeqs.length == 0 && savLimitAmt == form.querySelector( 'input[name="savLimitAmt"]' ).value) {
	  	  	showComModal( {msg:'${mLang["nodatatosave"]}'} );	// 저장할 항목이 없습니다
			return false;
  	  	} else {
	  	  	for( var i = 0; i < dataList.length; i++ ) {
		  	  	var tAmt 	= form.querySelectorAll( "[id^='idChk']" )[i].parentElement.parentElement.nextElementSibling.children[0];
		  	  	var tGoosNm 	= form.querySelectorAll( "[id^='idChk']" )[i].parentElement.parentElement.nextElementSibling.nextElementSibling.children[0];
		  	  	var tRemk	= form.querySelectorAll( "[id^='idChk']" )[i].parentElement.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.children[0];

		  	  	if( isNaN(tAmt.value) || tAmt.value < 1 || tAmt.value > 999999999999 ) {
		  	  		showComModal( {msg:'${mLang["inputnumberoveroneormore"]}',closeCallbackFnc:function(){ tAmt.focus() }} );	// 숫자로 1 이상 입력해 주세요
		  	  		return false;
			  	} else if( tGoosNm.value == "" ) {
			  		showComModal( {msg:'${mLang["inputgoods"]}',closeCallbackFnc:function(){ tGoosNm.focus() }} );	// 상품을 입력해 주세요
		  	  		return false;
				}

				// Check whether duplicated goods is exist
				for( var j = 0; j < dataList.length; j++ ) {
					if( i != j ) {
						var cTamt 	= form.querySelectorAll( "[id^='idChk']" )[j].parentElement.parentElement.nextElementSibling.children[0];
						if( cTamt.value == tAmt.value ) {
							showComModal( {msg:'${mLang["thereisdupleqty"]}',closeCallbackFnc:function(){ cTamt.focus() }} );	// 중복된 수량이 있습니다
							return false;
						}
					}
				}
		  	}
	  	  	
  	  	}
  	  	return true;
  	}
  	
	</script>
	
<jsp:include page="comFooter.jsp"/>
<jsp:include page="footer.jsp"/>
</body>

</html>