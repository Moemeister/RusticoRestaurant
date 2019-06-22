
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		body{
		
		background-color: #A8A8A8; 
		}
	</style>
</head>
<body>

<button class="btn btn-dark" style="margin:20px 30px;" onclick="location.href='${pageContext.request.contextPath}/sucursales'" value="BACK">Regresar</button>
	
	<table class="table table-hover">
		<thead class="thead-dark">
		<tr>
			<th>Nombre</th>
			<th>Ubicacion</th>
			<th>Horarion de Entrada</th>
			<th>Horario de Cierre</th>
			<th>Cantidad de Mesas</th>
			<th>Gerente</th>
		</tr>
		</thead>
	
	<tr>
		<td>${sucursal.sucursal}</td>
		<td>${sucursal.ubicacion}</td>
		<td>${sucursal.open}</td>
		<td>${sucursal.close}</td>
		<td>${sucursal.nMesas}</td>
		<td>${sucursal.gerente}</td>
			
	</tr>
	</table>
		<div style="margin:20px 30px;" >
			<form name="addEmp" action="${pageContext.request.contextPath}/addEmp" method="post">
			<input type="hidden" name="IdSuc" value="${sucursal.idSucursal}">
				<input class="btn btn-dark" type="submit" value="Agregar Empleados">
				
			</form>
		</div>
	<table class="table table-hover">
	<thead class="thead-dark">
	
	<tr>
		<th>Empleados de ${sucursal.sucursal }</th>
		<th></th>
		<th></th>
		<th></th>
		<th></th>
		<th></th>

	</tr>
	<tr>
		<th>Nombre</th>
		<th>Edad</th>
		<th>G&eacute;nero</th>
		<th>Estado</th>
		<th></th>
		<th></th>
	</tr>
	</thead>
	<c:forEach items="${empleado}" var="empleado">
		<tr>
			<td>${empleado.nombre}</td>
			<td>${empleado.edad}</td>
			<td>${empleado.genreDelegate}</td>
			<td>${empleado.estadoDelegate}</td>
			
			<td>
			<form name="editarSucursal" action="${pageContext.request.contextPath}/editEmp" method="post">
            		<input type="hidden" name="editId" value="${empleado.idEmpleado}">
            		<input type="hidden" name="IdSuc" value="${sucursal.idSucursal}">
            		<input class="btn btn-warning" type="Submit" value="Editar">
				</form>
			</td>
			<td>
				<input type="button" class="btn btn-danger delete_button" value="Eliminar" onClick="deleteSuc(${empleado.idEmpleado})">
			</td> 
		</tr>
	</c:forEach>
</table>
<script type='text/javascript'>
		function deleteSuc(id){
			var url = '${pageContext.request.contextPath}/deleteEmp/';
			var data = {delIdEmp: id};
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
		   			location.href = "${pageContext.request.contextPath}/profile?proId=" + ${sucursal.idSucursal}
			})
			.catch(error=>{
				console.log(error)
						location.href = "${pageContext.request.contextPath}/profile?proId=" + ${sucursal.idSucursal}
			}); 
		}
</script>
</body>
</html>