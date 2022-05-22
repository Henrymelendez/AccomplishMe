<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
 <%@ include file="../CSSInclude.jsp" %>
</head>
<body>

<main>
<div class="row">
 <%@ include file="navbar.jsp" %>
</div>
<div class="col-4">
<img src="${user.userPhoto }"/>
</div>
<div class="col-4">
<h2>${user.firstName} ${user.lastName}</h2>
<form action="editUsernamePassword.user">
<input type="text" value="${user.id }" name="id" hidden="true">
<label for="username">Username</label>
<input type="text" value="${user.username }" name="username" id="username">
<label for="password">password</label>
<input type="password" name="password" id="password" placeholder="Current Password">
<label for="newPassword">Enter new password</label>
<input type="password" name="newPassword" id="newPassword" placeholder="New Password">
<input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password">
<input type="submit" value="Save Changes">
</form>
</div>

</main>

</body>
</html>