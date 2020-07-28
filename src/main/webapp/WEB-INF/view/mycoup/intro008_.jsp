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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> Homepage service</span>
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      <h5 class="mt-3 ml-3 mr-3 mb-3">
        <span class="text-primary font-weight-bold">○ Why don't you use the service as an app? ○</span>
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        The app's deadliest drawback is
        <br/> It is necessary to install.
        <br/> App installation itself
        <br/> It's cumbersome, but the app itself
        <br/> It takes up storage space on your phone or PC
        <br/> Anxiety about app installation
        <br/> It always exists.
        <br/> (Apps that take my information, etc.)
        <br/>
        <br/> And for good service
        <br/> If you add/change the function
        <br/> Frequent updates
        <br/> You'll face hell
        <br/> Let me experience this
        <br/> I don't want to.
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        Service only on the homepage
        <br/> Mobile browser access
        <br/> Make it smooth
        <br/> No installation required,
        <br/> Whenever you want, you can use your favorites
        <br/> Safe and convenient
        <br/> Can be used.
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        Now anytime, anywhere
        <br/> You can access the web with confidence.
        	
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