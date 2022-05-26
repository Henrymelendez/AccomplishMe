<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<div class="row centerHeading">
<h1 >${log.entryDate }</h1>
</div>
<div class="row">
<div class="col-4 rightHeading">
<form action="addlog.clc" method="POST">
<button type="submit" title="Add a new entry to the Journal" class="btn btn-success btn-icon">
<!-- Add new Entry -->
<i class="fa-solid fa-calendar-plus"></i>
</button>
</form>
</div>
<div class="col-4"></div>
<c:choose>
<c:when test="${! empty log }">
<div class="col-4">
<form action="deletelog.clc" method="POST">
<input name="id" value="${log.id }" hidden="true">
<button type="submit" title="Delete this entry from the Journal" class="btn btn-danger btn-icon"> 
<!-- Delete this Entry -->
<i class="fa-solid fa-trash-can"></i>
</button>
</form>
</div>
</c:when>
</c:choose>
</div>


<c:choose>
<c:when test="${! empty log }">

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
	<li>Calories burned: <fmt:formatNumber type="number" maxFractionDigits = "2"  value = "${((workout.duration/60)*workout.challengeDetail.met)*(user.weight * 0.453) }"/></li>
	</ul>
	<form action="removeChallengeDetail.cld" method="POST">
		<input hidden="true" type="text" name = "id" value="${workout.id}">
		<input hidden="true" type="text" name = "logId" value="${log.id}">
		<button type="submit" title="Remove this workout entry from the Journal" value="Remove" class="btn btn-danger"><i class="fa-solid fa-circle-minus"></i></button>
	</form>
	</c:forEach>
	</c:when>
	</c:choose>
	
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
		<button type="submit" title="Remove this meal entry from the Journal" value="Remove" class="btn btn-danger"><i class="fa-solid fa-circle-minus"></i></button>
	</form>
	</c:forEach>
	</c:when>
	</c:choose>
	
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
		<button type="submit" title="Remove this book entry from the Journal" value="Remove" class="btn btn-danger"><i class="fa-solid fa-circle-minus"></i></button>
	</form>
	</c:forEach>
	</c:when>
	</c:choose>
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
<br>
<div class="row">
<div class="col-4">
<c:choose>
<c:when test="${! empty workout }"> 
<form action="addChallengeDetail.cld" method="get">
	<input name="id" value="${log.id }" hidden="true">
	<input hidden="true" value="workout" name="name">
	<button type="submit" title="Add a workout entry to the Journal" value="Add Workout" class="btn btn-success btn-circle"><i class="fa-solid fa-person-running"></i></button>
	</form>
</c:when>
</c:choose>
</div>
<div class="col-4">
<c:choose>
<c:when test="${! empty food }"> 
<form action="addChallengeDetail.cld" method="get">
	<input name="id" value="${log.id }" hidden="true">
	<input hidden="true" value="food" name="name">
	<button type="submit" title="Add a meal entry to the Journal" value="Add Food" class="btn btn-success btn-circle"><i class="fa-solid fa-carrot"></i></button>
	</form>
</c:when>
</c:choose>
</div>
<div class="col-4">
<c:choose>
<c:when test="${! empty book }"> 
<form action="addChallengeDetail.cld" method="get">
	<input name="id" value="${log.id }" hidden="true">
	<input hidden="true" value="book" name="name">
	<button type="submit" title="Add a book entry to the Journal" class="btn btn-success btn-circle"><i class="fa-solid fa-book-open"></i></button>
	</form>
</c:when>
</c:choose>
</div>
</div>

<hr>
<br>
<c:choose>
<c:when test="${! empty log }">

<div class="row">
<div class="col-sm-2">
<form action="previousLog.clc" method="GET">
<input name="id" value="${log.id }" hidden="true" >
<input type="submit" title="View previous journal entry" value="Previous" class="btn btn-primary">
</form></div>
<div class="col-8"></div>
<div class="col-sm-2">
<form action="nextLog.clc" method="GET">
<input name="id" value="${log.id }" hidden="true" >
<input type="submit" title="View next journal entry" value="Next" class="btn btn-primary">
</form></div>

</div>
</c:when>
</c:choose>



</main>


<%@ include file="../JSInclude.jsp" %>
</body>
</html>