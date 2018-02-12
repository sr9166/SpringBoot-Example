<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>

<div class="container">
    <table class="table table-hover">
        <tr>
            <th>No</th>
            <th>ID</th>
            <th>Password</th>
            <th>Age</th>
            <th>Name</th>
        </tr>
          <c:forEach var="item" items="${list}" varStatus="status">
              <tr>
              	  <td>${status.count}</td>
                  <td>${item.id}</td>
                  <td>${item.pw}</td>
                  <td>${item.age}</td>
                  <td>${item.name}</td>
              </tr>
          </c:forEach>
    </table>
</div>

<jsp:include page="Header.jsp"></jsp:include>
</body>
</html>