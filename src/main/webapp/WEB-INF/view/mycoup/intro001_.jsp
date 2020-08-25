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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> 뭐 하는 곳인가?</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<img src="../../img/mycoup/how_1_en.png" alt="What it this?-Coupon management in general stores" class="z-depth-0 img-fluid">
      	<br/>
      	<img src="../../img/mycoup/how_2_en.png" alt="What is this?-I want to give points to customers" class="z-depth-0 img-fluid">
        <h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ This is a place where you can easily manage points or coupons for free. ○</span>
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	When you buy an item at the store, you can give out the coupons that are accumulated as much as the number of purchased items,
Paper coupons that make it easy for customers to visit again next time
It is very inconvenient to carry from the guest's point of view.
It is difficult to manage, and if there are many visiting stores,
This is because there is a hassle of finding coupons individually.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	At the academy, students earn a certain percentage each time they make monthly payments,
In order to induce you to register next month to consume points,
In general, it is necessary to manage the inconvenient books, so various inconveniences occur.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	The reason for offering coupons or points is simple.
This is to increase loyalty through free marketing materials paid to customers.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	But paper coupons and ledgers are uncomfortable for both business owners and customers,
However, if you are a small business owner, not a franchise affiliate,
You can't ignore the financial burden.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	The MyCoup site has absolutely no administration fees, including usage fees.
It's free to start, but I have no intention of paying it later.
If there is a cost, such as sending a text message to the customer
It will be a new service, and whether or not to use it is also an option,
We will do our best to pay little commission.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	I can't believe it!!! Wouldn't it be possible to close the site at any time if there was no profit from running this site?
→ It is not that there is no profit at all. Ads on the site cover the operating costs,
Even with simple customer management and coupon/point management
I believe it will be a great help to small business owners.
And I will always worry to provide better service periodically.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	Now simply earn and manage with just a phone number!
All coupons/points are operated based on the customer's phone number.
You don't have to remember your ID separately,
You can easily enter when you earn/use.
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	How many guests have coupons and points in my store
Which store can I use my coupons and points
You can check it easily.
And send our customers event information
I can see the event of the store where I have the coupon.
(Please wait a little longer for this service.
We are considering whether there is no way to service for free)
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