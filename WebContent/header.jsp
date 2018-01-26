<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- Web Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
<style>
.w3-allerta {
  font-family: "Allerta Stencil", Sans-serif;
}
</style>

<!-- 수정: Icons Import -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="./icons/css/weather-icons.min.css">
<!-- 수정: jQuery Import -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
body {padding-right:0!important;}
body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
.bg-tawny-port {background-color: #672E3B!important;}
.bg-white {background-color: #f1f1f1!important;}
.txt-white {color: #f1f1f1!important;}
</style>

<!-- 수정: Style Modified -->
<style>
.w3-select {
	width:auto;
	margin-right: 2%;
}
.right-margin {margin-right: 2%;}
.right-margin-small {margin-right: 1%;}
.logo {
	font-size: 2em;
}

.flex {display:flex;}
.flex-grow {flex-grow:1;}
.flex-align-center{align-items:center;}
.flex-justify-center{justify-content:center;}
.flex-justify-between{justify-content:space-between;}
.flex-wrap{flex-wrap:wrap;}

.1em {font-size: 1em;}
.05em {font-size: 0.5em;}
.07em {font-size: 0.7em;}

.color-ccc {background-color: #ccc;}
.padding-bot{padding-bottom: 24px!important;}
.height-100{height:100%;}
.width-100{widht:100%;}
</style>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-black w3-animate-right w3-top w3-text-light-grey w3-large" style="z-index:3;width:250px;font-weight:bold;display:none;right:0;" id="mySidebar">
  <a href="javascript:void()" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-32">CLOSE</a> 
  <a href="#" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">PORTFOLIO</a> 
  <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">ABOUT ME</a> 
  <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-center w3-padding-16">CONTACT</a>
</nav>

<!-- Top menu on small screens -->
<header class="w3-container w3-top bg-tawny-port w3-padding-16 flex flex-align-center">
	<span class="logo w3-cell-middle w3-text-white w3-left w3-allerta">WhatTODO</span>
	
	<span class="flex-grow"></span>
	
  	<div id="wIcon" class="right-margin-small">
  	<i onclick="getWeather();" class="w3-cell-middle w3-right w3-text-white right-margin wi wi-day-sunny" style="font-size:2em"></i>
  	</div>
  	<span id="wState" class="w3-cell-middle w3-right w3-text-white right-margin">Winter</span>
  	<div class="right-margin-small">
  		<i class="w3-cell-middle w3-right w3-text-white right-margin wi wi-thermometer" style="font-size:1.7em"></i>
  	</div>
  	<span id="tState" class="w3-cell-middle w3-right w3-text-white right-margin">-36.5</span>
  	
  	<select class="w3-select w3-cell-middle w3-right w3-white" name="goo">
  		<option value="mapo">마포구</option>
  		<option value="seocho">서초구</option>
  		<option value="songpa">송파구</option>
  	</select>
  	
  	<a href="javascript:void(0)" class="w3-cell-middle w3-right bg-tawny-port" onclick="w3_open()">
  		<i class="w3-cell-middle w3-right w3-text-white right-margin fa fa-user" style="font-size:2.5em"></i>
  	</a>
</header>

<div class="w3-bar w3-border flex flex-align-center" style="width:88%;margin-top:100px;margin-left:6%;margin-right:6%;">
<div class="color-ccc w3-bar-item w3-button" style="width:20%;">추천 코스</div>
<div class="w3-button" style="width:20%;">관광지</div>
<div class="w3-button" style="width:20%;">식당</div>
<div class="w3-button" style="width:20%;">다른 코스</div>
<div class="w3-button" style="width:20%;">유저 코스</div>
</div>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<script>
// Script to open and close sidebar
var weather;
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

function getWeather() {
	$.ajax({
		url: "http://api.openweathermap.org/data/2.5/weather",
		data: {
			"APPID": "c93ab0e6ebef559a78615a5dc266a5fd",
			"lat": "37.566535",
			"lon": "126.977969"
		},
		success: function(data) {
			/*
			날씨: data.weather[0].main
			상세: data.weather[0].description
			아이콘: data.weather[0].icon
			온도: data.main.temp - 273
			http://openweathermap.org/img/w/10d.png
			*/
			$("#tState").text(Math.round((data.main.temp - 273)*10)/10);
			$("#wState").text(data.weather[0].main);
			$("#wIcon").html("<div class='flex flex-align-center flex-justify-center w3-circle w3-light-grey' style='overflow:hidden;'>"
			 + "<img src='http://openweathermap.org/img/w/"+data.weather[0].icon+".png' /></div>");
			alert(data.main.temp - 273);
		},
		error: function(data) {
			alert("날씨 받아오기 실패");
		}
		
	});
}
</script>