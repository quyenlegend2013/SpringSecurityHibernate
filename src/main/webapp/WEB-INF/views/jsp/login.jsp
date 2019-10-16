<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
</head>
<title>Login</title>



</head>
<body style="padding-top: 100px;" class="bg-light">
	<div class="col-md-4 offset-md-4 border bg-white">
		<div class="row bg-light border-bottom">
			<nav class="navbar navbar-expand-lg navbar-light">
				<h4>Please Sign In</h4>
			</nav>
		</div>


		<nav class="navbar navbar-expand-lg navbar-light offset-2" style="padding-left: 45px;">
			<c:if test="${param.error != null}">
				<div class="alert alert-danger">Invalid Email and password.</div>
			</c:if>

			<c:if test="${param.logout != null}">
				<div class="alert alert-warning">You have been logged out.</div>
			</c:if>
			<c:if test="${param.success != null}">
					<div class="alert alert-success">You have register success.</div>
				</c:if>
		</nav>

		<form:form action="passLogin" modelAttribute="data" name='loginForm'
			method='POST'>

			<nav class="navbar navbar-expand-lg navbar-light">
			
			
				<form:input type='text' path="email" name='email'
					id="email" class="form-control"
					placeholder="E-mail" required="required" />
					
					
			</nav>
			<nav class="navbar navbar-expand-lg navbar-light">
			
			
				<form:input type='password' path="password" name='password'
					id="password" class="form-control"
					placeholder="Password" required="required" />
					
					
			</nav>
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="custom-control custom-checkbox">
				
					<input type="checkbox" name="remember-me"
						class="custom-control-input" id="defaultLoginFormRemember">
					<label class="custom-control-label" for="defaultLoginFormRemember">Remember
						me</label>
				</div>
			</nav>
			<nav class="navbar navbar-expand-lg navbar-light">
				<button class="btn btn-success btn-block" name="submit"
					type="submit">Login</button>
			</nav>
			<nav class="navbar navbar-expand-lg navbar-light">
				<a href="<c:url value="/dangky"/>">Click here to Register</a>
			</nav>
		</form:form>
	</div>
	<script type="text/javascript">
		$(function(){
			
			if(localStorage.chkbox && localStorage.chkbox != ''){
				$('#defaultLoginFormRemember').attr('checked', 'checked');
				$('#email').val(localStorage.email);
				$('#password').val(localStorage.password);
			}else{
				$('#defaultLoginFormRemember').removeAttr('checked');
				$('#email').val('');
				$('#password').val('');
			}
			
			$('#defaultLoginFormRemember').click(function() {
				if($('#defaultLoginFormRemember').is(':checked')){
					
					localStorage.email = $('#email').val();
					localStorage.password = $('#password').val();
					localStorage.chkbox = $('#defaultLoginFormRemember').val();
					console.log(localStorage.email);
				}else{
					localStorage.email ='';
					localStorage.password = '';
					localStorage.chkbox = '';
				}
			});
		});
	</script>
</body>
</html>