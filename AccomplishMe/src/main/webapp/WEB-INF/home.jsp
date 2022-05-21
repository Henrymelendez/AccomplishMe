<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="css/login.css">
  </head>
  <body>
    <div class="">


    <h1>Accomplish Me</h1>
      <img src="https://cdn4.iconfinder.com/data/icons/unigrid-layout/60/021_layout_wireframe_grid_image-512.png" alt="#">
    </div>
    <form action="login.do" method="GET">
    <div class="login">

      <i class="fa fa-empire" aria-hidden="true"></i>
        <h3>Login</h3>
      <div class="group"><input type="text" name="username" placeholder="Username">
        <i class="fa fa-user"></i></div>

        <div class="group"><input type="password" name="password" placeholder="password"><i
          class="fa fa-lock"></i></div>
          <input type="submit" name="button" value="Login" formaction="login.do"/>
          <input type="submit" name="button" value="Register" formaction="createUser.do"/>


    </div>
  </form>
  

  </body>
</html>