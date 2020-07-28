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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i>To use</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<img src="../../img/mycoup/how_4.png" alt="쿠폰(포인트) 사용 할게요" class="z-depth-0 img-fluid">
        <h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ Easy to use ○</span>
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	To use coupons or points
Just call the phone number
Please use it yourself.
        	
        	<br/><br/>        	
        	<span class="text-success font-weight-bold">⊙</span>
        	When used, the customer calls
Can you trust the phone number?
→ For those who are regular or trustworthy
You don't have to bother with confirmation,
(But through possible confirmation
We recommend that innocent customers do not suffer. )
Can I check the phone number before using it

For Android phones, each version is slightly different,
Basically, go into the settings
Mobile phone information> Status
or
More> Device Info> Status
Can find my phone number at

For iphone
In Settings, Phone> My Phone
or
Tap the contact icon in the phone app
You can check the phone number with user information.

If you check and use it like this, you will be more relieved.

And who might call my phone number
If you used coupons or points
You can also check your visit history.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	Someone used coupons and points with my phone number
→ without checking the phone number
I think the store manager used the coupon/point.
In this case, please contact the store quickly
Please tell me the owner's fault
Steal another phone number
Please help catch the bad guys quickly.
        	
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