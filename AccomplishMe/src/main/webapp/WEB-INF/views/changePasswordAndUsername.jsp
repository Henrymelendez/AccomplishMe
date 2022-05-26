<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ include file="../CSSInclude.jsp" %>
</head>
<body>
<div class="row">
 <%@ include file="navbar.jsp" %>
</div>

<div class="container-xl px-4 mt-4">

        <!-- Account page navigation-->
        <nav class="nav nav-borders">
        <a class="nav-link  ms-0" href="startEdit.do">Profile</a>
       
        </nav>
        <hr class="mt-0 mb-4">
        <div class="row">
            <div class="col-lg-8">
                <!-- Change password card-->
                <div class="card mb-4">
                    <div class="card-header">Change Password</div>
                    <div class="card-body">
                        <form action="editUsernamePassword.user">
                            <!-- Form Group (current password)-->
                            <div class="mb-3">
                            	 <label class="small mb-1" for="username">User Name</label>	
                            	<input type="text" value="${user.username }" name="username" id="username" class="form-control">
                            	<input type="text" value="${user.id }" name="id" hidden="true">
                                <label class="small mb-1" for="currentPassword">Current Password</label>
                                <input class="form-control" id="currentPassword" type="password" placeholder="Enter current password" name="password">
                            </div>
                            <!-- Form Group (new password)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="newPassword">New Password</label>
                                <input class="form-control" name="newPassword" type="password" placeholder="Enter new password" >
                            </div>
                            <!-- Form Group (confirm password)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="confirmPassword">Confirm Password</label>
                                <input class="form-control" name="confirmPassword" type="password" placeholder="Confirm new password">
                            </div>
                            <input class="btn btn-primary" type="submit" value="Save">
                        </form>
                    </div>
                </div>
                
                
            </div>
           
        </div>
    </div>




</body>
</html>