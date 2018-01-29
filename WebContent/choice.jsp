<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<style>
/* @import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);

@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

.jh {
	font-family: 'Jeju Hallasan';
}

.hn {
	font-family: 'Hanna';
} */
body {
	font-family: "Lato", sans-serif;
}
.mySlides {
	display: none
}
/* #hidden{ visibility: hidden } */

.flex {display:flex;}
.flex-justify-between {justify-content:space-between;}
.flex-align-center {align-items:center;}
</style>
</head>
<body>
<div class="w3-content w3-padding-64" style="background-color : #f1f1f1;  max-width:2000px;margin-top:100px;">
	<!-- Navbar  -->
	<h2 class="w3-wide w3-center" id="first">서울 인프라 및 사업장<h2>
	<div class="w3-container w3-content w3-padding-64 flex flex-justify-between flex-align-center" id="contact" style="width:80%; height:400px; margin:auto" >
		<div class="w3-card-4 w3-opacity w3-hover-opacity-off" style="width:30%; height:250px;">
		<a href="/whattodo/choice.do?location=mapo">
		    <img src="https://image.samsungsds.com/global/ko/images/img/korea/img_office3.jpg?queryString=20171211104617" alt="Norway" style="width:100%">
		    <div class="w3-container w3-center"style="color:black">
		      <h4><p>MAPO</p></h4>
		    </div></a>
	  	</div>
	  	
	  	<a href="/whattodo/choice.do?location=seocho">
	  	<div class="w3-card-4 w3-opacity w3-hover-opacity-off" style="width:30%; height:250px;">
		    <img src="https://image.samsungsds.com/global/ko/images/img/korea/img_office1.jpg?queryString=20171211104617" alt="Norway" style="width:100%">
		    <div class="w3-container w3-center"style="color:black">
		      <h4><p>SEOCHO</p></h4>
		    </div></a>
	  	</div>
	  	
	  	<a href="/whattodo/choice.do?location=songpa">
	  	<div class="w3-card-4 w3-opacity w3-hover-opacity-off" style="width:30%; height:250px;">
		    <img src="https://image.samsungsds.com/global/ko/images/img/korea/img_office8.jpg" alt="Norway" style="width:100%">
		    <div class="w3-container w3-center" style="color:black">
		      <h4><p>SONGPA</p></h4>
		    </div></a>
	  	</div>
	</div>
	
	
	
	
	<!-- 
	<div class="w3-camo-sand">

		<div class="w3-container w3-content w3-padding-64"
			style="max-width: 800px">

			<div class="w3-row-padding w3-padding-32" style="margin: 0 -16px">
				<div class="w3-third w3-margin-bottom">
					<a target="_blank" href="img_mapo.jpg"> <img
						src="https://image.samsungsds.com/global/ko/images/img/korea/img_office3.jpg?queryString=20171211104617"
						style="vertical-align: text-top" width=100%
						class="img-circle" class="w3-hover-opacity" alt="마포구 삼성sds 사옥" align="left" >
						<div
							class="w3-container  w3-center w3-hover-opacity jh"style="color:black">
							<p>
								<b>마포</b>
							</p>
						</div></a>

				</div>
				
				<div class="w3-third w3-margin-bottom">

					<img
						src="https://image.samsungsds.com/global/ko/images/img/korea/img_office1.jpg?queryString=20171211104617"
						style="vertical-align: text-middle" width=100%
						class="img-circle" class="w3-hover-opacity" align="right" id="hidden" >
						
				</div>
				<div class="w3-third w3-margin-bottom">
					<a target="_blank" href="img_songpa.jpg"> <img
						src="https://image.samsungsds.com/global/ko/images/img/korea/img_office8.jpg"
						style="vertical-align: text-middle" width=100%
						class="img-circle" class="w3-hover-opacity" alt="송파구 삼성sds 사옥" align="right">
						<div
							class="w3-container w3-center w3-hover-opacity jh"style="color:black">
							<p>
								<b>송파</b>
							</p>
						</div></a>
						
				</div>
				</p>
				<div class="w3-third w3-margin-bottom  text-center" >
					<a target="_blank" href="img_songpa.jpg">
					<img
						src="https://image.samsungsds.com/global/ko/images/img/korea/img_office1.jpg?queryString=20171211104617"
						style="vertical-align: text-middle" width=100%
						class="img-circle" class="w3-hover-opacity" align="center">
						<div
							class="w3-container  w3-center w3-hover-opacity jh"style="color:black">
							<p>
								<b>서초</b>
							</p>
						</div></a>
				</div>
				
			</div>
		</div>
	</div>
 -->

	<!-- <div class="gallery">
<a href="#" onclick="location.href='http://meet.lg.com'"><img src="http://apply-cdn.lg.com/common/images/./img_gate_meetLG.png" alt="Meet LG 바로가기"></a>
</div> -->
</body>
</html>
