<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyymmdd");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="keywords" content="쿠폰 관리, 무료 쿠폰, 무료, 포인트 관리, Coupon management, Free coupon, Free, Point management">
  		<meta name="description" content="간편하고 편리한 무료 쿠폰, 포인트 관리 웹 사이트 입니다.">
  		<title>My Coup</title>
        <link href="favicon.ico" rel="icon" type="image/x-icon" />
        <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
        <link href="tomcat.css?temp=<%=sdf%>" rel="stylesheet" type="text/css" />
		<script>
			/*
			if( window.location.host.indexOf( "sooho-kr.com" ) != -1 ) {
				
			} else if( window.location.host.indexOf( "sooho-kr.com" ) != -1 ) {
				document.location.href = "./jsp/michae/LangStudy.jsp";
			} else {
				document.location.href = "/kokomath/main.do";
			}
			*/
			let protocol = "https";
			if( location.hostname == "localhost" ) {
				protocol = "http";
			}
			document.location.href = protocol + "://" + location.hostname + "/mycoup/index.do";
			
		</script>
		
		<!-- google ad sense 
  		<script data-ad-client="ca-pub-3806979393244246" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
		-->
    </head>

    <body style="background-color:#FAFAFA">
    </body>

</html>
