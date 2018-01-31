<%@page import="com.java.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User user = (User)session.getAttribute("user");
	if (user != null) {
		out.println("<script> alert('지역선택 화면으로 이동합니다.'); location.href = 'choice.jsp';</script>");
	}
%>
<!DOCTYPE html>
<html>
<title>What to do?</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	font-family: "Lato", sans-serif;
}
.mySlides {display: none}
</style>
<body >
<!-- Page content -->
<div class="w3-content" style="background-color : #f1f1f1;  max-width:2000px;margin-top:200px;">



  <!-- The Contact Section -->
  
  <div class="w3-container w3-content w3-padding-64" style="max-width:286px;" id="contact">
  <h2 class="w3-wide w3-center" id="first">오늘 뭐하세요?</h2>  
    <p class="w3-opacity w3-center"><i>What to do?</i></p>
    <div class="w3-row w3-padding-32">
      <div class="w3-col m6">
        <form method = "post" action = "./login.do">
          <div class="w3-row-padding" style="margin:0 -16px 8px -16px">
            <div class="w3-half">      
              <input class="w3-input w3-border" type="text" placeholder="사번" required name="userid" style = "width: 248px">
            </div>
          </div>
          <input class="w3-input w3-border" type="password" placeholder="비밀번호" required name="password" style = "width: 248px">
          <button class="w3-button" type="submit" style="background-color:#672E3B; margin-top:10px; color: #ffffff;" >로그인</button>
        </form>	
      </div>
    </div>
  </div>
 </div>
 
  <%
		String errorMessage = (String)request.getAttribute("errorMessage");/*request : jsp 내장 참조 변수  */
		if(errorMessage != null){
		%>
		<p style = "color:red" align="center"><%=errorMessage%></p>
	<% }%>
 
   
	
</body>
</html>
