<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
     
    
     
 <%@ include file="../CSSInclude.jsp" %>
</head>
<body>
<div class="row">
 <%@ include file="navbar.jsp" %>
</div>
 

<div class="container-xl px-4 mt-4 container-fluid">
<!-- Account page navigation-->
            <nav class="nav nav-borders">
        
        <a class="nav-link active" href="startEditUsernamePassword.do">Password</a>
        
        </nav>
    

 <hr class="mt-0 mb-4">
    <div class="row">
        <div class="col-xl-4">
            <!-- Profile picture card-->
            <div class="card mb-4 mb-xl-0">
                <div class="card-header">Profile Picture</div>
                <div class="card-body text-center">
                    <!-- Profile picture image-->
                    <img id="userPhoto" class="img-account-profile rounded-circle mb-2" src="${user.userPhoto }" alt="">
                    <!-- Profile picture help block-->
                    <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                    <!-- Profile picture upload button-->
                    <button class="btn btn-primary " type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">Upload new image</button>
                    
          
                </div>
            </div>
        </div>
        
 	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Picture Url</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
        <form action="addPhoto.user" method="post" id="photoForm">
        <input type="text" name="photoURL" >
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <input type="submit" class="btn btn-primary" onclick="document.getElementById('photoForm').submit();">
      </div>
    </div>
  </div>
</div>

 			
 			
 			
 			
        
        <div class="col-xl-8">
            <!-- Account details card-->
            <div class="card mb-4">
                <div class="card-header">Account Details</div>
                <div class="card-body">
                    <form>
                        <!-- Form Group (username)-->
                        <div class="mb-3">
                         <h2>${user.firstName} ${user.lastName}</h2>
                        </div>
                        <!-- Form Row-->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (first name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputFirstName">First name</label>
                                <input class="form-control" id="inputFirstName" type="text"  value="${user.firstName }" name="firstName">
                            </div>
                            <!-- Form Group (last name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputLastName">Last name</label>
                                <input class="form-control" id="inputLastName" type="text" placeholder="Enter your last name" value="${user.lastName }" name="lastName">
                            </div>
                        </div>
                        <!-- Form Row        -->
                        <div class="row gx-3 mb-3">
                           
                            <!-- Form Group (current password)-->
                            <div class="mb-3">
                                <label>Height</label> <input type="text" value="${user.feet}" name="feet"> <input type="text" value="${user.inches}" name="inches">
    							<label>Weight (lbs)</label><input type="text" value="${user.weight}" name= weight>
                            </div>
                            <!-- Form Group (new password)-->
                          
                            <!-- Form Group (confirm password          
                            
                            
                        
                           
                        </div>
                        
                          
                        
                        <!-- Save changes button-->
                        <button class="btn btn-primary" type="button">Save changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>




<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<script >
var myModal = document.getElementById('myModal')
var myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', function () {
  myInput.focus()
})
</script>
<%@ include file="../JSInclude.jsp" %>
</body>
</html>