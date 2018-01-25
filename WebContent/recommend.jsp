<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
</head>

<body>

	<!-- Top menu on small screens -->
	<jsp:include page="header.jsp" />

	<!-- !PAGE CONTENT! -->
	<div class="w3-container" style="max-width: 1600px; margin-top: 20px; margin-bottom:20px;">
		<div style="width: 90%; margin: auto;">
		<h1><b>Today's What TODO?</b></h1>
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
					<img style="width:100%;" src="http://cfile8.uf.tistory.com/image/2309CC3758D4F80A283284" />
				</div>
			</div>

			<div class="flex flex-justify-between">
				<div class="w3-card-4" style="width: 24%">
					<div class="no-padding w3-opacity w3-hover-opacity-off"
						data-toggle="modal" data-target="#myModal"
						style="height: 200px; overflow: hidden">
						<img src="./img/chige.png" alt="Norway" style="width: 100%">
					</div>
					<div class="w3-container w3-center">
						<p>Korean Food</p>
					</div>
				</div>
				
<!-- 허수---------------------------------------------------------------------------------------- -->
				<div class="w3-card-4" style="width: 24%">
					<div class="no-padding w3-opacity w3-hover-opacity-off"
						data-toggle="modal" data-target="#myModal"
						style="height: 200px; overflow: hidden">
						<img src="./img/chige.png" alt="Norway" style="width: 100%">
					</div>
					<div class="w3-container w3-center">
						<p>Korean Food</p>
					</div>
				</div>
				
				<div class="w3-card-4" style="width: 24%">
					<div class="no-padding w3-opacity w3-hover-opacity-off"
						data-toggle="modal" data-target="#myModal"
						style="height: 200px; overflow: hidden">
						<img src="./img/chige.png" alt="Norway" style="width: 100%">
					</div>
					<div class="w3-container w3-center">
						<p>Korean Food</p>
					</div>
				</div>
				
				<div class="w3-card-4" style="width: 24%">
					<div class="no-padding w3-opacity w3-hover-opacity-off"
						data-toggle="modal" data-target="#myModal"
						style="height: 200px; overflow: hidden">
						<img src="./img/chige.png" alt="Norway" style="width: 100%">
					</div>
					<div class="w3-container w3-center">
						<p>Korean Food</p>
					</div>
				</div>
<!-- 허수---------------------------------------------------------------------------------------- -->

				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Korean Food</h4>
							</div>
							<div class="modal-body">
								<p>Some text in the modal.</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div>


			</div>

		</div>
	</div>
	
	<%-- 
	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	 --%>
</body>
</html>