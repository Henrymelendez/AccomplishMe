<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Search Results</title>
 <%@ include file="../CSSInclude.jsp" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" integrity="sha256-46qynGAkLSFpVbEBog43gvNhfrOj+BmwXdxFgVK/Kvc=" crossorigin="anonymous" />

</head>
<body>
<main>
 <%@ include file="navbar.jsp" %>
<h3>
User Search Results
</h3>
<div class="container">
<div class="row">

	<table class="table table-hover table striped">
	<thead>
	<tr>
	<th>First Name</th>
	<th>Last Name</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="t" items="${users}">
	<tr>
	<td> ${t.firstName}</td>
	<td>${t.lastName }</td>
	  <td>
		<form id="${t.id}_select" method="get" action="selectChallenge.uch"><input type="text" name="id" value="${t.id}" hidden="true"></form>
		 <form id="${t.id}_edit" method="get" action="editChallenge.ch"><input type="text" name="id" value="${t.id}" hidden="true"></form>
	  	<form id="${t.id}_delete" method="post" action="deleteChallenge.ch"><input type="text" name="id" value="${t.id}" hidden="true"></form>
		 
		 <a class="btn btn-success disabled" onclick="document.getElementById('${t.id}_select').submit();" ><i class="fa-solid fa-user-plus" ></i></a> 
		 | <a class="btn btn-danger disabled" onclick="document.getElementById('${t.id}_delete').submit();" ><i class="fa-solid fa-ban"></i></a> 
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