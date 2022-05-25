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
<<body>
<main class="container-fluid"></main>
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
	<input id="myInput" type="text" placeholder="Search...">
	<br><br>
	
<div class="row">
	<table class="table table-hover table striped">
	<thead>
	<tr>
	<th>Name</th>
	<th>Description</th>
	<th></th>
	</tr>
	</thead>
	<tbody id="myTable">
	<c:forEach var="t" items="${details}">
	<tr>
	<td> ${t.name}</td>
	<td style="max-width: 300px;">${t.description }</td>
	
	  <td>
		<form action="addChallengeDetail.cld" method="POST" id="${t.id}_select"><input type="text" name="cdId" value="${t.id}" hidden="true">
		<input hidden="true" name="logId" value="${log.id}" type="text">
		
		<c:choose>

<c:when test="${details.get(0).category.name.equals('workout') }">
<input type="text" name ="duration" placeholder="Duration..." style="max-width: 100px;" ></input>
</c:when>

<c:when test="${details.get(0).category.name.equals('food') }">
<input type="text" name ="servings" placeholder="Servings..." style="max-width: 100px;"></input>
</c:when>

<c:when test="${details.get(0).category.name == 'book' }">
<input type="text" name ="pagesRead" placeholder="Number of pages Read..." style="max-width: 100px;"></input>
</c:when>

</c:choose>
		</form>
		</td>
		 <td>
		 <a class="btn btn-success" onclick="document.getElementById('${t.id}_select').submit();" ><i class="fa fa-circle-plus" ></i></a> 
		 
	</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
</div>
</div>



</body>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<%@ include file="../JSInclude.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
$(document).ready(function(){
	  $("#myInput").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#myTable tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	});


</script>


</html>