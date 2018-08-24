<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
.font-big{
	font-size: 20px;
	line-height: 10.0em;
}
</style>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>

<div class="container">
    <table class="table table-striped">
     	<tr>
        	<th>NO</th>
            <th>ID</th>
            <th>NAME</th>
            <th>PRICE</th>
            <th>IMAGE</th>
        </tr>
          <c:forEach var="item" items="${list}" varStatus="status">
              <tr style="cursor:pointer; margin-top:100px" onclick="location.href='/item/detail/${item.id}'" class=font-big>
                  <td>${status.count }</td>
                  <td>${item.id}</td>
                  <td>${item.name }</td>
                  <td><fmt:formatNumber value="${item.price}" pattern="###,###,###원"/></td>
                  <td><img src="data:image/jpg;base64,${item.encodedString}" width=100 height=100></td>
              </tr>
          </c:forEach>
    </table>
</div>

<script>
	var link = document.location.href;
	console.log(link);
</script>

	<!-- PAGING PROCESS BGN -->
	<div class="container">
		<ul class="pager">
		<c:if test="${nowPage > 1 }">
			<li class="previous"><a href="">Previous</a></li>
		</c:if>
		<c:if test="${nowPage < PageCount }">
			<li class="next"><a href="">Next</a></li>
		</c:if>
		</ul>
	</div>
	<!-- PAGING PROCESS END -->

	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>