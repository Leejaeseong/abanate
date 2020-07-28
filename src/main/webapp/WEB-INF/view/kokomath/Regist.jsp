<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyymmdd");

	// null			: 순수 접근
	// "success" 	: 성공
	// "dupleId" 	: 아이디 중복
	String processResult = (String)request.getAttribute( "processResult" );
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
			function onSubmit() {	/* submit */
				if( document.getElementById( "inputId" ).value == "" ) {
					alert( "아이디를 입력해 주세요" );
					return;
				} else if( document.getElementById( "inputName" ).value == "" ) {
					alert( "이름을 입력해 주세요" );
					return;
				} else if( document.getElementById( "inputPw" ).value == "" ) {
					alert( "비밀번호를 입력해 주세요" );
					return;
				} else if( document.getElementById( "inputPwChk" ).value == "" ) {
					alert( "비밀번호 확인을 입력해 주세요" );
					return;
				} else if( document.getElementById( "inputPw" ).value != document.getElementById( "inputPwChk" ).value ) {
					alert( "비밀번호와 비밀번호 확인이 다릅니다" );
					return;
				} else {
					document.getElementById( "registForm" ).submit();
				}
			}
			
			if( "dupleId" == "<%=processResult%>" ) {
				alert( "이미 가입된 아이디 입니다.\r\n\r\n다른 아이디로 다시 입력 부탁드립니다.\r\n\r\n불편을 드려 미안합니다." );
			}
			if( "success" == "<%=processResult%>" ) {
				alert( "가입되었습니다.\r\n\r\n로그인 해 주세요" );
				document.location.href = "main.do";
			}
		</script>
    </head>

    <body style="background-color:#FAFAFA" class="bg">
		<div class="divTopFrame">
			<a href="#" onclick="goIntroduce();">소개</a>
		</div>
		
		<br/>
		
		<div>
			<form method="post" id="registForm" action="./registDo.do">
				<table style="border:1px; border-color: #000000; width: 100%;">
					<tr>
						<td style="width: 20%"">&nbsp;</td>
						<td style="border:1px; text-align: left;">아이디 (필수,영문)</td>
						<td style="border:1px; text-align: left; width: 60%;"><input id="inputId" name="inputId" type="text" size="20" maxlength="20"></td>
					<tr/>
					<tr>
						<td style="width: 20%"">&nbsp;</td>
						<td style="border:1px; text-align: left;">이름 (필수)</td>
						<td style="border:1px; text-align: left; width: 60%;"><input id="inputName" name="inputName" type="text" size="20" maxlength="20"></td>
					<tr/>
					<tr>
						<td>&nbsp;</td>
						<td style="border:1px; text-align: left;">비밀번호 (필수)</td>
						<td style="border:1px; text-align: left;"><input id="inputPw" name="inputPw" type="password" size="20" maxlength="20"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td style="border:1px; text-align: left;">비밀번호 확인 (필수)</td>
						<td style="border:1px; text-align: left;"><input id="inputPwChk" name="inputPwChk" type="password" size="20" maxlength="20"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td style="border:1px; text-align: left;">이메일 주소</td>
						<td style="border:1px; text-align: left;"><input id="inputEmail" name="inputEmail" type="text" size="20" maxlength="50" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td style="border:1px; text-align: left;">학년</td>
						<td style="border:1px; text-align: left;"><input id="inputGrade" name="inputGrade" type="text" size="20" maxlength="10"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td style="border:1px; text-align: left;">주소</td>
						<td style="border:1px; text-align: left;"><input id="inputAddr" name="inputAddr" type="text" size="40" maxlength="60"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td style="border:1px; text-align: left;">남길 말</td>
						<td style="border:1px; text-align: left;"><textarea id="inputMsg" name="inputMsg" cols="40" rows="5" maxlength="300"></textarea></td>
					</tr>
				</table>
				<br/>
				<input type="button" value="가입" onclick="onSubmit();"/>
				<input type="reset" value="정보 지우기"/>
			</form>
		</div>
    </body>

</html>