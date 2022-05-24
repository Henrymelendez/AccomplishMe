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
	<div class="col-4">
	<c:choose>
	<c:when test="${! empty workout }">
	<c:choose>
	<c:when test="${!empty user.currentUserChallenge.mostRecent.workouts}">
	<c:forEach var="workout" items="${user.currentUserChallenge.mostRecent.workouts }">
	<h4>${workout.challengeDetail.name}</h4>
	<ul>
	<li>Duration: ${ workout.duration}</li>
	<li>Calories burned: ${((workout.duration/60)*workout.challengeDetail.met)*user.weight }</li>
	</ul>
	</c:forEach>
	</c:when>
	</c:choose>
	<form action="addChallengeDetail.cld" method="get">
	<input hidden="true" value="workout" name="name">
	<input type="submit" value="Add Workout">
	</form>
	</c:when>
	</c:choose>
	</div>
	<div class="col-4">
	<c:choose>
	<c:when test="${! empty food }">
	<c:choose>
	<c:when test="${!empty user.currentUserChallenge.mostRecent.meals}">
	<c:forEach var="food" items="${user.currentUserChallenge.mostRecent.meals }">
	</c:forEach>
	</c:when>
	</c:choose>
	<form action="addChallengeDetail.cld" method="get">
	<input hidden="true" value="food" name="name">
	<input type="submit" value="Add Food">
	</form>
	</c:when>
	</c:choose>
	</div>
	<div class="col-4">
	<c:choose>
	<c:when test="${! empty book }">
	<c:choose>
	<c:when test="${!empty user.currentUserChallenge.mostRecent.books}">
	<c:forEach var="book" items="${user.currentUserChallenge.mostRecent.books }">
	</c:forEach>
	</c:when>
	</c:choose>
	<form action="addChallengeDetail.cld" method="get">
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
<div class="col-4"></div>
<div class="col-4">
<h1>No entries Yet</h1>
<form action="addlog.clc" method="POST">
<input type="submit" value="Add An Entry">
</form>
</div>
<div class="col-4"></div>
</div>
</c:otherwise>
</c:choose>
</main>


<%@ include file="../JSInclude.jsp" %>
</body>
</html>