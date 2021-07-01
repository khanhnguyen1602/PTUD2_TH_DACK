<%-- 
    Document   : home
    Created on : Jun 28, 2021, 3:45:29 PM
    Author     : Huyen Minhh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page='header.jsp'></jsp:include>

<!DOCTYPE html>
<html lang="en">
    <head>
      <title>Home</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
    <br>
        <div class="container">
          <!-- Nav tabs -->
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" data-toggle="tab" href="#home">Best-Seller</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#menu1">New Arrivals</a>
            </li>
          </ul>

          <!-- Tab panes -->
          <div class="tab-content">
            <div id="home" class="container tab-pane active"><br>
                <div class="row">
                    <div class="col-sm-9">
                        <div class="row">
                            <c:forEach items="${listPro}" var="o">
                                <c:url value="/resources/Images/${p.imgs.listImg}" var="i"></c:url>
                                <div class="col-12 col-md-6 col-lg-4">
                                    <div class="card">
                                        <img class="card-img-top" src="i" alt="Card image cap">
                                        <div class="card-body">
                                            <h4 class="card-title show_txt"><a href="#" title="View Product">${o.productName}</a></h4>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="btn btn-danger btn-block">${o.price} $</p>
                                                </div>
                                                <div class="col">
                                                    <a href="#" class="btn btn-success btn-block">Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div id="menu1" class="container tab-pane fade"><br>
              <div class="row">
                    <div class="col-sm-9">
                        <div class="row">
                            <c:forEach items="${listPro}" var="o">
                                <c:url value="/resources/Images/${p.imgs.listImg}" var="i"></c:url>
                                <div class="col-12 col-md-6 col-lg-4">
                                    <div class="card">
                                        <img class="card-img-top" src="i" alt="Card image cap">
                                        <div class="card-body">
                                            <h4 class="card-title show_txt"><a href="#" title="View Product">${o.productName}</a></h4>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="btn btn-danger btn-block">${o.price} $</p>
                                                </div>
                                                <div class="col">
                                                    <a href="#" class="btn btn-success btn-block">Add to cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
          </div>
        </div>
    </body>
</html>
<jsp:include page='footer.jsp'></jsp:include>