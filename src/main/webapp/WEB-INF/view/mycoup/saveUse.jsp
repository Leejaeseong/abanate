<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="header.jsp"/>
<jsp:include page="comHeader.jsp"/>
<body>

  <jsp:include page="navigator.jsp"/>

  <form id="idForm" action="./saveUse.do" method="post">
  <!--Main layout-->
  <main>

    <!-- 상단 공백 -->
    <p class="my-4">&nbsp;</p>

    <div class="container bg-primary">
      <h2>
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;" id="idPageTitle">&nbsp;</span>        
      </h2>
    </div>

    <div class="container">

      <div class="row wow fadeIn border border-dark justify-content-center">

        <div class="w-100">&nbsp;</div> <!-- top space of regist border -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-filter"></i>
        </div>                  
        <div class="col-4 text-left mt-2">
          <label><!--구분-->${mLang["type"]}</label>
        </div>
        <div class="col form-inline text-center">
          <select class="form-control form-control-sm" name="useTp" style="width:12em;">
            <option value="save" selected><!--적립-->${mLang["save"]}</option>
            <option value="use" ><!--사용-->${mLang["use"]}</option>
          </select>
        </div>

        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-mobile-alt"></i>
        </div>                  
        <div class="col-4 text-left mt-1">
          <small><!--고객 전화번호-->${mLang["custphonenumber"]}</small>
        </div>
        <div class="col form-inline text-center">
          <input type="text" class="form-control form-control-sm" name="usrId" style="width:12em;" maxlength="20">
          <input type="hidden" name="savAmt" value="0"/>
          <input type="hidden" name="useAmt" value="0"/>
        </div>

        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-user-tag"></i>
        </div>                  
        <div class="col-4 text-left my-auto">
          <label><!--고객명-->${mLang["custname"]}<font class="small"><br/>( <!--또는 예명-->${mLang["oraliasname"]} )</font>
         </label>
        </div>
        <div class="col form-inline text-center">
          <input type="text" class="form-control form-control-sm" name="usrNm" style="width:12em;" disabled>
        </div>

        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-money-bill-alt"></i>
        </div>
        <div class="col-4 text-left mt-1">
          <label><!--현재<br/>적립 상태-->${mLang["cursavstate_br"]}</label>
        </div>
        <div class="col form-inline text-center">
          <input type="text" class="form-control form-control-sm" id="curAmt" style="width:12em;" disabled/>
        </div>

        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-piggy-bank"></i>
        </div>                  
        <div class="col-4 text-left mt-2">
          <label id="idLabelSavUse"><!--적립 수량-->${mLang["savqty"]}</small>
        </div>
        <div class="col form-inline text-center">
          <input type="number" min="0" class="form-control form-control-sm" id="savUseAmt" style="width:12em;" />
        </div>

        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="far fa-money-bill-alt"></i>
        </div>                  
        <div class="col-4 text-left mt-2">
          <label id="idLabelAfterSavUse"><!--적립 후 상태-->${mLang["stateaftersav"]}</lab>
        </div>
        <div class="col form-inline text-center">
          <input type="text" class="form-control form-control-sm" id="idAfterAdd" style="width:12em;"disabled/>
        </div>        

        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="far fa-clipboard"></i>
        </div>                  
        <div class="col-4 text-left mt-4">
          <label><!--고객 메모-->${mLang["custmemo"]}</la>
        </div>
        <div class="col form-inline text-center">
          <textarea class="form-control form-control-sm" name="rmks" style="width:12em;" rows="3"></textarea>
        </div>
        
        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="far fa-edit"></i>
        </div>                  
        <div class="col-4 text-left mt-4">
          <label id="idLabelSavUseMemo"><!--메모-->${mLang["memo"]}</la>
        </div>
        <div class="col form-inline text-center">
          <textarea class="form-control form-control-sm" name="saveUseMemo" style="width:12em;" rows="3"></textarea>
        </div>

        <div class="w-100">&nbsp;</div> <!-- bottom space of regist border -->

      </div> <!-- end of border -->
      
      
      <div class="col text-center">
        <button type="button" class="btn btn-primary" onclick="onSave();"><!--적용하기-->${mLang["apply"]} <i class="fas fa-clipboard-check"></i></button>        
      </div>
      
      
      <div class="w-100">&nbsp;</div> <!-- space between border -->
      
      <div class="row wow fadeIn border border-dark justify-content-center">

        <div class="row w-100">
          <h4 class="w-100 bg-primary"><span class="badge badge-success w-100"><!--적립 / 사용 내역-->${mLang["historysav_use"]}</span></h4>
        </div>

        <div class="table-responsive-sm">
        <!--  
          <table id="idHistoryTbl" class="table table-striped table-bordered table-sm table-nowrap" style="table-layout:fixed;">
        -->
          <table id="idHistoryTbl" class="table table-striped table-bordered table-sm table-nowrap">
            <thead class="thead-light">
              <tr>
                <th scope="col" class="text-center font-weight-bold" style="white-space:nowrap; width:22%;"><!--방문일-->${mLang["visitdate"]}</th>
                <th scope="col" class="text-center font-weight-bold" style="white-space:nowrap; width:13%;"><!--구분-->${mLang["type"]}</th>
                <th scope="col" class="text-center font-weight-bold" style="white-space:nowrap; width:10%;"><!--적용수-->${mLang["applyqty"]}</th>
                <th scope="col" class="text-center font-weight-bold" style="white-space:nowrap; width:10%;"><!--적립상태-->${mLang["savstate"]}</th>
                <th scope="col" class="text-center font-weight-bold" style="white-space:nowrap; width:35%;"><!--상품-->${mLang["goods"]}</th>
                <th scope="col" class="text-center font-weight-bold" style="white-space:nowrap; width:10%;"><!--메모-->${mLang["memo"]}</th>
              </tr>
            </th>
            <tbody>            
            </tbody>
          </table>
        </div>
        
      </div> <!-- end of border -->
      
      <div class="col text-center">
        <button type="button" class="btn btn-info" onclick="viewMore();"><!--더 보기-->${mLang["viewmore"]} <i class="far fa-caret-square-down"></i></button>        
      </div>

    </div> <!-- end of container -->
    
  </main>
  <!--Main layout-->
  <input type="hidden" name="recaptchaToken"/>
  </form>
  
  <script language="javascript">
  	var savTp 		= "${sessionScope.cmStor.savTp}";						// Type of save
  	var isComplete	= '${isComplete}';										// Process completed
	var isError 	= '${isError}'; 										// Error occured
	var errMsg  	= '${errMsg}';											// Message of error
  	var firstPageNo	= '<%=com.abanate.com.util.ConstUtil.FIRST_PAGE_STR%>';	// First page number.
  	
  	var recaptchaSiteKey	= '${setting_api_recaptcha_site_key}';

  	// Multi language variables
  	var mLang = new Map();
  	mLang.set( "applycompleted"			, '${mLang["applycompleted"			]}' );
  	mLang.set( "cantuseoversave"		, '${mLang["cantuseoversave"		]}' );
  	mLang.set( "serv_notjoined"			, '${mLang["serv_notjoined"			]}' );
  	mLang.set( "savingqty"				, '${mLang["savingqty"				]}' );
  	mLang.set( "savingpoint"			, '${mLang["savingpoint"			]}' );
  	mLang.set( "inputcustphonenumber"	, '${mLang["inputcustphonenumber"	]}'	);
  	mLang.set( "islastpage"				, '${mLang["islastpage"				]}' );
  	mLang.set( "use"					, '${mLang["use"					]}' );
  	mLang.set( "save"					, '${mLang["save"					]}' );
  	mLang.set( "coupsavuse"				, '${mLang["coupsavuse"				]}' );
  	mLang.set( "pointsavuse"			, '${mLang["pointsavuse"			]}' );
  	mLang.set( "savqty"					, '${mLang["savqty"					]}' );
  	mLang.set( "savpoint"				, '${mLang["savpoint"				]}' );
  	mLang.set( "qtyaftersav"			, '${mLang["qtyaftersav"			]}' );
  	mLang.set( "pointaftersav"			, '${mLang["pointaftersav"			]}' );
  	mLang.set( "savmemo"				, '${mLang["savmemo"				]}' );
  	mLang.set( "useqty"					, '${mLang["useqty"					]}' );
  	mLang.set( "usepoint"				, '${mLang["usepoint"				]}' );
  	mLang.set( "qtyafteruse"			, '${mLang["qtyafteruse"			]}' );
  	mLang.set( "pointafteruse"			, '${mLang["pointafteruse"			]}' );
  	mLang.set( "usememo"				, '${mLang["usememo"				]}' );
  	mLang.set( "inputoverzero"			, '${mLang["inputoverzero"			]}' );
  	mLang.set( "inputonlyinteger"		, '${mLang["inputonlyinteger"		]}' );
  	mLang.set( "nocontenttosave"		, '${mLang["nocontenttosave"		]}' );
  	mLang.set( "inputonlynumber"		, '${mLang["inputonlynumber"		]}' );
  	mLang.set( "willyousave"			, '${mLang["willyousave"			]}' );  	
  </script>

<jsp:include page="comFooter.jsp"/>
<jsp:include page="footer.jsp"/>

<script type="text/javascript" async defer src="../../js/mycoup/saveUse.js?removeCache=<%=new java.util.Date().getTime()%>"></script>
<script defer src="https://www.google.com/recaptcha/api.js?render=${setting_api_recaptcha_site_key}"></script>

</body>

</html>