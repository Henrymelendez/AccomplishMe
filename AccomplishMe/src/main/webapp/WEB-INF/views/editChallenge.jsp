<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport">
<%@ include file="../CSSInclude.jsp" %>
<title>Edit User Challenges</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" integrity="sha256-46qynGAkLSFpVbEBog43gvNhfrOj+BmwXdxFgVK/Kvc=" crossorigin="anonymous" />

</head>
<body>
<main class="container-fluid">
<div class="row">
 <%@ include file="navbar.jsp" %>
</div>




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
		<form id="select" method="GET" action="selectChallenge.uch"><input type="text" name="id" value="${t.id }" hidden="true"></input> </form>
		 <a class="btn btn-primary" onclick="document.getElementById('select').submit();" ><i class="fa fa-check" ></i></a> |
		 
		 <form id="edit" method="GET" action="editChallenge.ch"><input type="text" name="id" value="${t.id }" hidden="true"></input> </form>
		 <a href="#" class="btn btn-warning" onclick="document.getElementById('edit').submit();"><i class="fas fa-edit"></i></a>
		 
	  	<form id="myform" method="post" action="deleteChallenge.ch"><input type="text" name="id" value="${t.id }" hidden="true"></input> </form>
		 <a class="btn btn-danger" onclick="document.getElementById('myform').submit();" ><i class="fas fa-trash"></i></a> |
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