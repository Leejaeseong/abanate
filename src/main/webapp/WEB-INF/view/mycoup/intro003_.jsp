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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> Earn</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<img src="../../img/mycoup/how_3.png" alt="쿠폰(포인트) 모을게요" class="z-depth-0 img-fluid">
        <h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ Easy to earn ○</span>
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	To purchase items and earn coupons or points
Just call the phone number
Earn it yourself.
        	
        	<br/><br/>        	
        	<span class="text-success font-weight-bold">⊙</span>
        	I have never been a member, but how?
→ Earn by phone number
If you sign up for easy membership
In the meantime, I can see the coupons or points accumulated.       	
        	
        	<br/><br/>        	
        	<span class="text-success font-weight-bold">⊙</span>
        	Can you believe what you said you earned?
→ After registering as a simple member, you can see
Because you can see, you can rest assured.
        	
        	<br/><br/>        	
        	<span class="text-success font-weight-bold">⊙</span>
        	I accidentally earned too much from my customers
I need to earn one,
I accidentally earned 100.
→ Don't panic and tell the customer
You can use 99.
        	
        	<br/><br/>        	
        	<span class="text-success font-weight-bold">⊙</span>
        	The customer has already gone?
→ Likewise, use 99
If you write down the contents in the usage memo column
The next time the customer comes, look at the memo
You will be able to guide.
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