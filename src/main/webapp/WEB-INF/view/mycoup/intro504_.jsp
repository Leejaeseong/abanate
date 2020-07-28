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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> Earning settings</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ Register product information ○</span>
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	<br/> →[Equipment classification] This is the information set when registering for membership.
        <br/> Once set, it cannot be changed.
        <br/>
        <br/> →[Account Limit] You can set the maximum number of credits.
        <br/> If there is no, there is no limit,
        <br/> If you enter a number, when the customer reaches the number
        The <br/> message will be displayed.

        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        Try setting up the product
        <br/> You can set the product through the Add and Delete buttons
        <br/> When you register the number and product you earn
        <br/> Customers can see this when searching for store information
        <br/> To use existing credits, or
        <br/> You can visit many of our stores because you want to get products.
        <br/> Let's do a good setup
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        It is saved through the final apply button.
        	
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