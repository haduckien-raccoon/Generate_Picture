<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Picture Collage Generator</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .loader {
        text-align: center;
        color: white;
    }
    .spinner {
        width: 60px;
        height: 60px;
        border: 4px solid rgba(255,255,255,0.3);
        border-top: 4px solid white;
        border-radius: 50%;
        animation: spin 1s linear infinite;
        margin: 0 auto 20px;
    }
    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }
    h2 {
        font-size: 24px;
        font-weight: 300;
        letter-spacing: 2px;
    }
</style>
</head>
<body>
    <div class="loader">
        <div class="spinner"></div>
        <h2>LOADING...</h2>
    </div>
	<%
	if (session.getAttribute("user") != null){
		response.sendRedirect("home");
	}else{
		response.sendRedirect("login");
	}
	%>
</body>
</html>