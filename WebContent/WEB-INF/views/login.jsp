<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</head>
<body>
<!--  response.setStatus(HttpServletResponse.SC_OK);-->
	<form id="login">
		<input type="email" placeholder="Username" name="user">
		<input type="password" placeholder="Password" name="pass">
		<input type="submit" value="LOGIN">
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