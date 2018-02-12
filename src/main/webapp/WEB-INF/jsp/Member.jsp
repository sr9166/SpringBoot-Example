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

	<div class="container">
	
		<p>ID : ${sessionScope.member._id }</p>
		<p>PW : ${sessionScope.member.pw }</p>
		<p>NAME : ${sessionScope.member.name }</p>
		<p>AGE : ${sessionScope.member.age }</p>
	
	</div>

<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>