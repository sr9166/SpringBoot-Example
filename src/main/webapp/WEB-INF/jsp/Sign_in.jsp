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
    function check_sign_in() {
    	if(form.id.value =="") {
    		alert("아이디를 입력해 주세요.");
    		form.id.focus();
    		return false;
    	}
    	else if(form.pw.value == "") {
    		alert("비밀번호를 입력해 주세요.");
    		form.pw.focus();
    		return false;
    	}
    	else
    		return true;
    }
    </script>

    <div id="menu1" class="container">

      <h3>Sign in</h3>

      <form method = "POST" name = "form" onsubmit = "return check_sign_in()" action="/sign_in">

    <div class="form-group">

      <label for="ex3">ID:</label>

      
      <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id">

    </div>

    <div class="form-group">

      <label for="pwd">Password:</label>

      <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw">

 

    </div>

   <button type="submit" class="btn btn-basic">submit</button>

  </form>

    </div>
    
    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>