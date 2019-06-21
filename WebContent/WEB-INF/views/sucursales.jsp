<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/new" method="post">
<input type="submit" value="Nueva Sucursal">
</form>
<table>
	<tr>
		<th>Nombre</th>
		<th>Ubicacion</th>
		<th>Horarion de Entrada</th>
		<th>Horario de Cierre</th>
		<th>Cantidad de Mesas</th>
		<th>Gerente</th>
	</tr>
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
            		<input type="submit" value="Ver Perfil">
				</form>
			</td>
			<td>
			<!-- action="${pageContext.request.contextPath}/delete" method="post" -->
            <input type="button" class="delete_button" value="Eliminar" onClick="deleteSuc(${sucursal.idSucursal})">
			</td>
			<td>
			<form name="editarSucursal" action="${pageContext.request.contextPath}/edit" method="post">
            		<input type="hidden" name="editId" value="${sucursal.idSucursal}">
            		<input type="Submit" value="Editar">
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