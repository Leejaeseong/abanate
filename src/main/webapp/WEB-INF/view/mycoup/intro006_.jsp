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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> security</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ Is my information really safe? ○</span>
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        Passwords are stored in a way that no one else knows.
        <br/> Reverse password, never known to administrators
        <br/> Because it is impossible to decrypt
        <br/> You can rest assured.
        <br/> Even if you hack,
        <br/> The password is unknown.
        
        <span class="text-success font-weight-bold">⊙</span>
        In addition, this site
        <br/> Hacking and Intrusion Prevention (reCaptcha)
        <br/> Use the road name address provided by the country,
        <br/> And I use Naver/Google maps.
        
        <span class="text-success font-weight-bold">⊙</span>
        If you have any inconvenience or suspicion of security
        <br/> Email me anytime
        <br/> It will be a more effortless site.
        <br/> Thank you.
        	
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