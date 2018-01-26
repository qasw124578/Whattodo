<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!--지도 생성과정  -->
<!-- prevent IE6 flickering -->
<script type="text/javascript">
        try {
            document.execCommand('BackgroundImageCache', false, true);
        } catch (e) {
        }
    </script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=83Xkfwn4qaUTBwYcbhDn"></script>
</head>
<body>
	 <div>${obj }</div>
	<div class="w3-container">
		<table class="w3-table w3-striped w3-margin" style="width: 80%">
			<tr>
				<td>양식</td>
				<td>중식</td>
				<td>한식</td>
				<td>분식</td>
			</tr>
		</table>
		<!--패널 라인-->
			<div class="panel-group" id="accordion">
			<div class="panel panel-default">
			
			<c:forEach var="item" items="${restList}">
    		
				<div class="panel-heading" style="background-color:#672E3B">
					<h4 class="panel-title">
						<a style="color:#ffffff" data-toggle="collapse" data-parent="#accordion"
							href="#collapse${item.code}" >${item.name}</a>
					</h4>
				</div>
				<div id="collapse${item.code}" class="panel-collapse collapse">
					<div class="panel-body" style="display:flex; align-items:center; justify-contents:center;">
					<!-- <div class="panel-body"> -->
						<div style="display: inline-block; height:auto; width:30%;">
							<img src="http://post.phinf.naver.net/20150514_144/umph112_1431595096294McQLs_JPEG/mug_obj_143159509680481827.jpg"
								class="w3-round-large" style="width:100%; height:auto;" alt="img1">
						</div>
						<div id="map" style="width:50%;height:400px;"></div>
					</div>
					<h2> ${item.name} </h2>
					<p> ${item.explain} </p>
				</div>
				</c:forEach>
			</div>

		</div>
		</div>


<script type="text/javascript">
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 10
});

var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(restList.latitude, resList.longitude),
    map: map
});

		
</script>
</body>
</html>
