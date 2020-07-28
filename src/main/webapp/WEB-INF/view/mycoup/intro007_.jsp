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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> Coupon Production Cost</span>
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      <h5 class="mt-3 ml-3 mr-3 mb-3">
        <span class="text-primary font-weight-bold">○ How much does it cost to make a coupon? ○</span>
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        Each company is different
        <br/> For the cheapest version of the paper coupon
        <br/> About 8,000 to 10,000 won per 100 sheets
        <br/> Do you cost about 40,000 to 50,000 won per 1,000 sheets
        <br/> Even if you purchase 1,000 sheets
        <br/> There is a cost of 40-50 won per sheet.
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        The price is also the price
        <br/> The design form provided by the company
        <br/> Little by little
        <br/> You have to make changes
        <br/> If you don't have a design in mind,
        <br/> A completely new design
        <br/> There is a hassle.
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        Paper coupons for distribution and management
        <br/> Both the owner and the customer
        <br/> Fatal, too uncomfortable
        <br/> There are disadvantages
        <br/> Each coupon
        <br/> Collected and managed by store
        <br/> If you like coupons
        <br/> Except for a few customers
        <br/> Most coupon fragments
        <br/> It's a waste to throw away
        <br/> To keep it with you
        <br/> So annoying.
        	
		</h5>

      </div>
      
      <div class="w-100">&nbsp;</div>  <!-- horizontal blank -->

      <div class="col text-center">
      	<button type="button" class="btn btn-dark" onclick="goMain();">돌아가기 <i class="fas fa-undo-alt"></i></button>
      	<input type="hidden" name="usrTp"/>
      	<input type="hidden" name="usrNm"/>
      	<input type="hidden" name="marketAgreeYn"/>
      </div>
        
      
    </div> <!-- end of border -->

    </div>  <!-- end of container -->
    
  </main>
  <!--Main layout-->

  	<script language="javascript">
  		window.addEventListener("load", function(evt) {
  	  		
		});
	</script>
	
<jsp:include page="comFooter.jsp"/>
<jsp:include page="footer.jsp"/>
</body>

</html>