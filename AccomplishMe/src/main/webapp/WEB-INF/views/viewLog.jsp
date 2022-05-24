<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log</title>
 <%@ include file="../CSSInclude.jsp" %>

</head>
<body>
<main class="container-fluid">
<div class="row">
 <%@ include file="navbar.jsp" %>
</div>
<c:choose>
<c:when test="${! empty log }">
<div class="row">
<h1>${log.entryDate }</h1>
</div>
<div class="row">
<div class="col-lg-8">
<form action="addlog.clc" method="POST">
<input type="submit" value="Add new Entry">
</form>
</div>
<div class="col-lg-4">
<form action="deletelog.clc" method="POST">
<input name="id" value="${log.id }" hidden="true">
<input type="submit" value="Delete this Entry">
</form></div>
</div>
<br>
<hr>
<div class="row">
	<div class="col-4 scroll">
	<c:choose>
	<c:when test="${! empty workout }">
	<c:choose>
	<c:when test="${!empty log.workouts}">
	<c:forEach var="workout" items="${log.workouts }">
	<h4>${workout.challengeDetail.name}</h4>
	<ul>
	<li>Duration: ${ workout.duration}</li>
	<li>Calories burned: ${((workout.duration/60)*workout.challengeDetail.met)*user.weight }</li>
	</ul>
	<form action="removeChallengeDetail.cld" method="POST">
		<input hidden="true" type="text" name = "id" value="${workout.id}">
		<input hidden="true" type="text" name = "logId" value="${log.id}">
		<input type="submit" value="Remove this workout">
	</form>
	</c:forEach>
	</c:when>
	</c:choose>
	<form action="addChallengeDetail.cld" method="get">
	<input name="id" value="${log.id }" hidden="true">
	<input hidden="true" value="workout" name="name">
	<input type="submit" value="Add Workout">
	</form>
	</c:when>
	</c:choose>
	</div>
	<div class="col-4 scroll">
	<c:choose>
	<c:when test="${! empty food }">
	<c:choose>
	<c:when test="${!empty log.meals}">
	<c:forEach var="food" items="${log.meals }">
	<h4>${food.challengeDetail.name}</h4>
	<ul>
	<li>Servings: ${food.servings}</li>
	<li>Calories: ${food.servings * food.challengeDetail.calories}</li>
	</ul>
	<form action="removeChallengeDetail.cld" method="POST">
		<input hidden="true" type="text" name = "id" value="${food.id}">
		<input hidden="true" type="text" name = "logId" value="${log.id}">
		<input type="submit" value="Remove this food">
	</form>
	</c:forEach>
	</c:when>
	</c:choose>
	<form action="addChallengeDetail.cld" method="get">
	<input name="id" value="${log.id }" hidden="true">
	<input hidden="true" value="food" name="name">
	<input type="submit" value="Add Food">
	</form>
	</c:when>
	</c:choose>
	</div>
	<div class="col-4 scroll">
	<c:choose>
	<c:when test="${! empty book }">
	<c:choose>
	<c:when test="${!empty log.books}">
	<c:forEach var="book" items="${log.books }">
	<h4>${book.challengeDetail.name }</h4>
	<ul>
	<li>Pages Read: ${book.pagesRead}</li>
	<li class="hiddenLi"></li>
	</ul>
	<form action="removeChallengeDetail.cld" method="POST">
		<input hidden="true" type="text" name = "id" value="${book.id}">
		<input hidden="true" type="text" name = "logId" value="${log.id}">
		<input type="submit" value="Remove this book">
	</form>
	</c:forEach>
	</c:when>
	</c:choose>
	<form action="addChallengeDetail.cld" method="get">
	<input name="id" value="${log.id }" hidden="true">
	<input hidden="true" value="book" name="name">
	<input type="submit" value="Add Book">
	</form>
	</c:when>
	</c:choose>
	
	</div>
</div>
</c:when>
<c:otherwise>
<div class="row">
<div class="col-4 scroll"></div>
<div class="col-4 scroll">
<h1>No entries Yet</h1>
</div>
<div class="col-4 scroll"></div>
</div>
</c:otherwise>
</c:choose>

<hr>
<br>


<div class="row">
<div class="col-sm-2">
<form action="previousLog.clc" method="GET">
<input name="id" value="${log.id }" hidden="true">
<input type="submit" value="Previous">
</form></div>
<div class="col-8"></div>
<div class="col-sm-2">
<form action="nextLog.clc" method="GET">
<input name="id" value="${log.id }" hidden="true">
<input type="submit" value="Next">
</form></div>

</div>



</main>


<%@ include file="../JSInclude.jsp" %>
</body>
</html>