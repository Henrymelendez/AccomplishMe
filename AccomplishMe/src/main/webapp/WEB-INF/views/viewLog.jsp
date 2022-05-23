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
<div class="col-4"></div>
<div class="col-4">
 ${log.entryDate }
</div>
<div class="col-4"></div>

</div>
</c:when>
<c:otherwise>
<div class="row">
<div class="col-4"></div>
<div class="col-4">
<h1>No entries Yet</h1>
<a href="addlog.clc"> Add An Entry Right Now</a>
</div>
<div class="col-4"></div>
</div>
</c:otherwise>
</c:choose>
</main>


<%@ include file="../JSInclude.jsp" %>
</body>
</html>