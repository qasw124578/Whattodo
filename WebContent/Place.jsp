<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
a.w3-button {
	text-decoration-line: none;
}
</style>
<!--지도 생성과정  -->
<!-- prevent IE6 flickering -->
<script type="text/javascript">
        try {
            document.execCommand('BackgroundImageCache', false, true);
        } catch (e) {
        }
    </script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=83Xkfwn4qaUTBwYcbhDn">
	</script>
</head>
<body>

	<!-- Top menu on small screens -->
	<jsp:include page="header.jsp" />
	<div>${obj }</div>
	<div class="w3-container">
		<div class="w3-margin-bottom w3-margin-top w3-bar flex flex-align-center flex-justify-center"
			style="width: 100%; margin-top: 10px;">
			<div onclick="selectTheme(this)" class="w3-button w3-white" style="width: 14%;">액티비티</div>
			<div onclick="selectTheme(this)" class="w3-button w3-white" style="width: 14%;">이색체험</div>
			<div onclick="selectTheme(this)" class="w3-button w3-white" style="width: 14%;">소소함</div>
			<div onclick="selectTheme(this)" class="w3-button w3-white" style="width: 14%;">힐링</div>
			<div onclick="selectTheme(this)" class="w3-button w3-white" style="width: 14%;">문화</div>
			<div onclick="selectTheme(this)" class="w3-button w3-white" style="width: 14%;">공원</div>
		</div>
		<!--패널 라인-->
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">

				<c:forEach var="item" items="${restList}">

					<div class="panel-heading" style="background-color: #672E3B">
						<h4 class="panel-title">
							<a style="color: #ffffff" data-toggle="collapse"
								data-parent="#accordion" href="#collapse${item.code}">${item.name}</a>
						</h4>
					</div>
					<div id="collapse${item.code}" class="panel-collapse collapse">
						<div class="panel-body flex flex-align-center flex-justify-center">
						<!-- <div class="panel-body"> -->
							<div class="w3-margin width-50 flex flex-align-center flex-justify-center" style="overflow:hidden; width:50%; height: 300px;">
								<img src="./img/P_image/${item.code}.jpg"
									style="width:100%; height:auto;" alt="img1">
							</div>
							<div class="w3-margin width-50 flex flex-align-center flex-justify-center" style="margin-right: 0;">
								<div id="map${item.code}" style="width:90vh;height:300px;"></div>
							</div>
							<!--지도 생성 및 지도 마커 스크립트  -->
							<script type="text/javascript">
							var map = new naver.maps.Map('map${item.code}', {
							    center: new naver.maps.LatLng(${item.latitude}, ${item.longitude}),
							    zoom: 10
							});
							
							var marker = new naver.maps.Marker({
							    position: new naver.maps.LatLng(${item.latitude}, ${item.longitude}),
							    map: map
							});		
							</script>

						</div>
						<h2>${item.name}</h2>
						<p>${item.explain}</p>
					</div>
				</c:forEach>
			</div>

		</div>
	</div>
	<%-- <!-- Footer -->
	<jsp:include page="footer.jsp" /> --%>
	<script type="text/javascript">
$(document).ready(function() {
	$("#accordion > div:first-child > div:nth-child(2)").addClass("in");	
});

function selectTheme(obj) {
	location.href="restaurant.do?group=P&theme="
			+ encodeURI($(obj).text(), "UTF-8");
};
</script>
</body>
</html>
