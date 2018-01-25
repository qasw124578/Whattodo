<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!--map 테스트 용 jsp 파일  -->

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>오픈 API v2 - 지도 생성</title>
    <!-- prevent IE6 flickering -->
    <script type="text/javascript">
        try {
            document.execCommand('BackgroundImageCache', false, true);
        } catch (e) {
        }
    </script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=83Xkfwn4qaUTBwYcbhDn"></script>
</head>
<body>


<div id="map" style="border:1px solid #000; width:500px; height:400px; margin:20px;"></div>
<script type="text/javascript">
    var mapOptions = new naver.maps.LatLng(37.5010226, 127.0396037);
    var map = new naver.maps.Map('map', mapOptions); 
 
	
	var locationList = [];
	<c:forEach items="${locationList}" var="location">
	locationList.push({"latitude":"${location.latitude}","longitude":"${location.longitude}"}); 
	</c:forEach>
	
	    
    for(var i=0; i<locationList.length; ++i){
		var position = new naver.maps.LatLng(locationList[i].latitude,locationList[i].longitude);
		/* alert(position); */
		var markerOptions = {
		    "position": position,
		    "icon": {
		        url: 'http://static.naver.net/maps/v3/pin_default.png',
		        size: new naver.maps.Size(22, 35),
		        anchor: new naver.maps.Point(11, 35)
		    }
		};
		
		var marker = new naver.maps.Marker(markerOptions);
		marker.setMap(map); // 추가
    }

</script>
</body>