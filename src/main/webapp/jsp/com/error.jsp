<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Error</title>
	
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<!-- Bootstrap core CSS -->
	<link href="/css/mycoup/bootstrap.min.css" rel="stylesheet">
	<!-- Material Design Bootstrap -->
	<link href="/css/mycoup/mdb.min.css" rel="stylesheet">
	<!-- Your custom styles (optional) -->
	<link href="/css/mycoup/style.min.css" rel="stylesheet">
	<!-- Utilities -->
  	<script type="text/javascript" async defer src="../../js/com/util.js?removeCache=<%=new java.util.Date().getTime()%>"></script>
  
</head>
<body style="background-image: url('../../../img/mycoup/error-background.jpg');">
	<div class="h-100 row align-items-center text-center">
	  	<div class="w-100">
	  		<h5 class="text-light font-weight-bold">시스템 오류가 발생하였습니다.</h5>
	  		<div class="w-100">&nbsp;</div>
			<h5 class="text-light font-weight-bold">관리자에게 문의하여 주십시오.</h5>
	  		<div class="w-100">&nbsp;</div>
			<button type="button" class="btn btn-danger" onclick="goMain();">돌아가기 <i class="fas fa-undo-alt"></i></button>
		</div>
	</div>
</body>
</html>