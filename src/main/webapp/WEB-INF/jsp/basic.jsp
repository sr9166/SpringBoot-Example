<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
.bg-grey {
      background-color: #f6f6f6;
  }
  .jumbotron {
      background-color: #f6f6f6;
      color: #ffffff;
      padding: 50px 0px;
  }
  .logo-small {
    color: #000000;
    font-size: 50px;
}
.carousel-control.right, .carousel-control.left {
     background-image: none;
     color: #f4511e;
  }
  .carousel-indicators li {
      border-color: #f4511e;
  }
  .carousel-indicators li.active {
      background-color: #f4511e;
  }
  .item h4 {
      font-size: 19px;
      line-height: 1.375em;
      font-weight: 400;
      font-style: italic;
      margin: 70px 0;
  }
  </style>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	
	<div class="container jumbotron text-center">
		<h1>Shopping Mall</h1>
		<p>made HyunGyu</p>
		<form class="form-inline">
		<div class = "input-gourp">
		<input type="email" class="form-control" size="50" placeholder="Email Address">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Subscribe</button>
		</div>
		</form>
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-body">
						<h4>Thank you for Subscribe!</h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container text-center bg-grey">
			<h2>SERVICES</h2>
			<h4>What we offer</h4>
			<br>
			<div class="row">
				<div class="col-sm-4">
					<span class="glyphicon glyphicon-thumbs-up logo-small"></span>
					<h4>GOOD</h4>
				</div>
				<div class="col-sm-4">
					<span class="glyphicon glyphicon-heart logo-small"></span>
					<h4>LOVE</h4>
				</div>
				<div class="col-sm-4">
					<span class="glyphicon glyphicon-globe logo-small"></span>
					<h4>GLOBAL</h4>
				</div>
			</div>
			<br>
			<br>
			<div class="row">
				<div class="col-sm-4">
					<span class="glyphicon glyphicon-tree-conifer logo-small"></span>
					<h4>GREEN</h4>
				</div>
				<div class="col-sm-4">
					<span class="glyphicon glyphicon-certificate logo-small"></span>
					<h4>CERTIFIED</h4>
				</div>
				<div class="col-sm-4">
					<span class="	glyphicon glyphicon-usd logo-small"></span>
					<h4>CHEAP</h4>
				</div>
			</div>
		</div>
		
		<div class="container jombotron">
		<p/><p/><h1></h1>
		</div>
		
		<div class="container text-center bg-grey">
		
		<h2>What our customers say</h2><p/><p/>
<div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
    <h4>"This company is the best. I am so happy with the result!"<br><span style="font-style:normal;">Michael Roe, Vice President, Comment Box</span></h4>
    </div>
    <div class="item">
      <h4>"One word... WOW!!"<br><span style="font-style:normal;">John Doe, Salesman, Rep Inc</span></h4>
    </div>
    <div class="item">
      <h4>"Could I... BE any more happy with this company?"<br><span style="font-style:normal;">Chandler Bing, Actor, FriendsAlot</span></h4>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
		
		</div>
		
		<div class="container jombotron">
		<p/><p/><h1></h1>
		</div>
		
	<div class="container text-center bg-grey">
		<h2>CONTACT</h2>
		<div>
			<p>Contact us and we'll get back to you within 24 hours.</p>
			<p>
				<span class="glyphicon glyphicon-map-marker"></span> Kyung Hee
				University, Korea
			</p>
			<p>
				<span class="glyphicon glyphicon-phone"></span> 010-2478-8401
			</p>
			<p>
				<span class="glyphicon glyphicon-envelope"></span>
				2014104133@khu.ac.kr
			</p>
		</div>
		<div id="googleMap" style="height: 500px; width: 100%; margin-bottom: 80px"></div>
		<script>
			function myMap() {
				var myCenter = new google.maps.LatLng(37.239788, 127.083457);
				var mapProp = {
					center : myCenter,
					zoom : 15,
					scrollwheel : true,
					draggable : true,
					mapTypeId : google.maps.MapTypeId.ROADMAP
				};
				var map = new google.maps.Map(document
						.getElementById("googleMap"), mapProp);
				var marker = new google.maps.Marker({
					position : myCenter
				});
				marker.setMap(map);
			}
		</script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAELbflZ3yTP9326i113lHjBpT22y3_PsY&callback=myMap"></script>
	</div>
</body>
</html>