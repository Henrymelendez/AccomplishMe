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
<form action="addChallengeDetail.cld" method="POST">
<c:choose>
<c:when test="${details.get(0).category.name == workout }">
<input type="text" name ="duration" placeholder="Duration..."></input>

</c:when>
<c:when test="${details.get(0).category.name == food }">
<input type="text" name ="servings" placeholder="Servings..."></input>

</c:when>
<c:when test="${details.get(0).category.name == book }">
<input type="text" name ="pagesRead" placeholder="Number of pages Read..."></input>

</c:when>
</c:choose>
<select>
<c:forEach var="d" items="${details }">
<option value="${d }">${d.name } </option>
</c:forEach>
</select>
<input type="submit" value="Submit">
</form>
</div>

<div class="col-4">



</div>
<div class="col-4"></div>

</div>



</main>
<%@ include file="../JSInclude.jsp" %>
</body>
</html>