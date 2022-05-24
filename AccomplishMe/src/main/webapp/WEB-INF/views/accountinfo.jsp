<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" charset="UTF-8">
<title>${user.username}</title>
 <%@ include file="../CSSInclude.jsp" %>
</head>
<body>
<span hidden="true">
${feet = user.height / 12}
${inches = user.height - (feet*12)}
</span>
<main>
<div class="row">
 <%@ include file="navbar.jsp" %>
</div>
<div class="row">
<div class="col-4">
<img src="${user.userPhoto }" style="height:100%; width:auto;"/>


</div>
<div class="col-4">
  <h2>${user.firstName} ${user.lastName}</h2>
  <form action="editUser.do">
    <input type="text" value="${user.id }" name="id" hidden="true">
    <label>First Name:</label><input type="text" value="${user.firstName }" name="firstName"> <br>
    <label>Last Name:</label><input type="text" value="${user.lastName }" name="lastName"><br>
    <label>Height</label> <input type="text" value="${user.feet}" name="feet"> <input type="text" value="${user.inches}" name="inches">
    <label>Weight (lbs)</label><input type="text" value="${user.weight}" name= weight>
    <input type="submit" value="Save Changes">
  </form>

<br>
  <form action="startEditUsernamePassword.do">
	<input type="text" hidden="true" value="${user.id }" name="id" /> 
	<input type="submit" value="Change your username or password">
  </form>
<!-- <button>Change your username or password?</button> -->
<br>
  <form action="deleteUser.do">
    <input type="text" value="${user.id}" name="id" hidden="true">
    <input type="submit" value="Delete my account">
  </form>
</div>
<div class="col-4">
 
  <c:forEach var="userChallenge" items="${user.userChallenges}">
	<h5>${userChallenge.challenge.name}</h5>
	<c:choose>
	<c:when test="${userChallenge == user.currentUserChallenge}">
		<p>Current User Challenge</p>
	 	<form action="abandonChallenge.uch" method="POST">
	 	  <input hidden="true" name="id" value="${userChallenge.id}">
	 	  <input type="submit" value="Abandon">	
	 	</form>
	</c:when>
	</c:choose>
		<form action="removeChallenge.uch" method="POST">
		  <input hidden="true" name="id" value="${userChallenge.id}">
		  <input type="submit" value="Remove">
		</form>
  </c:forEach>

</div>

  	

</div>




</main>
<%@ include file="../JSInclude.jsp" %>
</body>
</html>