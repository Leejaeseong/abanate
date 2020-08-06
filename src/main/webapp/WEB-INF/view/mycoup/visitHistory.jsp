<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="header.jsp"/>
<jsp:include page="comHeader.jsp"/>

<!-- https://flatpickr.js.org/ -->
<link href="../../css/com/datepicker/flatpickr.min.css" rel="stylesheet">
<!--[if IE 9]>
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/ie.css">
<![endif]-->
	
<body>

  <jsp:include page="navigator.jsp"/>

  <!--Main layout-->
  <main>

    <!-- 상단 공백 -->
    <p class="my-4">&nbsp;</p>

    <div class="container bg-primary">
      <h1>        
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-store"></i> 고객 방문 내역</span>
      </h1>
    </div>

    <div class="container">

      <div class="row wow fadeIn border border-dark justify-content-center">

        <div class="row w-100">
          <h4 class="w-100 bg-primary"><span class="badge badge-success w-100">전체 내역</span></h4>
        </div>

        <div class="w-100">&nbsp;</div> <!-- space br -->

        <div class="col-1 align-self-center">
          <i class="fas fa-user-friends"></i>
        </div>                  
        <div class="col-3 text-left my-auto">
          <small>전체 고객</small>
        </div>
        
        <div class="col-3 form-inline">
          <label class="small mt-2">누적 고객</label>
        </div>
        <div class="col form-inline text-center">
          <input id="idAccumCustomerCnt" type="text" class="form-control form-control-sm text-right" disabled style="width:8em;"/>
          <div class="w-100" style="height:1px;">&nbsp;</div> <!-- space br -->
          <small id="idOpenDt">※개시:<fmt:formatDate value="${cmStor.regDttm}" pattern="yyyy.MM.dd" /></small>
        </div>
        
        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-chart-area"></i>
        </div>                  
        <div class="col-3 form-inline">
          <label class="small mt-2">전체 현황</label>
        </div>
        
        <div class="col-3 form-inline text-center">
          <label class="small mt-2">적립</label>          
          <div class="w-100" style="height:1px;">&nbsp;</div> <!-- space br -->
          <label class="small mt-2">사용</label>
        </div>
        <div class="col form-inline text-center">
          <input type="text" id="idAccumSavAmt" class="form-control form-control-sm text-right" disabled style="width:8em;"/>
          <div class="w-100" style="height:1px;">&nbsp;</div> <!-- space br -->
          <input type="text" id="idAccumUseAmt" class="form-control form-control-sm text-right" disabled style="width:8em;"/>
        </div>

        <div class="w-100">&nbsp;</div> <!-- bottom space of regist border -->

      </div> <!-- end of border -->

      <div class="w-100">&nbsp;</div> <!-- space between border -->

      <div class="row wow fadeIn border border-dark justify-content-center">

        <div class="row w-100">
          <h4 class="w-100 bg-primary"><span class="badge badge-success w-100">검색</span></h4>
        </div>

        <div class="w-100">&nbsp;</div> <!-- space br -->

        <div class="col-1 align-self-center text-right">
          <i class="far fa-clock"></i>
        </div>
        <div class="col-3 form-inline">
          <label class="mt-2">일자</label>
        </div>        
        <div class="col form-inline text-center">
          <input type="text" id="sFromDate" class="form-control form-control-sm text-center" style="width:10em;"/>
          <label class="mt-2" style="width:2em;">~</label><br/>
          <input type="text" id="sToDate"   class="form-control form-control-sm text-center" style="width:10em;"/>
        </div>

        <div class="w-100"><hr/></div> <!-- horizontal line -->
        
        <div class="col-1 align-self-center text-right">
          <i class="far fa-clock"></i>
        </div>
        <div class="col-4 text-left mt-2">
          <label>전화번호(ID)</label>
        </div>        
        <div class="col form-inline text-center">
          <!--  
          <input type="text" class="form-control form-control-sm" id="phone1" style="width:3em;" maxlength="3">
          <label class="mt-2" style="width:0.8em;">-</label>
          <input type="text" class="form-control form-control-sm" id="phone2" style="width:3.5em;" maxlength="4">
          <label class="mt-2" style="width:0.8em;">-</label>
          <input type="text" class="form-control form-control-sm" id="phone3" style="width:3.5em;" maxlength="4">
          <input type="hidden" id="usrId"/>
          -->
          <input type="text" class="form-control form-control-sm" name="usrId" style="width:12em;" maxlength="20">
        </div>

        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-user-tag"></i>
        </div>                  
        <div class="col-4 text-left my-auto">
          <label>성함<font class="small"><br/>( 또는 예명 )</font>
          </label>
        </div>
        <div class="col form-inline text-center">
          <input type="text" class="form-control form-control-sm" id="usrNm" style="width:12em;">
        </div>

        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col text-right">
          <button type="button" class="btn btn-primary" onclick="searchVisitHistory();">검색 <i class="fas fa-search"></i></button>
        </div>

        <div class="w-100">&nbsp;</div> <!-- bottom space of regist border -->

      </div> <!-- end of border -->

      <div class="w-100">&nbsp;</div> <!-- space between border -->

      <div class="row wow fadeIn border border-dark justify-content-center">

        <div class="row w-100">
          <h4 class="w-100 bg-primary"><span class="badge badge-success w-100">검색 결과</span></h4>
        </div>

        <div class="w-100">
          <div class="col text-center">
            <small>
              [검색] <font class="text-info" id="idSearchCnt">0</font>&nbsp;&nbsp;&nbsp;[고객] <font class="text-info" id="idUsrCnt"  >0</font>&nbsp;&nbsp;&nbsp;[적립] <font class="text-info" id="idSavAmt">0</font>&nbsp;&nbsp;&nbsp; 
              [사용] <font class="text-info" id="idUseAmt"   >0</font>&nbsp;&nbsp;&nbsp;[누적] <font class="text-info" id="idAccumAmt">0</font>
            </small>
          </div>
        </div>
        
        <div class="table-responsive-sm">
          <!--  
          <table class="table table-striped table-bordered table-sm table-nowrap" style="table-layout: fixed;">
          -->
          <table id="idHistoryTbl" class="table table-striped table-bordered table-sm table-nowrap">
            <thead class="thead-light">
              <tr>
                <th scope="col" class="text-center" style="white-space:nowrap; width:22%;">방문 일시</th>
                <th scope="col" class="text-center" style="white-space:nowrap; width:13%;">구분</th>
                <th scope="col" class="text-left"   style="white-space:nowrap; width:25%;">성함</th>
                <th scope="col" class="text-center" style="white-space:nowrap; width:25%;">전화번호</th>
                <th scope="col" class="text-center" style="white-space:nowrap; width:5%;">적용</th>
                <th scope="col" class="text-center" style="white-space:nowrap; width:5%;">누적</th>
                <th scope="col" class="text-left"   style="white-space:nowrap; width:5%;">상품</th>
              </tr>
            </th>
            <tbody>
            <!--
              <tr>
                <td class="text-center">2019.10.21<br/>13:10:00</td>
                <td class="text-center text-danger">사용</td>
                <td class="text-left">이지은</td>
                <td class="text-center">010-1234-5678</td>
                <td class="text-right">10</td>
                <td class="text-right">5</td>
              </tr>
              <tr>
                <td class="text-center">2019.10.21<br/>13:10:00</td>
                <td class="text-center">적립</td>
                <td class="text-left">이지은</td>
                <td class="text-center">010-1234-5678</td>
                <td class="text-right">2</td>
                <td class="text-right">15</td>
              </tr>
              <tr>
                <td class="text-center">2019.10.19<br/>10:10:00</td>
                <td class="text-center">적립</td>
                <td class="text-left">이지은</td>
                <td class="text-center">010-1234-5678</td>
                <td class="text-right">1</td>
                <td class="text-right">13</td>
              </tr>
              <tr>
                <td class="text-center">2019.10.17<br/>11:10:00</td>
                <td class="text-center">적립</td>
                <td class="text-left">이지은</td>
                <td class="text-center">010-1234-5678</td>
                <td class="text-right">3</td>
                <td class="text-right">12</td>
              </tr>
            -->
            </tbody>
          </table>
          <!--
          <div class="w-100 d-flex justify-content-center">
            <nav>
              <ul class="pagination">
                <li class="page-item disabled">
                  <span class="page-link">First</span>
                </li>
                <li class="page-item disabled">
                  <span class="page-link">&lt;&lt;</span>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item active" aria-current="page">
                  <span class="page-link">
                    2
                    <span class="sr-only">(current)</span>
                  </span>
                </li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                  <a class="page-link" href="#">&gt;&gt;</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">Last</a>
                </li>
              </ul>
            </nav>
          </div>
          -->
          
        </div>
        
      </div> <!-- end of border -->
      
      <div class="col text-center">
      	<button type="button" class="btn btn-info" onclick="viewMore();">더 보기 <i class="far fa-caret-square-down"></i></button>        
      </div>
      
    </div> <!-- end of container -->
    
  </main>
  <!--Main layout-->

  <script language="javascript">
  	var accumSavAmt 		= 0;
	var accumUseAmt 		= 0;
	var accumCustomerCnt 	= 0;
	var savTp 				= "C"; // Type of save
	var firstPageNo			= '<%=com.abanate.com.util.ConstUtil.FIRST_PAGE_STR%>';	// First page number.

	window.addEventListener("load", function(evt) {
  		savTp 				= "${sessionScope.cmStor.savTp}";			// Type of save
		accumSavAmt 		= toNumWithSep( ${cmStor.savAmt} 		);	
		accumUseAmt 		= toNumWithSep( ${cmStor.useAmt} 		);
		accumCustomerCnt 	= toNumWithSep( ${accumCustomerCnt} 	);

		init();
  	});
  </script>
	
   <!-- https://flatpickr.js.org/ -->
   <script type="text/javascript" async defer src="../../js/com/datepicker/flatpickr.min.js?removeCache=<%=new java.util.Date().getTime()%>"></script>
   
   <script type="text/javascript" async defer src="../../js/mycoup/visitHistory.js?removeCache=<%=new java.util.Date().getTime()%>"></script>
	
<jsp:include page="comFooter.jsp"/>
<jsp:include page="footer.jsp"/>
</body>

</html>