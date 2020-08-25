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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> Check visit</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<img src="../../img/mycoup/how_7_en.png" alt="Shall we see how many you've been?" class="z-depth-0 img-fluid">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">      	
        	<span class="text-primary font-weight-bold">○ Check customer's visit history ○</span>
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	You can see the total amount of earned/used items in the store
        <br/> Earned coupons/points through accumulated customers
        <br/> Can you know the number of customers
        <br/>
        <br/> I can see the total number of earned and used
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        By date, phone number, and name
        <br/> I can search my store's visit history
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        After the search, you can see the search results
        <br/> The total number and
        <br/> Number of customers (excluding duplicates)
        <br/> Accumulation and use amount and
        <br/> Earn-You can see the accumulated amount
        <br/>
        <br/> Visiting and earning/use classification
        <br/> Name and phone number
        <br/> The amount applied and accumulated
        <br/> Calculated the final credit/usage for each customer
        <br/> Can you check the cumulative amount
        <br/>
        <br/> Since it is a recent visit, only 20 can be viewed at a time.
        <br/> Add more information via the [More] button
        <br/> You can check.
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