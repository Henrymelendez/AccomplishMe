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

 <div class="row" >
<div class="col-4">
	<h2>Challenge: ${challenge.challenge.name}</h2>
	<p>${challenge.challenge.description}</p>
	<br>
	<br>
	<br>
	<h2>Friends</h2>
	<p>Not yet Implemented</p>
</div>
 <div class="col-4 scroll" >
 	<h2>Journal Entries</h2>
	<c:forEach items="${challenge.challengeLogs}" var="log" >
		<c:choose>
		<c:when test="${! empty log }">
		<a href="showLog.do?${log.id }">${log.entryDate }</a>
		</c:when>
		</c:choose>
	</c:forEach>
 
 </div>
 <div class="col-4 scroll">
 	<h2><i class="fa fa-users"></i> Friends Feed</h2>
 	<p>Not yet Implemented</p>
 </div>

 </div>

</main>
<%@ include file="../JSInclude.jsp" %>
</body>
</html>