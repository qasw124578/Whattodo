<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.java.model.vo.Course"%>
<%@page import="com.java.model.vo.Restaurant"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	ArrayList<ArrayList<Restaurant>> detail_list = (ArrayList<ArrayList<Restaurant>>) request
			.getAttribute("detail_list");
	ArrayList<Course> course_list = (ArrayList<Course>) request.getAttribute("course_list");

	Double latitude = 0.0, longitude = 0.0;
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
				<div class="panel-heading  w3-border w3-round-large">

					<h4 class="panel-title">

						<a style="color: #ffffff" data-toggle="collapse"
							data-parent="#accordion"
							href="#collapse<%=course_list.get(i).getCode()%>"><%=course_list.get(i).getName()%></a>
					</h4>
				</div>
				<div id="collapse<%=course_list.get(i).getCode()%>" class="panel-collapse collapse">
					<div class="flex flex-justify-between">
						<div class="flex-grow">
						<h2 style="margin-left: 0.5%;"><%=course_list.get(i).getName()%></h2>
						<p style="margin-left: 1%;"><%=course_list.get(i).getContents()%></p>
						</div>
						<div class="flex flex-align-center">
							<div class="flex flex-align-center"><img onclick="hitGood('<%=course_list.get(i).getCode() %>')" src="./img/good.png" class="w3-margin cursor-pointer" style="height: 30px; width: auto;"></div>
							<div id="goodCount<%=course_list.get(i).getCode() %>" class="w3-margin-right"><%=course_list.get(i).getGood() %></div>
						</div>
					</div>
					<div class="panel-body flex flex-align-center flex-justify-center">
						<div class="width-50 flex flex-wrap">

							<%
								for (int j = 0; j < detail_list.get(i).size(); j++) {
							%>
							<div class="flex flex-justify-center flex-align-center"
								style="width: 65px;">
								<span
									class="glyphicon glyphicon-chevron-right logo w3-text-grey"></span>
							</div>
							<!-- <div class="panel-body"> -->
							<div class="w3-card-4 w3-margin"
								style="width: 24%; min-width: 200px; margin-bottom: 3%;">
								<div id="img_<%=detail_list.get(i).get(j).getCode() %>" class="w3-padding-small w3-opacity w3-hover-opacity-off cursor-pointer"
									data-toggle="modal"
									data-target="#myModal<%=detail_list.get(i).get(j).getCode()%>"
									style="height: 160px; overflow: hidden">
									<img
										src="./img/P_image/<%=detail_list.get(i).get(j).getCode()%>.jpg"
										class="w3-round" style="width: 100%"
									/>
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
										<div class="flex flex-justify-center flex-align-center" style="width:100%; height: 300px; overflow: hidden;">
											<img style="width:100%; height: auto;"src="./img/P_image/<%=detail_list.get(i).get(j).getCode() %>.jpg" />
										</div>
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
								}
							%>
						</div>
						<%-- latitude: <%=latitude/detail_list.get(i).size() %><br>
						longitude: <%=longitude/detail_list.get(i).size() %> --%>
						<div class="width-50 flex flex-align-center flex-justify-center">
							<div id="map<%=course_list.get(i).getCode()%>"
								style="width: 90vh; height: 60vh;"></div>
						</div>

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
	function hitGood(param){ 
		   $.ajax({ 
		       url: "${pageContext.request.contextPath}/good.do", // 통신할 url을 지정한다. 
		       method :"get",
		       data: {
		    	   'code': param // 서버로 데이터를 전송할 때 이 옵션을 사용한다.
		       },
		       dataType: "json", // 서버측에서 전송한 데이터를 어떤 형식의 데이터로서 해석할 것인가를 지정한다. 없으면 알아서 판단한다. 
		       success: function(jsonObj){ 
		         // 요청이 성공했을 경우 좋아요/싫어요 개수 레이블 업데이트 
		         var flag = jsonObj.flag;
		         switch (flag) {
			         case 0:
			        	 alert("이미 추천하셨습니다.")
			        	 break;
			         case 1:
			        	 if (jsonObj.count != -1) {
			        		 $("#goodCount" + param).text(jsonObj.count);
			        	 } else {
			        		 alert("추천수 로딩 실패: DB SELECT에 실패했습니다. 새로고침을 해 주세요")
			        	 }
			        	 break;
			         case -1:
			        	 alert("추천 실패: 데이터베이스 업데이트에 실패했습니다.")
			        	 break;
		         }
		        	 
		         
		         //$('#like_count'+ pk).html("count : "+ response.like_count); 
		       }, 
		       error:function(error){ 
		         // 요청이 실패했을 경우 
		         alert("error");
		       }
		   }); 
	
	};
	$(".panel-body > div:first-child > div:first-child").remove();
	$(document).ready(
			function() {
				$("#accordion > div:first-child > div:nth-child(2)").addClass("in");
			});
	
	
	function selectTheme(obj) {
		location.href = "course.do?theme="
				+ encodeURI($(obj).text(), "UTF-8");
	};

<%
	for (int i = 0; i < course_list.size(); i++) {
				// 중심위치 잡기
				for (Restaurant rest : detail_list.get(i)) {
					latitude += rest.getLatitude();
					longitude += rest.getLongitude();
				}%>
	var map = new naver.maps.Map('map<%=course_list.get(i).getCode()%>', {
		center : new naver.maps.LatLng(
		<%=latitude / detail_list.get(i).size()%>,
		<%=longitude / detail_list.get(i).size()%>
		),
			zoom : 9
		});
		<%
				latitude = 0.0;
				longitude = 0.0;

		for (Restaurant rest : detail_list.get(i)) {
		%>
			var marker = new naver.maps.Marker({
				position : new naver.maps.LatLng(<%=rest.getLatitude()%>, <%=rest.getLongitude()%>),
				map : map
			});
			naver.maps.Event.addListener(marker, 'mouseover', function(e) {
			    $("#img_<%=rest.getCode()%>").css("opacity", 1);
			});
			naver.maps.Event.addListener(marker, 'mouseout', function(e) {
			    $("#img_<%=rest.getCode()%>").css("opacity", '');
			});
			naver.maps.Event.addListener(marker, 'click', function(e) {
			    $("#myModal<%=rest.getCode()%>").modal()
			});
		<%
		}
		
	}
%>
		
	</script>
</body>
</html>