
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="resources/css/login.css">
<title>Login</title>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		body{
		
		background-color: #A8A8A8; 
		}
	</style>
</head>
<body>
<!--  response.setStatus(HttpServletResponse.SC_OK);-->

<h1 style="text-align:center;font-weight:bold;margin-top:20px;">Rustico Restaurant</h1>
		<form id="login">
	<div class="form-group" style="margin: 0 auto;width:50%;border: 1px solid #FFF;border-radius:10px;padding:30px;">
			<input type="email" class="form-control" placeholder="Username" name="user"><br>
			<input type="password" class="form-control" placeholder="Password" name="pass"><br>
			<input type="submit" class="btn btn-dark" value="LOGIN">
	</div>
		</form>
		
	<script type='text/javascript'>
	   	$("#login").on('submit', function (e) {
			e.preventDefault();
			$.ajax(
				{
					url: "${pageContext.request.contextPath}/login",
					data:  $("#login").serialize(),
					type: 'POST', 
					success: function (result) {
						location.href = "${pageContext.request.contextPath}/sucursales"
					},
					error: function (result) {
						swal("Usuario o contraseña inválido", {
				 	    	icon: "error",
		 		   		});
					}
				});
		});
    </script>
</body>
</html>