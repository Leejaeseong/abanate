<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="keywords" content="${mLang['site_keywords']}">
  <meta name="description" content="${mLang['site_description']}">
  
  <meta property="og:type" content="website"> 
  <meta property="og:title" content="My Coup">
  <meta property="og:description" content="${mLang['site_description']}">
  <meta property="og:image" content="https://www.mycoup.ml/img/mycoup/logo.png">
  <meta property="og:url" content="https://www.mycoup.ml">
  <!--  
  <meta name="googlebot" content="index,follow" />
  -->
  <title>My Coup</title>
  
  <link rel="canonical" href="https://www.mycoup/mycoup/index.do">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="../../css/mycoup/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="../../css/mycoup/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="../../css/mycoup/style.min.css" rel="stylesheet">
  
   <link rel="manifest" href="../../../test.menifest">
  
  <style type="text/css">
    @media (min-width: 800px) and (max-width: 850px) {
      .navbar:not(.top-nav-collapse) {
        background: #1C2331 !important;
      }
    }
  </style>
  
  <script>
  	// 네비게이터 포커싱
  	window.addEventListener("load", function(evt) {
  		
  		var urlName = '${urlName}';
  		urlName = urlName.charAt(0).toUpperCase() + urlName.substring( 1 );	// 첫글자 대문자 변환

  		if( document.querySelector( "#idNaviUi" + urlName ) ) {
  			document.querySelector( "#idNaviUi" + urlName ).classList.add( "active" );
  		}
  		
	});
  </script>

  <!-- google ad sense 
  <script data-ad-client="ca-pub-3806979393244246" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
  -->
    
</head>