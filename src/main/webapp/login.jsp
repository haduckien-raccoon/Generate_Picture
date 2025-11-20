<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>

    <link type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link type="text/css" rel="stylesheet" href="./fonts/icomoon/style.css">

    <link type="text/css" rel="stylesheet" href="./css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css">
    
    <!-- Style -->
    <link href="./css/login-style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%
	if (session.getAttribute("message") != null) {
	%>
	<script>alert("<%=session.getAttribute("message")%>")
	</script>
	<%
	session.setAttribute("message", null);
	}
	%>
  
  <div class="content">
    <div class="container">
      <div class="row">
        <div class="col-md-6 order-md-2">
          <img src="images/undraw_file_sync_ot38.svg" alt="Image" class="img-fluid">
        </div>
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-8">
              <div class="mb-4">
              <h3>Sign In to <strong>Generate Artistic Photos</strong></h3>
              <p class="mb-4">Dễ dàng chuyển đổi PDF thành các định dạng khác với giao diện thân thiện và tiện lợi.</p>
            </div>
            <form  method="post" action="login_process">
              <div class="form-group first">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username">

              </div>
              <div class="form-group last mb-4">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password">
                
              </div>
     

              <input type="submit" value="Log In" class="btn text-white btn-block btn-primary">
              	
            </form>
            </div>
          </div>
          
        </div>
        
      </div>
    </div>
  </div>

  
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/popper.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/main.js"></script>
</body>
</html>
