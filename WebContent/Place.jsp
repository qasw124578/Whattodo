<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=83Xkfwn4qaUTBwYcbhDn">
	</script>
</head>
<body>

	<!-- Top menu on small screens -->
	<jsp:include page="header.jsp" />
	<div>${obj }</div>
	<div class="w3-container" style="width: 100%; margin: auto;">
		<div class="w3-bar w3-border flex flex-align-center"
			style="width: 100%; margin-top: 10px;">
			<div class="color-ccc w3-bar-item w3-button" style="width: 20%;">액티비티</div>
			<div onclick="movePage(this)" id="P" class="w3-button"
				style="width: 20%;">이색체험</div>
			<div onclick="movePage(this)" id="R" class="w3-button"
				style="width: 20%;">소소함</div>
			<div class="w3-button" style="width: 20%;">힐링</div>
			<div class="w3-button" style="width: 20%;">문화</div>
			<div class="w3-button" style="width: 20%;">공원</div>
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
							<div class="panel-body"
								style="display: flex; align-items: center; justify-contents: center;">
								<!-- <div class="panel-body"> -->
								<div style="display: inline-block; height: auto; width: 30%;">
									<img src="./img/P_image/${item.code}.jpg"
										class="w3-round-large" style="width: 100%; height: auto;"
										alt="img1">
								</div>
								<div id="map${item.code}" style="width: 50%; height: 400px;"></div>

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
</body>
</html>
