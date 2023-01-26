<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%

    String navpage = (String) request.getAttribute("nav");
    String titlepage = (String) request.getAttribute("content_title");
    if (navpage != null)
        navpage = "nav/".concat(navpage).concat(".jsp");
    else
        navpage = "nav/employe.jsp";
%>
<div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
    <a href="hello-servlet" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none"><span
            class="fs-5 d-none d-sm-inline"><%=titlepage%></span></a>

    <jsp:include page="<%=navpage %>"/>
</div>