<%@page import="model.beans.GeneratedPicture"%>
<%@page import="model.beans.QueryTopic"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.beans.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="./fonts/icomoon/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="./css/owl.carousel.min.css">
<link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css">

<style>
    body {
        background: #d0e7ff;
        font-family: 'Roboto', sans-serif;
        margin: 0;
        padding: 0;
    }

    #sidebar {
        background: #4e73d1;
        color: #fff;
        min-width: 250px;
    }

    #sidebar a {
        color: #fff;
        text-decoration: none;
    }

    #sidebar .logo {
        border-radius: 50%;
        width: 80px;
        height: 80px;
        background-size: cover;
        margin: 0 auto 10px auto;
    }

    #content {
        background: #e6f0ff;
        min-height: 100vh;
        padding: 30px;
        flex: 1;
    }

    .section_heading h3 {
        color: #2b3e80;
    }

    .single-timeline-area {
        background: #ffffff;
        border-radius: 15px;
        padding: 20px;
        margin-bottom: 20px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        display: flex;
        flex-direction: column;
        width: 100%;
    }

    .timeline-text h6 {
        color: #333;
        margin-bottom: 5px;
        word-wrap: break-word;
    }

    .progress-container {
        margin-top: 10px;
        width: 100%;
        background-color: #cce0ff;
        border-radius: 10px;
        height: 10px;
        overflow: hidden;
    }

    .progress-bar {
        height: 100%;
        width: 0%;
        background: linear-gradient(90deg, #4e73d1, #6770f0);
        transition: width 0.5s ease-in-out;
    }

    .text-warning strong, .text-success strong, .text-danger strong {
        display: block;
        margin-top: 5px;
    }

    .single-timeline-content:hover {
        transform: translateY(-2px);
        transition: all 0.3s ease-in-out;
    }

    .timeline-row {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
    }

    .timeline-item {
        flex: 1 1 calc(33.333% - 20px);
        min-width: 250px;
        display: flex;
        flex-direction: column;
    }

    @media (max-width: 768px) {
        .timeline-item {
            flex: 1 1 100%;
        }
    }

</style>
</head>
<body class="js-fullheight">

<%
if (request.getAttribute("message") != null) {
%>
<script>alert('<%=(request.getAttribute("message"))%>')</script>
<%
}
%>

<%
User user = (User) session.getAttribute("user");
ArrayList<QueryTopic> topics = (ArrayList<QueryTopic>) request.getAttribute("queryTopics");
SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
%>

<div class="wrapper d-flex align-items-stretch">
    <nav id="sidebar">
        <div class="p-4 pt-5 text-center">
            <a href="#" class="img logo rounded-circle mb-3" style="background-image: url(./images/default-profile-icon-24.jpg);"></a>
            <h5><%=user.getFullname()%></h5>
            <span class="btn btn-outline-light" style="width: 100%; margin-bottom:10px;"><%=user.getEmail()%></span>
            <ul class="list-unstyled components my-3">
                <li><a href="<%=request.getContextPath()%>">Home</a></li>
                <li><a href="<%=request.getContextPath() + "/logout"%>">Logout</a></li>
            </ul>
        </div>
    </nav>

    <div id="content" class="p-4">
        

        <section class="timeline_area section_padding_130">
            <div class="container-fluid">
                <div class="row justify-content-center mb-4">
                    <div class="col-12 col-sm-8 col-lg-6 text-center">
                        <h3 class="section_heading">Our History</h3>
                        <div class="line" style="height:2px; background:#4e73d1; width:60px; margin:10px auto;"></div>
                    </div>
                </div>

                <%
                for (QueryTopic topic : topics) {
                %>
                <div class="single-timeline-area mb-4">
                    <div class="timeline-date mb-3">
                        <p class="text-info mb-1"><%=topic.getQuery_topic()%></p>
                        <p><span class="badge badge-secondary">Shape</span> <%=topic.getShape() == 0 ? "Retangle" : "Hexagon"%></p>
                        <p><%=dateFormat.format(topic.getTimestamp())%></p>
                        <%
                        if (topic.getStatus() == 0) {
                        %>
                        <div class="d-flex align-items-center text-warning">
                            <strong>Processing...</strong>
                            <div class="spinner-border ml-auto" role="status" aria-hidden="true"></div>
                        </div>
                        <%
                        } else if (topic.getStatus() == 2) {
                        %>
                        <strong class="text-success"><i class="fa fa-check"></i> Success</strong>
                        <%
                        } else if (topic.getStatus() == 1) {
                        %>
                        <strong class="text-danger"> Resource Error</strong>
                        <%
                        }
                        %>
                    </div>

                    <div class="timeline-row">
                        <%
                        for (GeneratedPicture picture : topic.getGeneratedPictures()) {
                        %>
                        <div class="timeline-item">
                            <div class="single-timeline-content d-flex flex-column p-3 bg-white rounded shadow-sm">
                                <a href="<%=request.getContextPath() + "/picture/download?file=" + picture.getName()%>" class="timeline-icon mb-2">
                                    <i class="fa fa-paperclip" aria-hidden="true"></i>
                                </a>
                                <div class="timeline-text">
                                    <a href="<%=request.getContextPath() + "/picture/download?file=" + picture.getName()%>">
                                        <h6 class="text-line"><%=picture.getName()%></h6>
                                    </a>
                                    <p><%=dateFormat.format(picture.getTimestamp())%></p>
                                    <%
                                    if (picture.getStatus() == 0) {
                                    %>
                                    <div class="text-warning">
                                        <strong>Processing...</strong>
                                        <div class="progress-container">
                                            <div class="progress-bar" id="progress-<%=picture.getUid()%>"></div>
                                        </div>
                                    </div>
                                    <%
                                    } else if (picture.getStatus() == 2) {
                                    %>
                                    <strong class="text-success"><i class="fa fa-check"></i> Success</strong>
                                    <%
                                    } else if (picture.getStatus() == 1) {
                                    %>
                                    <strong class="text-danger">Error</strong>
                                    <%
                                    }
                                    %>
                                </div>
                            </div>
                        </div>
                        <%
                        }
                        %>
                    </div>
                </div>
                <%
                }
                %>
            </div>
        </section>

    </div>
</div>

<script src="./js/jquery-3.3.1.min.js"></script>
<script src="./js/popper.min.js"></script>
<script src="./js/bootstrap.min.js"></script>

<script>
    var fullHeight = function() {
        $('.js-fullheight').css('height', $(window).height());
        $(window).resize(function() {
            $('.js-fullheight').css('height', $(window).height());
        });
    };
    fullHeight();

    $('#sidebarCollapse').on('click', function() {
        $('#sidebar').toggleClass('active');
    });

    function simulateProgress(pictureId) {
        var elem = document.getElementById("progress-" + pictureId);
        if (!elem) return;
        var width = 0;
        var interval = setInterval(function() {
            if (width >= 100) {
                clearInterval(interval);
                elem.style.width = "100%";
            } else {
                width += 5;
                elem.style.width = width + "%";
            }
        }, 500);
    }

    <% for (QueryTopic topic : topics) {
           for (GeneratedPicture picture : topic.getGeneratedPictures()) {
               if (picture.getStatus() == 0) {
    %>
    simulateProgress(<%=picture.getUid()%>);
    <%        }
           }
       }
    %>
</script>
</body>
</html>
