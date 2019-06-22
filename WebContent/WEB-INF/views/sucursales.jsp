
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		body{
		
		background-color: #A8A8A8; 
		}
	</style>
</head>
	<body>
	
	<h1 style="text-align:center; margin-top:20px;">Lista de Sucursales</h1>
	<div style="margin:0 auto;width:10%;">
	<form style="padding-bottom: 10px;" action="${pageContext.request.contextPath}/new" method="post">
	<input class="btn btn-dark" type="submit" value="Nueva Sucursal">
	</form>
	</div>
	<table class="table table-hover">
		<thead class="thead-dark">
		<tr>
			<th>Nombre</th>
			<th>Ubicacion</th>
			<th>Horarion de Entrada</th>
			<th>Horario de Cierre</th>
			<th>Cantidad de Mesas</th>
			<th>Gerente</th>
			<th></th>
			<th></th>
			<th></th>
		</tr>
		</thead >
		<c:forEach items="${sucursal}" var="sucursal">
			<tr>
				<td>${sucursal.sucursal}</td>
				<td>${sucursal.ubicacion}</td>
				<td>${sucursal.open}</td>
				<td>${sucursal.close}</td>
				<td>${sucursal.nMesas}</td>
				<td>${sucursal.gerente}</td>
				<td><form id="form" name="perfil" action="${pageContext.request.contextPath}/profile" method="get">
	            		<input type="hidden" name="proId" value="${sucursal.idSucursal}">
	            		<input  class="btn btn-info" type="submit" value="Ver Perfil">
					</form>
				</td>
				<td>
				<!-- action="${pageContext.request.contextPath}/delete" method="post" -->
	            <input type="button" class="btn btn-danger delete_button" value="Eliminar" onClick="deleteSuc(${sucursal.idSucursal})">
				</td>
				<td>
				<form name="editarSucursal" action="${pageContext.request.contextPath}/edit" method="post">
	            		<input type="hidden" name="editId" value="${sucursal.idSucursal}">
	            		<input class="btn btn-warning" type="Submit" value="Editar">
					</form>
				</td>
			</tr>
		</c:forEach>
		
	</table>
	<script type='text/javascript'>
			function deleteSuc(id){
				var url = '${pageContext.request.contextPath}/delete/';
				var data = {delId: id};
	       	 	//const myObj={delId:id} 
				
		   	 	fetch( url, 
		   		   	{
						method: 'POST',
						body: JSON.stringify(data),
						headers:{
						    'Content-Type': 'application/json'
						  }
			   		}
			   	).then(response=>{
				   		console.log(response)
			   			location.href = "${pageContext.request.contextPath}/sucursales"
				})
				.catch(error=>{
					console.log(error)
							location.href = "${pageContext.request.contextPath}/sucursales"
				});   
				/* 
				 $.ajax(
					{
						url: "${pageContext.request.contextPath}/delete",
						data: {
							delId:id,
							},
						type: 'POST', 
						success: function (result,status,hxr) {
							console.log(hxr.status)
							location.href = "${pageContext.request.contextPath}/sucursales"
						},
						error: function (result) {
							console.log("Nel perro")
							location.href = "${pageContext.request.contextPath}/sucursales"
						}
					});  
	 */		} 
	    </script> 
	</body> 
</html>