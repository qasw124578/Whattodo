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
	<div class="w3-container" style="max-width: 1600px; margin-top: 83px">
		<div style="width: 80%; margin: auto;">
			<div class="w3-margin"
				style="width: 100%; height: 400px; overflow: hidden">
				<img src="http://cfile8.uf.tistory.com/image/2309CC3758D4F80A283284" />
			</div>

			<div class="flex w3-margin">
				<div class="w3-card-4" style="width: 25%">
					<div class="no-padding w3-opacity w3-hover-opacity-off"
						data-toggle="modal" data-target="#myModal"
						style="height: 200px; overflow: hidden">
						<img src="./img/chige.png" alt="Norway" style="width: 100%">
					</div>
					<div class="w3-container w3-center">
						<p>Korean Food</p>
					</div>
				</div>


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



				<div class="w3-card-4" style="width: 25%">
					<div class="w3-opacity w3-hover-opacity-off"
						style="height: 200px; overflow: hidden">
						<img src="./img/pizza.jpg" alt="Norway"
							style="width: 100%; overflow: hidden">
					</div>
					<div class="w3-container w3-center">
						<p>The Troll's tongue in Hardanger, Norway</p>
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