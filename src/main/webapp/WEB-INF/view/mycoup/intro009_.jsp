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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> Overflowing service</span>
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      <h5 class="mt-3 ml-3 mr-3 mb-3">
        <span class="text-primary font-weight-bold">○ I've heard a lot of coupons and point apps. ○</span>
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        Earn coupons, earn points
        <br/> I don't know the details, but incredibly
        <br/> Related services or apps
        <br/> You might think there are many.
        <br/>
        <br/> For this service, we
        <br/> I thought about it.
        <br/> However, the following services
        <br/> Since it's still not there, like this
        <br/> I made it myself.
        <br/>
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        It's also said at the beginning of the site.
        
        <br/><br/><br/>
        <i class="far fa-star"></i> Hassle-free app installation <label class="text-danger font-weight-bold">NO!</label><br/>
        The place where the service is provided only by the web, not by the app
        <br/> Almost none.
        <br/> This will install the app
        <br/> Frequently bothering users
        <br/> Send an alarm,
        <br/> Monitoring user traffic
        <br/> This is because companies prefer the app.
        
        <br/><br/><br/>
          <i class="far fa-star"></i> I don't need any machine <label class="text-danger font-weight-bold">equipment</label>.<br/>
          <br/> For owners to recognize users
          <br/> Through a tag machine or a product linked with a small POS
          <br/> It makes money by purchasing machines.
          <br/>
          <br/> We have no owners
          <br/> It doesn't bother me.
          <br/> Pure!!! Only through the website
          <br/> Because it becomes a service.
          
          <br/><br/><br/>
          <i class="far fa-star"></i> All services are <label class="text-danger font-weight-bold">free</label>
          <br/> Exploiting money from the owners
          <br/> A service created to make money
          <br/> No.
          <br/>
          <br/> To win-win each other
          <br/> Even with the least necessary service
          <br/> Without investing in each other
          <br/> Can do good management service
          <br/> Because I was convinced there was.
          <br/>
          <br/> It started as a kind of talent donation.
          
          <br/><br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
          Provided by the franchise
          <br/> Merchant's service is not unique
          <br/>
          <br/> Operates alone,
          <br/> Free and safe to use
          <br/> For those small business owners
          <br/> I want to make a good service.
        	
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