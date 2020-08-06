<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

  <form id="idForm" action="./integrationCoupon.do" method="post">
  <!--Main layout-->
  <main>

    <!-- 상단 공백 -->
    <p class="my-4">&nbsp;</p>

    <div class="container bg-primary">
      <h1>        
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="far fa-object-group"></i> 적립금 이전</span>
      </h1>
    </div>

    <div class="container">

      <div class="row wow fadeIn border border-dark justify-content-center">
        <div class="w-100">&nbsp;</div> <!-- top space of regist border -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-phone-slash"></i>
        </div>                  
        <div class="col-4 text-left mt-2">
          <small>적립금 양도 전화번호</small>
        </div>
        <div class="col form-inline text-center">
          <!--  
          <input type="text" class="form-control form-control-sm" id="oldPhone1" style="width:3em;" maxlength="3">
          <label class="mt-2" style="width:0.8em;">-</label>
          <input type="text" class="form-control form-control-sm" id="oldPhone2" style="width:3.5em;" maxlength="4">
          <label class="mt-2" style="width:0.8em;">-</label>
          <input type="text" class="form-control form-control-sm" id="oldPhone3" style="width:3.5em;" maxlength="4">
          <input type="hidden" name="oldUsrId"/>
          -->
          <input type="text" class="form-control form-control-sm" name="oldUsrId" style="width:12em;" maxlength="20">
          <input type="hidden" name="oldSavAmt" value="0"/>
          <input type="hidden" name="oldUseAmt" value="0"/>
        </div>

        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-user-tag"></i>
        </div>                  
        <div class="col-4 text-left my-auto">
          <small>양도자 성함</small>
        </div>
        <div class="col form-inline text-center">
          <input type="text" class="form-control form-control-sm" id="oldUsrNm" style="width:12em;" disabled>
        </div>

		<div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-retweet"></i>
        </div>                  
        <div class="col-4 text-left my-auto">
          <small>양도자 적립금</small>
        </div>
        <div class="col form-inline text-center">
          <input type="text" class="form-control form-control-sm" id="oldAccumAmt" disabled style="width:12em;">
        </div>
        
        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-mobile-alt"></i>
        </div>                  
        <div class="col-4 text-left mt-2">
          <small>적립금 양수 전화번호</small>
        </div>
        <div class="col form-inline text-center">
          <!--  
          <input type="text" class="form-control form-control-sm" id="newPhone1" style="width:3em;" maxlength="3">
          <label class="mt-2" style="width:0.8em;">-</label>
          <input type="text" class="form-control form-control-sm" id="newPhone2" style="width:3.5em;" maxlength="4">
          <label class="mt-2" style="width:0.8em;">-</label>
          <input type="text" class="form-control form-control-sm" id="newPhone3" style="width:3.5em;" maxlength="4">
          <input type="hidden" name="newUsrId"/>
          -->
          <input type="text" class="form-control form-control-sm" name="newUsrId" style="width:12em;" maxlength="20">
          <input type="hidden" name="newSavAmt" value="0"/>
          <input type="hidden" name="newUseAmt" value="0"/>
        </div>
        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-user-tag"></i>
        </div>                  
        <div class="col-4 text-left my-auto">
          <small>양수자 성함</small>
        </div>
        <div class="col form-inline text-center">
          <input type="text" class="form-control form-control-sm" id="newUsrNm" style="width:12em;" disabled>
        </div>
        
        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="far fa-object-group"></i>
        </div>                  
        <div class="col-4 text-left my-auto">
          <small>양수자 적립</small>
        </div>
        <div class="col form-inline text-center">
          <input type="text" class="form-control form-control-sm" id="newAccumAmt" disabled style="width:12em;">
        </div>

        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
          <i class="fas fa-ticket-alt"></i>
        </div>                  
        <div class="col-4 text-left my-auto">
          <small>이동 수량(금액)</small>
        </div>
        <div class="col form-inline text-center">
            <input type="number" class="form-control form-control-sm" name="addAccumAmt" style="width:12em;">
        </div>

		<div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="col-1 align-self-center text-right">
            <i class="fas fa-lock"></i>
        </div>                  
        <div class="col-4 text-left my-auto">
          <small>양도자 비밀번호</small>
        </div>
        <div class="col form-inline text-center">
          <input type="password" class="form-control form-control-sm" name="passwd" placeholder="Password" style="width:12em;">
          <label for="password" class="font-italic small">&nbsp;&nbsp;※ 고객 직접 입력</label>
        </div>
        
        <div class="w-100"><hr/></div> <!-- horizontal line -->

        <div class="row w-100">
          <div class="col text-center">              
            <label class="text-danger">※ 적용 후에는 다시 복구가 불가능 합니다.</label>
          </div>
        </div>

        <div class="row w-100">
          <div class="col text-center">
            <button type="button" class="btn btn-primary" onclick="onSave();">적용하기 <i class="fas fa-clipboard-check"></i></button>
          </div>
        </div>

        <div class="w-100">&nbsp;</div> <!-- bottom space of regist border -->
      </div> <!-- end of border -->
    </div> <!-- end of container -->
    
  </main>
  <!--Main layout-->
  </form>

  <script language="javascript">
  	var savTp 		= "${sessionScope.cmStor.savTp}";						// Type of save
  	var isComplete	= '${isComplete}';										// Process completed
	var isError 	= '${isError}'; 										// Error occured
	var errMsg  	= '${errMsg}';											// Message of error
  </script>
	
   <!-- https://flatpickr.js.org/ -->
   <script type="text/javascript" async defer src="../../js/mycoup/integrationCoupon.js?removeCache=<%=new java.util.Date().getTime()%>"></script>
	
<jsp:include page="comFooter.jsp"/>
<jsp:include page="footer.jsp"/>
</body>

</html>