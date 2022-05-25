<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Create New Challenge</title>
	<link rel="stylesheet" type="text/css" href="css/multi-form.css?v2">
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
	<script type="text/javascript" src="js/multi-form.js?v2"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$.validator.addMethod('duration', function(value, element, param) {
				return (value  > 0) && (value <= 365) && (value == parseInt(value, 10));
			}, 'Please enter more than 1 day!');
			$.validator.addMethod('name', function(value, element, param) {
				var nameRegex = /^[a-zA-Z0-9]+$/;
				return value.match(nameRegex);
			}, 'Only a-z, A-Z, 0-9 characters are allowed');

			var val	=	{
			    // Specify validation rules
			    rules: {
			    	name: "required",
			    	description:  "required",
					duration:{
						duration:true,
						required:true,
						minlength:1,
						maxlength:3,
						digits:true
					}
			    },
			    // Specify validation error messages
			    messages: {
			    	name: 			"Name is required",
			    	description: 	"Description is required",
				
					duration:{
						required: 	"Duration in days",
						minlength: 	"Should be at least 1 day",
						maxlength: 	"Should be below 365 days",
						digits: 	"Duration should be a number"
			    }
			}
			}
			$("#myForm").multiStepForm(
			{
				// defaultStep:0,
				beforeSubmit : function(form, submit){
					console.log("called before submiting the form");
					console.log(form);
					console.log(submit);
				},
				validations:val,
			}
			).navigateTo(0);
		});
	</script>
</head>
<body>
	<h1 style="margin-top:50px; color: white;">Add New Challenge</h1>
	<form id="myForm" action="createChallenge.ch" method="POST">
	  <h1>Challenge Form</h1>
	  <!-- One "tab" for each step in the form: -->
	  <div class="tab">Challenge Info:
	    <p><input placeholder="Name..." name="name"></p>
	    <p><input placeholder="Description..." name="description"></p>
	    <p><input placeholder="Duration..." name="duration"></p>
	  	
	  	<div class="checkboxes" style="display: flex;justify-content: center;text-align: end;">
  				<div class="column">Workout <input type="checkbox" name="categoryName" value="workout"></div>
  				<div class="column"> Diet <input type="checkbox" name="categoryName" value="food"></div>
  				<div class="column">Books<input type="checkbox" name="categoryName" value="book"></div>
		</div>
	  </div>
	    <!-- <div class="tab">
	    </div> -->
	  <div style="overflow:auto;">
	    <div style="float:right; margin-top: 5px;">
	    <button type="button" class="previous">Previous</button>
	      	<button type="button" class="next">Next</button>
			<button type="button" class="submit">Submit</button>
	    </div>
	  </div>
	  <!-- Circles which indicates the steps of the form: -->
	  <div style="text-align:center;margin-top:40px;">
	    <span class="step">1</span>
	   <!--  <span class="step">2</span> -->
	    
	  </div>
	</form>
</body>
</html>
    