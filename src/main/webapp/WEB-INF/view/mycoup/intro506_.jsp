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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> Information change</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ Change our store information ○</span>
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        Let's change our store information
        <br/> You can change your name or name.
        <br/>
        <br/> Can I change my email address
        <br/> This is unique information to manage passwords.
        <br/> Please be careful when making corrections.
        <br/>
        <br/> You can change the name.
        <br/> But if the customer's friendly name changes,
        <br/> It can be confusing
        <br/> I recommend you keep it as much as possible.
        <br/>
        <br/> I can change the store phone number.
        <br/> But if the customer-familiar contact information changes,
        <br/> It can be confusing
        <br/> I recommend you keep it as much as possible.
        <br/>
        <br/> When the store address has changed
        <br/> Please correct the address
        <br/> My new store on customer's map
        The <br/> location is displayed immediately.
        <br/>
        <br/> Can change marketing consent
        <br/> If you've been plagued by advertisements in the meantime,
        <br/> You can turn it off for a while
        <br/> But I want to inform the owners
        <br/> You may miss important event information
        <br/> Please use if possible.
        <br/>
        <br/> Can I change my password?
        <br/> If you forget your password
        <br/> You can change it again via email,
        <br/> It's annoying, so remember it whenever possible.
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