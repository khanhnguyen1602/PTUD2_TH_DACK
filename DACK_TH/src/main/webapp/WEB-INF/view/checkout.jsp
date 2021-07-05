<%-- 
    Document   : checkout
    Created on : Jun 27, 2021, 5:18:09 PM
    Author     : phuongkhanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page='header.jsp'></jsp:include>

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/"/>styles/bootstrap4/bootstrap.min.css">
<link href="<c:url value="/resources/"/>plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/"/>styles/checkout.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/"/>styles/checkout_responsive.css">

<style>
    .btnDatHang{
        color: black;
        background: none;
        width: 70%;
        margin-top: 83px;
        margin-left: 15%;
        height: 61px;
        text-align: center;
        border: solid 2px #1b1b1b;
        overflow: hidden;
        cursor: pointer;
        font-size: 17px;
        font-weight: 500;
    }
    .btnDatHang:hover{
        color: white;
        background: black;
        border: double;
    }
</style>
    <!-- Checkout -->

    <div class="checkout">
        <div class="container">
            <div class="row">

                <!-- Billing Info -->
                <div class="col-lg-6">
                    <div class="billing checkout_section">
                        <div class="section_title">Thông tin đơn hàng</div>
                        <div class="section_subtitle">Nhập thông tin địa chỉ của bạn</div>
                        <div class="checkout_form_container">
                            <form action="/sampleapp/cart/checkout.html" method="POST" id="checkout_form" class="checkout_form">
                                <div>
                                    <label for="checkout_name">Họ và tên*</label>
                                    <input type="text" id="fullName" name="fullName" class="checkout_input" required="required">
                                </div>
                                
                                <div>
                                    <!-- Address -->
                                    <label for="checkout_address">Địa chỉ*</label>
                                    <input type="text" id="address" name="address" class="checkout_input" required="required">
                                </div>
                                
                                <div>
                                    <!-- Phone no -->
                                    <label for="checkout_phone">Số điện thoại*</label>
                                    <input type="phone" id="phone" name="phone" class="checkout_input" required="required">
                                </div>
                                
                                <!-- Payment Options -->
                                <div class="payment">
                                    <div class="payment_options">
                                        <label class="payment_option clearfix">Paypal
                                            <input type="radio" name="radio">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="payment_option clearfix" >Thanh toán khi nhận hàng
                                            <input type="radio" name="radio" checked="checked">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="payment_option clearfix">Credit card
                                            <input type="radio" name="radio">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="payment_option clearfix">Ví momo
                                            <input type="radio" name="radio">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                                <button class="btnDatHang" type="submit" >Đặt hàng</button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Order Info -->

                <div class="col-lg-6">
                    <div class="order checkout_section">
                        <div class="section_title">Hóa đơn</div>
                        <div class="section_subtitle">Chi tiết đơn hàng</div>

                        <!-- Order details -->
                        <div class="order_list_container">
                            <div class="order_list_bar d-flex flex-row align-items-center justify-content-start">
                                <div class="order_list_title">Tên SP</div>
                                <div class="order_list_value ml-auto">Thành tiền</div>
                            </div>
                            <ul class="order_list ">
                                <c:set var="totalPriceProduct" value="0"/>
                                <c:forEach var="cart" items="${listCart}">
                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                        <div class="order_list_title">${cart.product.productName}</div>
                                        <c:set var="totalPrice" value="${cart.product.price * cart.quantity}"/>
                                        <div class="order_list_value ml-auto">${totalPrice} đ</div>
                                        <c:set var="totalPriceProduct" value="${totalPriceProduct + totalPrice}"/>
                                    </li>
                                </c:forEach>
                                
                                <hr>
                                <li class="d-flex flex-row align-items-center justify-content-start">
                                    <div class="order_list_title">Tổng tiền</div>
                                    <div class="order_list_value ml-auto">${totalPriceProduct} đ</div>
                                </li>
                                <li class="d-flex flex-row align-items-center justify-content-start">
                                    <div class="order_list_title">Phí ship</div>
                                    <div class="order_list_value ml-auto">Free</div>
                                </li>
                                <li class="d-flex flex-row align-items-center justify-content-start">
                                    <div class="order_list_title">Tổng tiền thanh toán</div>
                                    <div class="order_list_value ml-auto">${totalPriceProduct} đ</div>
                                </li>
                            </ul>
                        </div>

                        <!-- Order Text -->
                        <div class="order_text">Cảm ơn bạn đã ghé thăm cửa hàng của chúng tôi. Chúc bạn một ngày tốt lành!</div>
                        
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
<script src="<c:url value="/resources/"/>plugins/easing/easing.js"></script>
<script src="<c:url value="/resources/"/>plugins/parallax-js-master/parallax.min.js"></script>
<script src="<c:url value="/resources/"/>js/checkout.js"></script>

<jsp:include page='footer.jsp'></jsp:include>
