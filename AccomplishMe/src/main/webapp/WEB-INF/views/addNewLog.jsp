<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../CSSInclude.jsp" %>
</head>
<body>
<main class="container-fluid">
<div class="row">
 <%@ include file="navbar.jsp" %>
</div>

<div class="row">
	<div class="col-4">
	<c:choose>
	<c:when test="${! empty workout }">
	<c:choose>
	<c:when test="${!empty user.userChallenge.challengeLog.workouts}">
	<c:forEach var="workout" items="${user.userChallenge.challengeLog.workouts }">
	<h4>${workout.challengeDetail.name}</h4>
	<ul>
	<li>Duration: ${ workout.duration}</li>
	<li>Calories burned: ${((workout.duration/60)*workout.challengeDetail.met)*user.weight }</li>
	</ul>
	</c:forEach>
	</c:when>
	</c:choose>
	</c:when>
	</c:choose>
	</div>
	<div class="col-4">
	<c:choose>
	<c:when test="${! empty food }">
	<c:choose>
	<c:when test="${!empty user.userChallenge.challengeLog.meals}">
	<c:forEach var="food" items="${user.userChallenge.challengeLog.meals }">
	</c:forEach>
	</c:when>
	</c:choose>
	</c:when>
	</c:choose>
	</div>
	<div class="col-4">
	<c:choose>
	<c:when test="${! empty book }">
	<c:choose>
	<c:when test="${!empty user.userChallenge.challengeLog.books}">
	<c:forEach var="book" items="${user.userChallenge.challengeLog.books }">
	</c:forEach>
	</c:when>
	</c:choose>
	</c:when>
	</c:choose>
	
	</div>
</div>
</main>
<%@ include file="../JSInclude.jsp" %>
</body>
</html>