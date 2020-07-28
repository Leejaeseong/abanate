<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Navbar -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
    <div class="container">

      <!-- Brand -->
      <a class="navbar-brand" href="./index.do">
        <strong>MyCoup</strong>
      </a>
      
      <div class="navbar-brand">
      	<select id="idLanguageSelect" class="form-control form-control-sm" style="width:6em;" onchange="changeLanguage( this );">
            <option value="English" >English</option>
        	<option value="ko-KR">Korean</option>
      	</select>
      </div>
      
      <!-- Collapse -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Links -->
      <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <!-- Left -->
        <ul class="navbar-nav mr-auto">
        <!-- 로그인 안 함 -->
       	 <c:if test="${sessionScope.cmUsr == null}">
			<li class="nav-item" id="idNaviUiLogin">
				<a class="nav-link" href="./login.do">로그인</a>
			</li>
			<li class="nav-item" id="idNaviUiJoinMember">
				<a class="nav-link" href="./joinMember.do">회원 가입</a>
			</li>
       	 </c:if>
       	 
       	 <!-- 사용자 -->
       	 <c:if test="${sessionScope.cmUsr != null and sessionScope.cmStor == null}">
			<li class="nav-item" id="idNaviUiMyoucoup">
            	<a class="nav-link" href="./mycoupList.do">내 쿠폰(포인트) 함</a>
          	</li>
          	<li class="nav-item" id="idNaviUiAround">
	            <a class="nav-link" href="./around.do">내 주변 쿠폰(포인트)</a>
          	</li>
          	<li class="nav-item" id="idNaviUiMoveNumber">
	            <a class="nav-link" href="./moveNumber.do">번호 이동</a>
          	</li>
       	 </c:if>

		 <!-- 경영주 -->       	 
       	 <c:if test="${sessionScope.cmStor != null}">
			<li class="nav-item" id="idNaviUiSaveUse">
				<a class="nav-link" href="./saveUse.do">쿠폰(포인트) 적립/사용</a>
			</li>
			<li class="nav-item" id="idNaviUiVisitHistory">
				<a class="nav-link" href="./visitHistory.do">방문 내역</a>
			</li>
			<li class="nav-item" id="idNaviUiSetup">
				<a class="nav-link" href="./setup.do">쿠폰(포인트) 설정</a>
			</li> 
			<li class="nav-item" id="idNaviUiIntegrationCoupon">
				<a class="nav-link" href="./integrationCoupon.do">적립금 이전</a>
			</li>
       	 </c:if>
        	
         <!--  로그인 사용자 공통 -->
         <c:if test="${sessionScope.cmUsr != null}">
         	<li class="nav-item" id="idLogOut">
				<a class="nav-link" href="./logout.do">로그아웃</a>
			</li>
         </c:if>
        </ul>

        <!-- Right 
        <ul class="navbar-nav nav-flex-icons">
          <li class="nav-item">
            <a href="https://www.facebook.com/mdbootstrap" class="nav-link" target="_blank">
              <i class="fab fa-facebook-f"></i>
            </a>
          </li>
          <li class="nav-item">
            <a href="https://twitter.com/MDBootstrap" class="nav-link" target="_blank">
              <i class="fab fa-twitter"></i>
            </a>
          </li>
          <li class="nav-item">
            <a href="https://github.com/mdbootstrap/bootstrap-material-design" class="nav-link border border-light rounded"
              target="_blank">
              <i class="fab fa-github mr-2"></i>MDB GitHub
            </a>
          </li>
        </ul>
        -->

      </div> 

    </div>
  </nav>
  <!-- Navbar -->