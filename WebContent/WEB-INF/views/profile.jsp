<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<button onclick="location.href='${pageContext.request.contextPath}/sucursales'" value="BACK">Regresar</button>
	
	<table>
		<tr>
		<th>Nombre</th>
		<th>Ubicacion</th>
		<th>Horarion de Entrada</th>
		<th>Horario de Cierre</th>
		<th>Cantidad de Mesas</th>
		<th>Gerente</th>
	</tr>
	
	<tr>
		<td>${sucursal.sucursal}</td>
		<td>${sucursal.ubicacion}</td>
		<td>${sucursal.open}</td>
		<td>${sucursal.close}</td>
		<td>${sucursal.nMesas}</td>
		<td>${sucursal.gerente}</td>
			
	</tr>	
	<tr>
		<td>
			<form name="addEmp" action="${pageContext.request.contextPath}/addEmp" method="post">
			<input type="hidden" name="IdSuc" value="${sucursal.idSucursal}">
				<input type="submit" value="Agregar Empleados">
				
			</form>
		</td>
	</tr>
	<tr>
		<th>Empleados de ${sucursal.sucursal }</th>
	</tr>
	<tr>
		<th>Nombre</th>
		<th>Edad</th>
		<th>G&eacute;nero</th>
		<th>Estado</th>
	</tr>
	
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
            		<input type="Submit" value="Editar">
				</form>
			</td>
			<td>
				<input type="button" class="delete_button" value="Eliminar" onClick="deleteSuc(${empleado.idEmpleado})">
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