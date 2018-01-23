<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html lang="en">

<head>

  <title>Bootstrap Example</title>

  <meta charset="utf-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>

 

<div class="container">

</br> 

</br>

  <ul class="nav nav-tabs">

    <li class="active"><a data-toggle="tab" href="#home">Home</a></li>

    <li><a data-toggle="tab" href="#menu1">Sign in</a></li>

    <li><a data-toggle="tab" href="#menu2">Sign up</a></li>

  </ul>

 

  <div class="tab-content">

    <div id="home" class="tab-pane fade in active">

      <h3>HOME</h3>

      <p>Hello world!</p>

    </div>

    <div id="menu1" class="tab-pane fade">

      <h3>Sign in</h3>

      <form action="/action_page.php">

    <div class="form-group">

      <label for="ex3">ID:</label>

      <input type="text" class="form-control" id="id" placeholder="Enter ID" type="text">

    </div>

    <div class="form-group">

      <label for="pwd">Password:</label>

      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">

 

    </div>

    <button type="submit" class="btn btn-primary">Login</button>

  </form>

    </div>

    <div id="menu2" class="tab-pane fade">

      <h3>Sign up</h3>

      <form action="/action_page.php">

    <div class="form-group">

      <label for="ex3">ID:</label>

      <input type="text" class="form-control" id="id" placeholder="Enter ID" type="text">

    </div>

    <div class="form-group">

      <label for="pwd">Password:</label>

      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">

    </div>

    <div class="form-group">

      <label for="name">Name:</label>

      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">

    </div>

    <div class="form-group">

      <label for="age">Age:</label>

      <input type="number" class="form-control" id="age" placeholder="Enter age" name="age">

    </div>

    <button type="submit" class="btn btn-basic">submit</button>

  </form>

    </div>

  </div>

</div>

 

</body>

</html>