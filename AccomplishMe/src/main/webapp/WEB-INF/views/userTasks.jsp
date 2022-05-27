<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Tasks</title>
 <%@ include file="../CSSInclude.jsp" %>
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" integrity="sha256-46qynGAkLSFpVbEBog43gvNhfrOj+BmwXdxFgVK/Kvc=" crossorigin="anonymous" />
 <style>
.table td, .table th {
	padding: 0 !important;
}
 </style>
</head>
<body>
<main class="container-fluid">
<div class="row">
 <%@ include file="navbar.jsp" %>
<!-- end row  -->
</div>
<br>
<div class="row">

<div class="col-4 rightHeading">
<form action="findChallenges.ch">
<button type="submit" Title="Select a Challenge" class="btn btn-primary">New Challenge</button>
</form>
</div>
<br>
<div class="col-4"></div>

<div class="col-4">
<c:if test="${! empty user.currentUserChallenge }">
<form action="completeChallenge.uch" method="post">
<input type="text" name="id" value="${user.currentUserChallenge.id}" hidden="true">
<button type="submit" Title="Complete Current challenge" class="btn btn-primary">Complete Current Challenge</button>
</form>
<br>
<form action="abandonChallenge.uch" method="post">
<input type="text" name="id" value="${user.currentUserChallenge.id}" hidden="true">
<button type="submit" Title="Complete Current challenge" class="btn btn-primary">Abandon Current Challenge</button>
</form>
</c:if>
<c:if test="${! empty message}">
<h4 class="message">${message}</h4>
</c:if>
</div>
<br>
<br>
<br>
<br>
<div class="row centerHeading">
<h2> User Created Details</h2>
</div>
<br>
<hr>
<br>
<div class="row">
<div class="col-4 rightHeading">
<form action="createDetail.cld" method="GET">
<button type="submit" title="Create a new Workout" class="btn btn-success">
Create A Workout
<i class="fa-solid fa-person-running"></i>
</button>
<input hidden="true" value="Workout" name="pageName">
</form>
</div>

<div class="col-4 centerHeading">
<form action="createDetail.cld" method="GET">
<button type="submit" title="Create a new Food item" class="btn btn-success">
Create A Food
<i class="fa-solid fa-carrot"></i>
</button>
<input hidden="true" value="Food" name="pageName">
</form>
</div>

<div class="col-4">
<form action="createDetail.cld" method="GET">
<button type="submit" title="Create a new Book" class="btn btn-success">
Create A Book
<i class="fa-solid fa-book-open"></i>
</button>
<input hidden="true" value="Book" name="pageName">
</form>
</div>

</div>


<div class="row">
<br>
<hr>
<br>

<div class="col-4 scroll">
	<table class="table table-hover table striped">
	<thead>
	<tr>
	<th>Name</th>
	<th>Description</th>
	<th>MET value</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="t" items="${user.createdWorkouts}">
	<tr>
	<td> ${t.name}</td>
	<td style="max-width: 150px;">${t.description }</td>
	<td>${t.met }</td>
	  <td>
		
		 <form id="${t.id}_edit" method="get" action="editDetail.cdc"><input type="text" name="id" value="${t.id}" hidden="true"> </form>
	  	<form id="${t.id}_delete" method="post" action="deleteDetail.cdc"><input type="text" name="id" value="${t.id}" hidden="true"></form>
		 
		
		
		  <a href="#" class="btn btn-warning" title="Edit this Workout" onclick="document.getElementById('${t.id}_edit').submit();"><i class="fas fa-edit"></i></a>
		 
		 | <a class="btn btn-danger" title="Remove this Workout" onclick="document.getElementById('${t.id}_delete').submit();" ><i class="fas fa-trash"></i></a> 
		
	</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
</div>

<div class="col-4 scroll">

	<table class="table table-hover table striped">
	<thead>
	<tr>
	<th>Name</th>
	<th>Description</th>
	<th>Calories Per Serving</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="t" items="${user.createdFood}">
	<tr>
	<td> ${t.name}</td>
	<td style="max-width: 300px;">${t.description }</td>
	<td>${t.calories }</td>
	  <td>
		
		 <form id="${t.id}_edit" method="get" action="editDetail.cdc"><input type="text" name="id" value="${t.id}" hidden="true"></form>
	  	<form id="${t.id}_delete" method="post" action="deleteDetail.cdc"><input type="text" name="id" value="${t.id}" hidden="true"></form>
		 
		
		
		  <a href="#" class="btn btn-warning" title="Edit this food item" onclick="document.getElementById('${t.id}_edit').submit();"><i class="fas fa-edit"></i></a>
		 
		 | <a class="btn btn-danger" title="Remove this Food item" onclick="document.getElementById('${t.id}_delete').submit();" ><i class="fas fa-trash"></i></a> 
	
	</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>



</div>

<div class="col-4 scroll">

	<table class="table table-hover table striped">
	<thead>
	<tr>
	<th>Name</th>
	<th>Description</th>
	<th>Length</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="t" items="${user.createdBooks}">
	<tr>
	<td> ${t.name}</td>
	<td style="max-width: 300px;">${t.description }</td>
	<td>${t.numberPages }</td>
	  <td>
		 <form id="${t.id}_edit" method="get" action="editDetail.cdc"><input type="text" name="id" value="${t.id}" hidden="true"></form>
	  	<form id="${t.id}_delete" method="post" action="deleteDetail.cdc"><input type="text" name="id" value="${t.id}" hidden="true"></form>
		 
		 
		  <a href="#" class="btn btn-warning" title="Edit this Book" onclick="document.getElementById('${t.id}_edit').submit();"><i class="fas fa-edit"></i></a>
		 
		 | <a class="btn btn-danger" title="Remove this Book" onclick="document.getElementById('${t.id}_delete').submit();" ><i class="fas fa-trash"></i></a> 
		
	</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
</div>
</div>


<!-- end row  -->
</div>
  
</main>
 
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<%@ include file="../JSInclude.jsp" %>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

</body>
</html>