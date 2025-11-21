<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generate Picture</title>

<!-- Fonts & Icons -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./fonts/icomoon/style.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">

<style>
    body {
        background: #d0e7ff; /* Xanh dương nhạt tổng thể */
        font-family: 'Roboto', sans-serif;
        margin: 0;
        padding: 0;
    }

    .container {
        margin-top: 80px;
        margin-bottom: 50px;
    }

    .profile-avatar {
        border-radius: 50%;
        border: 3px solid #4e4ed1;
        width: 60px;
        position: fixed;
        top: 20px;
        left: 20px;
        z-index: 1000;
        transition: transform 0.2s;
    }

    .profile-avatar:hover {
        transform: scale(1.1);
    }

    .card {
        border-radius: 20px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        padding: 40px 30px;
        background: #ffffff; /* Card trắng nổi bật trên nền xanh */
        transition: transform 0.3s;
    }

    .card:hover {
        transform: translateY(-5px);
    }

    h3.heading {
        font-weight: 500;
        color: #333;
        margin-bottom: 30px;
    }

    .search {
        display: flex;
        width: 100%;
        max-width: 500px;
        margin: 0 auto 40px auto;
        border-radius: 30px;
        overflow: hidden;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }

    .search-input {
        flex: 1;
        padding: 12px 20px;
        border: none;
        outline: none;
        font-size: 16px;
    }

    .btn-primary.search-icon {
        background: linear-gradient(90deg, #4e4ed1, #6767f0);
        border: none;
        color: #fff;
        font-weight: 500;
        padding: 0 25px;
        border-radius: 0 30px 30px 0;
        transition: background 0.3s;
    }

    .btn-primary.search-icon:hover {
        background: linear-gradient(90deg, #6767f0, #4e4ed1);
    }

    .radio-group {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin-bottom: 30px;
    }

    .radio-group .card-block {
        background: #f0f0f5;
        padding: 20px;
        border-radius: 15px;
        cursor: pointer;
        transition: all 0.3s;
        text-align: center;
        width: 120px;
    }

    .radio-group .card-block.selected {
        border: 3px solid #4e4ed1;
        box-shadow: 0 5px 15px rgba(0,0,0,0.15);
    }

    .radio-group .card-block img {
        width: 80px;
        height: 80px;
        border-radius: 10px;
        margin-bottom: 10px;
    }

    label {
        font-weight: 500;
        color: #555;
    }

    .form-control, .form-control-range {
        border-radius: 10px;
        border: 1px solid #ddd;
        padding: 10px;
        box-shadow: inset 0 1px 3px rgba(0,0,0,0.05);
    }

    .form-text {
        font-size: 12px;
        color: #888;
    }

    .range-container {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    @media(max-width: 768px) {
        .radio-group {
            flex-wrap: wrap;
        }
        .radio-group .card-block {
            width: 100px;
        }
        .search {
            flex-direction: column;
        }
        .btn-primary.search-icon {
            border-radius: 0 0 30px 30px;
            margin-top: 5px;
        }
    }
</style>

</head>
<body>

<%
    if (session.getAttribute("message") != null) {
%>
<script>alert("<%=session.getAttribute("message")%>")</script>
<%
    }
    session.setAttribute("message", null);
%>

<a href="<%=request.getContextPath() + "/profile"%>">
    <img src="./images/user_profile.jpg" class="profile-avatar" alt="Profile">
</a>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <form id="formRetangle" action="<%=request.getContextPath() + "/pictures/generation"%>">
                <div class="card">
                    <h3 class="heading text-center">Generate Images by Topic</h3>
                    
                    <div class="search">
                        <input type="text" class="search-input" required list="suggestions" 
                            placeholder="Enter topic e.g. Family, Event, Sports..." name="topic">
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
                        <!-- Add more options here -->
                    </datalist>

                    <div class="radio-group">
                        <div class="card-block radio selected" onclick="onTextHeight()">
                            <img src="./images/retangle_example.PNG" alt="Rectangle">
                            <input name="shape" type="radio" value='0' checked hidden required>
                            <p>Rectangle</p>
                        </div>
                        <div class="card-block radio" onclick="onTextRows()">
                            <img src="./images/hexagon_example.PNG" alt="Hexagon">
                            <input name="shape" type="radio" value='1' hidden required>
                            <p>Hexagon</p>
                        </div>
                    </div>

                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="myRange">Variety</label>
                            <div class="range-container">
                                <input type="range" min="1" max="100" value="50" name="variety" class="form-control-range" id="myRange">
                                <span id="demo">50</span>
                            </div>
                            <small class="form-text">Number of images to generate.</small>
                        </div>
                        <div class="col-md-6">
                            <label>Small Images</label>
                            <input name="smallImages" type="number" min="1" max="50" value="20" required class="form-control">
                            <small class="form-text">Small images per large image.</small>
                        </div>
                        <div class="col-md-6">
                            <label>Large Images</label>
                            <input name="largeImages" type="number" min="1" max="5" value="1" required class="form-control">
                            <small class="form-text">Number of large images.</small>
                        </div>
                        <div class="col-md-6">
                            <label>Width (px)</label>
                            <input name="width" type="number" min="50" value="2000" step="10" required class="form-control">
                        </div>
                        <div class="col-md-6">
                            <label id="height">Height (px)</label>
                            <input name="height" type="number" value="1000" required class="form-control">
                        </div>
                    </div>
                    <div class="form-group row col-md-12 mt-3">
                        <div class="col-md-6 d-flex align-items-center">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="chkFrame">
                                <label class="form-check-label font-weight-bold" for="chkFrame">
                                    Create Border for Image
                                </label>
                            </div>
                        </div>
                    
                        <div class="col-md-6">
                            <label for="colorPicker">Choose color for border:</label>
                            <input type="color" id="colorPicker" name="color" class="form-control" value="#000000" disabled style="height: 40px; padding: 3px;">
                            <small class="form-text text-muted">Click checkbox to choose color</small>
                        </div>
                    </div>
                    <div class="card mt-3 p-3" style="background: #f8f9fa; border: 1px solid #eee;">
                        <h5 class="text-primary">Artistic Mode (Optional)</h5>
                        <div class="row">
                            <div class="col-md-5">
                                <label class="font-weight-bold">Choose Style:</label>
                                <select name="artStyle" class="form-control" id="artStyle">
                                    <option value="0">None (Default)</option>
                                    <option value="1">Text Shape (Arrange images as text)</option>
                                    <option value="2">Polaroid Frame + Signature</option>
                                </select>
                            </div>
                            <div class="col-md-7">
                                <label class="font-weight-bold">Caption / Text:</label>
                                <input type="text" name="artText" id="artText" class="form-control" maxlength="15" placeholder="e.g. LOVE, TRAVEL..." disabled>
                                <small class="text-muted">Text used for shape or signature.</small>
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
