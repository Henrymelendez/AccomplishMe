<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Sign Up Page</title>
	<link rel="stylesheet" type="text/css" href="css/multi-form.css?v2">
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
	<script type="text/javascript" src="js/multi-form.js?v2"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$.validator.addMethod('date', function(value, element, param) {
				return (value != 0) && (value <= 31) && (value == parseInt(value, 10));
			}, 'Please enter a valid date!');
			$.validator.addMethod('feet', function(value, element, param) {
				return (value  > 3) && (value <= 9) && (value == parseInt(value, 10));
			}, 'Please enter a height above 3 feet!');
			$.validator.addMethod('inches', function(value, element, param) {
				return (value > -1) && (value <= 12) && (value == parseInt(value, 10));
			}, 'Please enter a valid Inches below 13 inches and above 0!');
			$.validator.addMethod('username', function(value, element, param) {
				var nameRegex = /^[a-zA-Z0-9]+$/;
				return value.match(nameRegex);
			}, 'Only a-z, A-Z, 0-9 characters are allowed');

			var val	=	{
			    // Specify validation rules
			    rules: {
			      fname: "required",

					phone: {
						required:true,
						minlength:10,
						maxlength:10,
						digits:true
					},
					feet:{
						feet:true,
						required:true,
						minlength:1,
						maxlength:1,
						digits:true
					},
					inches:{
						inches:true,
						required:true,
						minlength:1,
						maxlength:2,
						digits:true
					},
					username:{
						username:true,
						required:true,
						minlength:4,
						maxlength:16,
					},
					password:{
						required:true,
						minlength:8,
						maxlength:16,
					}
			    },
			    // Specify validation error messages
			    messages: {
					fname: 		"First name is required",
				
					feet:{
						required: 	"Height in Feet",
						minlength: 	"should be above 3 feet",
						maxlength: 	"Should be below 9 feet",
						digits: 	"height should be a number"
					},
					inches:{
						required: 	"inches",
						minlength: 	"inches should be between 0-12",
						maxlength: 	"inches should be below 13 ",
						digits: 	"Only numbers are allowed in this field"
					},

					username:{
						required: 	"Username is required",
						minlength: 	"Username should be minimum 4 characters",
						maxlength: 	"Username should be maximum 16 characters",
					},
					password:{
						required: 	"Password is required",
						minlength: 	"Password should be minimum 8 characters",
						maxlength: 	"Password should be maximum 16 characters",
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
	<h1 style="margin-top:50px; color: white;">Sign Up for Accomplish Me</h1>
	<form id="myForm" action="#" method="POST">
	  <h1>Registration Form</h1>
	  <!-- One "tab" for each step in the form: -->
	  <div class="tab">Name:
	    <p><input placeholder="First name..." name="fname"></p>
	    <p><input placeholder="Last name..." name="lname"></p>
	  </div>
	  <div class="tab">Measurements
	    <p><input placeholder="feet" name="feet"></p>
	    <p><input placeholder="inches" name="inches"></p>
	  </div>
	  
	  <div class="tab">Login Info:
	    <p><input placeholder="Username..." name="username"></p>
	    <p><input placeholder="Password..." name="password" type="password"></p>
	  </div>
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
	    <span class="step">2</span>
	    <span class="step">3</span>
	    <span class="step">4</span>
	  </div>
	</form>
</body>
</html>
    