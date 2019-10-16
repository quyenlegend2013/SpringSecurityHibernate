<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Content</title>

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
							onclick="location.href='editProfile'">
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
			<div class="col-3 bg-light border border-top-0 border-bottom-0  "style="height: 693px;">
				<div class="input-group p-2">
					<input type="text" class="form-control" placeholder="Search...">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
				<div class="row">
					<div class="col p-2 border border-right-0">
						<a href="list"><i class="fas fa-table"> View contents</i></a>
					</div>
				</div>
				<div class="row">
					<div
						class="col p-2 border border-top-0 border-right-0 border-bottom-0">
						<a href="#"><i class="fas fa-edit"> Form content</i></a>
					</div>
				</div>
			</div>
			<div class="col-9">
				<nav class="navbar navbar-expand-lg navbar-light border-bottom">
					<h2>Edit Content</h2>
				</nav>
				<div class="row p-4">
					<div class="col border ">
						<div
							class="row bg-light p-2 border border-top-0 border-left-0 ">Content
							Form Element</div>
						<form:form modelAttribute="contentdata" cssClass="form-horizontal"
							method="POST" action="updatecontent">
							<form:hidden path="contentID" />
							<div class="row p-2 font-weight-bold">Title</div>
							<div class="row">
								<div class="col-10">
									<form:input path="title" cssClass="form-control"
										required="required" placeholder="Enter the title"
										minlength="10" maxlength="200" />
								</div>
							</div>
							<div class="row p-2 font-weight-bold">Brief</div>
							<div class="row">
								<div class="col-10">
									<form:textarea path="brief" cssClass="form-control"
										required="required" aria-label="With textarea" minlength="30"
										maxlength="150" />
								</div>
							</div>
							<div class="row p-2 font-weight-bold">Content</div>
							<div class="row">
								<div class="col-10">
									<form:textarea path="contents" cssClass="form-control"
										required="required" aria-label="With textarea" minlength="50"
										maxlength="1000" />
								</div>
							</div>
							<div class="row p-3">
								<p>
									<input type="submit" class="btn btn-success" value="Save"></input>
									<input type="submit" class="btn btn-success" value="Cancel"></input>
								</p>
							</div>
						</form:form>
					</div>
				</div>

			</div>
		</div>
	</div>
	</main>

	<%-- <main>
	<div class="container-fluid flex-xl-nowrap">
		<div class="row p-2">
			<div class="col-9  ">
				<input placeholder="Search..." cssClass="form-control" />
			</div>
			<div class="col-3">
				<button type="button" class="btn btn-while">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</div>
		<div class="row p-2">
			<div class="col">
				<a href="list"><i class="fas fa-table"> View contents</i></a>
			</div>
		</div>
		<div class="row p-2">
			<div class="col">
				<a href="create"><i class="fas fa-edit"> Form Content</i></a>
			</div>
		</div>
	</div>
	<div class="col-9  border-bottom border-right">
		<div class="row p-4 ">
			<h3>Edit Content</h3>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10 border border-bottom-0">
				<form:form modelAttribute="contentdata" cssClass="form-horizontal"
					method="POST" action="updatecontent">
					<div class="row bg-light p-2 order  border-bottom">Content
						Form Element</div>
					<form:hidden path="contentID" />
					<div class="row p-2 font-weight-bold">Title</div>
					<div class="row">
						<div class="col-10">
							<form:input path="title" cssClass="form-control"
								required="required" placeholder="Enter the title" minlength="10"
								maxlength="200" />
						</div>
					</div>
					<div class="row p-2 font-weight-bold">Brief</div>
					<div class="row">
						<div class="col-10">
							<form:textarea path="brief" cssClass="form-control"
								required="required" aria-label="With textarea" minlength="30"
								maxlength="150" />
						</div>
					</div>
					<div class="row p-2 font-weight-bold">Content</div>
					<div class="row">
						<div class="col-10">
							<form:textarea path="contents" cssClass="form-control"
								required="required" aria-label="With textarea" minlength="50"
								maxlength="1000" />
						</div>
					</div>
					<div class="row p-2">
						<table class="table">
							<tr>
								<td><input type="submit" class="btn btn-success"
									value="Save"></input> <input type="submit"
									class="btn btn-success" value="Cancel"></input></td>
							<tr>
						</table>

					</div>
				</form:form>
			</div>

		</div>
		<div class="col-1"></div>
	</div>
	</main> --%>
</body>
</html>