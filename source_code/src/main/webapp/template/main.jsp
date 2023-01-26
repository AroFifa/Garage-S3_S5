<%


    String header = "header.jsp";
    String footer = "footer.jsp";


    String content = (String) request.getAttribute("content");
    if (content != null)
        content = "content/".concat(content).concat(".jsp");
    else
        content = "content/new_emp.jsp";

%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>

    <meta charset="utf-8">
    <title>Garage</title>


    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic&amp;display=swap">
    <link rel="stylesheet" href="/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="/assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="/assets/css/FORM.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="/assets/css/MagicNav.css">
</head>
<body>



<div class="container-fluid">
    <div class="row row flex-nowrap">
        <div class="col col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">

            <jsp:include page="<%=header %>"/>
        </div>
        <jsp:include page="<%=content %>"/>

    </div>
</div>

<jsp:include page="<%=footer %>"/>
</body>
</html>
