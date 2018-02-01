<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.java.model.vo.Course"%>
<%@page import="com.java.model.vo.Restaurant"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	ArrayList<ArrayList<Restaurant>> detail_list = (ArrayList<ArrayList<Restaurant>>) request.getAttribute("detail_list");
	ArrayList<Course> course_list = (ArrayList<Course>) request.getAttribute("course_list");
	
	Double latitude = 0.0, longitude = 0.0;
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
		<div
			class="w3-margin-bottom w3-margin-top w3-bar flex flex-align-center flex-justify-center"
			style="width: 100%; margin-top: 10px;">
			<div onclick="selectTheme(this)" class="w3-button w3-white"
				style="width: 18%;">힐링</div>
			<div onclick="selectTheme(this)" class="w3-button w3-white"
				style="width: 18%;">문화</div>
			<div onclick="selectTheme(this)" class="w3-button w3-white"
				style="width: 18%;">소소함</div>
			<div onclick="selectTheme(this)" class="w3-button w3-white"
				style="width: 18%;">액티비티</div>
			<div onclick="selectTheme(this)" class="w3-button w3-white"
				style="width: 18%;">이색체험</div>
		</div>
		<!--패널 라인-->
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
			<!----------------------- 코스목록 시작 ----------------------->
				<%
					for (int i = 0; i < course_list.size(); i++) {
				%>
				<div class="panel-heading" style="background-color: #d8a6b3">

					<h4 class="panel-title">

						<a style="color: #ffffff" data-toggle="collapse"
							data-parent="#accordion"
							href="#collapse<%=course_list.get(i).getCode()%>"><%=course_list.get(i).getName()%></a>
					</h4>
				</div>
				<div id="collapse<%=course_list.get(i).getCode()%>"
					class="panel-collapse collapse">
					<h2 style="margin-left: 0.5%;"><%=course_list.get(i).getName()%>
					<img id="Good" src="./img/Miracom_CI_BK.png" class="w3-right right-margin" style="width : 0%">
					</h2>
					<p style="margin-left: 1%;"><%=course_list.get(i).getContents()%></p>
					<div class="panel-body flex flex-align-center flex-justify-center">
						<div class="width-50 flex flex-wrap">
						<%
							for (int j = 0; j < detail_list.get(i).size(); j++) {
						%>
						<!-- <div class="panel-body"> -->
							<div class="w3-card-4 w3-margin"
								style="width: 24%; min-width: 200px; margin-bottom: 3%;">
								<div class="w3-padding-small w3-opacity w3-hover-opacity-off"
									data-toggle="modal"
									data-target="#myModal<%=detail_list.get(i).get(j).getCode()%>"
									style="height: 160px; overflow: hidden">
									<img
										src="./img/P_image/<%=detail_list.get(i).get(j).getCode()%>.jpg"
										class="w3-round" style="width: 100%">
								</div>
								<div
									class="w3-container w3-center flex flex-align-center flex-justify-center"
									style="height: 50px;"><%=detail_list.get(i).get(j).getName()%></div>
							</div>
							
							<!-- Modal -->
							<div class="modal fade"
								id="myModal<%=detail_list.get(i).get(j).getCode()%>"
								role="dialog">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title"><%=detail_list.get(i).get(j).getName()%></h4>
										</div>
										<div class="modal-body">
											<p><%=detail_list.get(i).get(j).getExplain()%></p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
						<%
								latitude += detail_list.get(i).get(j).getLatitude();
								longitude += detail_list.get(i).get(j).getLongitude();
							}
						%>
						</div>
						<%-- latitude: <%=latitude/detail_list.get(i).size() %><br>
						longitude: <%=longitude/detail_list.get(i).size() %> --%>
						<div class="width-50 flex flex-align-center flex-justify-center">
							<div id="map<%=course_list.get(i).getCode() %>" style="width: 90vh; height: 60vh;"></div>
						</div>
						<script type="text/javascript">
							var map = new naver.maps.Map('map<%=course_list.get(i).getCode() %>',
							{
								center : new naver.maps.LatLng(<%=latitude/detail_list.get(i).size() %>, <%=longitude/detail_list.get(i).size() %>),
								zoom : 9
							});
					<%
						latitude = 0.0; longitude = 0.0;
						
						for (Restaurant rest : detail_list.get(i)) {
					%>
							var marker = new naver.maps.Marker({
								position : new naver.maps.LatLng(<%=rest.getLatitude() %>
										, <%=rest.getLongitude() %>),
								
								map : map
							});
					<%
						}
					%>
						</script>
					</div>
				</div>
				<%
					}
				%>
				<!----------------------- 코스목록 끝 ----------------------->
			</div>

		</div>
	</div>

	<%-- <!-- Footer -->
	<jsp:include page="footer.jsp" /> --%>
	<script>
		$(document).ready(function() {
			$("#accordion > div:first-child > div:nth-child(2)").addClass("in");
			 // 좋아요 버튼 처리 
			 // 버튼 클릭 > ajax통신 (like url로 전달) > views의 like 메소드에서 리턴하는 값 전달받기 > 성공시 콜백 호출 
			 $('#good').click(function(){ 
			   var pk = $(this).prop('code') // 클릭한 요소의 attribute 중 name의 값을 가져온다. 
			   $.ajax({ 
			       url: "${pageContext.request.contextPath}/good.do", // 통신할 url을 지정한다. 
			       method :"get",
			       data: {
			    	   'code': pk, // 서버로 데이터를 전송할 때 이 옵션을 사용한다. 
			       },
			       dataType: "json", // 서버측에서 전송한 데이터를 어떤 형식의 데이터로서 해석할 것인가를 지정한다. 없으면 알아서 판단한다. 
			       success: function(jsonObj){ 
			         // 요청이 성공했을 경우 좋아요/싫어요 개수 레이블 업데이트 
			         alert(jsonObj.flag);
			         //$('#like_count'+ pk).html("count : "+ response.like_count); 
			       }, 
			       error:function(error){ 
			         // 요청이 실패했을 경우 
			         alert("error");
			       }
			   }); 
			 }) 
				
		});
		function selectTheme(obj) {
			location.href = "course.do?theme="
					+ encodeURI($(obj).text(), "UTF-8");
		};
	</script>
</body>
</html>