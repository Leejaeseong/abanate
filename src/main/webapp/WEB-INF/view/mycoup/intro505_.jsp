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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> Earning Transfer</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ I have a customer who wants to share my earned information with a friend. ○</span>
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        <br/> →[Equity deposit transfer phone number] This is the phone number of the member you are trying to give
        <br/> You'll be prompted for a password below, but your phone number is still
        <br/> Please check.
        <br/> Accidentally the amount of money in another person's phone number
        <br/> To prevent the attempt to move.
        <br/>
        <br/> For Android phones, each version is slightly different,
        <br/> By default, we go into the settings
        <br/> Mobile Phone Information> Status
        <br/> or
        <br/> More> Device Information> Status
        You can find my phone number at <br/>
        <br/>
        <br/> For iPhone
        <br/> Call from Settings> My Phone
        <br/> or
        <br/> Tap the contact icon in the phone app
        <br/> You can check the phone number with the user information.
        <br/>
        <br/> →[Account Limit] You can set the maximum number of credits.
        <br/> If there is no, there is no limit,
        <br/> If you enter a number, when the customer reaches the number
        The <br/> message will be displayed.
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        When the transfer phone number is entered
        <br/> The name of the transferor and the reserve amount are displayed.
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        Please enter the phone number of the transferee (the person receiving the savings).
        After entering, the name of the assignee and the accumulated amount are displayed.
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        Please enter the amount of movement
        <br/> Number of transfers from transferor to transferee.
        <br/> You can't move beyond the number of transferors.
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        Please allow the transferor's password to be entered directly.
        <br/> This is the direct transferee entering the password.
        <br/> From responsibilities that may arise
        <br/> It is a device to protect the business owner.
        
        <br/><br/>
        <span class="text-success font-weight-bold">⊙</span>
        You can move the deposit through the final [Apply] button.
        	
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