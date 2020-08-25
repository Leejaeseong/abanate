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
        <span class="badge w-100 mb-2 mt-2" style="height:1.5em;"><i class="fas fa-info-circle"></i> Sign Up</span>        
      </h1>
    </div>

    <div class="container">
      
    <div class="row wow fadeIn border border-dark justify-content-center">

      <div class="row w-100">
      	<h5 class="mt-3 ml-3 mr-3 mb-3">
        	<span class="text-primary font-weight-bold">○ Easy membership management ○</span>
        	
        	<br/><br/>
        	<span class="text-success font-weight-bold">⊙</span>
        	It’s really easy.
→[Membership classification] Please change to management.

→[Phone number] Please enter your phone number

→[Password] Please enter the password of only 6 or more characters

→[Confirm password] Enter the same information as the password

→[Name or Name] Please enter the name of the manager.

→[E-mail address] To find out when the password is lost

→[Mutual name] Please enter the name of the store

→[Earning classification] Please decide how to store
Coupons are credited to the number of coupons.
Points will be credited as point points.
Once set, it cannot be changed.

→[Contact] Please enter the phone number of the store

→[Address] Please enter the location of the store
<br/>
         <br/> →[Latitude/Longitude] Please enter the location of the store
         <br/> This is the location of the store to be displayed to customers on the map.
         <br/> When registering as a member, the location of the store is displayed on the map of customers immediately.
         <br/> Click on the letters of latitude and longitude to bring up a Google map.
         <br/> Click the location or share the location
         <br/> The latitude and longitude appear in the link address.
         <br/> Please refer to the picture below
         <br/>
This is the store location to display on the map to customers.
Immediately upon signing up for membership, the store location is displayed on the customer's map.

→[Marketing Agreement] You can receive event information by email or phone.
        	<br/>
        	<img src="../../img/mycoup/find_store_location_en.png" alt="Find the latitude and longitude of my store" class="z-depth-0 img-fluid">
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