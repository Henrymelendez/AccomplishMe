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
<img src="${user.userPhoto }"/>
</div>
<div class="col-4">
<h2>${user.firstName} ${user.lastName}</h2>
<form action="editUser.do">
<input type="text" value="${user.id }" name="id" hidden="true">
<input type="text" value="${user.firstName }" name="firstName">
<input type="text" value="${user.lastName }" name="lastName">
<input type="text" value="${user.height}" name="height">
<input type="text" value="${user.weight}" name= weight>
<input type="submit" value="Save Changes">
</form>
</div>
<div class="col-4">
<button>Change your username or password?</button>

<form action="deleteUser.do">
<input type="text" value="${user.id}" name="id" hidden="true">
<input type="submit" value="Delete my account">
</form>
</div>


</div>




</main>
<%@ include file="../JSInclude.jsp" %>
</body>
</html>