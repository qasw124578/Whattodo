<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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

	<!-- !PAGE CONTENT! -->
	<div class="w3-container" style="max-width: 1600px; margin-top: 20px; margin-bottom:20px;">
		<div style="width: 90%; margin: auto;">
		<h2><b>오늘의 추천 코스:</b> ${course.name }</h2>
		<h5 style="margin-left:1%;">${course.contents }</h5>
			<div class="w3-border w3-round-small " style="width: 100%; height: auto; margin-bottom:3%; overflow: hidden">
				<div class="flex w3-padding-large">
					<div class="flex flex-grow">
					<div id="wIcon" class="right-margin">
						<h3>
						<i onclick="getWeather();" class="w3-cell-middle w3-right right-margin wi wi-day-sunny" style="font-size:2rem"></i>
						</h3>
					</div>
			  		<span id="wState" class="w3-cell-middle w3-right right-margin"><h3>Winter</h3></span>
			  		</div>
			  		<div class="flex flex-grow">
			  			<div class="right-margin">
				  		<h3>
				  		<i class="w3-cell-middle w3-right right-margin wi wi-thermometer" style="font-size:2rem"></i>
				  		</h3>
				  		</div>
				  		<span id="tState" class="w3-cell-middle w3-right right-margin"><h3>-36.5</h3></span>
			  		</div>
  				</div>
				<div class="w3-padding-large padding-bot">
					
					
					
					<div id="map" style="width:100%;height:400px;"></div>
				
				
				
				</div>
			</div>
			
			<div class="flex flex-justify-between flex-wrap">
			
			<c:forEach var="detail" items="${detailList }">
			
				

				<div class="w3-card-4" style="width: 24%; min-width:200px; margin-bottom:3%;">
					<div class="w3-padding-small w3-opacity w3-hover-opacity-off"
						data-toggle="modal" data-target="#myModal${detail.code }"
						style="height: 160px; overflow: hidden">
						<img src="./img/P_image/${detail.code }.jpg" class="w3-round" style="width: 100%">
					</div>
					<div class="w3-container w3-center flex flex-align-center flex-justify-center" style="height:50px;">
						${detail.name }
					</div>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="myModal${detail.code }" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">${detail.name }</h4>
							</div>
							<div class="modal-body">
								<p>${detail.explain }</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div>

			</c:forEach>

			</div>

		</div>
	</div>
	
	<%-- 
	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	 --%>
<script type="text/javascript">
var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(${location.latitude}, ${location.longitude}),
    zoom: 10
});
</script>
<c:forEach var="loc" items="${detailList }">
<script>
var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(${loc.latitude}, ${loc.longitude}),
    map: map
});
</script>
</c:forEach>
</body>
</html>