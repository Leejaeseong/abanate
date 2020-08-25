<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyymmdd");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="keywords" content="${mLang['site_keywords']}">
  		<meta name="description" content="${mLang['site_description']}">
  		<meta property="og:type" content="website"> 
  		<meta property="og:title" content="My Coup">
  		<meta property="og:description" content="${mLang['site_description']}">
  		<meta property="og:image" content="https://www.mycoup.ml/img/mycoup/logo.png">
  		<meta property="og:url" content="https://www.mycoup.ml">
  		<title>My Coup</title>
  		<link rel="canonical" href="https://www.mycoup/mycoup/index.do">
        <link href="favicon.ico" rel="icon" type="image/x-icon" />
        <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
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
