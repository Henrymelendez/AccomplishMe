<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Challenge</title>
<%@ include file="../CSSInclude.jsp" %>
</head>
<body>
<main class="container-fluid">
<div class="row">
 <%@ include file="navbar.jsp" %>
</div>

<!-- main row begin -->
<div class="row">
	<div class="col-4">
		
	</div>
	<div class="col-4">
		<h4>${challenge.name}</h4>		
		<form action="selectChallenge.uch" method="post">
		<textarea name="details"></textarea>	
		<input type="submit" value="Submit"/>
		</form>
	</div>
	<div class="col-4">

	</div>
<!-- main row end -->
</div>

</main>
<%@ include file="../JSInclude.jsp" %>
</body>
</html>