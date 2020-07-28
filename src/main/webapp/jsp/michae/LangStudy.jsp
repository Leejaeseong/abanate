<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyymmdd");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>즐거운 공부 놀이방</title>
        <link href="../../css/michae/tomcat.css?temp=<%=sdf%>" rel="stylesheet" type="text/css" />
		<style>
			body, html {
				height: 100%;
				margin: 0;
			}

			.bg {
				/* The image used */
				background-image: url("../../img/michae//hi.jpg");

				height: 100%;
				//width: 100%;

				/* Center and scale the image nicely */
				background-position: center;
				background-repeat: no-repeat;
				background-size: contain;
				
			}
		</style>
		<script>
			var audio 		= '';
			var mp3Folder 	= "../../cont/michae/mp3/";
			var loopCnt 	= 2;	// 반복 횟수
			var loopIdx		= 0;	// 반복 위치
			var listIdx 	= 0;	// play 위치
			var langIdx 	= 0;	// 시작 = 0, 1 : 한국어, 2 : 중국어, 3 : 영어
			var delay 		= 1;	// 쉬는 시간( 초 )
			var isEnd		= false;
			
			//var playListAll = "001,002,003,004,005,006,007,008,009,010,011,012,013,014,015,016,017,018,019,020,021,022,023,024,025,026,027,028,029,030,031,032,033,034,035,036,037,038,039,040";
			var playListAll = "001,002,003,004,005,006,007,008,009,010,011,012,013,014,015,016,017,018,019,020,021,022,023,024,025,026,027,028,029,030,031,032,033,034,035,036,037,038,039,040,041,042,043,044,045,046,047,048,049,050,051,052,053,054,055,056,057,058,059,060,061";
			var playListArr = Array();
			
			var langSoundFile;
			
			window.onload = function(){
				playListArr = playListAll.split(",");
				document.getElementById( "chapterNum" ).value = playListArr.length;
			}
			
			function init() {
				loopCnt = document.getElementById( "repeatCnt" ).value;
				loopIdx = 0;
				langIdx = 0;
				listIdx = 0;
				isEnd 	= false;
			}
			
			function listenSound() {
				playListArr = playListAll.split(",");
				var playSound = playListArr[ document.getElementById( "chapterNum" ).value - 1 ];
				
				var fileNm = mp3Folder + playSound + "." + "chn" + ".mp3";
				audio = new Audio( fileNm );
				audio.load();
				audio.addEventListener('ended',listenSound2);
				audio.play();
			}
			function listenSound2() {
				playListArr = playListAll.split(",");
				var playSound = playListArr[ document.getElementById( "chapterNum" ).value - 1 ];
				var fileNm = mp3Folder + playSound + "." + "eng" + ".mp3";
				audio = new Audio( fileNm );
				audio.load();
				audio.play();
			}
			function listenMorning() {
				var fileNm = mp3Folder + "morning.chn.mp3";
				audio = new Audio( fileNm );
				audio.load();
				audio.play();
			}
			function listenNight() {
				var fileNm = mp3Folder + "night.chn.mp3";
				audio = new Audio( fileNm );
				audio.load();
				audio.play();
			}
			
			function startToday() {
				playListArr = playListAll.split(",");
				var playListTmp = Array();
				playListTmp[0] = playListArr[ playListArr.length - 1 ];
				playListTmp[1] = playListArr[ playListArr.length - 2 ];
				playListTmp[2] = playListArr[ playListArr.length - 6 ];
				playListArr = playListTmp;
				init();
				selectSound();
			}
			
			function startAll() {
				playListArr = playListAll.split(",");
				init();
				selectSound();
			}
			
			function selectSound() {
				// 끝
				if( isEnd ) {
					return;
				}
				
				var fileNm = '';
				// 시작
				if( listIdx == 0 && langIdx == 0 ) {
					fileNm = mp3Folder + "greet" + ".mp3";
				} else {
					var langTp = "";
					if( langIdx == 1 ) {
						langTp = "kor";
					} else if( langIdx == 2 ) {
						langTp = "chn";
					} else if( langIdx == 3 ) {
						langTp = "eng"; 
					}
					fileNm = mp3Folder + playListArr[listIdx] + "." + langTp + ".mp3";
				}
				
				console.log( "playListArr.length = " + playListArr.length
							,"listIdx = " + listIdx 
							,"langIdx = " + langIdx
							,"loopIdx = " + loopIdx
				)
				
				console.log( "playListArr[listIdx]" + playListArr[listIdx], playListArr[listIdx] == undefined );
				if( playListArr[listIdx] == undefined ){
					isEnd = true;
					fileNm = mp3Folder + "bye.mp3";
				}
				setTimeout( function() { playAudio( fileNm ); } , delay * 1000 );
				
				if( langIdx == 1 ) {	// [1]한국어는 한번만
					loopIdx = 0;
					langIdx = 2;
				} else if( langIdx == 3 && ( loopIdx + 1 ) == loopCnt ) { // [3]영어 끝나면 다음 문장으로 [1]국어로 설정
					listIdx++;
					loopIdx = 0;
					langIdx = 1;
				} else if( ( loopIdx + 1 ) == loopCnt ) { // 반복이 끝나면 언어를 다음것으로 설정
					loopIdx = 0;
					langIdx++;
				} else {	// 반복 위치 증가
					if( langIdx == 0 ) {
						langIdx++;
					}
					loopIdx++;
				}
			}
			
			function playAudio( fileNm ) {
				console.log( "play fileName", fileNm );
				audio = new Audio( fileNm );
				audio.load();
				audio.addEventListener('ended',selectSound);
				audio.play();
			}
			
			function viewLecture() {
				document.location.href = "../../cont/michae/pdf/Lecture_to_80.pdf";
			}
			
			function movePlayMovie() {
				document.location.href = "./PlayMovie.jsp";
			}
		</script>
    </head>

    <body class="bg">
		<div style="background-color:#FAFAFA">
			<button type="button" onclick="startToday();" style="width:150px; height:50px;"/>오늘도 배워볼까요?</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="startAll();" style="width:200px; height:50px;"/>배운 것 전부 들어볼까요?</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="viewLecture();" style="width:200px; height:50px;"/>배운게 뭘까요?</button>
			<!--
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="moveLeo();" style="width:300px; height:50px;"/>강레오 수학</button>
			-->
			
			<br/><br/>
			
			<input type="text" id="repeatCnt" style="width:50px; height:40px; text-align:center;" value="2"/>듣기 반복
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" id="chapterNum" style="width:50px; height:40px; text-align:center;" value="1"/>강<button type="button" onclick="listenSound();" style="width:200px; height:50px;"/>이거 한번만 들어볼래요</button>
			
			<br/><br/>
			
			<button type="button" onclick="listenMorning();" style="width:80px; height:50px;"/>아침에</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="listenNight();" style="width:80px; height:50px;"/>저녁에</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="movePlayMovie();" style="width:80px; height:50px;"/>놀자</button>
			
		</div>
    </body>

</html>