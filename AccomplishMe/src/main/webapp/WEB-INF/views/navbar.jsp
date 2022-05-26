    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
    <div class="hero">
        <nav class="navbar" id="onBar">
       <span class="logo">
          <img src="images/yogaguy.png" alt="" id="navImage">
      
		 <h3 class="NavHeader">Accomplish ${page}</h3>
       </span>

         
          <ul>
            <li><a href="home.do" title="User Home" class="fa fa-user fa-2x"></a></li>
              <li><a href="startEdit.do" title="Settings" class="fa fa-cog fa-2x"></a></li>
                <li><a href="viewLog.do" title="Journal" class="fa fa-address-book fa-2x"></a></li>
                  <li><a href="#" title="Health(not implemented)" class="fa fa-heartbeat fa-2x disablednav"></a></li>
                    <li><a href="#" title="Friends(not implemented)" class="fa fa-users fa-2x disablednav"></a></li>
          </ul>
          <div class="searchbar">
				  <form action="search.user">
                  <input type="search" class="navSearch" name="name" placeholder="Search Users...">
                  <button id="navButton" class="btn btn-outline" type="submit">
                      <i class="fa fa-search"></i>
                  </button>
				  </form>
              </div>

 <div class="dropdown">
  <a class="dropdown" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
  <c:choose>
  <c:when test="${! empty user.userPhoto }">
   <img src="${user.userPhoto }" alt="" class="userProfile" title="User Options" style="border-radius: 50%; height: 12vh;">
  </c:when>
  <c:otherwise>
    <img src="images/Intersect.png" alt="" class="userProfile" title="User Options">
  </c:otherwise>
  </c:choose>
  </a>

  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-xxl-start" aria-labelledby="dropdownMenuLink">
    <li><a class="dropdown-item" href="userTasks.user">User Tasks</a></li>
    <li><a class="dropdown-item" href="startEdit.do">Settings</a></li>
    <li><a class="dropdown-item" href="logout.user">Logout</a></li>
  </ul>
</div>
      <!--  <img src="images/Intersect.png" alt="" class="userProfile"> -->
        </nav>  
         
    </div>
  