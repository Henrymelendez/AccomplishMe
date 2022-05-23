<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" charset="UTF-8">
<title>User Home</title>

 <%@ include file="../CSSInclude.jsp" %>
</head>
<body>
<main class="container-fluid">
<div class="row">
 <%@ include file="navbar.jsp" %>
</div>
	<c:choose>
	<c:when test="${! empty sessionScope}">
	<span hidden="true">${user = sessionScope.user}
	<c:choose>
	<c:when test="${! empty user.userChallenges}">
	${challenge = user.userChallenges.get(0)}
	</c:when>	
	</c:choose>
	</span>
	</c:when>
	</c:choose>

 <div class="row" >
<div class="col-4">
<c:choose>
<c:when test="${! empty challenge}">
	<h2>Challenge: ${challenge.challenge.name}</h2>
	<p>${challenge.challenge.description}</p>
	<br>
	<br>
	<br>
</c:when>
<c:otherwise>
<h2>No Challenge Selected</h2>
<p> Please visit the challenge section to select a challenge!</p>
</c:otherwise>
</c:choose>
	<h2>Friends</h2>
	<p>Not yet Implemented</p>
</div>
 <div class="col-4 scroll" >
 	<h2>Journal Entries</h2>
 	<c:choose>
 	<c:when test="${! empty challenge.challengeLogs}">
	<c:forEach items="${challenge.challengeLogs}" var="log" >
		<c:choose>
		<c:when test="${! empty log }">
		<a href="showLog.do?${log.id }">${log.entryDate }</a>
		</c:when>
		</c:choose>
	</c:forEach> 
 	</c:when>
 	</c:choose>
 </div>
 <div class="col-4 scroll">
 	<h2><i class="fa fa-users"></i> Friends Feed</h2>
 	<p>Not yet Implemented</p>
 </div>

 </div>
 
 	 <div class=row>
 <c:choose>
 <c:when test="${! empty message}">
 <h4>${message}</h4>
 </c:when>
 </c:choose>
 </div>


</main>
<%@ include file="../JSInclude.jsp" %>
</body>
</html>