<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport">
<%@ include file="../CSSInclude.jsp" %>
<title>Select Challenges</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" integrity="sha256-46qynGAkLSFpVbEBog43gvNhfrOj+BmwXdxFgVK/Kvc=" crossorigin="anonymous" />

</head>
<body>
<main class="container-fluid">
<div class="row">
 <%@ include file="navbar.jsp" %>
</div>




<div class="row">
<form id="createChallenge" method="get" action="createChallenge.ch">
<input type="submit" value="Create Custom Challenge" class="btn btn-primary">
</form>
</div>
<br><br>
<div class="container">
	
<div class="row">
	<table class="table table-hover table striped">
	<thead>
	<tr>
	<th>Name</th>
	<th>Description</th>
	<th>Duration in Days</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="t" items="${challenges}">
	<tr>
	<td> ${t.name}</td>
	<td style="max-width: 300px;">${t.description }</td>
	<td>${t.duration }</td>
	  <td>
		<form id="${t.name}_select" method="get" action="selectChallenge.uch"><input type="text" name="id" value="${t.id}" hidden="true"></form>
		 <form id="${t.name}_edit" method="get" action="editChallenge.ch"><input type="text" name="id" value="${t.id}" hidden="true"></form>
	  	<form id="${t.name}_delete" method="post" action="deleteChallenge.ch"><input type="text" name="id" value="${t.id}" hidden="true"></form>
		 
		 <a class="btn btn-primary" onclick="document.getElementById('${t.name}_select').submit();" ><i class="fa fa-check" ></i></a> 
		 <c:choose> 
		 <c:when test="${user.id == t.creator.id }">
		 | <a href="#" class="btn btn-warning" onclick="document.getElementById('${t.name}_edit').submit();"><i class="fas fa-edit"></i></a>
		 
		 | <a class="btn btn-danger" onclick="document.getElementById('${t.name}_delete').submit();" ><i class="fas fa-trash"></i></a> 
		</c:when>
		</c:choose>
	</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
</div>


</div>














</main>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<%@ include file="../JSInclude.jsp" %>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

</body>
</html>