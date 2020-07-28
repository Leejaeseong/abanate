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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> Earn / use</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ Earn and use ○</span>
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	Easy to earn and use
        <br/> I can do it.
        <br/>
        <br/> →[Division] Whether to earn or use
        <br/> Please select first
        <br/>
        <br/> →[Customer phone number]
        <br/> Please enter.
        <br/> For those who are regular or trustworthy
        <br/> You already know the phone number
        <br/> You may have already earned before the customer said
        <br/> In case of use, the other person's accumulated amount
        <br/> To prevent theft
        <br/> Must see! Please check the phone number
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
        <br/> If you check and use it like this, you will be more relieved.
        <br/>
        <br/> After entering the phone number
        <br/> You can check the customer name and current status
        <br/>
        <br/> →[Acquisition/Use amount] To earn or use
        <br/> Please enter the quantity
        <br/> After entering the quantity, you can check the quantity after you have accumulated or used it.
        <br/>
        <br/> →[Customer's Note]
        <br/> Enter what you want to remember
        <br/> You can check it out next time.
        <br/>
        <br/> →[Earning/using notes] When earning or using
        <br/> Please enter any memo you want to remember
        <br/>
        <br/> Finally, you can save through [Apply]
        
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	Can I check the earned/used history
         <br/> There is a distinction between visit and accrual or use.
         <br/>
         <br/> Number of accumulated/used (applied) and
         <br/> There is a status of accumulation of final credit/usage.
         <br/> Entered from related products and earned/used notes
         <br/> You can check the memo.
         <br/>
         <br/> Only 20 can be viewed at a time due to recent usage
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