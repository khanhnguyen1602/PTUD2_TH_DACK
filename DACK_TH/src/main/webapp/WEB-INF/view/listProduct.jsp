<%-- 
    Document   : listProduct
    Created on : Jun 23, 2021, 6:50:17 PM
    Author     : phuongkhanh
--%>

<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page='header.jsp'></jsp:include>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    
    <style>
        th, td 
        {
            padding: 3px
        }
        .scroll{
            display:block;
            padding:5px;
            margin-top:5px;
            width: auto;
            max-height: 600px;
            height: 100%;
            overflow:scroll;
        }
    </style>
    <!--<img src="<c:url value="/resources/Images/VH1.jpg"/>">-->
    <p>${sessionScope.userId}</p>
    <h1>Danh sách sản phẩm</h1>
    <div class="scroll">
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th>Mã SP</th>
                    <th>Tên SP</th>
                    <th>Link</th>
                </tr>
            </thead>

            <tbody>
            <c:forEach var="p" items="${listPro}">
                <tr>
                    <td> ${p.id} </td>
                    <td> ${p.productName} </td>
                    <td>
                        <c:forEach var="i" items="${p.imgs.listImg}">   
                            ${i.link}<br>
                        </c:forEach>
                    </td>
                    <td><a href="./edit.html?makh=${kh.makh}"><i class="fa fa-reorder iconReorder"></i></a></td>
                    <td><a href="./delete.html?makh=${kh.makh}" onclick="return confirm('Bạn có chắc muốn xóa khách hàng?')"><i class="fa fa-remove iconRemove"></i></a> </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page='footer.jsp'></jsp:include>
