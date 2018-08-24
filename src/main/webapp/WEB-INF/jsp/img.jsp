<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class = "container text-center">
<h2>File Name : ${image.name }</h2>
<h2>File Price : ${image.price }원</h2>
<h2>File Category : ${image.category }</h2>
<img src="data:image/jpg;base64,${image.encodedString}" ><p/>
<h4><a href="/">BACK TO MAIN</a></h4>
</div>
</body>
</html>