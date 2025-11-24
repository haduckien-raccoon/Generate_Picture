<%@page import="model.beans.GeneratedPicture"%>
<%@page import="model.beans.QueryTopic"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.beans.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile - Picture Generator</title>
<link type="text/css" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css">

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
    }

    .wrapper {
        display: flex;
        min-height: 100vh;
    }

    #sidebar {
        background: linear-gradient(180deg, #667eea 0%, #764ba2 100%);
        color: #fff;
        min-width: 280px;
        box-shadow: 4px 0 20px rgba(0, 0, 0, 0.1);
        position: relative;
        z-index: 100;
    }

    #sidebar a {
        color: #fff;
        text-decoration: none;
        transition: all 0.3s;
    }

    #sidebar a:hover {
        color: #ffd700;
        transform: translateX(5px);
    }

    #sidebar .logo {
        border-radius: 50%;
        width: 100px;
        height: 100px;
        background-size: cover;
        margin: 0 auto 15px auto;
        border: 4px solid rgba(255, 255, 255, 0.3);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    }

    #sidebar h5 {
        font-weight: 600;
        margin-bottom: 5px;
        font-size: 20px;
    }

    #sidebar .btn-outline-light {
        font-size: 14px;
        padding: 8px 15px;
        border-radius: 20px;
        border: 2px solid rgba(255, 255, 255, 0.5);
        background: rgba(255, 255, 255, 0.1);
        transition: all 0.3s;
    }

    #sidebar .btn-outline-light:hover {
        background: rgba(255, 255, 255, 0.2);
        border-color: white;
    }

    #sidebar ul li {
        margin: 10px 0;
    }

    #sidebar ul li a {
        padding: 12px 20px;
        display: block;
        border-radius: 10px;
        transition: all 0.3s;
        font-weight: 500;
    }

    #sidebar ul li a:hover {
        background: rgba(255, 255, 255, 0.15);
        transform: translateX(5px);
    }

    #content {
        background: transparent;
        min-height: 100vh;
        padding: 40px;
        flex: 1;
    }

    .section_heading h3 {
        color: #2d3748;
        font-weight: 700;
        font-size: 32px;
    }

    .line {
        height: 3px;
        background: linear-gradient(90deg, #667eea, #764ba2);
        width: 80px;
        margin: 15px auto;
        border-radius: 10px;
    }

    .single-timeline-area {
        background: white;
        border-radius: 25px;
        padding: 30px;
        margin-bottom: 30px;
        box-shadow: 0 15px 40px rgba(0,0,0,0.08);
        display: flex;
        flex-direction: column;
        width: 100%;
        transition: all 0.3s;
        border: 1px solid rgba(102, 126, 234, 0.1);
    }

    .single-timeline-area:hover {
        transform: translateY(-5px);
        box-shadow: 0 20px 50px rgba(0,0,0,0.12);
    }

    .timeline-date {
        margin-bottom: 20px;
        padding-bottom: 20px;
        border-bottom: 2px solid #f7fafc;
    }

    .timeline-date p {
        margin: 5px 0;
        font-size: 14px;
        color: #718096;
    }

    .timeline-date .text-info {
        font-size: 20px;
        font-weight: 700;
        color: #667eea !important;
        margin-bottom: 10px !important;
    }

    .badge {
        padding: 6px 12px;
        border-radius: 8px;
        font-weight: 600;
        font-size: 12px;
    }

    .badge-secondary {
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: white;
    }

    .timeline-text h6 {
        color: #2d3748;
        margin-bottom: 8px;
        word-wrap: break-word;
        font-weight: 600;
        font-size: 15px;
    }

    .progress-container {
        margin-top: 12px;
        width: 100%;
        background-color: #e2e8f0;
        border-radius: 20px;
        height: 12px;
        overflow: hidden;
        box-shadow: inset 0 2px 4px rgba(0,0,0,0.1);
    }

    .progress-bar {
        height: 100%;
        width: 0%;
        background: linear-gradient(90deg, #667eea, #764ba2);
        transition: width 0.5s ease-in-out;
        border-radius: 20px;
    }

    .text-warning {
        color: #f6ad55 !important;
        font-weight: 600;
    }

    .text-success {
        color: #48bb78 !important;
        font-weight: 600;
    }

    .text-danger {
        color: #f56565 !important;
        font-weight: 600;
    }

    .text-warning strong, .text-success strong, .text-danger strong {
        display: flex;
        align-items: center;
        gap: 8px;
        margin-top: 8px;
        font-size: 14px;
    }

    .spinner-border {
        width: 20px;
        height: 20px;
        border-width: 2px;
    }

    .single-timeline-content {
        background: #f7fafc;
        border-radius: 15px;
        padding: 20px;
        transition: all 0.3s;
        border: 2px solid #e2e8f0;
        height: 100%;
    }

    .single-timeline-content:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        border-color: #667eea;
    }

    .timeline-icon {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 40px;
        height: 40px;
        background: linear-gradient(135deg, #667eea, #764ba2);
        border-radius: 10px;
        color: white;
        font-size: 18px;
        transition: all 0.3s;
    }

    .timeline-icon:hover {
        transform: scale(1.1);
        box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
    }

    .timeline-row {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 25px;
    }

    .timeline-item {
        display: flex;
        flex-direction: column;
    }

    @media (max-width: 992px) {
        #sidebar {
            min-width: 240px;
        }
        
        #content {
            padding: 25px;
        }
        
        .timeline-row {
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }
    }

    @media (max-width: 768px) {
        .wrapper {
            flex-direction: column;
        }
        
        #sidebar {
            min-width: 100%;
        }
        
        #content {
            padding: 20px;
        }
        
        .timeline-row {
            grid-template-columns: 1fr;
        }
        
        .section_heading h3 {
            font-size: 26px;
        }
    }

</style>
</head>
<body class="js-fullheight">

<%
if (request.getAttribute("message") != null) {
%>
<script>
    window.addEventListener('DOMContentLoaded', function() {
        showNotification('<%=(request.getAttribute("message"))%>');
    });
    function showNotification(message) {
        const notification = document.createElement('div');
        notification.style.cssText = 'position: fixed; top: 20px; right: 20px; background: white; padding: 20px 25px; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.2); z-index: 9999; animation: slideIn 0.3s ease; max-width: 350px; border-left: 4px solid #667eea;';
        notification.innerHTML = '<div style="color: #667eea; font-weight: 600; margin-bottom: 5px;">📢 Notification</div><div style="color: #4a5568; font-size: 14px;">' + message + '</div>';
        document.body.appendChild(notification);
        setTimeout(() => {
            notification.style.animation = 'slideOut 0.3s ease';
            setTimeout(() => notification.remove(), 300);
        }, 4000);
    }
</script>
<style>
    @keyframes slideIn {
        from { transform: translateX(400px); opacity: 0; }
        to { transform: translateX(0); opacity: 1; }
    }
    @keyframes slideOut {
        from { transform: translateX(0); opacity: 1; }
        to { transform: translateX(400px); opacity: 0; }
    }
</style>
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
                <div class="row justify-content-center mb-5">
                    <div class="col-12 text-center">
                        <h3 class="section_heading">📚 Generation History</h3>
                        <div class="line"></div>
                        <p style="color: #718096; font-size: 16px; margin-top: 10px;">Track your picture generation projects and downloads</p>
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
