<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyymmdd");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <title>내 쿠폰함</title>
        <link href="../../css/michae/tomcat.css?temp=<%=sdf%>" rel="stylesheet" type="text/css" />
		<style>
			.container {
			  width: 70%;
			  height: 70%;
			  margin: 40px auto;			  
			}
			
			.table{				
				width: 100%;
				border: 1px solid #444444;
				border-collapse: collapse;
			}
			
			.th, .td {
				/*
				border-width:1px 1px 1px 1px;
				border-style:solid solid solid solid;
				*/
				border: 1px solid #444444;
			}
			
			.left{
				text-align: left;
			}
		</style>
		<script>
			
		</script>
    </head>

    <body class="bg">
    	<div class="container">
    		<table>
    		<tr>
  				<td align="center">내 쿠폰</td>  				
  			</tr>
  			<tr>
  				<td>
  					<table class="table">  					
  					<tr>
  						<th class="th">상호</th>
  						<th class="th">쿠폰 도장 수</th>
  						<th class="th">쿠폰 사용 수</th>
  						<th class="th">최근 방문</th>
  						<th class="th">주소</th>
  						<th class="th">전화번호</th>
  						<th class="th">업종</th>
  					</tr>
  					<tr>
  						<td class="td left">커피빈 잠실점</td>
  						<td class="td">3 [사용하기]</td>
  						<td class="td">1 [확인하기]</td>
  						<td class="td">2019.09.10 19:30</td>
  						<td class="td">서울 송파구 잠실동...</td>
  						<td class="td">02-1234-5678</td>
  						<td class="td">요식업</td>
  					</tr>
  					<tr>
  						<td class="td left">스타벅스 대구점</td>
  						<td class="td">3</td>
  						<td class="td">1 [확인하기]</td>
  						<td class="td">2019.09.10 19:30</td>
  						<td class="td">서울 송파구 잠실동...</td>
  						<td class="td">02-1234-5678</td>
  						<td class="td">요식업</td>
  					</tr>
  					<tr>
  						<td class="td left">이차돌 잠실점</td>
  						<td class="td">3</td>
  						<td class="td">1 [확인하기]</td>
  						<td class="td">2019.09.10 19:30</td>
  						<td class="td">서울 송파구 잠실동...</td>
  						<td class="td">02-1234-5678</td>
  						<td class="td">요식업</td>
  					</tr>
  					<tr>
  						<td class="td left">중국요리 잠실점</td>
  						<td class="td">3</td>
  						<td class="td ">1 [확인하기]</td>
  						<td class="td">2019.09.10 19:30</td>
  						<td class="td">서울 송파구 잠실동...</td>
  						<td class="td">02-1234-5678</td>
  						<td class="td">요식업</td>
  					</tr>
  					<tr>
  						<td class="td left">VIPS 잠실점</td>
  						<td class="td">3 [사용하기]</td>
  						<td class="td">1 [확인하기]</td>
  						<td class="td">2019.09.10 19:30</td>
  						<td class="td">서울 송파구 잠실동...</td>
  						<td class="td">02-1234-5678</td>
  						<td class="td">요식업</td>
  					</tr>
  					</table>
  				</td>
  			</tr>
  			<tr>
  				<td align="center"><img src="../../img/mycoup/map_sample.jpg"/></td>  				
  			</tr>
  			<tr>
  				<td align="center">&nbsp;</td>  				
  			</tr>  	
  			<tr>
  				<td align="center">쿠폰 사용 흔적</td>  				
  			</tr>
  			<tr>
  				<td>
  					<table class="table">  					
  					<tr>
  						<th class="th">사용일시</th>
  						<th class="th">상호</th>
  						<th class="th">쿠폰 사용 수</th>
  						<th class="th">쿠폰 차감 수</th>  						
  						<th class="th">주소</th>
  						<th class="th">전화번호</th>
  						<th class="th">업종</th>
  					</tr>
  					<tr>
  						<td class="td">2019.09.10 19:30</td>
  						<td class="td left">커피빈 잠실점</td>
  						<td class="td">1</td>
  						<td class="td">10</td>  						
  						<td class="td">서울 송파구 잠실동...</td>
  						<td class="td">02-1234-5678</td>
  						<td class="td">요식업</td>
  					</tr>
  					<tr>
  						<td class="td">2019.09.10 19:30</td>
  						<td class="td left">스타벅스 대구점</td>
  						<td class="td">1</td>
  						<td class="td">10</td>  						
  						<td class="td">서울 송파구 잠실동...</td>
  						<td class="td">02-1234-5678</td>
  						<td class="td">요식업</td>
  					</tr>
  					<tr>
  						<td class="td">2019.09.10 19:30</td>
  						<td class="td left">이차돌 잠실점</td>
  						<td class="td">1</td>
  						<td class="td">10</td>
  						<td class="td">서울 송파구 잠실동...</td>
  						<td class="td">02-1234-5678</td>
  						<td class="td">요식업</td>
  					</tr>
  					<tr>
  						<td class="td">2019.09.10 19:30</td>
  						<td class="td left">중국요리 잠실점</td>
  						<td class="td">1</td>
  						<td class="td">10</td>
  						<td class="td">서울 송파구 잠실동...</td>
  						<td class="td">02-1234-5678</td>
  						<td class="td">요식업</td>
  					</tr>
  					<tr>
  						<td class="td">2019.09.10 19:30</td>
  						<td class="td left">VIPS 잠실점</td>
  						<td class="td">1</td>
  						<td class="td">10</td>
  						<td class="td">서울 송파구 잠실동...</td>
  						<td class="td">02-1234-5678</td>
  						<td class="td">요식업</td>
  					</tr>
  					</table>
  				</td>
  			</tr>		
    		</table>
		</div>
		
    </body>

</html>