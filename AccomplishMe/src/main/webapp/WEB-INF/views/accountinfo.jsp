<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" charset="UTF-8">
<title>${user.username}</title>
 <%@ include file="../CSSInclude.jsp" %>
</head>
<body>
<main>
<div class="row">
<div class="col-4">
<img href="${user.userPhoto }">
</div>
<div class="col-4">
<h2>${user.firstName} ${user.lastName}</h2>
<form action="editUser.do">
<input type=text value="${user.firstName }" name="firstName" hidden="true">
<input type=text value="${user.lastName }" name="lastName" hidden="true">
<input type=text value="${user.id }" name="id" hidden="true">
<input type=text value="${user.userPhoto}" name="userPhoto" hidden="true">
<input type="text" value="${user.height}">
<input type="text" value="${user.weight}">
<input type="text" value="${user.birthday }">
<input type="submit" value="Save Changes">
</form>
</div>
<div class="col-4">
<button>Change your username or password?</button>

<form>
<input type="text" >
</form>
</div>


</div>




</main>
<%@ include file="../JSInclude.jsp" %>
</body>
</html>