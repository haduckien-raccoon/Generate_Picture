<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>404 Not Found</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Arvo&display=swap" rel="stylesheet">

<style>
body {
    background-color: #f0f4f8;
    font-family: 'Arvo', serif;
    margin: 0;
    padding: 0;
}

.page_404 {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    min-height: 100vh;
    text-align: center;
}

.page_404 h1 {
    font-size: 150px;
    color: #007bff;
    font-weight: bold;
    text-shadow: 2px 2px 5px rgba(0,0,0,0.2);
    margin: 0;
}

.page_404 h3 {
    font-size: 36px;
    color: #007bff;
    margin: 20px 0 10px;
}

.page_404 p {
    font-size: 18px;
    color: #555;
    margin-bottom: 30px;
}

.link_404 {
    color: #fff !important;
    padding: 12px 30px;
    background: #007bff;
    border-radius: 25px;
    text-decoration: none;
    font-size: 16px;
    transition: background 0.3s ease;
}

.link_404:hover {
    background: #0056b3;
    text-decoration: none;
    color: #fff !important;
}

@media (max-width: 768px) {
    .page_404 h1 {
        font-size: 100px;
    }
    .page_404 h3 {
        font-size: 28px;
    }
}
</style>
</head>
<body>
<section class="page_404">
    <h1>404</h1>
    <h3>Oops! Page not found</h3>
    <p>The page you are looking for might be removed or temporarily unavailable.</p>
    <a href="<%=request.getContextPath()%>" class="link_404">Go to Home</a>
</section>
</body>
</html>
