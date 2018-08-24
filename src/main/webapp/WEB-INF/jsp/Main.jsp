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

<br> 

<br>

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
     <script>
    function check_sign_in() {
    	if(form.id.value =="") {
    		alert("값을 입력해 주세요.");
    		form.id.focus();
    		return false;
    	}
    	else if(form.pwd.value == "") {
    		alert("값을 입력해 주세요.");
    		form.pwd.focus();
    		return false;
    	}
    	else
    		return true;
    }
    </script>

    <div id="menu1" class="tab-pane fade">

      <h3>Sign in</h3>

      <form method = "POST" name = "form" onsubmit = "return check_sign_in()" action="/login">

    <div class="form-group">

      <label for="ex3">ID:</label>

      
      <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id">

    </div>

    <div class="form-group">

      <label for="pwd">Password:</label>

      <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw">

 

    </div>

   <button type="submit" class="btn btn-basic">login</button>

  </form>

    </div>
    
    <script>
    function check_sign_up() {
    	if(fr.id.value =="") {
    		alert("값을 입력해 주세요.");
    		fr.id.focus();
    		return false;
    	}
    	else if(fr.pwd.value == "") {
    		alert("값을 입력해 주세요.");
    		fr.pwd.focus();
    		return false;
    	}
    	else if(fr.name.value =="") {
    		alert("값을 입력해 주세요.");
    		fr.name.value.focus();
    		return false;
    	}
    	else if(fr.age.value == "") {
    		alert("값을 입력해 주세요.");
    		fr.age.value.focus();
    		return false;
    	}
    	else
    		return true;
    }
    </script>

    <div id="menu2" class="tab-pane fade">

      <h3>Sign up</h3>

      <form method = "POST" name = "fr" onsubmit = "return check_sign_up()" action="/sign_up">

    <div class="form-group">

      <label for="ex3">ID:</label>

      <input type="text" class="form-control" id="id2" placeholder="Enter ID" type="text" name = "id">

    </div>

    <div class="form-group">

      <label for="pwd">Password:</label>

      <input type="password" class="form-control" id="pw2" placeholder="Enter password" name="pw">

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