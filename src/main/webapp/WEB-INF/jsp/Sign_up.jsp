<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>

 <script>
    function check_sign_up() {
    	if(fr.id.value =="") {
    		alert("아이디를 입력해 주세요.");
    		fr.id.focus();
    		return false;
    	}
    	else if(fr.pw.value == "") {
    		alert("비밀번호를 입력해 주세요.");
    		fr.pw.focus();
    		return false;
    	}
    	else if(fr.name.value =="") {
    		alert("이름을 입력해 주세요.");
    		fr.name.focus();
    		return false;
    	}
    	else if(fr.age.value == "") {
    		alert("나이를 입력해 주세요.");
    		fr.age.focus();
    		return false;
    	}
    	else
    		return true;
    }
    </script>

    <div id="menu2" class="container">

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

	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>