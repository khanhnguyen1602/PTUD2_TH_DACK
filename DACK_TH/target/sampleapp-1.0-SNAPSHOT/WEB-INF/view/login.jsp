<%-- 
    Document   : login
    Created on : Jun 28, 2021, 10:44:18 AM
    Author     : phuongkhanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page='header.jsp'></jsp:include>

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/"/>styles/css/login.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">

 <div class="row">
        <div class="col-md-6">
            <div class="card">
                <form action="/sampleapp/user/login/xulylogin.html" method="POST" class="box">
                    <h1>Login</h1>
                    <p class="text-muted"> Please enter your login and password!</p> 
                    <input type="text" name="username" placeholder="Username"> 
                    <input type="password" name="password" placeholder="Password"> 
                    <a class="forgot text-muted" href="#">Forgot password?</a> 
                    <input type="submit" name="login" value="Login" href="">
                    <div class="col-md-12">
                        <ul class="social-network social-circle">
                            <li><a href="#" class="icoFacebook" title="Facebook"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a href="#" class="icoTwitter" title="Twitter"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="#" class="icoGoogle" title="Google +"><i class="fab fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                    <span style='color: gray'>Don't have an account? 
                    <a style="color: white" href="/sampleapp/user/register.html">Register here</a></span>
                </form>
            </div>
        </div>
    </div>

<jsp:include page='footer.jsp'></jsp:include>
