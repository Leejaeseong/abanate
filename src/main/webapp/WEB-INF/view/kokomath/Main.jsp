<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyymmdd");
	
	// null		: 순수 접근
	// "false" 	: 로그인 접근 실패
	// "true"	: 로그인 상태
	// "leave"	: 회원 탈퇴
	String pageAccessType = (String)request.getAttribute( "isLogin" );
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>강레오의 수학 교실</title>
        <link href="../css/kokomath/tomcat.css?temp=<%=sdf%>" rel="stylesheet" type="text/css" />
		<style>
			body, html {
				height: 100%;
				margin: 0;
			}

			.bg {
				/* The image used */
				//background-image: url("../img/kokomath/1.png");

				height: 100%;
				//width: 100%;

				/* Center and scale the image nicely */
				background-position: center;
				background-repeat: no-repeat;
				background-size: contain;
			}
			
			.divMoviewText { /* Text css that placed over movie clip */
				text-align: left;
				font-weight: bold;
				font-style: italic;
				color: #000000;
			}
			
			.divTopFrame { /* Top Menu */
				background-color: #7B7B7B;
				height: 35px;
				font-size: 20px;
				color: #FFFFFF;
				text-align: center;
				vertical-align: middle;				
			}
			
			a:link 		{ color: #FFFFFF; 	}	/* unvisited link */
			a:visited 	{ color: #FFFFFF;	}	/* visited link */
			a:hover 	{ color: #FFFFFF;	}	/* mouse over link */
			a:active 	{ color: #FFFFFF;	}	/* selected link */
			
		</style>
		<script>
			function goIntroduce() { /* 소개 이동 */
				document.location.href = "./main.do";
			}
			function goMathTop() { /* 심화 - 수학(상) */
				document.location.href = "./mathTop.do";
			}
			function goRegist() { /* 가입 이동 */
				document.location.href = "./registInit.do";
			}
			function goLogout() { /* 로그아웃 */
				document.location.href = "./logout.do";
			}
			function goLogin() { /* 로그인 */
				if( document.getElementById( "inputId" ).value == "" ) {
					alert( "아이디를 입력해 주세요" );
					return;
				} else if( document.getElementById( "inputPw" ).value == "" ) {
					alert( "비밀번호를 입력해 주세요" );
					return;
				}
				document.getElementById( "loginForm" ).submit();
			}
			
			if( "false" == "<%=pageAccessType%>" ) {
				alert( "로그인이 필요합니다" );
			}
			if( "leave" == "<%=pageAccessType%>" ) {
				alert( "탈퇴되었습니다.\r\n\r\n더 좋은 모습으로 다시 만나요^^" );
			}
		</script>
    </head>

    <body style="background-color:#FAFAFA" class="bg">
		<form method="post" id="loginForm" action="./login.do">
			<div class="divTopFrame">
				<a href="#" onclick="goIntroduce();">소개</a>
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" onclick="goMathTop();">심화</a>
<%if( "true" != pageAccessType ) { %>				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" onclick="goRegist();">회원가입</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				아이디 : <input id="inputId" name="inputId" type="text" size="10" maxlength="20">
				&nbsp;&nbsp;
				비밀번호 : <input type="password" id="inputPw" name="inputPw" size="10" maxlength="20">
				<a href="#" onclick="goLogin();">로그인</a>
<%} else {%>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" onclick="goLogout();">로그아웃</a>
<%} %>
			</div>
		</form>
		
		<br/>
		<div class="divMoviewText">[ 소개합니다 ]<br/><iframe width="950" height="534" src="https://www.youtube.com/embed/mDU_uxSVmUs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		
	<!--
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/iiUmW8_G2Hk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/ui-TZ_iamUw" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/ui-TZ_iamUw" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/YOn7396mf1E" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/pj-aEfM4zgU" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/I8mAzaIv26Q" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/dFIg8OhRK6A" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/oTFDkmPr0Ss" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/fZzkTObOiN4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/BoiujovTd-k" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/HWUJvRAFc-A" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/4C91q1Od4i4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/LHrkwSBZbxU" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/AlO_SBESCWI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/8ZiM1aCOu0E" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/Nmij1-uiPqg" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/6oirzgG7gHU" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/Iw8fQPC9gEc" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/zTRSf9j8mNg" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/wH0oKMx4Zr0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/TpVH0XCGXyc" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/Cri0_tUiy2A" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/Z9T6-lvFmZY" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/UpI9_1GWQPg" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/dzPpa6q3zCI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/BFmrJYCFktI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/NnF3h8p67PA" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/8XRasGQaqvU" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/WiJpmRVM3Js" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/-VReJY78ixY" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/_Z-DeCOET74" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/-vYBxP0iMoM" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/MmWV2-i1oF0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/1kLFG8h8wJk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/MOPRZMyDppw" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/MSRBxzZU6b8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/7Nn2V49Vtb4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/nDiaQINR-7g" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/_na1Moa0ghs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/wEpchxmZlDg" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/cx5IDm8puIk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/CvY0KLI5fn4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/0ZIY_kyvrkM" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/8PlJW2FOXpM" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/t0Y6726wI78" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/os0h08f1Nhs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/Qqlsn3m7Pek" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/JhFHUigTymc" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/LY4P5bwOZ2A" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/8SMFd3EMYIE" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/gyvytPnYms0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/OUUstHdIauE" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/NsDLugaFdKg" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/5pXKxqTPtsE" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/yDODfxah7uk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/8gxyA3teVr8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
		<div><iframe width="950" height="534" src="https://www.youtube.com/embed/Ils1vKYHoCE" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div><br/>
	-->
    </body>

</html>