<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<form method="POST" enctype="multipart/form-data" action="/upload">

		<label for="ex3">FILE:</label> <input type="file" id="file"	name="file" class="form-control"><p>
		
		<label for="ex3">ID        </label><input type="text" class="form-control" id="name" placeholder="Enter NAME" name="name"><p/>
		
		<label for="ex3">PRICE     </label><input type="number" class="form-control" id="price" placeholder="Enter PRICE" name="price"><p/>
		
		<label for="ex3">CATEGORY  </label><select class="form-control" id="category" name="category">
        <option>top</option>
        <option>bottom</option>
        <option>outer</option>
        <option>sneaker</option>
        <option>bag</option>
      </select>

		<button type="submit" class="btn btn-basic">upload</button>
	</form>

</body>
</html>