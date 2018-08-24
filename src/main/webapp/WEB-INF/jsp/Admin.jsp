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
  <h2>ADMIN PAGE</h2>
  <ul class="nav nav-pills nav-justified">
    <li class="active"><a data-toggle="pill" href="#home">회원 리스트</a></li>
    <li><a data-toggle="pill" href="#menu1">상품 업로드</a></li>
    <li><a data-toggle="pill" href="#menu2">상품 리스트</a></li>
  </ul>
  <p/>
  <div class="tab-content">
  
    <div id="home" class="tab-pane fade in active">
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
    </div>
    
    <div id="menu1" class="tab-pane fade">
    <div class="container">
      <form method="POST" enctype="multipart/form-data" action="/upload">

		<label for="ex3">FILE:</label> <input type="file" id="file"	name="file" class="form-control"><p>
		
		<label for="ex3">NAME</label><input type="text" class="form-control" id="name" placeholder="Enter NAME" name="name"><p/>
		
		<label for="ex3">PRICE</label><input type="number" class="form-control" id="price" placeholder="Enter PRICE" name="price"><p/>
		
		<label for="ex3">CATEGORY</label>
		
		<select class="form-control" id="category" name="category">
        <option>top</option>
        <option>bottom</option>
        <option>outer</option>
        <option>sneaker</option>
        <option>bag</option>
      </select>
		<p/>
		<button type="submit" class="btn btn-basic">upload</button>
	</form>
	<div class="alert alert-warning" style="text-align:center">
    <h4><strong>같은 상품을 올릴시 상품정보가 수정됩니다!</strong></h4>
  	</div>
    </div>
    </div>
    
    <div id="menu2" class="tab-pane fade">
     <table class="table table-striped">
     <tr align = center>
        	<th align = center>NO</th>
            <th align = center>NAME</th>
            <th align = center>PRICE</th>
            <th align = center>IMAGE</th>
            <th> </th>
        </tr>
          <c:forEach var="item" items="${imagelist}" varStatus="status">
              <tr style = "font-size:20px">
                  <td>${status.count }</td>
                  <td>${item.name }</td>
                  <td><fmt:formatNumber value="${item.price}" pattern="###,###,###원"/></td>
                  <td><img src="data:image/jpg;base64,${item.encodedString}" width=100 height=100></td>
                  <td>
                  <form method="POST" action="/item_delete">
                  		<input type="hidden" name="productId" value="${item.id}">
                  		<button type="submit" class="btn btn-basic">Delete</button>
                  </form>
                  </td>
              </tr>
          </c:forEach>
    </table>
    </div>
    
  </div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>
