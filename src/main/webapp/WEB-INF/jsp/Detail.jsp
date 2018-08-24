<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세정보</title>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>

	<script>
		function check_sign_in() {
			var value = new Object();
			value.auth = "${auth}";
			if (value.auth == "user") {
				return true;
			} else {
				alert("로그인이 필요합니다.")
				return false;
			}
		}
	</script>


	<div class="container">
    <h2>상품 상세정보</h2>
    <table border="1">
        <tr>
            <td>
                <img src="data:image/jpg;base64,${item.encodedString}" width="340" height="300">
            </td>
            <td>
                <table border="1" style="height: 300px; width: 400px;">
                    <tr align="center">
                        <td>상품명</td>
                        <td>${item.name}</td>
                    </tr>
                    <tr align="center">
                        <td>가격</td>
                        <td><fmt:formatNumber value="${item.price}" pattern="###,###,###원"/></td>
                    </tr>
                    <tr align="center">
                        <td>카테고리</td>
                        <td>${item.category}</td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <form name="form1" method="post" onsubmit = "return check_sign_in()" action="/cart_add">
                                <input type="hidden" name="productId" value="${item.id}">
                                <select name="amount">
                                    <c:forEach begin="1" end="10" var="i">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>&nbsp;개
                                <button type="submit" class="btn btn-primary btn-xs">장바구니에 담기</button>
                            </form>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>