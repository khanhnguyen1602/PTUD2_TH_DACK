<%-- 
    Document   : message
    Created on : Jun 27, 2021, 8:27:13 PM
    Author     : phuongkhanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns:th="http://www.thymeleaf.org">
<jsp:include page='header.jsp'></jsp:include>
<div style="color: green; margin-top: 40px; font-size: 25px" class="container text-center">
     ${msg}
</div>
<jsp:include page='footer.jsp'></jsp:include>
