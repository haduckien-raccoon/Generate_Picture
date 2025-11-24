<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Generate Picture - Create Stunning Collages</title>

<!-- Fonts & Icons -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/bootstrap.min.css">

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        font-family: 'Poppins', sans-serif;
        min-height: 100vh;
        padding: 20px;
    }

    .header {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        padding: 15px 30px;
        box-shadow: 0 2px 20px rgba(0, 0, 0, 0.08);
        z-index: 1000;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .logo {
        display: flex;
        align-items: center;
        gap: 12px;
        font-size: 24px;
        font-weight: 700;
        color: #667eea;
    }

    .logo-icon {
        width: 45px;
        height: 45px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 24px;
    }

    .profile-avatar {
        display: block;
        border-radius: 50%;
        border: 3px solid #667eea;
        width: 50px;
        height: 50px;
        object-fit: cover;
        cursor: pointer;
        transition: all 0.3s;
        box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
    }

    .profile-avatar:hover {
        transform: scale(1.1);
        box-shadow: 0 6px 20px rgba(102, 126, 234, 0.5);
    }

    .container {
        margin-top: 100px;
        margin-bottom: 50px;
        max-width: 1000px;
    }

    .main-card {
        background: white;
        border-radius: 30px;
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
        padding: 50px 40px;
        transition: all 0.3s;
        animation: fadeInUp 0.6s ease-out;
    }

    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    h3.heading {
        font-weight: 700;
        color: #2d3748;
        margin-bottom: 15px;
        text-align: center;
        font-size: 32px;
    }

    .subheading {
        text-align: center;
        color: #718096;
        font-size: 16px;
        margin-bottom: 40px;
    }

    .search {
        display: flex;
        width: 100%;
        max-width: 600px;
        margin: 0 auto 40px auto;
        border-radius: 50px;
        overflow: hidden;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        border: 2px solid #e2e8f0;
        transition: all 0.3s;
    }

    .search:focus-within {
        border-color: #667eea;
        box-shadow: 0 10px 40px rgba(102, 126, 234, 0.2);
    }

    .search-input {
        flex: 1;
        padding: 18px 25px;
        border: none;
        outline: none;
        font-size: 16px;
        background: transparent;
    }

    .btn-primary.search-icon {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border: none;
        color: #fff;
        font-weight: 600;
        padding: 18px 35px;
        cursor: pointer;
        transition: all 0.3s;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-size: 14px;
    }

    .btn-primary.search-icon:hover {
        transform: scale(1.05);
        box-shadow: 0 10px 30px rgba(102, 126, 234, 0.4);
    }

    .section-divider {
        margin: 40px 0 30px;
        text-align: center;
        position: relative;
    }

    .section-divider::before {
        content: '';
        position: absolute;
        left: 0;
        top: 50%;
        width: 100%;
        height: 1px;
        background: linear-gradient(to right, transparent, #e2e8f0, transparent);
    }

    .section-divider span {
        background: white;
        padding: 0 20px;
        color: #a0aec0;
        font-weight: 600;
        position: relative;
        z-index: 1;
        font-size: 14px;
        text-transform: uppercase;
        letter-spacing: 2px;
    }

    .radio-group {
        display: flex;
        justify-content: center;
        gap: 25px;
        margin-bottom: 40px;
        flex-wrap: wrap;
    }

    .radio-group .card-block {
        background: linear-gradient(145deg, #f7fafc, #edf2f7);
        padding: 25px;
        border-radius: 20px;
        cursor: pointer;
        transition: all 0.3s;
        text-align: center;
        width: 140px;
        border: 3px solid transparent;
    }

    .radio-group .card-block:hover {
        transform: translateY(-5px);
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
    }

    .radio-group .card-block.selected {
        border-color: #667eea;
        background: linear-gradient(145deg, #f0f4ff, #e6efff);
        box-shadow: 0 15px 35px rgba(102, 126, 234, 0.2);
    }

    .radio-group .card-block img {
        width: 90px;
        height: 90px;
        border-radius: 15px;
        margin-bottom: 15px;
        object-fit: cover;
    }

    .radio-group .card-block p {
        margin: 0;
        font-weight: 600;
        color: #4a5568;
        font-size: 14px;
    }

    .form-section {
        background: #f7fafc;
        padding: 30px;
        border-radius: 20px;
        margin-bottom: 25px;
    }

    .form-section h5 {
        font-weight: 600;
        color: #2d3748;
        margin-bottom: 20px;
        font-size: 18px;
    }

    label {
        font-weight: 600;
        color: #4a5568;
        margin-bottom: 8px;
        display: block;
        font-size: 14px;
    }

    .form-control {
        border-radius: 12px;
        border: 2px solid #e2e8f0;
        padding: 5px 18px;
        transition: all 0.3s;
        font-size: 15px;
        background: white;
    }

    .form-control:focus {
        outline: none;
        border-color: #667eea;
        box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
    }

    .form-text {
        font-size: 13px;
        color: #a0aec0;
        margin-top: 5px;
    }

    .range-container {
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .range-container input[type="range"] {
        flex: 1;
    }

    .range-container span {
        background: #667eea;
        color: white;
        padding: 8px 16px;
        border-radius: 10px;
        font-weight: 600;
        min-width: 50px;
        text-align: center;
    }

    .form-check {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .form-check-input {
        width: 20px;
        height: 20px;
        margin-right: 10px;
        cursor: pointer;
    }

    .form-check-label {
        margin: 0;
        margin-left: 10px;
        margin-top: 5px;
        cursor: pointer;
    }

    .artistic-mode-card {
        background: linear-gradient(135deg, #667eea15 0%, #764ba215 100%);
        border: 2px solid #667eea30;
        border-radius: 20px;
        padding: 30px;
        margin-top: 30px;
    }

    .artistic-mode-card h5 {
        color: #667eea;
        font-weight: 700;
        margin-bottom: 20px;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    @media(max-width: 768px) {
        .header {
            padding: 12px 20px;
        }
        
        .logo {
            font-size: 18px;
        }
        
        .logo-icon {
            width: 35px;
            height: 35px;
            font-size: 18px;
        }
        
        .main-card {
            padding: 30px 20px;
        }
        
        h3.heading {
            font-size: 26px;
        }
        
        .radio-group .card-block {
            width: 120px;
            padding: 20px;
        }
        
        .search {
            flex-direction: column;
        }
        
        .btn-primary.search-icon {
            border-radius: 0 0 50px 50px;
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
        showToast("<%=session.getAttribute("message")%>");
    });
    function showToast(message) {
        const toast = document.createElement('div');
        toast.style.cssText = 'position: fixed; top: 20px; right: 20px; background: white; padding: 20px 25px; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.2); z-index: 9999; animation: slideIn 0.3s ease; max-width: 350px; border-left: 4px solid #667eea;';
        toast.innerHTML = '<div style="color: #667eea; font-weight: 600; margin-bottom: 5px;">ℹ️ Notice</div><div style="color: #4a5568; font-size: 14px;">' + message + '</div>';
        document.body.appendChild(toast);
        setTimeout(() => {
            toast.style.animation = 'slideOut 0.3s ease';
            setTimeout(() => toast.remove(), 300);
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
    session.setAttribute("message", null);
%>

<div class="header">
    <div class="logo">
        <div class="logo-icon">🎨</div>
        <span>Picture Generator</span>
    </div>
    <a href="<%=request.getContextPath() + "/profile"%>">
        <img src="./images/user_profile.jpg" class="profile-avatar" alt="Profile">
    </a>
</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <form id="formRetangle" action="<%=request.getContextPath() + "/pictures/generation"%>">
                <div class="main-card">
                    <h3 class="heading">✨ Generate Artistic Picture Collages</h3>
                    <p class="subheading">Transform your ideas into beautiful visual compositions</p>
                    
                    <div class="search">
                        <input type="text" class="search-input" required list="suggestions" 
                            placeholder="🔍 Enter your topic... (e.g. Nature, Technology, Art)" name="topic">
                        <button type="submit" class="btn btn-primary search-icon">Generate</button>
                    </div>
                    <datalist id="suggestions">
                        <option value="Nature"></option>
                        <option value="Abstract"></option>
                        <option value="Cityscape"></option>
                        <option value="Sunset"></option>
                        <option value="Wildlife"></option>
                        <option value="Food"></option>
                        <option value="Architecture"></option>
                        <option value="Portrait"></option>
                        <option value="Technology"></option>
                        <option value="Art"></option>
                    </datalist>

                    <div class="section-divider">
                        <span>Choose Layout</span>
                    </div>

                    <div class="radio-group">
                        <div class="card-block radio selected" onclick="onTextHeight()">
                            <img src="./images/retangle_example.PNG" alt="Rectangle">
                            <input name="shape" type="radio" value='0' checked hidden required>
                            <p>📐 Rectangle</p>
                        </div>
                        <div class="card-block radio" onclick="onTextRows()">
                            <img src="./images/hexagon_example.PNG" alt="Hexagon">
                            <input name="shape" type="radio" value='1' hidden required>
                            <p>⬡ Hexagon</p>
                        </div>
                    </div>

                    <div class="section-divider">
                        <span>Configuration</span>
                    </div>

                    <div class="form-section">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="myRange">🎲 Image Variety</label>
                                <div class="range-container">
                                    <input type="range" min="1" max="100" value="50" name="variety" class="form-control-range" id="myRange">
                                    <span id="demo">50</span>
                                </div>
                                <small class="form-text">Number of different images to fetch</small>
                            </div>
                            <div class="col-md-6">
                                <label>🖼️ Small Images Count</label>
                                <input name="smallImages" type="number" min="1" max="50" value="20" required class="form-control" placeholder="Enter count">
                                <small class="form-text">Number of small images per large image</small>
                            </div>
                            <div class="col-md-6">
                                <label>🖼️ Large Images Count</label>
                                <input name="largeImages" type="number" min="1" max="5" value="1" required class="form-control" placeholder="Enter count">
                                <small class="form-text">Number of large accent images</small>
                            </div>
                            <div class="col-md-6">
                                <label>📏 Canvas Width (px)</label>
                                <input name="width" type="number" min="50" value="2000" step="10" required class="form-control" placeholder="e.g. 2000">
                            </div>
                            <div class="col-md-6">
                                <label id="height">📏 Canvas Height (px)</label>
                                <input name="height" type="number" value="1000" required class="form-control" placeholder="e.g. 1000">
                            </div>
                        </div>
                    </div>
                    <div class="form-section">
                        <h5>🎨 Border Customization</h5>
                        <div class="row">
                            <div class="col-md-6 d-flex align-items-center">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="chkFrame">
                                    <label class="form-check-label" for="chkFrame">
                                        Enable Image Border
                                    </label>
                                </div>
                            </div>
                        
                            <div class="col-md-6">
                                <label for="colorPicker">🎨 Border Color</label>
                                <input type="color" id="colorPicker" name="color" class="form-control" value="#000000" disabled style="height: 45px; padding: 3px;">
                                <small class="form-text">Enable border checkbox to choose color</small>
                            </div>
                        </div>
                    </div>

                    <div class="artistic-mode-card">
                        <h5>✨ Artistic Mode (Optional)</h5>
                        <div class="row">
                            <div class="col-md-5">
                                <label>🎭 Style Selection</label>
                                <select name="artStyle" class="form-control" id="artStyle">
                                    <option value="0">None (Default)</option>
                                    <option value="1">Text Shape Layout</option>
                                    <option value="2">Polaroid with Signature</option>
                                </select>
                            </div>
                            <div class="col-md-7">
                                <label>💬 Custom Text / Caption</label>
                                <input type="text" name="artText" id="artText" class="form-control" maxlength="15" placeholder="e.g. LOVE, FAMILY, TRAVEL..." disabled>
                                <small class="form-text">Text for shape layout or signature (max 15 chars)</small>
                            </div>
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>

<script src="./js/jquery-3.3.1.min.js"></script>
<script src="./js/popper.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/main.js"></script>

<script>
$('.radio-group .radio').click(function(){
    $('.radio').removeClass('selected');
    $(this).addClass('selected');
    $(this).find('input[type="radio"]').prop('checked', true);
});

function onTextHeight() {
    $('#height').html("Height (px)");
    $('input[name="height"]').attr({ 'max': 5000, 'min': 100, 'value': 2000, 'step': 10 });
}

function onTextRows() {
    $('#height').html("Rows");
    $('input[name="height"]').attr({ 'max': 20, 'min': 1, 'value': 5, 'step': 1 });
}

var slider = document.getElementById("myRange");
var output = document.getElementById("demo");
output.innerHTML = slider.value;
slider.oninput = function() { output.innerHTML = this.value; }
$('#chkFrame').change(function() {
        if(this.checked) {
            // Nếu check: Cho phép chọn màu
            $('#colorPicker').prop('disabled', false);
        } else {
            // Nếu bỏ check: Disable ô màu (Backend sẽ nhận null)
            $('#colorPicker').prop('disabled', true);
        }
    });
    $('#artStyle').change(function() {
        var style = $(this).val();
        if(style == "0") {
            $('#artText').prop('disabled', true);
            $('#artText').val(''); // Xóa text nếu chọn None
        } else {
            $('#artText').prop('disabled', false);
        }
    });
</script>
</body>
</html>
