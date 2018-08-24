<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="/">MAIN</a>
				</div>
				<ul class="nav navbar-nav">
					<li><a href="/item?category=top">TOP</a></li>
					<li><a href="/item?category=bottom">BOTTOM</a></li>
					<li><a href="/item?category=outer">OUTER</a></li>
					<li><a href="/item?category=sneaker">SNEAKER</a></li>
					<li><a href="/item?category=bag">BAG</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/sign_up"><span
							class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<c:choose>
						<c:when test="${sessionScope.member eq null }">
							<li><a href="/sign_in"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
						</c:when>
						<c:when test="${sessionScope.member.name eq 'admin'  }">
							<li><a href="/admin"><span class="glyphicon glyphicon-pencil"></span> 
							ADMINTYPE</a></li>
							<li><a href="/logout"><span
									class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/member"><span class="glyphicon glyphicon-pencil"></span> 
							${sessionScope.member.name }</a></li>
							<li><a href="/logout"><span
									class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<form class="navbar-form navbar-right" action="/search">
					<div class="input-group">
						<input type="text" class="form-control input-sm" placeholder="Search"
							name="name">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</div>
					</div>
				</form>
			</div>
		</nav>
	</div>

</body>
</html>

