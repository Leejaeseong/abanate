<%@page import="javax.websocket.Session"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyymmdd");
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="header.jsp"/>
<jsp:include page="comHeader.jsp"/>
<body>

  <jsp:include page="navigator.jsp"/>


  <!-- Full Page Intro -->
  <!--  
  <div class="view" style="background-image: url('https://mdbootstrap.com/img/Photos/Others/images/93.jpg'); background-repeat: no-repeat; background-size: cover;">
  -->
  <div class="view" style="background-image: url('../../img/mycoup/maxresdefault.jpg'); background-repeat: no-repeat; background-size: cover;">

    <!-- Mask & flexbox options-->
    <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

      <!-- Content -->
      <div class="text-left white-text mx-5 wow fadeIn">
        <h5 class="mb-4">
          <i class="far fa-star"></i> <!--쿠폰/포인트 적립,고객관리-->${mLang["ind_intro1"]}<br/><br/>
          <i class="far fa-star"></i> <!--번거로운 App 설치-->${mLang["ind_intro2"]} <label class="text-danger font-weight-bold">NO!</label><br/><br/>
          <i class="far fa-star"></i> <!--크고 비싼 종이쿠폰-->${mLang["ind_intro3"]} <label class="text-danger font-weight-bold">NO!</label><br/><br/>
          <i class="far fa-star"></i> <!--기계 장비 도입 -->${mLang["ind_intro4"]} <label class="text-danger font-weight-bold">NO!</label><br/><br/>
          <i class="far fa-star"></i> <!--모든 서비스는-->${mLang["ind_intro5_1"]} <label class="text-danger font-weight-bold"><!--무료-->${mLang["ind_intro5_2"]}</label><br/><br/>
          <!--이제 쿠폰과 포인트를 편리하게 모아 보아요-->${mLang["ind_intro5_3"]}
        </h5>

		<!--  
        <p class="mb-4 d-none d-md-block">
          <strong>The most comprehensive tutorial for the Bootstrap 4. Loved by over 500 000 users. Video and written
            versions available.
            Create your own, stunning website.</strong>
        </p>
		-->

      <!-- <div class="bg-primary"> -->
	   <c:if test="${sessionScope.cmUsr == null}">
        <a href="./login.do" class="btn btn-outline-white btn-sm" style="width:10em;"><span id="idTextLogin"><!--로그인-->${mLang["login"]}</span>
          <i class="fas fa-sign-in-alt"></i> 
        </a>
        
        <a href="./joinMember.do" class="btn btn-outline-white btn-sm" style="width:13em; padding-left:1em; padding-right:1em;"><!--간편 가입-->${mLang["easy_join"]}
          <i class="far fa-address-card"></i>
        </a>
       </c:if>
      <!-- </div> -->
      
    </div>
      <!-- Content -->

    </div>
    <!-- Mask & flexbox options-->

  </div>
  <!-- Full Page Intro -->

  <!--Main layout-->
  <main>
    <div class="container">

      <hr class="my-5">

      <!--Section-->
      <section>

        <jsp:include page="comIntroArticle.jsp"/>

      </section>
      <!--Section-->

      <hr class="mb-5">
    </div>
  </main>
  <!--Main layout-->

<jsp:include page="comFooter.jsp"/>
<jsp:include page="footer.jsp"/>
</body>

</html>