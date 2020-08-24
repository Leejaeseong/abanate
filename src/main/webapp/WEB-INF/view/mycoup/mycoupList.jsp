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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-money-bill-alt"></i> <!--내 쿠폰(포인트) 함-->${mLang["nav_mycoupbox"]}</span>        
      </h1>
    </div>

    <div class="container">
        
      <div class="row wow fadeIn border border-dark justify-content-center">
        
        <div class="row w-100">
          <h4 class="w-100 bg-primary"><span class="badge badge-success w-100"><!--전체 적립 상태-->${mLang["allsavstate"]}</span></h4>
        </div>

        <div class="w-100">&nbsp;</div> <!-- space br -->
        
        <div class="col-1 align-self-center text-right mb-1">
          <i class="fas fa-ticket-alt"></i>
	    </div>                  
	    <div class="col-4 align-self-center text-left">
	        <label class="small"><!--내 쿠폰-->${mLang["mycoupon"]}</label>
	    </div>
	    <div class="col form-inline text-center">
        	<a href="#idSearchResultDiv">
        		<input type="text" id="idCoupSum" class="form-control form-control-sm text-right" readonly="readonly" style="width:12em;" onclick="searchStore( false, 'coupon' );"/>
        	</a>
	    </div>
      
        <div class="w-100"><hr/></div> <!-- horizontal line -->
        
        <div class="col-1 align-self-center text-right mb-1">
          <i class="fas fa-file-powerpoint"></i>
        </div>                  
        <div class="col-4 align-self-center text-left">
          <label class="small"><!--내 포인트-->${mLang["mypoint"]}</label>
        </div>
        <div class="col form-inline text-center">
        	<a href="#idSearchResultDiv">
        		<input type="text" id="idPointSum" class="form-control form-control-sm text-right" readonly="readonly" style="width:12em;" onclick="searchStore( false, 'point' );"/>
        	</a>
	    </div>
        
      <div class="w-100">&nbsp;</div> <!-- bottom space of border -->

    </div> <!-- end of border -->

    <div class="w-100">&nbsp;</div> <!-- space between border -->

    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
        <h4 class="w-100 bg-primary"><span class="badge badge-success w-100"><!--검색-->${mLang["search"]}</span></h4>
      </div>

      <div class="w-100">&nbsp;</div> <!-- space br -->
      
      <div class="col-1 align-self-center text-right mb-1">
          <i class="fas fa-sign"></i>
      </div>                  
      <div class="col-4 align-self-center text-left">
        <label class="small"><!--상호-->${mLang["storename"]}</label>
      </div>
      <div class="col form-inline text-center">
        <input type="text" id="idStorNm" class="form-control form-control-sm text-left" style="width:12em;"/>
      </div>

      <div class="w-100"><hr/></div> <!-- horizontal line -->
      
      <div class="col-1 align-self-center text-right mt-1">
        <i class="fas fa-phone-square"></i>
      </div>                  
      <div class="col-4 text-left mt-2">
        <label class="small"><!--매장 전화번호-->${mLang["storetelno"]}</label>
      </div>
      <div class="col form-inline text-center">
        <input type="text" class="form-control form-control-sm" name="telNo" style="width:12em;" maxlength="20">
      </div>

      <div class="w-100"><hr/></div> <!-- horizontal line -->

	  <div class="col-6 custom-control custom-checkbox ml-3 mt-3">
		<input type="checkbox" class="custom-control-input" id="isVisited" checked/>
		<label class="custom-control-label" for="isVisited"><!--방문 장소만 검색-->${mLang["searchonlyvisitedplace"]}</label>
	  </div>
      <div class="col text-right">
        <button type="button" class="btn btn-primary" onclick="searchStore( false, '' );"><!--검색-->${mLang["search"]} <i class="fas fa-search"></i></button>
      </div>
        
      <div class="w-100">&nbsp;</div> <!-- bottom space of border -->

    </div> <!-- end of border -->

    <div class="w-100">&nbsp;</div> <!-- space between border -->

    <div class="row wow fadeIn border border-dark justify-content-center" id="idSearchResultDiv">

      <div class="row w-100">
        <h4 class="w-100 bg-primary"><span class="badge badge-success w-100"><!--검색 결과-->${mLang["resultofsearch"]}</span></h4>
      </div>
        
      <div class="table-responsive-sm">
        <!-- 
        <table class="table table-striped table-bordered table-sm table-nowrap" style="table-layout: fixed;">
        -->
        <table id="idStorTbl" class="table table-striped table-bordered table-sm table-nowrap">
          <thead class="thead-light">
            <tr>
              <th scope="col" class="text-center" style="white-space:nowrap; width:30%;"><!--상호-->${mLang["storename"]}</th>
              <th scope="col" class="text-center" style="white-space:nowrap; width:25%;"><!--최근 방문일-->${mLang["recentvisitdate"]}</th>
              <th scope="col" class="text-center" style="white-space:nowrap; width:10%;"><!--적립-->${mLang["save"]}</th>
              <th scope="col" class="text-left" style="white-space:nowrap; width:35%;"><!--주소-->${mLang["address"]}</th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
      
    </div> <!-- end of border -->
    
    <div class="col text-center">
    	<button type="button" class="btn btn-info" onclick="searchStore( true, '' );"><!--더 보기-->${mLang["viewmore"]} <i class="far fa-caret-square-down"></i></button>        
	</div>

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
        <!--  
        <table class="table table-striped table-bordered table-sm table-nowrap" style="table-layout: fixed;">
        -->
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
      	<!--  
        <table class="table table-striped table-bordered table-sm table-nowrap" style="table-layout: fixed;">
      	-->
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
    
  </div> <!--  end of container -->
  
  </main>
  <!--Main layout-->

  	<script language="javascript">
  		// Define variables.
		var coupSum 	= 0;
		var pointSum	= 0;
		var firstPageNo	= '<%=com.abanate.com.util.ConstUtil.FIRST_PAGE_STR%>';	// First page number.
	
  		// Event load of document.
  		window.addEventListener("load", function(evt) {
			coupSum 	= toNumWithSep( ${sumInfo.coupon} 	);
			pointSum 	= toNumWithSep( ${sumInfo.point}	);

			init();
		});

  		// Multi language variables
  	  	var mLang = new Map();
  	  	mLang.set( "savingqty" , '${mLang[ "savingqty" ]}' );
  	  	mLang.set( "savingpoint" , '${mLang[ "savingpoint" ]}' );
  	  	mLang.set( "checkstorephonenumber" , '${mLang[ "checkstorephonenumber" ]}' );
  	  	mLang.set( "nosearchdata" , '${mLang[ "nosearchdata" ]}' );
  	  	mLang.set( "numberqty" , '${mLang[ "numberqty" ]}' );
  	  	mLang.set( "pointquantitiesunit" , '${mLang[ "pointquantitiesunit" ]}' );
  	  	mLang.set( "use" , '${mLang[ "use" ]}' );
  	  	mLang.set( "save" , '${mLang[ "save" ]}' );
	</script>
	
	<script type="text/javascript" async defer src="../../js/mycoup/mycoupList.js?removeCache=<%=new java.util.Date().getTime()%>"></script>
	
<jsp:include page="comFooter.jsp"/>
<jsp:include page="footer.jsp"/>
</body>

</html>