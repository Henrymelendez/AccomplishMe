<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Challenge</title>
<%@ include file="../CSSInclude.jsp" %>
</head>
<body>
<main class="container-fluid">
<div class="row">
 <%@ include file="navbar.jsp" %>
</div>

<!-- main row begin -->
<div class="row centerHeading">
		<h2 class="goalsHeading">${challenge.name}</h2>		
		</div>
<div class="row">
	<div class="col-3">
	<h4>Challenge Description</h4>
		${challenge.description}
	</div>
	<div class="col-6 centerHeading">
		<form action="selectChallenge.uch" method="post">
		<textarea name="details" placeholder="Goals..."></textarea>	
		<button type="submit" title="Submit" class="btn btn-primary btn-long">
		<i class="fa fa-check-circle" aria-hidden="true"></i>
		</button>
		</form>
	</div>
	<div class="col-3">
	<h4>Challenge Duration</h4>
	${challenge.duration}
	<br><hr><br>
	<h4>Challenge Categories</h4>
	<ul>
	 <c:forEach var="category" items="${challenge.categories }">
	<li>${category.name }</li>
	 </c:forEach>
	</ul>
	</div>
<!-- main row end -->
</div>

</main>
<%@ include file="../JSInclude.jsp" %>
</body>
</html>