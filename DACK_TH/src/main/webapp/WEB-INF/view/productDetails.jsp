<%-- 
    Document   : productDetails
    Created on : Jun 26, 2021, 6:51:22 PM
    Author     : phuongkhanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page='header.jsp'></jsp:include>


    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/"/>styles/bootstrap4/bootstrap.min.css">
<link href="<c:url value="/resources/"/>plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/"/>plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/"/>plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/"/>plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/"/>styles/product.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/"/>styles/product_responsive.css">

<p>${sessionScope.userId}</p>
<!-- Product Details -->

<div class="product_details">
    <div class="container">
        <div class="row details_row">

            <!-- Product Image -->
            <div class="col-lg-6">
                <div class="details_image">
                    <div class="details_image_large"><img style="max-width: 400px;width: 100%; max-height: 500px; height: auto" src="<c:url value="/resources/Images/"/>${p.imgs.listImg[0].link}" alt="img"></div>
                    <div class="details_image_thumbnails d-flex flex-row align-items-start justify-content-between">
                        <div class="details_image_thumbnail active" data-image="<c:url value="/resources/Images/"/>${p.imgs.listImg[0].link}"><img src="<c:url value="/resources/Images/"/>${p.imgs.listImg[0].link}" alt="img"></div>
                            <c:set var="index" value="0" />
                            <c:forEach var="i" items="${p.imgs.listImg}"> 
                                <c:if test="${index != 0}" >
                                    <div class="details_image_thumbnail" data-image="<c:url value="/resources/Images/"/>${i.link}"><img src="<c:url value="/resources/Images/"/>${i.link}" alt="img"></div>
                                </c:if>
                                <c:set var="index" value="${index+1}" />
                            </c:forEach>
                            <c:choose>
                                <c:when test="${countImg <= 4}">
                                    <div  class="details_image_thumbnail" data-image="<c:url value="/resources/Images/"/>${i.link}"></div>
                                </c:when>
                            </c:choose>
                    </div>
                </div>
            </div>

            <!-- Product Content -->
            <div class="col-lg-6">
                <div class="details_content">
                    <div class="details_name">${p.productName}</div>
                    <div class="details_discount">${p.price} đ</div>
                    <div class="details_price">${p.price} đ</div>

                    <!-- In Stock -->
                    <div class="in_stock_container">
                        <div class="availability">Availability:</div>
                        <span>In Stock</span>
                    </div>
                    <div class="details_text">
                        <p>${p.description}</p>
                    </div>

                    <!-- Product Quantity -->
                    <div class="product_quantity_container">
                        <div class="product_quantity clearfix">
                            <span>Qty</span>
                            <input id="quantity" name="quantity" type="text" pattern="[0-9]*" value="1">
                            <div class="quantity_buttons">
                                <div id="quantity_inc_button" class="quantity_inc quantity_control"><i class="fa fa-chevron-up" aria-hidden="true"></i></div>
                                <div id="quantity_dec_button" class="quantity_dec quantity_control"><i class="fa fa-chevron-down" aria-hidden="true"></i></div>
                            </div>
                        </div>
                        <div class="button cart_button"><a href="#">Add to cart</a></div>
                    </div>

                    <!-- Share -->
                    <div class="details_share">
                        <span>Share:</span>
                        <ul>
                            <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row description_row">
            <div class="col">
                <div class="description_title_container">
                    <div class="description_title">Comment <span>(0)</span></div>
                    <!--<div class="reviews_title"><a href="#">Reviews <span>(1)</span></a></div>-->
                </div>
                <div class="description_text">
                    <form>
                        <div class="form-group">
                            <textarea class="form-control" id="comment" name="comment" rows="3"></textarea>                        </div>
                        <button type="submit" class="btn btn-primary">Comment</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<c:url value="/resources/"/>js/jquery-3.2.1.min.js"></script>
<script src="<c:url value="/resources/"/>styles/bootstrap4/popper.js"></script>
<script src="<c:url value="/resources/"/>styles/bootstrap4/bootstrap.min.js"></script>
<script src="<c:url value="/resources/"/>plugins/greensock/TweenMax.min.js"></script>
<script src="<c:url value="/resources/"/>plugins/greensock/TimelineMax.min.js"></script>
<script src="<c:url value="/resources/"/>plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="<c:url value="/resources/"/>plugins/greensock/animation.gsap.min.js"></script>
<script src="<c:url value="/resources/"/>plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="<c:url value="/resources/"/>plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="<c:url value="/resources/"/>plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="<c:url value="/resources/"/>plugins/easing/easing.js"></script>
<script src="<c:url value="/resources/"/>plugins/parallax-js-master/parallax.min.js"></script>
<script src="<c:url value="/resources/"/>js/product.js"></script>

<jsp:include page='footer.jsp'></jsp:include>