<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="header.jsp"/>
<jsp:include page="comHeader.jsp"/>
<body>

  <jsp:include page="navigator.jsp"/>

  <!--Main layout-->
  <main>

    <!-- 상단 공백 -->
    <p class="my-4">&nbsp;</p>

    <div class="container bg-primary">
      <h1>        
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-street-view"></i> <!--내 주변 쿠폰(포인트)-->${mLang["nav_around"]}</span>        
      </h1>
    </div>

    <div class="container">

      <div class="row wow fadeIn border border-dark justify-content-center">
	  	<div id="map" style="width:100%; height:20em;"></div>
      </div> <!-- end of border-->
      
      <div class="w-100">&nbsp;</div> <!-- space between border -->

    <div class="row wow fadeIn border border-dark justify-content-center" id="idStorInfo" style="display:none;">

      <div class="row w-100">
        <h3><span class="badge badge-pill badge-info" style="width:11em;" id="idClickedStorNm">&nbsp;</span></h3>

        <div class="col align-self-center">
          <h5 class="form-inline mt-1">
            <img id="idStorSavImg" src="../../img/mycoup/stamp.gif" class="z-depth-0 img-fluid" style="height: 1em;">
            <small id="idStorSavAmt">&nbsp;</small>
          </h5>
        </div>                    
      </div>
      
      <div class="row w-100">
        <h4 class="w-100 bg-primary"><span class="badge badge-success w-100"><!--상품-->${mLang["goods"]}</span></h4>
      </div>
        
      <div class="table-responsive-sm">
        <table id="idGoosTbl" class="table table-striped table-bordered table-sm table-nowrap">
          <thead class="thead-light">
            <tr>
              <th scope="col" class="text-center" style="white-space:nowrap; width:20%;"><!--적립수-->${mLang["savequnatities"]}</th>
              <th scope="col" class="text-center" style="white-space:nowrap; width:30%;"><!--상품-->${mLang["goods"]}</th>
              <th scope="col" class="text-left" style="white-space:nowrap; width:50%;">&nbsp;&nbsp;&nbsp;<!--소개-->${mLang["introduce"]}</th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>

      <div class="row w-100">
        <h4 class="w-100 bg-primary"><span class="badge badge-success w-100"><!--방문 내역-->${mLang["nav_visithist"]}</span></h4>
      </div>

      <div class="table-responsive-sm">
      	<table id="idVisitTbl" class="table table-striped table-bordered table-sm table-nowrap">
          <thead class="thead-light">
            <tr>
              <th scope="col" class="text-center" style="white-space:nowrap; width:25%;"><!--방문일-->${mLang["visitdate"]}</th>
              <th scope="col" class="text-center" style="white-space:nowrap; width:15%;"><!--구분-->${mLang["type"]}</th>
              <th scope="col" class="text-center" style="white-space:nowrap; width:15%;"><!--적용수-->${mLang["applyqty"]}</th>
              <th scope="col" class="text-center" style="white-space:nowrap; width:20%;"><!--적립상태-->${mLang["savstate"]}</th>
              <th scope="col" class="text-left" style="white-space:nowrap; width:25%;">&nbsp;&nbsp;&nbsp;<!--상품-->${mLang["goods"]}</th>
            </tr>
          </th>
          <tbody>
          </tbody>
        </table>
      </div>
      
    </div> <!-- end of border -->
    <div class="col text-center" id="idStorInfoMoreBtnDiv" style="display:none;">
    	<button type="button" class="btn btn-info" onclick="viewMoreVisitHistory();"><!--더 보기-->${mLang["viewmore"]} <i class="far fa-caret-square-down"></i></button>        
	</div>

    </div>  <!-- end of container -->
    
  </main>
  <!--Main layout-->

  	<script language="javascript">
  		var naverSecret 		= '${naverSecret}';
  		var firstPageNo			= '<%=com.abanate.com.util.ConstUtil.FIRST_PAGE_STR%>';	// First page number.
  		var canLoadGooglemap	= ${canLoadGoogleMap};
  		var recaptchaSiteKey	= '${setting_api_recaptcha_site_key}';

  		window.addEventListener("load", function(evt) {
		});

  		// Multi language variables
  	  	var mLang = new Map();
  	  	mLang.set( "todaygooglemapserviceexpired_br" 		, '${mLang[ "todaygooglemapserviceexpired_br" 		]}' );
	  	mLang.set( "autoaccessdeniedyoucantusethismenu_br" 	, '${mLang[ "autoaccessdeniedyoucantusethismenu_br"	]}' );
	  	mLang.set( "cantrecognizecurrentlocation_br" 		, '${mLang[ "cantrecognizecurrentlocation_br" 		]}' );
	  	mLang.set( "numberqty" 								, '${mLang[ "numberqty" 							]}' );
	  	mLang.set( "pointquantitiesunit" 					, '${mLang[ "pointquantitiesunit" 					]}' );
	  	mLang.set( "use" 									, '${mLang[ "use" 									]}' );
	  	mLang.set( "save" 									, '${mLang[ "save" 									]}' );
	  	mLang.set( "nosearchdata" 							, '${mLang[ "nosearchdata" 							]}' );
	</script>
	
	<%--
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=${naverKey}"></script>	
	--%>
	<script type="text/javascript" async defer src="../../js/mycoup/around.js?removeCache=<%=new java.util.Date().getTime()%>"></script>
	<c:if test="${canLoadGoogleMap}">
	<script defer src="https://maps.googleapis.com/maps/api/js?key=${googleMapKey}"></script>
	</c:if>
	
	<script defer src="https://www.google.com/recaptcha/api.js?render=${setting_api_recaptcha_site_key}"></script>
	
<jsp:include page="comFooter.jsp"/>
<jsp:include page="footer.jsp"/>
</body>

</html>