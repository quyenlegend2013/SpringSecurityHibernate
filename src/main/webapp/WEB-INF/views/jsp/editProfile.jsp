<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light border">
			<div class="col-11 bg-light text-secondary">CMS</div>
			<div class="col-1 bg-light text-right">
				<div class="btn-group">
					<button type="button" class="btn btn-light dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						style="color: blue;">
						<i class="fas fa-user"></i>
					</button>
					<div class="dropdown-menu dropdown-menu-right">
						<button class="dropdown-item" type="button"
							onclick="location.href='#'">
							<i class="fas fa-user p-2"></i>User Profile
						</button>
						<button class="dropdown-item" type="button"
							onclick="location.href='logout'">
							<i class="fas fa-sign-out-alt p-2"></i>Logout
						</button>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<main>
	<div class="container-fluid flex-xl-nowrap">
		<div class="row">
			<div class="col-3 bg-light border border-top-0 border-bottom-0 ">
				<div class="row border border-top-0 border-right-0">
					<div class="input-group p-2">
						<input type="text" class="form-control" placeholder="Search...">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col p-2 border border-top-0 border-right-0 ">

						<a href="list"><i class="fas fa-table"> View contents</i></a>

					</div>
				</div>
				<div class="row">
					<div class="col p-2 border border-top-0 border-right-0">

						<a href="create"><i class="fas fa-edit"> Form content</i></a>

					</div>
				</div>
			</div>
			<div class="col-9">
				<nav class="navbar navbar-expand-lg navbar-light border-bottom p-3">
					<h2>Edit Profile</h2>
				</nav>
				<div class="row p-4">
					<div class="col border">
						<div
							class="row bg-light p-3 border border-top-0 border-left-0">Profile
							Form Elements</div>

						<form:form method="POST" action="passProfile" modelAttribute="dataProfile">
							<form:hidden path="memberID" /> 
						<div class="row p-3 font-weight-bold">First Name</div>
						<div class="row">
							<div class="col-10">
								
								
								
								<form:input id="firstname" type="text" path="firstname"
										class="form-control" placeholder="Enter the title"
										required="required" minlength="3" maxlength="30" />
										
							</div>
						</div>
						<div class="row p-3 font-weight-bold">Last Name</div>
						<div class="row">
							<div class="col-10">
								
								
								<form:input id="lastname" path="lastname" class="form-control"
										aria-label="With textarea" minlength="3" maxlength="30"
										required="required" />
							</div>
						</div>
						<div class="row p-3 font-weight-bold">Email</div>
						<div class="row">
							<div class="col-10">
								${dataProfile.email }
								
								<%-- <form:input id="email" path="email" class="form-control"
										aria-label="With textarea" minlength="5"
										required="required" readonly="true" /> --%>
							</div>
						</div>
						<div class="row p-3 font-weight-bold">Phone</div>
						<div class="row">
							<div class="col-10">
								
								<form:input id="phone" path="phone" class="form-control"
										aria-label="With textarea" minlength="9" maxlength="13"
										required="required" />
							</div>
						</div>
						<div class="row p-3 font-weight-bold">Description</div>
						<div class="row">
							<div class="col-10">
								<!-- <textarea class="form-control" aria-label="With textarea"></textarea> -->
								<form:textarea id="description" path="description"
										class="form-control" aria-label="With textarea" 
										maxlength="200" required="required" />
							</div>
						</div>
						<div class="row p-3">
							<p>
								<input type="submit" class="btn btn-success" value="Submit"></input>
								<input type="reset" class="btn btn-success" value="Reset"></input>
							</p>
						</div>
					 </form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>
</body>

</html>