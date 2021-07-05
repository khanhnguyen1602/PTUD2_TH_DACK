<%-- 
    Document   : header
    Created on : Jun 11, 2021, 3:09:45 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý sách</title>
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <link href="<c:url value="/resources/"/>plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="/sampleapp/">Quản lý sách</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarScroll">
                        <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="/sampleapp/index.html">Trang chủ</a>
                            </li>
                            <c:if test="${sessionScope.userId > 0}">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">Cá nhân</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">Liên hệ</a>
                                </li>
                            </c:if>
                            
                        </ul>
                        <form class="d-flex">
                            <c:if test="${sessionScope.userId > 0}">
                                <a style="float: end" class="btn btn-outline-success" type="submit" href="/sampleapp/user/logout.html">Logout</a>
                                <a class="btn btn-success btn-sm ml-3" href="/sampleapp/cart.html">
                                    <i class="fa fa-shopping-cart"></i> Cart
                                    <span class="badge badge-light"></span>
                                </a>
                                
                            </c:if>
                            <c:if test="${sessionScope.userId == 0 || sessionScope.userId == null}">
                                <a style="float: end;" class="btn btn-outline-success" type="submit" href="/sampleapp/user/register.html">Register</a>
                                <a style="float: end; margin-left: 5px" class="btn btn-outline-success" type="submit" href="/sampleapp/user/login.html">Login</a>
                            </c:if>
                        </form>
                        
                    </div>
                </div>
            </nav>

