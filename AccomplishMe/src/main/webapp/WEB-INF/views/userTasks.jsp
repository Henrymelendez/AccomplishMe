<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@ include file="../CSSInclude.jsp" %>
</head>
<body>
<main>
<div class="row">
 <%@ include file="navbar.jsp" %>
<!-- end row  -->
</div>
<div class="row">

<div class="col-4">
<form action="createChallenge.ch">
<input type="submit" value="Select a Challenge">
</form>
</div>
<div class="col-4">

</div>

<div class="col-4">

</div>


<!-- end row  -->
</div>
  
</main>
 
<%@ include file="../JSInclude.jsp" %>
</body>
</html>