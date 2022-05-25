<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<main>
<div class="row">
 <%@ include file="navbar.jsp" %>
<!-- end row  -->
</div>
<div class="row">

<div class="col-4">
<form action="findChallenges.ch">
<input type="submit" value="Select a Challenge">
</form>
</div>
<div class="col-4"></div>
<div class="col-4"></div>

<div class="row">
<div class="col-4">
<form action="createDetail.cld" method="GET">
<input type="submit" value="Create A Workout ">
<input hidden="true" value="Workout" name="pageName">
</form>
</div>
<div class="col-4">
<form action="createDetail.cld" method="GET">
<input type="submit" value="Create A Food ">
<input hidden="true" value="Food" name="pageName">
</form>
</div>
<div class="col-4">
<form action="createDetail.cld" method="GET">
<input type="submit" value="Create A Book ">
<input hidden="true" value="Book" name="pageName">
</form>
</div>

</div>


<div class="row">


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
		
		 <form id="${t.name}_edit" method="get" action="editDetail.cdc"><input type="text" name="id" value="${t.id}" hidden="true"> </form>
	  	<form id="${t.name}_delete" method="post" action="deleteDetail.cdc"><input type="text" name="id" value="${t.id}" hidden="true"></form>
		 
		
		
		  <a href="#" class="btn btn-warning" onclick="document.getElementById('${t.name}_edit').submit();"><i class="fas fa-edit"></i></a>
		 
		 | <a class="btn btn-danger" onclick="document.getElementById('${t.name}_delete').submit();" ><i class="fas fa-trash"></i></a> 
		
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
		
		 <form id="${t.name}_edit" method="get" action="editChallenge.ch"><input type="text" name="id" value="${t.id}" hidden="true"></form>
	  	<form id="${t.name}_delete" method="post" action="deleteChallenge.ch"><input type="text" name="id" value="${t.id}" hidden="true"></form>
		 
		
		
		  <a href="#" class="btn btn-warning" onclick="document.getElementById('${t.name}_edit').submit();"><i class="fas fa-edit"></i></a>
		 
		 | <a class="btn btn-danger" onclick="document.getElementById('${t.name}_delete').submit();" ><i class="fas fa-trash"></i></a> 
	
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
		 <form id="${t.name}_edit" method="get" action="editChallenge.ch"><input type="text" name="id" value="${t.id}" hidden="true"></form>
	  	<form id="${t.name}_delete" method="post" action="deleteChallenge.ch"><input type="text" name="id" value="${t.id}" hidden="true"></form>
		 
		 
		  <a href="#" class="btn btn-warning" onclick="document.getElementById('${t.name}_edit').submit();"><i class="fas fa-edit"></i></a>
		 
		 | <a class="btn btn-danger" onclick="document.getElementById('${t.name}_delete').submit();" ><i class="fas fa-trash"></i></a> 
		
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