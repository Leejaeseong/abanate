<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyymmdd");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>강레오의 수학 교실-수학(Ⅱ)</title>
        <link href="../css/kokomath/tomcat.css?temp=<%=sdf%>" rel="stylesheet" type="text/css" />
		<style>
			body, html {
				height: 100%;
				margin: 0;
			}

			.bg {
				/* The image used */
				background-image: url("../img/kokomath/1.png");

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
				height: 30px;
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
			function goLogout() { /* 로그아웃 */
				document.location.href = "./logout.do";
			}
			function goMathTop() { /* 수학(상) */
				document.location.href = "./mathTop.do";
			}
			function goMathBottom() { /* 수학(하) */
				document.location.href = "./mathBottom.do";
			}
			function goMathOne() { /* 수학(Ⅰ) */
				document.location.href = "./mathOne.do";
			}
			function goLeave() { /* 탈퇴 */
				if( confirm( "정말 탈퇴하실려구요?") ) {
					document.location.href = "./memberLeave.do";					
				}
			}
		</script>
    </head>

    <body style="background-color:#FAFAFA" class="bg">
		<div class="divTopFrame">
			<a href="#" onclick="goIntroduce();">소개</a>
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" onclick="goMathTop();">수학(상)</a>
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" onclick="goMathBottom();">수학(하)</a>

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" onclick="goMathOne();">수(Ⅰ)</a>
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" onclick="goLogout();">로그아웃</a>
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" onclick="goLeave();">회원탈퇴</a>
		</div>
		
	</body>

</html>