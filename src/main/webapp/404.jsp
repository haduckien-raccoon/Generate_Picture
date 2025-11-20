<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>404 Not Found</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Arvo">

  <style type="text/css">
    body {
      background-color: #f0f4f8;
      font-family: 'Arvo', serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .page_404 {
      text-align: center;
    }

    .page_404 h1 {
      font-size: 150px;
      color: #007bff; /* Xanh dương */
      font-weight: bold;
      margin-bottom: 30px;
      text-shadow: 2px 2px 5px rgba(0,0,0,0.1);
    }

    .page_404 h3 {
      font-size: 36px;
      color: #007bff;
      margin-bottom: 15px;
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
      color: #fff !important;
      text-decoration: none;
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

  <div class="page_404">
    <h1>404</h1>
    <h3>Looks like you're lost</h3>
    <p>The page you are looking for is not available!</p>
    <a href="<%=request.getContextPath()%>" class="link_404">Go to Home</a>
  </div>

</body>
</html>
