<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<div class="container">
  <h2>MY PAGE</h2>
  <ul class="nav nav-pills nav-justified">
    <li class="active"><a data-toggle="pill" href="#home">회원정보</a></li>
    <li><a data-toggle="pill" href="#menu1">장바구니</a></li>
    <li><a data-toggle="pill" href="#menu2">구매내역</a></li>
  </ul>
  <p/>
  <div class="tab-content">
  
    <div id="home" class="tab-pane fade in active">
      <p>ID : ${sessionScope.member._id }</p>
      <p>PW : ${sessionScope.member.pw }</p>
      <p>NAME : ${sessionScope.member.name }</p>
      <p>AGE : ${sessionScope.member.age }</p>      
    </div>
    
    <div id="menu1" class="tab-pane fade">
      <table class="table table-striped">
     <tr align = center>
        	<th align = center>NO</th>
            <th align = center>NAME</th>
            <th align = center>PRICE</th>
            <th align = center>IMAGE</th>
            <th align = center>AMOUNT</th>
            <th> </th>
        </tr>
          <c:forEach var="item" items="${list}" varStatus="status">
              <tr style="cursor:pointer; font-size:20px" onclick="location.href='/item/detail/${item.itemid}'">
                  <td>${status.count }</td>
                  <td>${item.name }</td>
                  <td><fmt:formatNumber value="${item.price}" pattern="###,###,###원"/></td>
                  <td><img src="data:image/jpg;base64,${item.encodedString}" width=100 height=100></td>
                  <td>${item.amount}</td>
                  <td>
                  <form method="POST" action="/cart_delete">
                  		<input type="hidden" name="productId" value="${item.itemid}">
                  		<button type="submit" class="btn btn-basic">Delete</button>
                  </form>
                  </td>
              </tr>
          </c:forEach>
    </table>
    
    <form class = "form-inline" method="POST" action="cart_buy">
    	<span style="font-size: 25px">TOTAL PRICE : ${totalPrice }</span>
    	<button type="submit" class="btn btn-info">BUY</button>
    </form>
    </div>
    
    <div id="menu2" class="tab-pane fade">
      <table class="table table-striped">
     <tr align = center>
        	<th align = center>NO</th>
            <th align = center>NAME</th>
            <th align = center>PRICE</th>
            <th align = center>IMAGE</th>
            <th align = center>AMOUNT</th>
        </tr>
          <c:forEach var="item" items="${purchaselist}" varStatus="status">
              <tr style="cursor:pointer; font-size:20px" onclick="location.href='/item/detail/${item.itemid}'">
                  <td>${status.count }</td>
                  <td>${item.name }</td>
                  <td><fmt:formatNumber value="${item.price}" pattern="###,###,###원"/></td>
                  <td><img src="data:image/jpg;base64,${item.encodedString}" width=100 height=100></td>
                  <td>${item.amount}</td>
              </tr>
          </c:forEach>
    </table>
    </div>
    
  </div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
