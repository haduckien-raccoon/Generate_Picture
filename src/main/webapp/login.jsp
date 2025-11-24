<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign In - Picture Collage Generator</title>

    <link type="text/css" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css">
    
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
        overflow: hidden;
    }
    
    /* Animated background circles */
    body::before,
    body::after {
        content: '';
        position: absolute;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.1);
        animation: float 20s infinite ease-in-out;
    }
    
    body::before {
        width: 400px;
        height: 400px;
        top: -100px;
        left: -100px;
        animation-delay: 0s;
    }
    
    body::after {
        width: 300px;
        height: 300px;
        bottom: -100px;
        right: -100px;
        animation-delay: 5s;
    }
    
    @keyframes float {
        0%, 100% { transform: translate(0, 0) scale(1); }
        50% { transform: translate(50px, 50px) scale(1.1); }
    }
    
    .login-container {
        position: relative;
        z-index: 1;
        width: 100%;
        max-width: 450px;
        padding: 20px;
    }
    
    .glass-card {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        border-radius: 30px;
        padding: 50px 40px;
        box-shadow: 0 25px 45px rgba(0, 0, 0, 0.2);
        border: 1px solid rgba(255, 255, 255, 0.3);
        animation: slideUp 0.6s ease-out;
    }
    
    @keyframes slideUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    
    .logo-container {
        text-align: center;
        margin-bottom: 35px;
    }
    
    .logo-icon {
        width: 80px;
        height: 80px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border-radius: 20px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        font-size: 40px;
        color: white;
        margin-bottom: 20px;
        box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
    }
    
    h3 {
        font-size: 28px;
        font-weight: 700;
        color: #2d3748;
        margin-bottom: 10px;
    }
    
    .subtitle {
        color: #718096;
        font-size: 14px;
        margin-bottom: 0;
    }
    
    .form-group {
        margin-bottom: 25px;
        position: relative;
    }
    
    .form-group label {
        font-size: 14px;
        font-weight: 600;
        color: #4a5568;
        margin-bottom: 8px;
        display: block;
    }
    
    .form-control {
        width: 100%;
        padding: 15px 20px;
        border: 2px solid #e2e8f0;
        border-radius: 15px;
        font-size: 15px;
        transition: all 0.3s ease;
        background: #f7fafc;
    }
    
    .form-control:focus {
        outline: none;
        border-color: #667eea;
        background: white;
        box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
    }
    
    .btn-login {
        width: 100%;
        padding: 16px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border: none;
        border-radius: 15px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        margin-top: 10px;
        text-transform: uppercase;
        letter-spacing: 1px;
    }
    
    .btn-login:hover {
        transform: translateY(-2px);
        box-shadow: 0 15px 30px rgba(102, 126, 234, 0.4);
    }
    
    .btn-login:active {
        transform: translateY(0);
    }
    
    .input-icon {
        position: absolute;
        right: 20px;
        top: 43px;
        color: #a0aec0;
        font-size: 18px;
    }
    
    @media (max-width: 576px) {
        .glass-card {
            padding: 40px 25px;
            border-radius: 20px;
        }
        
        h3 {
            font-size: 24px;
        }
        
        .logo-icon {
            width: 70px;
            height: 70px;
            font-size: 35px;
        }
    }
</style>
</head>
<body>

	<%
	if (session.getAttribute("message") != null) {
	%>
	<script>
        window.addEventListener('DOMContentLoaded', function() {
            showAlert("<%=session.getAttribute("message")%>");
        });
        function showAlert(message) {
            const alertBox = document.createElement('div');
            alertBox.style.cssText = 'position: fixed; top: 20px; right: 20px; background: white; padding: 20px 25px; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.2); z-index: 9999; animation: slideIn 0.3s ease; max-width: 350px;';
            alertBox.innerHTML = '<div style="color: #e53e3e; font-weight: 600; margin-bottom: 5px;">⚠ Error</div><div style="color: #4a5568; font-size: 14px;">' + message + '</div>';
            document.body.appendChild(alertBox);
            setTimeout(() => {
                alertBox.style.animation = 'slideOut 0.3s ease';
                setTimeout(() => alertBox.remove(), 300);
            }, 4000);
        }
	</script>
	<%
	session.setAttribute("message", null);
	}
	%>
  
    <div class="login-container">
        <div class="glass-card">
            <div class="logo-container">
                <div class="logo-icon">🎨</div>
                <h3>Welcome Back</h3>
                <p class="subtitle">Sign in to create stunning picture collages</p>
            </div>
            
            <form method="post" action="login_process">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
                    <span class="input-icon">👤</span>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                    <span class="input-icon">🔒</span>
                </div>
                
                <button type="submit" class="btn-login">Sign In</button>
            </form>
        </div>
    </div>

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

    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/popper.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</body>
</html>
