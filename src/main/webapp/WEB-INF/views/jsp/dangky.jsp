<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<%-- <jsp:include page="header.jsp"/> --%>
<title>Register</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/6631cf4e8b.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
function checkPassword() {
	var pass=document.getElementById("pass").value;
	var newpass=document.getElementById("repass").value;
	var notice="";
	if(newpass != pass)
		{
			notice="Password doesn't match!";
		}
	/* else
		{
			notice="Success!";
		} */
	document.getElementById("view-password").innerHTML=notice;
}


function checkUser() {
	var pass=document.getElementById("username").value;
	var notice="";
	if(pass=="")
		{
			notice="Please input Username!";
		}
	else
		{
			
		}
	
	document.getElementById("view-user").innerHTML=notice;
}


function checkEmail() {
	var pass=document.getElementById("email").value;
	var notice="";
	if(pass=="")
		{
			notice="Please enter an email!";
		}
	else
		{
			checkEmailExist();
		}
	
	document.getElementById("view-email").innerHTML=notice;
}

</script>

	<script>

			 function checkEmailExist() {

				var s = $('#email').val();

					$.ajax({
						url: "checkemail?email="+s,
						dataType: 'json',
						type: 'get',
						cache: false,
						success: function (data) {
							/*console.log(data);*/
							var event_data = '';

							var id = 1;
							$.each(
											data,
											function (index, value) {
												//alert(data);
												if(data=="success:true")
												{
													document.getElementById("view-email").innerHTML="Email existed!!!"
													$("#submit").attr("disabled", true);
												}
													//alert("OK");
												else {
													document.getElementById("view-email").innerHTML="";
													$("#submit").attr("disabled", false);
												}
											});
						},
						error: function (d) {
							/*console.log("error");*/
							alert("404. Please wait until the File is Loaded.");
						}
					})

		};
	</script>



</head>
<body style="padding-top: 100px;" class="bg-light">
	<div class="col-md-4 offset-md-4 border bg-white">
		<div class="row bg-light border-bottom">
			<nav class="navbar navbar-expand-lg navbar-light">
				<h4>Register</h4>
			</nav>
		</div>
		<form:form name='register' action="saveUser"
			modelAttribute="memberdata" method='POST'>
			
			<nav class="navbar navbar-expand-lg navbar-light">
			<p id="view-email" style="color:red"></p>
			</nav>
			
			<nav class="navbar navbar-expand-lg navbar-light">
				<form:input id="username" type='text' path="username" name='regusername'
					class="form-control" placeholder="User name" minlength="3"
					maxlength="30" required="required" onfocusout="checkUser()" />
			</nav>
			
			
			
			<!-- <p id="view-user" style="color:red"></p> -->
			
			
			
			
			
			<nav class="navbar navbar-expand-lg navbar-light">
				<form:input id="email" type='email' path="email" name='regemail'
					class="form-control" placeholder="E-mail" minlength="5"
					required="required" onfocusout="checkEmail()" />
			</nav>
			
			
			
			
			
			
			<nav class="navbar navbar-expand-lg navbar-light">
				<form:input id="pass" type='password' path="password" name='repassword'
					class="form-control" placeholder="Password" minlength="8"
					maxlength="30" required="required" />
			</nav>
			<nav class="navbar navbar-expand-lg navbar-light">
				<form:input id="repass" type='password' name='regrepassword' path="passwordrepeat"
					class="form-control" placeholder="Re Password" minlength="8"
					maxlength="30" required="required" onfocusout="checkPassword()" />
					
			</nav>
			
			<nav class="navbar navbar-expand-lg navbar-light">
			<p id="view-password" style="color:red"></p>
			</nav>
			
			<nav class="navbar navbar-expand-lg navbar-light">
				<button class="btn btn-success btn-block" name="submit" id="submit"
					type="submit">Register</button>
			</nav>
			<nav class="navbar navbar-expand-lg navbar-light">
				<a href="login" class="float-left">Click here to Login</a>
			</nav>
		</form:form>
	</div>
</body>
</html>