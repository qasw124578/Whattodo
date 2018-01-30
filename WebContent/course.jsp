<%@page import="com.java.model.vo.Course"%>
<%@page import="com.java.model.vo.Restaurant"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	ArrayList<ArrayList<Restaurant>> detail_list = (ArrayList<ArrayList<Restaurant>>) request.getAttribute("detail_list");
	ArrayList<Course> course_list = (ArrayList<Course>) request.getAttribute("course_list");
%>
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

	<!-- Top menu on small screens -->
	<jsp:include page="header.jsp" />
	<div class="w3-container">
		<table class="w3-table w3-striped w3-margin" style="width: 80%">
			<tr>
				<td>힐링</td>
				<td>소소함</td>
				<td>문화</td>
				<td>이색체험</td>
				<td>액티비티</td>
			</tr>
		</table>
		<!--패널 라인-->
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">

				<% for(int i=0; i<course_list.size(); i++ ) {%>
					<% for(int j=0; j<detail_list.size(); j++ ) {%>
						<div class="panel-heading" style="background-color: #d8a6b3">
							
							<h4 class="panel-title">
							
								<a style="color: #ffffff" data-toggle="collapse"
									data-parent="#accordion" href="#collapse<%=course_list.get(i).getCode() %>"><%=course_list.get(i).getName() %></a>
							</h4>
						</div>
						<div id="collapse<%=course_list.get(i).getCode() %>" class="panel-collapse collapse">
							<div class="panel-body"
								style="display: flex; align-items: center; justify-contents: center;">
								<!-- <div class="panel-body"> -->
								
								<div style="display: inline-block; height: auto; width: 30%;">

									<div class="w3-card-4"
										style="width: 24%; min-width: 200px; margin-bottom: 3%;">
										<div class="w3-padding-small w3-opacity w3-hover-opacity-off"
											data-toggle="modal" data-target="#myModal<%=detail_list.get(i).get(j).getCode() %>"
											style="height: 160px; overflow: hidden">
											<img src="./img/P_image/<%=detail_list.get(i).get(j).getCode() %>.jpg" class="w3-round"
												style="width: 100%">
										</div>
										<div
											class="w3-container w3-center flex flex-align-center flex-justify-center"
											style="height: 50px;"><%=detail_list.get(i).get(j).getName() %></div>
									</div>
									<!-- Modal -->
									<div class="modal fade" id="myModal<%=detail_list.get(i).get(j).getCode() %>"
										role="dialog">
										<div class="modal-dialog">

											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title"><%=detail_list.get(i).get(j).getName() %></h4>
												</div>
												<div class="modal-body">
													<p><%=detail_list.get(i).get(j).getExplain() %></p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button>
												</div>
											</div>

										</div>
									</div>


								</div>
								<div id="map" style="width: 50%; height: 400px;"></div>
							</div>
							<h2><%=course_list.get(i).getName() %></h2>
							<p><%=course_list.get(i).getContents() %></p>
						</div>
					<% } %>
				<% } %>
			</div>

		</div>
	</div>


	<script type="text/javascript">
		var map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(37.3595704, 127.105399),
			zoom : 10
		});

		var marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(courseList.latitude,
					course.longitude),
			map : map
		});
	</script>


	<%-- <!-- Footer -->
	<jsp:include page="footer.jsp" /> --%>

</body>
</html>