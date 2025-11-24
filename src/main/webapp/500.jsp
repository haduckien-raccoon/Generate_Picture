<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>500 - Server Error</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
    font-family: 'Poppins', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    padding: 20px;
    position: relative;
    overflow: hidden;
}

body::before {
    content: '';
    position: absolute;
    width: 500px;
    height: 500px;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 50%;
    top: -200px;
    left: -200px;
    animation: float 15s infinite ease-in-out;
}

body::after {
    content: '';
    position: absolute;
    width: 400px;
    height: 400px;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 50%;
    bottom: -150px;
    right: -150px;
    animation: float 20s infinite ease-in-out reverse;
}

@keyframes float {
    0%, 100% { transform: translate(0, 0); }
    50% { transform: translate(30px, 30px); }
}

.error-container {
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    padding: 60px 50px;
    border-radius: 30px;
    box-shadow: 0 25px 50px rgba(0, 0, 0, 0.2);
    text-align: center;
    max-width: 600px;
    position: relative;
    z-index: 1;
    animation: slideUp 0.6s ease-out;
}

@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(50px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.error-icon {
    font-size: 120px;
    margin-bottom: 20px;
    animation: shake 3s infinite;
}

@keyframes shake {
    0%, 100% { transform: rotate(0deg); }
    25% { transform: rotate(-10deg); }
    75% { transform: rotate(10deg); }
}

.error-container h1 {
    font-size: 120px;
    font-weight: 700;
    background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 20px;
    line-height: 1;
}

.error-container h3 {
    font-size: 32px;
    color: #2d3748;
    font-weight: 600;
    margin-bottom: 15px;
}

.error-container p {
    font-size: 18px;
    color: #718096;
    margin-bottom: 40px;
    line-height: 1.6;
}

.btn-home {
    display: inline-block;
    padding: 16px 40px;
    background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
    color: white;
    text-decoration: none;
    border-radius: 50px;
    font-size: 16px;
    font-weight: 600;
    transition: all 0.3s;
    text-transform: uppercase;
    letter-spacing: 1px;
    box-shadow: 0 10px 30px rgba(245, 87, 108, 0.4);
}

.btn-home:hover {
    transform: translateY(-3px);
    box-shadow: 0 15px 40px rgba(245, 87, 108, 0.6);
    color: white;
    text-decoration: none;
}

.btn-home:active {
    transform: translateY(-1px);
}

@media (max-width: 768px) {
    .error-container {
        padding: 40px 30px;
    }

    .error-icon {
        font-size: 80px;
    }

    .error-container h1 {
        font-size: 80px;
    }

    .error-container h3 {
        font-size: 24px;
    }

    .error-container p {
        font-size: 16px;
    }
}
</style>
</head>
<body>

<div class="error-container">
    <div class="error-icon">⚠️</div>
    <h1>500</h1>
    <h3>Internal Server Error</h3>
    <p>Oops! Something went wrong on our end. Our team has been notified and we're working on fixing it. Please try again later.</p>
    <a href="<%=request.getContextPath()%>" class="btn-home">🏠 Back to Home</a>
</div>

</body>
</html>
